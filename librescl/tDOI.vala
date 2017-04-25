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
 *  Copyright (c) 2013, 2014-2017 Daniel Espinosa
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
  public class tDOI : tUnNaming, SerializableMapKey<string>
  {
    [Description(nick="::name",blurb="")]
    public string name { get; set; }
    [Description(nick="::ix",blurb="Index")]
    public string ix { get; set; }
    [Description(nick="::ixSpecified",blurb="Index specified")]
    public SerializableBool ix_specified { get; set; }
    [Description(nick="::accessControl",blurb="")]
    public string access_control { get; set; }
    [Description(nick="::SDI",blurb="")]
    public tSDI.HashMap sdis { get; set; default = new tSDI.HashMap (); }
    [Description(nick="::DAI",blurb="")]
    public tDAI.HashMap dais { get; set; default = new tDAI.HashMap (); }

    public string get_map_key () { return name; }


    public class HashMap : GomHashMap {
      construct {
        try { initialize (typeof (tDOI)); }
        catch (GLib.Error e) { warning ("Error: "+e.message); }
      }
    }
  }
}
