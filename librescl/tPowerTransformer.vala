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
 *  Copyright (c) 2013-2015 Daniel Espinosa
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

namespace Lscl
{
  public class tPowerTransformer : tEquipment
  {
		construct {
			transformer_type = new tPowerTransformerType ("type");
		}
    [Description (nick="TransformerWinding", blurb="")]
    public tTransformerWinding transformer_winding { get; set; }
    [Description (nick="type", blurb="")]
    public tPowerTransformerType transformer_type { get; set; }
  }
	public class tPowerTransformerType : BaseEnum
	{
		construct {
			_enumtype = typeof (tPowerTransformerType.Enum);
		}
		 public tPowerTransformerType (string name)
		{
			_name = name;
		}
		public tPowerTransformerType.Enum get_value () throws GLib.Error { return (tPowerTransformerType.Enum) to_integer (); }
		public void set_value (tPowerTransformerType.Enum val) throws GLib.Error { parse_integer ((int) val); }
		public enum Enum
		{
		  PTR
		}
	}
}

