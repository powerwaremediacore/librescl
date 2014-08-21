/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *
 *  Copyright (c) 2013, 2014 Daniel Espinosa
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
    public uint ix { get; set; }
    [Description(nick="ixSpecified", blurb="Index of the SDI element in case of an array type.")]
    public bool ix_specified { get; set; }
    [Description(nick="SDI", blurb="")]
    public tSDI.Collection sdis	{ get; set; }
    [Description(nick="DAI", blurb="")]
    public tDAI.Collection dais { get; set; }

    public string get_map_key () { return name; }

    public override void init_containers ()
    {
      if (sdis == null)
        sdis = new tSDI.Collection ();
      if (dais == null)
        dais = new tDAI.Collection ();
    }
    public class Collection : SerializableHashMap<string,tSDI> {}
  }
}
