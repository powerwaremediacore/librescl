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
  public class tLNodeType : tIDNaming, SerializableMapKey<string>
  {
    [Description (blurb="Data Objects as Properties in this Logical Node Type")]
    public tDO.HashMap dos { get; set; default = new tDO.HashMap (); }
    [Description (nick="iedType", blurb="Data Objects as Properties in this Logical Node Type")]
    public string ied_type { get; set; default=Defaults.IED_TYPE; }
    [Description (nick="lnClass", blurb="Logical Node Class. Standard or custome one")]
    public tLNClassEnum ln_class { get; set; }

    public tLNodeType.full (string iedtype, string lnclass, string id)
    {
      base.from_string (id);
      ln_class.set_string (lnclass);
      ied_type = iedtype;
    }
    // SerializableMapKey
    public string get_map_key () { return id; }

    public class HashMap : Lscl.HashMap<string,tLNodeType>
	 {
		 public new tLNodeType get (string id) { return base.get (id); }
      public new GLib.List<string> list_keys () { return (GLib.List<string>) base.list_keys (); }
      public new GLib.List<tLNodeType> list_values () { return (GLib.List<tLNodeType>) base.list_values (); }
	 }
  }
}

