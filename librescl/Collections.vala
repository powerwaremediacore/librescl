/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *
 *  Copyright (c) 2013 Daniel Espinosa
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
using GXml;
using Gee;
namespace Lscl
{
  /**
   * A {link: GXml.SerializableHashMap} implementation with support for
   * duplicated entries.
   */
  public class HashMap<K,V> : SerializableHashMap<K,V>
  {
    public SerializableArrayList<V> duplicated { get; set; }
    public override GXml.Node? deserialize (GXml.Node node)
                      throws GLib.Error
    {
      if (!(value_type.is_a (typeof (GXml.Serializable)) &&
          value_type.is_a (typeof (SerializableMapKey)))) {
        throw new SerializableError.UNSUPPORTED_TYPE ("%s: Value type '%s' is unsupported", 
                                                      this.get_type ().name (), value_type.name ());
      }
      if (node is Element) {
        foreach (GXml.Node n in node.child_nodes) {
          if (n is Element) {
  #if DEBUG
            stdout.printf (@"Node $(node.node_name) for type '$(get_type ().name ())'\n");
  #endif
            var obj = Object.new (value_type);
            if (n.node_name == ((Serializable) obj).node_name ()) {
              ((Serializable) obj).deserialize (n);
              if (has_key (((SerializableMapKey<K>) obj).get_map_key ())) {
                if (duplicated == null)
                  duplicated = new SerializableArrayList<V> ();
                duplicated.add (obj);
                //stdout.printf (@"$(get_type ().name ()): Duplicated. Size: $(duplicated.size)\n");
              }
              else {
                @set (((SerializableMapKey<K>) obj).get_map_key (), obj);
                //stdout.printf (@"$(get_type ().name ()): Collection Size: $(this.size)\n");
              }
            }
          }
        }
      }
      return node;
    }
    public override GXml.Node? serialize (GXml.Node node)
                              throws GLib.Error
                              requires (node is Element)
    {
      if (value_type.is_a (typeof (Serializable))) {
      int i = 0;
        foreach (V v in values) {
          i++;
          //stdout.printf (@"Serialized $i\n");
         ((GXml.Serializable) v).serialize (node);
        }
        if (duplicated != null)
          if (duplicated.size != 0) {
            foreach (V d in duplicated) {
              ((GXml.Serializable) d).serialize (node);
            }
          }
      }
      return node;
    }
  }

  public interface SerializableMapThreeKey<P,S,T> : Object
  {
    public abstract P get_map_primary_key  ();
    public abstract S get_map_secondary_key ();
    public abstract T get_map_tertiary_key ();
  }
  /**
   * A Serializable Hash Collection using three keys.
   */
  public class ThreeMap<P,S,T,V> : Object, GXml.Serializable, GXml.SerializableCollection
  {
    private Gee.HashMultiMap<P,Gee.HashMultiMap<S,Gee.HashMap<T,V>>> storage;
    public int size {
      get {
        init ();
        return storage.size;
      }
    }
    public Type value_type
    {
      get {
        init ();
        return typeof (V);
      }
    }
    public Type primary_key_type
    {
      get {
        init ();
        return typeof (P);
      }
    }
    public Type secondary_key_type
    {
      get {
        init ();
        return typeof (S);
      }
    }
    public Type tertiary_key_type {
      get {
        init ();
        return typeof (T);
      }
    }
    public Gee.Collection<P> primary_keys
    {
      owned get {
        init ();
        return storage.get_keys ();
      }
    }
    public new void @set (P pkey, S skey, T tkey, V val)
    {
      init ();
      var hv = new Gee.HashMap<T,V> ();
      hv.@set (tkey, val);
      var sh = new Gee.HashMultiMap<S, Gee.HashMap<T,V>> ();
      sh.@set (skey, hv);
      storage.@set (pkey, sh);
    }
    public new V @get (P pkey, S skey, T tkey)
    {
      init ();
      var hs = storage.@get (pkey);
      foreach (Gee.HashMultiMap<S,Gee.HashMap<T,V>> ht in hs) {
        var hv = ht.@get (skey);
        foreach (Gee.HashMap<T,V> htv in hv) {
          if (htv.has_key (tkey))
            return htv.@get (tkey);
        }
      }
      return null;
    }
    public Collection<V> values ()
    {
      init ();
      var hvs = new HashSet<V> ();
      foreach (Gee.HashMultiMap<S,Gee.HashMap<T,V>> hs in storage.get_values ()) {
        foreach (Gee.HashMap<T,V> ht in hs.get_values ()) {
          hvs.add_all (ht.values);
        }
      }
      return hvs;
    }
    private void init ()
    {
      if (storage == null)
        storage = new Gee.HashMultiMap<P,Gee.HashMultiMap<S,Gee.HashMap<T,V>>> ();
    }
    // Serializable Interface
    protected ParamSpec[] properties { get; set; }
    public GLib.HashTable<string,GLib.ParamSpec> ignored_serializable_properties { get; protected set; }
    public string? serialized_xml_node_value { get; protected set; default=null; }
    public GLib.HashTable<string,GXml.Node> unknown_serializable_property { get; protected set; }

