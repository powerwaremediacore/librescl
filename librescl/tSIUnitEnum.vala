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

public class Lscl.tSIUnit : Lscl.BaseValueList
{
	private string[] _alternatives = {"none","m","kg","s","A","K","mol","cd","deg","rad","sr",
		"Gy","q","°C","Sv","F","C","S","H","V","ohm","J","N","Hz",
		"lx","Lm","Wb","T","W","Pa","m^2","m^3","m/s","m/s^2",
		"m^3/s","m/m^3","M","kg/m^3","m^2/s","W/m K","J/K","ppm",
		"s^-1","rad/s","VA","Watts","VAr","phi","cos_phi","Vs",
		"V^2","As","A^2","A^2 s","VAh","Wh","VArh","V/Hz","b/s",
			// Edition 2.0
			"Hz/s","char","char/s","kgm²","dB"};
	construct  {
		_vals = { "none","m","kg","s","A","K","mol","cd","deg","rad","sr",
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
	public void select (Enum v) { set_string (_vals[v]); }
	public enum Enum
	{
		NONE,
		METER, KM, SEC, A, K, MOL, CD, DEG, RAD, SR,
		GY, Q, CG, SV, F, C, S, H, V, OHM, J, N, HZ,
		LX, LM, WB, T, W, PA, M_SQR, M_CUB, M_SEC, M_SEC_SQR,
		M_CUB_SEC, M_M_CUB, M, KG_M_CUB, M_SQR_SEC, W_M_K, J_K, PPM,
		L_S, RAD_SEC, VA, WATTS, VAR, PHI, COS_PHI, VS,
		V_SQR, AS, A_SQR, A_SQR_T, VAH, WH, VARH, V_HZ, B_SEC,
		HZ_SEC, CHAR, CHAR_SEC, KG_M_SQR, DB
	}
}
