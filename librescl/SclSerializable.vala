/**
 *
 *  LibreSCL
 *
 *  Authors:
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *  Copyright (c) 2013 Daniel Espinosa
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

public class Lscl.SclSerializable : Object, Serializable
{
	// Serializable Interface
	public virtual bool deserialize_property (string property_name, GLib.ParamSpec spec, GXml.DomNode property_node);
	public virtual unowned GLib.ParamSpec? find_property (string property_name);
	public virtual void get_property (GLib.ParamSpec spec, ref GLib.Value str_value);
	public virtual unowned GLib.ParamSpec[] list_properties ();
	public virtual GXml.DomNode? serialize_property (string property_name, GLib.ParamSpec spec, GXml.Document doc);
	public virtual void set_property (GLib.ParamSpec spec, GLib.Value value);
}

