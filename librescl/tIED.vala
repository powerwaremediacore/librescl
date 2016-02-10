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
  public class tIED : tNaming, GXml.SerializableMapKey<string>
  {
    [Description (nick="Services", blurb="Available services")]
    public tServices services { get; set; }
    [Description (blurb="Access point to IED servers")]
    public tAccessPoint.HashMap access_points  {get; set; default = new tAccessPoint.HashMap (); }
    [Description (nick="type", blurb="IED type")]
    public string ied_type { get; set; }
    [Description (nick="manufacturer", blurb="Manufacturer of the IED")]
    public string manufacturer { get; set; }
    [Description (nick="configVersion", blurb="Configuration Versions of the IED")]
    public string config_version  { get; set; }
    // SerializableMapId
    public string get_map_key () { return name; }

    public class HashMap : SerializableHashMap<string,tIED>
    {
      public new tIED get (string name)
      {
        Test.message ("tIED HashMap: Getting IED: "+name);
        return base.get (name);
      }
      public string to_string ()
      {
        string str = "";
        foreach (tIED ied in values) {
          str += "["+ied.name+"/"+ied.manufacturer+"/"+ied.ied_type+"]";
        }
        return str;
      }
      public new GLib.List<string> list_keys () { return (GLib.List<string>) base.list_keys (); }
      public new GLib.List<tIED> list_values () { return (GLib.List<tIED>) base.list_values (); }
    }
  }
}

