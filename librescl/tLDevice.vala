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
 *  Copyright (c) 2013, 2014, 2017 Daniel Espinosa
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
  public class tLDevice : tUnNaming, MappeableElement
  {
    public LN0 ln0 { get; set; }
    [Description(nick="::inst",blurb="")]
    public string inst { get; set; }
    public tLN.ThreeMap logical_nodes { get; set; default = new tLN.ThreeMap (); }
    public tAccessControl access_control { get; set; }

    public string get_map_key () { return inst; }

    public class HashMap : GomHashMap {
      construct {
        try { initialize (typeof (tLDevice)); }
        catch (GLib.Error e) { warning ("Error: "+e.message); }
      }
    }
  }
}

