/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <daniel.espinosa@pwmc.mx>>
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
using GXml;

public class Lscl.tUnitMultiplier : Lscl.BaseEnum
{
	construct {
		_enumtype = typeof (tUnitMultiplier.Enum);
	}
	 public tUnitMultiplier (string name)
	{
		_name = name;
	}
  public tUnitMultiplier.Enum get_value () throws GLib.Error { return (tUnitMultiplier.Enum) to_integer (); }
  public void set_value (tUnitMultiplier.Enum val) throws GLib.Error { parse_integer ((int) val); }
	public enum Enum
	{
		Item = 0,
		m = -3,
		k = 3,
		M = 6,
		mu = -6,
		y = -24,
		z = -21,
		a = -18,
		f = -15,
		p = -12,
		n = -9,
		c = -2,
		d = -1,
		da = 1,
		h = 2,
		G = 9,
		T = 12,
		P = 15,
		E = 18,
		Z = 21,
		Y = 24
	}
}
