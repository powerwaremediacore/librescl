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
public class Lscl.tDataTypeTemplates : Serializable
{
#if ENABLE_PERFORMANCE
    
    private GXml.Node node;

    [Description(blurb="Logical Node Types templates")]
    public tLNodeType.HashMap logical_node_types {
        get {
            if (_logical_node_types.size == 0) {
                if (node == null) return _logical_node_types;
                _logical_node_types.clear ();
                _logical_node_types.deserialize (node);
            }
        }
        set { logical_node_types = value; }
    }
    [Description(blurb="Data Object Types templates")]
    public tDOType.HashMap data_object_types {
        get {
            if (_data_object_types.size == 0) {
                if (node == null) return _data_object_types;
                _data_object_types.clear ();
                _data_object_types.deserialize (node);
            }
        }
        set { _data_object_types = value; }
    }
    [Description(blurb="Data Attributes Types templates")]
    public tDAType.HashMap data_attribute_types {
        get {
            if (_data_attribute_types.size == 0) {
                if (node == null) return _data_attribute_types;
                _data_attribute_types.clear ();
                _data_attribute_types.deserialize (node);
            }
        }
        set { _data_attribute_types = value; }
    }
    [Description(nick="EnumType",blurb="Data Attributes Types templates")]
    public tEnumType.HashMap enum_types {
        get {
            if (_enum_types.size == 0) {
                if (node == null) return _enum_types;
                _enum_types.clear ();
                _enum_types.deserialize (node);
            }
        }
        set { _enum_types = value; }
    }
    construct {
        _logical_node_types = new tLNodeType.HashMap ();
        _data_object_types = new tDOType.HashMap ();
        _data_attribute_types = new tDAType.HashMap ();
        _enum_types = new tEnumType.HashMap ();
    }

    public override GXml.Node? deserialize (GXml.Node node) throws GLib.Error {
      this.node = node;
      _logical_node_types.clear ();
      _data_object_types.clear ();
      _data_attribute_types.clear ();
      return node;
    }
#else
    [Description(blurb="Logical Node Types templates")]
    public tLNodeType.HashMap logical_node_types { get; set; default = new tLNodeType.HashMap (); }
    [Description(blurb="Data Object Types templates")]
    public tDOType.HashMap data_object_types { get; set; default = new tDOType.HashMap (); }
    [Description(blurb="Data Attributes Types templates")]
    public tDAType.HashMap data_attribute_types { get; set; default = new tDAType.HashMap (); }
    [Description(nick="EnumType",blurb="Data Attributes Types templates")]
    public tEnumType.HashMap enum_types { get; set; default = new tEnumType.HashMap (); }
#endif
}
