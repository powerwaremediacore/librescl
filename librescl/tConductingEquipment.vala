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
public class Lscl.tConductingEquipment : Lscl.tAbstractConductingEquipment 
{
  construct {
		equipment_type = new tCommonConductingEquipment ("type");
  }
  [Description(nick="type", blurb="Type of conducting equipment")]
  public tCommonConductingEquipment equipment_type { get; set; }
}

public class Lscl.tCommonConductingEquipment : Lscl.tPredefinedCommonConductingEquipment
{
	public tCommonConductingEquipment (string name) { base (name); }
}
public class Lscl.tPredefinedCommonConductingEquipment : Lscl.BaseEnum
{
	construct {
		_enumtype = typeof (tPredefinedCommonConductingEquipment.Enum);
	}
	public tPredefinedCommonConductingEquipment (string name)
	{
		_name = name;
	}
  public tPredefinedCommonConductingEquipment.Enum get_value () throws GLib.Error { return (tPredefinedCommonConductingEquipment.Enum) to_integer (); }
  public void set_value (tPredefinedCommonConductingEquipment.Enum val) throws GLib.Error { parse_integer ((int) val); }
	public enum Enum 
	{
		CBR,
		DIS,
		VTR,
		CTR,
		GEN,
		CAP,
		REA,
		CON,
		MOT,
		EFN,
		PSH,
		BAT,
		BSH,
		CAB,
		GIL,
		LIN,
		RRC,
		SAR,
		TCF,
		TCR,
		IFL,
		// Edition 2.0
		FAN,
		SCR,
		SMC
	}
}


