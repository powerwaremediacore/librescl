/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
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

public class Lscl.tCDCEnum : Lscl.tPredefinedCDC {}
public class Lscl.tPredefinedCDC : GomEnum
{
	construct {
		try { initialize_enum (typeof (Enum)); }
		catch (GLib.Error e) { warning ("Error: "+e.message); }
	}
	public enum Enum
	{
		SPS,
		DPS,
		INS,
		ACT,
		ACD,
		SEC,
		BCR,
		MV,
		CMV,
		SAV,
		WYE,
		DEL,
		SEQ,
		HMV,
		HWYE,
		HDEL,
		SPC,
		DPC,
		INC,
		BSC,
		ISC,
		APC,
		SPG,
		ING,
		ASG,
		CURVE,
		DPL,
		LPL,
		CSD,
		// Edition 2.0
		ENS,ENC,ENG,CTS,UTS,BTS,LTS,
		OTS,GTS,MTS,NTS,STS,BAC,HST,
		ORG,TSG,CUG,
		// CSD, duplicated
		CSG,VSS,VSG
	}
}