    public virtual bool get_enable_unknown_serializable_property () { return false; }
    public virtual bool serialize_use_xml_node_value () { return false; }
    public virtual bool property_use_nick () { return false; }

    public virtual string node_name ()
    {
      return ((Serializable) Object.new (value_type)).node_name ();
    }

    public virtual GLib.ParamSpec? find_property_spec (string property_name)
    {
      return default_find_property_spec (property_name);
    }

    public virtual void init_properties ()
    {
      default_init_properties ();
    }

    public virtual GLib.ParamSpec[] list_serializable_properties ()
    {
      return default_list_serializable_properties ();
    }

    public virtual void get_property_value (GLib.ParamSpec spec, ref Value val)
    {
      default_get_property_value (spec, ref val);
    }

    public virtual void set_property_value (GLib.ParamSpec spec, GLib.Value val)
    {
      default_set_property_value (spec, val);
    }

    public virtual bool transform_from_string (string str, ref GLib.Value dest)
    {
      return false;
    }

    public virtual bool transform_to_string (GLib.Value val, ref string str)
    {
      return false;
    }

    public virtual GXml.Node? serialize (GXml.Node node)
      throws GLib.Error
      requires (node is Element)
    {
      return default_serialize (node);
    }
    public GXml.Node? default_serialize (GXml.Node node)
      throws GLib.Error
      requires (node is Element)
    {
      foreach (V v in values ()) {
        if (v is GXml.Serializable)
          ((GXml.Serializable) v).serialize (node);;
      }
      return node;
    }
    public virtual GXml.Node? serialize_property (GXml.Element element,
                                                  GLib.ParamSpec prop)
      throws GLib.Error
    {
      return default_serialize_property (element, prop);
    }
    public GXml.Node? default_serialize_property (GXml.Element element,
                                                  GLib.ParamSpec prop)
      throws GLib.Error
    {
      return element;
    }
    public virtual GXml.Node? deserialize (GXml.Node node)
      throws GLib.Error
      requires (node_name () != null)
    {
      return default_deserialize (node);
    }
    public GXml.Node? default_deserialize (GXml.Node node)
      throws GLib.Error
      requires (node is Element)
    {
      if (!(value_type.is_a (typeof (GXml.Serializable)) &&
            value_type.is_a (typeof (SerializableMapThreeKey)))) {
        throw new SerializableError.UNSUPPORTED_TYPE ("%s: Value type '%s' is unsupported", 
                                                      this.get_type ().name (), value_type.name ());
      }
      foreach (GXml.Node n in node.child_nodes) {
        if (n is Element) {
          var obj = (SerializableMapThreeKey<P,S,T>) Object.new (value_type);
          if (n.node_name == ((Serializable) obj).node_name ()) {
            ((Serializable) obj).deserialize (n);
            @set (obj.get_map_primary_key (), obj.get_map_secondary_key (), obj.get_map_tertiary_key (), obj);
          }
        }
      }
      return node;
    }
    public virtual bool deserialize_property (GXml.Node property_node)
      throws GLib.Error
    {
      return default_deserialize_property (property_node);
    }
    public bool default_deserialize_property (GXml.Node property_node)
      throws GLib.Error
    {
      return true;
    }
  }
}
