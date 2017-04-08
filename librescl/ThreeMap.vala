/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *       PowerMedia Consulting <pwmediaconsulting@gmail.com>
 *
 *
 *  Copyright (c) 2013, 2017 Daniel Espinosa
 *  Copyright (c) 2014 PowerMedia Consulting
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
   * Interface for objects providing three keys for hash maps {@link ThreeMap}
   */
  public interface SerializableMapThreeKey<P,S,T> : Object
  {
    public abstract P get_map_primary_key  ();
    public abstract S get_map_secondary_key ();
    public abstract T get_map_tertiary_key ();
  }
  /**
   * A Serializable Hash Collection using three keys.
   */
  public class ThreeMap<P,S,T,V> : Object, Traversable<V>, GXml.Serializable, GXml.SerializableCollection
  {
    private Gee.HashMultiMap<P,Gee.HashMultiMap<S,Gee.HashMap<T,V>>> storage;
    protected bool _deserialized;
    protected GXml.Node _node;
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
    public new GLib.List<V> list_values () {
      var l = new GLib.List<V> ();
      foreach (V v in values ()) { l.prepend (v); }
      return l;
    }
    // Traversable interface
    public bool @foreach (ForallFunc f) {
      return values ().foreach (f);
    }
    // Serializable Interface
    protected Gee.HashMap<string,GXml.Node> _unknown_serializable_properties = new Gee.HashMap<string,GXml.Node> ();
    protected Gee.ArrayList<GXml.Node> _unknown_serializable_nodes = new ArrayList<GXml.Node> ();

    protected ParamSpec[] properties { get; set; }
    public GLib.HashTable<string,GLib.ParamSpec> ignored_serializable_properties { get; protected set; }
    public string? serialized_xml_node_value { owned get; protected set; default=null; }
    public Gee.Map<string,GXml.Node> unknown_serializable_properties {
      owned get { return (Gee.Map<string,GXml.Node>) _unknown_serializable_properties.ref (); }
    }
    public Gee.Collection<GXml.Node> unknown_serializable_nodes {
      owned get { return (Gee.Collection<GXml.Node>) _unknown_serializable_nodes.ref (); }
    }

    public virtual bool get_enable_unknown_serializable_property () { return false; }
    public virtual bool serialize_use_xml_node_value () { return false; }
    public virtual bool property_use_nick () { return false; }

    public virtual string node_name ()
    {
      return ((GXml.Serializable) Object.new (value_type)).node_name ();
    }

    public virtual GLib.ParamSpec? find_property_spec (string property_name)
    {
      return default_find_property_spec (property_name);
    }

    public virtual GLib.ParamSpec[] list_serializable_properties ()
    {
      return default_list_serializable_properties ();
    }

    // SerializableCollection interface
    public virtual bool deserialize_proceed () { return false; }
    public virtual bool deserialized () { return _deserialized; }
    public virtual bool deserialize_node (GXml.Node node)  throws GLib.Error {
      if (!(value_type.is_a (typeof (GXml.Serializable)) &&
            value_type.is_a (typeof (SerializableMapThreeKey)))) {
        throw new SerializableError.UNSUPPORTED_TYPE_ERROR ("%s: Value type '%s' is unsupported", 
                                                      this.get_type ().name (), value_type.name ());
      }
      if (!(node is Element)) return false;
      var obj = (SerializableMapThreeKey<P,S,T>) Object.new (value_type);
      if (node.name == ((GXml.Serializable) obj).node_name ()) {
        if (obj is SerializableCollection)
          (obj as SerializableCollection).deserialize_children ();
        else {
          ((GXml.Serializable) obj).deserialize (node);
          @set (obj.get_map_primary_key (), obj.get_map_secondary_key (), obj.get_map_tertiary_key (), obj);
        }
      }
      return false;
    }
    public virtual bool deserialize_children ()  throws GLib.Error {
      if (_deserialized) return false;
      if (_node == null) return false;
      if (!(value_type.is_a (typeof (GXml.Serializable)) &&
            value_type.is_a (typeof (SerializableMapThreeKey)))) {
        throw new SerializableError.UNSUPPORTED_TYPE_ERROR ("%s: Value type '%s' is unsupported", 
                                                      this.get_type ().name (), value_type.name ());
      }
      //for (int iGXml.Node n in _node.child_nodes) {
      //  deserialize_node (n);
      //}
      _deserialized = true;
      return true;
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
    public virtual GXml.Node? serialize_property (GXml.Node element,
                                                  GLib.ParamSpec prop)
      throws GLib.Error
      requires (element is GXml.Element)
    {
      return default_serialize_property ((GXml.Element) element, prop);
    }
    public GXml.Node? default_serialize_property (GXml.Element element,
                                                  GLib.ParamSpec prop)
      throws GLib.Error
    {
      return element;
    }
    public virtual bool deserialize (GXml.Node node)
      throws GLib.Error
      requires (node_name () != null)
    {
      return default_deserialize (node);
    }
    public bool default_deserialize (GXml.Node node)
      throws GLib.Error
      requires (node is Element)
    {
      _node = node;
      _deserialized = false;
      if (deserialize_proceed ())
        return deserialize_children ();
      return false;
    }
    public virtual bool deserialize_property (GXml.Node property_node)
      throws GLib.Error
    {
      return default_deserialize_property (property_node);
    }
    public bool default_deserialize_property (GXml.Node property_node)
      throws GLib.Error
    {
      return deserialize_node (property_node);
    }
    public bool set_default_namespace (GXml.Node node) { return false; }
  }
}
