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
 *  Copyright (c) 2013, 2014 Daniel Espinosa
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

using Gee;
using GXml;

namespace Lscl
{
  public class tEnumType : tIDNaming, SerializableMapKey<string>
  {
    [Description(nick="EnumVal",blurb="")]
    public tEnumVal.Array enum_val { get; set; default = new tEnumVal.Array (); }

    public void order ()
    {
      // TODO: Reorder using order
    }
    // SerializableMapDualId
    public string get_map_key () { return id; }
    public class HashMap : Lscl.HashMap<string,tEnumType>
	 {
		 public new tEnumType get (string id) { return base.get (id); }
      public new GLib.List<string> list_keys () { return (GLib.List<string>) base.list_keys (); }
      public new GLib.List<tEnumType> list_values () { return (GLib.List<tEnumType>) base.list_values (); }
	 }
  }
}
