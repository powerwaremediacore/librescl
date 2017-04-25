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
 *  Copyright (c) 2013-2017 Daniel Espinosa
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

public class Lscl.tBasicType : GomEnum
{
	construct {
		try { initialize_enum (typeof (Enum)); }
		catch (GLib.Error e) { warning ("Error: "+e.message); }
	}
	public enum Enum
	{
		BOOLEAN,
		INT8,
		INT16,
		INT24,
		INT32,
		INT128,
		INT8U,
		INT16U,
		INT24U,
		INT32U,
		FLOAT32,
		FLOAT64,
		ENUM,
		DBPOS,
		TCMD,
		QUALITY,
		TIMESTAMP,
		VIS_STRING32,
		VIS_STRING64,
		VIS_STRING129,
		VIS_STRING255,
		OCTET64,
		STRUCT,
		ENTRY_TIME,
		UNICODE255,
		CHECK,
		VISSTRING65,
		EXTENSION
	}
}

