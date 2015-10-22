/**
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
using Gee;
using GXml;

namespace Lscl
{
	public class BaseEnum : GXml.SerializableEnum
  {
    public string get_string () { return get_serializable_property_value (); }
    public void set_string (string? str) { set_serializable_property_value (str); }
  }
	public class tStatus : BaseEnum
	{
		construct {
			_enumtype = typeof (tStatus.Enum);
		}
    public tStatus.Enum get_value () throws GLib.Error { return (tStatus.Enum) to_integer (); }
    public void set_value (tStatus.Enum val) throws GLib.Error { parse_integer ((int) val); }
		public enum Enum
		{
			VALID,
			INVALID,
			UNKNOWN
		}
	}

	public class BaseValueList : GXml.SerializableValueList
	{
		public string get_string () { return get_serializable_property_value (); }
		public void set_string (string str) { set_serializable_property_value (str); }
	}
}

