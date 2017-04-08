/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <daniel.espinosa@pwmc.mx>
 *
 *
 *  Copyright (c) 2016, 2017 Daniel Espinosa
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
  public class HashMap<K,V> : Lscl.SerializableHashMap<K,V>
  {
    public GXml.SerializableArrayList<V> duplicated { get; set; }

    public override bool deserialize_node (GXml.Node node) throws GLib.Error {
      //GLib.message ("DuplicatedHashMap: deserializing node "+node.name);
      if (!(value_type.is_a (typeof (GXml.Serializable)) &&
          value_type.is_a (typeof (SerializableMapKey)))) {
        throw new SerializableError.UNSUPPORTED_TYPE_ERROR ("%s: Value type '%s' is unsupported", 
                                                      this.get_type ().name (), value_type.name ());
      }
      if (node is Element) {
#if DEBUG
        stdout.printf (@"Node $(node.name) for type '$(get_type ().name ())'\n");
#endif
        var obj = Object.new (value_type);
        if (node.name == ((GXml.Serializable) obj).node_name ()) {
          ((GXml.Serializable) obj).deserialize (node);
          if (has_key (((GXml.SerializableMapKey<K>) obj).get_map_key ())) {
            if (duplicated == null)
              duplicated = new GXml.SerializableArrayList<V> ();
            duplicated.add (obj);
          }
          else {
            @set (((SerializableMapKey<K>) obj).get_map_key (), obj);
            //stdout.printf (@"$(get_type ().name ()): Collection Size: $(this.size)\n");
          }
        }
      }
      _deserialized = true;
      return true;
    }
    public override bool deserialize_children () throws GLib.Error {
      //GLib.message (@"DuplicatedHashMap: $(_deserialized.to_string ()) : $((_node == null).to_string ())");
      if (_deserialized) return false;
      if (_node == null) return false;
      if (!(value_type.is_a (typeof (GXml.Serializable)) &&
          value_type.is_a (typeof (SerializableMapKey)))) {
        throw new SerializableError.UNSUPPORTED_TYPE_ERROR ("%s: Value type '%s' is unsupported", 
                                                      this.get_type ().name (), value_type.name ());
      }
      if (_node is Element) {
        //for (GXml.Node n in _node.children) {
        //  deserialize_node (n);
        //}
      }
      return true;
    }
    public override GXml.Node? serialize (GXml.Node node)
                              throws GLib.Error
                              requires (node is Element)
    {
      if (!(value_type.is_a (typeof (GXml.Serializable)))) {
        throw new SerializableError.UNSUPPORTED_TYPE_ERROR ("%s: Value type '%s' is unsupported", 
                                                      this.get_type ().name (), value_type.name ());
      }
      foreach (V v in values) {
       ((GXml.Serializable) v).serialize (node);
      }
      if (duplicated == null) return node;
      foreach (V d in duplicated) {
        ((GXml.Serializable) d).serialize (node);
      }
      return node;
    }
    public override bool deserialize (GXml.Node node)
                      throws GLib.Error
    {
      //GLib.message ("Deserializing Lscl.HashMap");
      _node = node;
      _deserialized = false;
      if (deserialize_proceed ())
        return deserialize_children ();
      return false;
    }
  }
}
