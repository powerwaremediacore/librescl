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
  public class tPhysConn : tUnNaming, SerializableMapKey<string>
  {
    [Description (nick="P", blurb="")]
    public tP.Array ps { get; set; }
    [Description (nick="type", blurb="Physical Connection type")]
    public string connection_type { get; set; }
    public TypeEnum get_enum () { return TypeEnum.from_string (connection_type); }

    public string get_map_key () { return connection_type; }

    public override void init_containers ()
    {
      if (ps == null)
          ps = new tP.Array ();
    }
    public class Collection : SerializableHashMap<string,tPhysConn> {}

    // Edition 2.0 Enum
    public enum TypeEnum
    {
      TYPE,
      PLUG,
      CABLE,
      PORT,
      EXTENSION;
      public string to_string ()
      {
        string str = "<<INVALID PHYSICAL CONNECTION>>";
        try {
          str = GXml.Enumeration.get_nick_camelcase (typeof (TypeEnum), this);
        }
        catch (GLib.Error e) {}
        return str;
      }
      public static TypeEnum from_string (string str)
      {
        TypeEnum env = TypeEnum.EXTENSION;
        try {
          var v = GXml.Enumeration.parse (typeof (TypeEnum), str);
          env = (TypeEnum) v.@value;
        }
        catch {}
        return env;
      }
    }
  }
}
