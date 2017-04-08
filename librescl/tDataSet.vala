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
  public class tDataSet : tNaming, SerializableMapKey<string>
  {
    [Description(blurb="")]
    public tFCDA.Array fcdas { get; set; }

    public string get_map_key () { return name; }

    public class HashMap : SerializableHashMap<string,tDataSet> {
      public new tDataSet get (string name) { return base.get (name); }
      public new GLib.List<string> list_keys () { return (GLib.List<string>) base.list_keys (); }
      public new GLib.List<tDataSet> list_values () { return (GLib.List<tDataSet>) base.list_values (); }
    }
  }
}
