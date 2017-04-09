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
 *  Copyright (c) 2013, 2014, 2017 Daniel Espinosa
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
  private tHitem.Array _history;
  public tText text { get; set; }
  [Description(nick="::id")]
  public string id { get; set; default = "Created by LibreSCL(R)"; }
  [Description(nick="::version", blurb="")]
  public string version { get; set; default = "0"; }
  [Description(nick="::revision", blurb="")]
  public string revision { get; set; default = "0"; }
  [Description (nick="::toolID", blurb="Tool creator ID")]
  public string tool_id { get; set; default = "LibreSCL (R)"; }
  [Description (nick="::nameStructure",blurb="Name structure according with standard")]
  public tNameStructure name_structure { get; set; }
  public tHitem.Array history {
    get {
      if (_history == null)
        set_instance_property ("history");
      return _history;
    }
    set { _history = value; }
  }
  construct {
    parse_children = false;
  }
}

public class Lscl.tNameStructure : GomEnum
{
  construct {
    try { initialize_enum (typeof (Enum)); }
    catch (GLib.Error e) { warning ("Error: "+e.message); }
  }
  public enum Enum
  {
    IED_NAME,
    FUNC_NAME
  }
}
