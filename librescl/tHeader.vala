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
using GXml;
public class Lscl.tHeader : Lscl.Serializable
{
  [Description (nick="Text", blurb="Free text")]
  public tText text { get; set; }
  [Description (nick="History", blurb="History Items")]
  public tHitem.Array history { get; set; default = new tHitem.Array (); }
  [Description(nick="id", blurb="")]
  public string id { get; set; default = "Created by LibreSCL(C)"; }
  [Description(nick="version", blurb="")]
  public string version { get; set; default = "0"; }
  [Description(nick="revision", blurb="")]
  public string revision { get; set; default = "0"; }
  [Description (nick="toolID", blurb="Tool creator ID")]
  public string tool_id { get; set; default = "LibreSCL"; }
  [Description (nick="nameStructure",blurb="Name structure according with standard")]
  public tNameStructure name_structure { get; set; }
}

public class Lscl.tNameStructure : Lscl.BaseEnum
{
	construct {
		_enumtype = typeof (tNameStructure.Enum);
	}
	public tNameStructure.Enum get_value () throws GLib.Error { return (tNameStructure.Enum) to_integer (); }
	public void set_value (tNameStructure.Enum val) throws GLib.Error { parse_integer ((int) val); }
	public enum Enum
	{
	  IED_NAME,
	  FUNC_NAME
	}
}
