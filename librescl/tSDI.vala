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
using GXml;
namespace Lscl
{
  public class tSDI : tUnNaming, SerializableMapKey<string>
  {
    [Description(nick="name", blurb="Name of the SDI (structure part)")]
    public string name { get; set; }
    [Description(nick="ix", blurb="Index of the SDI element in case of an array type.")]
    public string ix { get; set; }
    [Description(nick="ixSpecified", blurb="Index of the SDI element in case of an array type.")]
    public SerializableBool ix_specified { get; set; }
    [Description(nick="SDI", blurb="")]
    public tSDI.HashMap sdis	{ get; set; default = new tSDI.HashMap (); }
    [Description(nick="DAI", blurb="")]
    public tDAI.HashMap dais { get; set; default = new tDAI.HashMap (); }

    public string get_map_key () { return name; }
    public class HashMap : SerializableHashMap<string,tSDI> {
      public new tSDI get (string name) { return base.get (name); }
      public new GLib.List<string> list_keys () { return (GLib.List<string>) base.list_keys (); }
      public new GLib.List<tSDI> list_values () { return (GLib.List<tSDI>) base.list_values (); }
    }
  }
}
