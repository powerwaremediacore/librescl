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
  public class tPhysConn : tUnNaming, MappeableElement
  {
    public tPPhysConn.Array ps { get; set; default = new tPPhysConn.Array (); }
    [Description (nick="::type")]
    public tPhysConnType connection_type { get; set; }

    public string get_map_key ()
	 {
			if (ps == null) return "";
			if (ps.length == 0) return "";
			var p = ps.get_item (0) as tPPhysConn; // Get first element in Ps
			if (p == null) return "";
			if (p.ptype == null) return "";
			if (p.ptype.value == null) return "";
			return p.ptype.value;
		}
    public class HashMap : GomHashMap {
      construct {
        try { initialize (typeof (tConnectedAP)); }
        catch (GLib.Error e) { warning ("Error: "+e.message); }
      }
    }
	}

	public class tPhysConnType : tPredefinedPhysConnType {}
	public class tPredefinedPhysConnType : GomEnum
	{
		construct {
			try { initialize_enum (typeof (tPredefinedPhysConnType.Enum)); }
			catch (GLib.Error e) { warning ("Error: "+e.message); }
		}
		public enum Enum
		{
			CONNECTION,
			RED_CONN
		}
	}

	public class tPPhysConn : Serializable
	{
		[Description (nick="::type", blurb="Physical Connection type")]
		public tPTypePhysConn ptype { get; set; }
      construct {
        try { initialize ("P"); }
        catch (GLib.Error e ) {
          warning ("Error: "+e.message);
        }
      }
		public class Array : GomArrayList {
      construct {
        try { initialize (typeof (tPPhysConn)); }
        catch (GLib.Error e) { warning ("Error: "+e.message); }
      }
    }
	}
	public class tPTypePhysConn : tPredefinedPTypePhysConn {}
	public class tPredefinedPTypePhysConn : GomEnum
	{
		construct {
			try { initialize_enum (typeof (tPredefinedPTypePhysConn.Enum)); }
			catch (GLib.Error e) { warning ("Error: "+e.message); }
		}
		public enum Enum
		{
			TYPE,
      PLUG,
      CABLE,
      PORT
		}
	}
}
