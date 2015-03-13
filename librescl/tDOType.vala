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
  public class tDOType : tIDNaming, SerializableMapKey<string>
  {
    [Description(blurb="Data Objects")]
    public tSDO.HashMap sdos { get; set; }
    [Description(blurb="Data Attributes")]
    public tDA.HashMap das { get; set; }
    [Description(nick="iedType",blurb="The type of the IED to which this DOType belongs")]
    public string ied_type { get; set; }
    [Description(nick="cdc",blurb="The basic Common Data Class")]
    public string cdc { get; set; }
    // SerializableMapKey
    public string get_map_key () { return id; }
    // Serializable
    public override void init_containers ()
    {
      if (sdos == null)
        sdos = new tSDO.HashMap ();
      if (das == null)
        das = new tDA.HashMap ();
    }
    public class HashMap : Lscl.HashMap<string,tDOType> {}
  }
}

