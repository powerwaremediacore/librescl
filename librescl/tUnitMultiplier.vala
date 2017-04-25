/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <daniel.espinosa@pwmc.mx>>
 *
 *
 *  Copyright (c) 2015-2017 Daniel Espinosa
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

public class Lscl.tUnitMultiplier : GomArrayString
{
	private int[] _m = {0,-3,3,6,-6,-24,-21,-18,-15,-12,-9,-2,-1,1,
											2,9,12,15,18,21,24};
	construct {
		_values = { "Item","m","k","M","mu","y","z","a","f","p","n","c","d","da",
						"h","G","T","P","E","Z","Y"};
	}
	/**
	 * If {@param v} is out of range of supported values, this method always return 0.
	 */
	public int get_multiplier (Enum v)
	{
		int index = (Enum) v;
		if (index < 0 || index > _m.length || index > _values.length) return 0;
		return _m[v];
	}
	/**
	 * Returns: multiplier based on current value, or 0 if value is not in list.
	 */
	public int get_multiplier_value ()
	{
		for (int i = 0; i < _values.length; i++) {
			if (_values[i] == value) return get_multiplier ((Enum) i);
		}
		return 0;
	}
	public enum Enum
	{
		ITEM,MILI,KILO,MEGA,MICRO,Y_U,Z_U,A_U,F_U,PICO,NANO,CENT_U,DEC_U,DEC,
		HECT,GIGA,TERA,PETA,EPTA,Z,Y
	}
}
