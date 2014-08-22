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
 *  Copyright (c) 2013 Daniel Espinosa
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
namespace Lscl
{
  public class tBasicType : Object
  {
  [Description (nick="bType",blurb="")]
  public string b_type { get; set; default = tBasicTypeEnum.BOOLEAN.to_string (); }

  public tBasicTypeEnum get_enum ()
  {
    return tBasicTypeEnum.new_from_string (_b_type);
  }

  }

  public enum  tBasicTypeEnum
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
    VISSTRING32,
    VISSTRING64,
    VISSTRING129,
    VISSTRING255,
    OCTET64,
    STRUCT,
    ENTRYTIME,
    UNICODE255,
    CHECK,
    VISSTRING65,
    EXTENSION; //  Used for custom types

    public string to_string ()
    {
      string text = "";
      switch (this) {

      case tBasicTypeEnum.BOOLEAN:
        text = "BOOLEAN";
        break;
      case tBasicTypeEnum.INT8:
        text = "INT8";
        break;
      case tBasicTypeEnum.INT16:
        text = "INT16";
        break;
      case tBasicTypeEnum.INT24:
        text = "INT24";
        break;
      case tBasicTypeEnum.INT32:
        text = "INT32";
        break;
      case tBasicTypeEnum.INT128:
        text = "INT128";
        break;
      case tBasicTypeEnum.INT8U:
        text = "INT8U";
        break;
      case tBasicTypeEnum.INT16U:
        text = "INT16U";
        break;
      case tBasicTypeEnum.INT24U:
        text = "INT24U";
        break;
      case tBasicTypeEnum.INT32U:
        text = "INT32U";
        break;
      case tBasicTypeEnum.FLOAT32:
        text = "FLOAT32";
        break;
      case tBasicTypeEnum.FLOAT64:
        text = "FLOAT64";
        break;
      case tBasicTypeEnum.ENUM:
        text = "Enum";
        break;
      case tBasicTypeEnum.DBPOS:
        text = "Dbpos";
        break;
      case tBasicTypeEnum.TCMD:
        text = "Tcmd";
        break;
      case tBasicTypeEnum.QUALITY:
        text = "Quality";
        break;
      case tBasicTypeEnum.TIMESTAMP:
        text = "Timestamp";
        break;
      case tBasicTypeEnum.VISSTRING32:
        text = "VisString32";
        break;
      case tBasicTypeEnum.VISSTRING64:
        text = "VisString64";
        break;
      case tBasicTypeEnum.VISSTRING255:
        text = "VisString255";
        break;
      case tBasicTypeEnum.OCTET64:
        text = "Octet64";
        break;
      case tBasicTypeEnum.STRUCT:
        text = "Struct";
        break;
      case tBasicTypeEnum.ENTRYTIME:
        text = "EntryTime";
        break;
      case tBasicTypeEnum.UNICODE255:
        text = "Unicode255";
        break;
      default:
        text = "Extension";
        break;
      }

      return text;
    }

    public static tBasicTypeEnum new_from_string (string t)
    {
      tBasicTypeEnum type;
      switch (t) {

      case "BOOLEAN":
        type = tBasicTypeEnum.BOOLEAN;
        break;

      case "INT8":
        type = tBasicTypeEnum.INT8;
        break;

      case "INT16":
        type = tBasicTypeEnum.INT16;
        break;

      case "INT24":
        type = tBasicTypeEnum.INT24;
        break;

      case "INT32":
        type = tBasicTypeEnum.INT32;
        break;

      case "INT128":
        type = tBasicTypeEnum.INT128;
        break;

      case "INT8U":
        type = tBasicTypeEnum.INT8U;
        break;

      case "INT16U":
        type = tBasicTypeEnum.INT16U;
        break;

      case "INT24U":
        type = tBasicTypeEnum.INT24U;
        break;

      case "INT32U":
        type = tBasicTypeEnum.INT32U;
        break;

      case "FLOAT32":
        type = tBasicTypeEnum.FLOAT32;
        break;

      case "FLOAT64":
        type = tBasicTypeEnum.FLOAT64;
        break;

      case "Enum":
        type = tBasicTypeEnum.ENUM;
        break;

      case "Dbpos":
        type = tBasicTypeEnum.DBPOS;
        break;

      case "Tcmd":
        type = tBasicTypeEnum.TCMD;
        break;

      case "Quality":
        type = tBasicTypeEnum.QUALITY;
        break;

      case "Timestamp":
        type = tBasicTypeEnum.TIMESTAMP;
        break;
      case "VisString32":
        type = tBasicTypeEnum.VISSTRING32;
        break;

      case "VisString64":
        type = tBasicTypeEnum.VISSTRING64;
        break;
      case "VisString255":
        type = tBasicTypeEnum.VISSTRING255;
        break;
      case "Octet64":
        type = tBasicTypeEnum.OCTET64;
        break;
      case "Struct":
        type = tBasicTypeEnum.STRUCT;
        break;
      case "EntryTime":
        type = tBasicTypeEnum.ENTRYTIME;
        break;
      case "Unicode255":
        type = tBasicTypeEnum.UNICODE255;
        break;
      default:
        type = tBasicTypeEnum.EXTENSION;
        break;
      }
      return type;
    }
  }
}

