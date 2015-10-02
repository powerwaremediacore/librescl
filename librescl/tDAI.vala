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
  public class tDAI : tUnNaming, SerializableMapKey<string>
  {
    [Description(nick="Val", blurb="Array of values")]
    public tVal.Array vals { get; set; }
    [Description(nick="name", blurb="Data Attribute's name")]
    public string name { get; set; }
    [Description(nick="sAddr", blurb="")]
    public string s_addr { get; set; }
    [Description(nick="valKind", blurb="Value kind of")]
    public tValKind val_kind { get; set; default = new tValKind ("valKind"); }
    [Description(nick="ix", blurb="")]
    public string ix { get; set; }
    [Description(nick="ixSpecified", blurb="")]
    public bool ix_specified { get; set; }

    public string get_map_key () { return name; }
    public override void init_containers ()
    {
      if (vals == null)
        vals = new tVal.Array ();
    }
    public class HashMap : SerializableHashMap<string,tDAI> {
      public new tDAI @get (string name) { return base.get (name); }
    }
  }
}
