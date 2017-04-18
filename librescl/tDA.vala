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
 *  Copyright (c) 2013-2015,2017 Daniel Espinosa
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
  public class tDA : tAbstractDataAttribute, MappeableElement
  {
    [Description(nick="::dchg", blurb="Data Change")]
    public SerializableBool dchg { get; set; }
    [Description(nick="::qchg", blurb="Quallity Change")]
    public SerializableBool qchg { get; set; }
    [Description(nick="::dupd", blurb="Data Update")]
    public SerializableBool dupd { get; set; }
    [Description(nick="::fc", blurb="Functional Code")]
    public tFC fc { get; set; }

    public string get_map_key () { return name.get_string (); }

    public class HashMap : GomHashMap {
      construct {
        try { initialize (typeof (tDA)); }
        catch (GLib.Error e) { warning ("Error: "+e.message); }
      }
	 }
  }
}

