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
 *  Copyright (c) 2013 Daniel Espinosa
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
  public class SerializableHashMap<K,V> : GXml.SerializableHashMap<K,V>
  {
    /**
     * All collections has been disable for deserialization on first run.
     */
    public override bool deserialize_proceed () { return false; }

    public new GLib.List<K> list_keys () {
      var l = new GLib.List<K> ();
      foreach (K k in keys) { l.prepend (k); }
      return l;
    }
    public new GLib.List<V> list_values () {
      var l = new GLib.List<V> ();
      foreach (V v in values) { l.prepend (v); }
      return l;
    }
  }
  /**
   * Lscl ArrayList implementation
   */
  public class SerializableArrayList<G> : GXml.SerializableArrayList<G> {
    public override bool deserialize_proceed () { return false; }
  }
  /**
   * Lscl DualKeyMap implementation
   */
  public class SerializableDualKeyMap<P,S,V> : GXml.SerializableDualKeyMap<P,S,V> {
    public override bool deserialize_proceed () { return false; }
  }
}
