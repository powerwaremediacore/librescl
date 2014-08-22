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
namespace Lscl
{
  public class tDA : tAbstractDataAttribute, SerializableMapKey<string>
  {
    [Description(nick="dchg", blurb="Data Change")]
    public bool dchg { get; set; }
    [Description(nick="qchg", blurb="Quallity Change")]
    public bool qchg { get; set; }
    [Description(nick="dupd", blurb="Data Update")]
    public bool dupd { get; set; }
    [Description(nick="fc", blurb="Functional Code")]
    public tFCEnum fc { get; set; }
    // SerializableMapId
    public string get_map_key () { return name; }

    public class Collection : SerializableTreeMap<string,tDA> {}
  }
}

