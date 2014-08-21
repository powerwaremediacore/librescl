/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*-  */
/*
 * tExtRef.vala
 * Copyright (C) 2014 Daniel Espinosa <esodan@gmail.com>
 *
 * librescl is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * librescl is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.";
 */
 using GXml;
namespace Lscl
{
  public class tExtRef : Serializable
  {
    public string ied_name { get; set; }
    public string ld_inst { get; set; }
    public string prefix { get; set; }
    public string ln_class { get; set; }
    public string ln_inst { get; set; }
    public string do_name { get; set; }
    public string da_name { get; set; }
    public string int_addr { get; set; }
    public string service_type { get; set; }
    public string src_ld_inst { get; set; }
    public string src_prefix { get; set; }
    public string src_ln_class { get; set; }
    public string src_ln_inst { get; set; }
    public string src_cb_name { get; set; }
  }
  // tExtRef.service_type must have just one of this enum value
  public enum tServiceType
  {
    POLL,
    REPORT,
    GOOSE,
    SMV,
    EXTENSION;
    public string to_string ()
    {
      string t = "";
      switch (this) {
        case POLL:
          t = "Poll";
          break;
        case REPORT:
          t = "Report";
          break;
        case GOOSE:
          t = "GOOSE";
          break;
        case SMV:
          t = "SMV";
          break;
        default:
          t = "EXTENSION";
          break;
      }
      return t;
    }
    public static tServiceType from_string (string str)
    {
      tServiceType env = tServiceType.EXTENSION;
      try {
        var v = GXml.Enumeration.parse (typeof (tServiceType), str);
        env = (tServiceType) v.@value;
      }
      catch {}
      return env;
    }
  }
}
