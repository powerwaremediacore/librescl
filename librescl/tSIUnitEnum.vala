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

public class tSIUnit : GXml.SerializableValueList
{
	private string[] _alternatives;
	public tSIUnit (string name) {
		base (name);
		add_values ({"none","m","kg","s","A","K","mol","cd","deg","rad","sr",
		"Gy","q","°C","Sv","F","C","S","H","V","ohm","J","N","Hz",
		"lx","Lm","Wb","T","W","Pa","m^2","m^3","m/s","m/s^2",
		"m^3/s","m/m^3","M","kg/m^3","m^2/s","W/m K","J/K","ppm",
		"s^-1","rad/s","VA","Watts","VAr","phi","cos_phi","Vs",
		"V^2","As","A^2","A^2 s","VAh","Wh","VArh","V/Hz","b/s" });

		_alternatives = { "none","m","kg","s","A","K","mol","cd","deg","rad","sr",
			"Gy","q","°C","Sv","F","C","S","H","V","ohm","J","N","Hz",
			"lx","Lm","Wb","T","W","Pa","m²","m³","m/s","m/s²",
			"m³/s","m/m³","M","kg/m³","m²/s","W/m K","J/K","ppm",
			"1/s","rad/s","VA","Watts","VAr","phi","cos(phi)","Vs",
			"V²","As","A²","A²t","VAh","Wh","VArh","V/Hz","b/s",
			// Edition 2.0
			"Hz/s","char","char/s","kgm²","dB"};
	}
	public string[] get_alternatives () { return _alternatives; }
	public string get_alternative (int index)
	{
		if (index < 0 || index > _alternatives.length) return "";
		return _alternatives[index];
	}
}
