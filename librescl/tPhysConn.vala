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
  public class tPhysConn : tUnNaming, SerializableMapKey<string>
  {
		construct  {
			connection_type = new tPhysConnType ("type");
		}
    [Description (nick="P", blurb="")]
    public tP.Array ps { get; set; default = new tP.Array (); }
    [Description (nick="type", blurb="Physical Connection type")]
    public tPhysConnType connection_type { get; set; }

    public string get_map_key () { return ""; }
    public class HashMap : SerializableHashMap<string,tPhysConn> {
			public new tPhysConn get (string type) { return base.get (type); }
	 }
	}

	public class tPhysConnType : tPredefinedPhysConnType
	{
		public tPhysConnType (string name) { base (name); }
	}
	public class tPredefinedPhysConnType : BaseEnum
	{
		public tPredefinedPhysConnType (string name)
		{
			_name = name;
			_enumtype = typeof (tPredefinedPhysConnType.Enum);
		}
    public tPredefinedPhysConnType.Enum get_value () throws GLib.Error { return (tPredefinedPhysConnType.Enum) to_integer (); }
    public void set_value (tPredefinedPhysConnType.Enum val) throws GLib.Error { parse_integer ((int) val); }
		public enum Enum
		{
			CONNECTION,
			RED_CONN
		}
	}
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
