/**
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <daniel.espinosa@pwmc.mx>
 *
 *
 *  Copyright (c) 2015 Daniel Espinosa
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
public class Lscl.tFC : Lscl.BaseEnum
{
	public tFC (string name)
	{
	_name = name;
	_enumtype = typeof (tFC.Enum);
	}
  public tFC.Enum get_value () throws GLib.Error { return (tFC.Enum) to_integer (); }
  public void set_value (tFC.Enum val) throws GLib.Error { parse_integer ((int) val); }
	public enum Enum
	{
		ST,
		MX,
		CO,
		SP,
		SG,
		SE,
		SV,
		CF,
		DC,
		EX
	}
}
