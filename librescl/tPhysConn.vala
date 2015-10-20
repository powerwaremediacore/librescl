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
    public tPPhysConn.Array ps { get; set; default = new tPPhysConn.Array (); }
    [Description (nick="type", blurb="Physical Connection type")]
    public tPhysConnType connection_type { get; set; }

    public string get_map_key ()
	 {
			if (ps == null) return "";
			if (ps.size == 0) return "";
			var p = ps.get (0); // Get first element in Ps
			if (p == null) return "";
			if (p.ptype == null) return "";
			if (p.ptype.get_string () == null) return "";
			return p.ptype.get_string ();
		}
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
		construct {
			_enumtype = typeof (tPredefinedPhysConnType.Enum);
		}
		public tPredefinedPhysConnType (string name)
		{
			_name = name;
		}
    public tPredefinedPhysConnType.Enum get_value () throws GLib.Error { return (tPredefinedPhysConnType.Enum) to_integer (); }
    public void set_value (tPredefinedPhysConnType.Enum val) throws GLib.Error { parse_integer ((int) val); }
		public enum Enum
		{
			CONNECTION,
			RED_CONN
		}
	}

	public class tPPhysConn : Serializable
	{
		construct {
			ptype = new tPTypePhysConn ("type");
		}
		[Description (nick="type", blurb="Physical Connection type")]
		public tPTypePhysConn ptype { get; set; }
		public override string node_name () { return "P"; }
		public class Array : SerializableArrayList<tPPhysConn> {
			public new tPPhysConn get (int index) { return base.get (index); }
		}
	}
	public class tPTypePhysConn : tPredefinedPTypePhysConn
	{
		public tPTypePhysConn (string name) { base (name); }
	}
	public class tPredefinedPTypePhysConn : BaseEnum
	{
		construct {
			_enumtype = typeof (tPredefinedPTypePhysConn.Enum);
		}
		public tPredefinedPTypePhysConn (string name)
		{
			_name = name;
		}
    public tPredefinedPTypePhysConn.Enum get_value () throws GLib.Error { return (tPredefinedPTypePhysConn.Enum) to_integer (); }
    public void set_value (tPredefinedPTypePhysConn.Enum val) throws GLib.Error { parse_integer ((int) val); }
		public enum Enum
		{
			TYPE,
      PLUG,
      CABLE,
      PORT
		}
	}
}
