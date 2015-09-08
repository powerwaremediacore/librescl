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
namespace Lscl
{
  public class tP : Serializable
  {
    private string _type;

    [Description(nick="type",blurb="This attribute identifies the meaning of the value")]
    public string ptype {  get { return _type; } set { _type = value; } }

    public TypeEnum get_enum ()
    {
      return TypeEnum.new_from_string (_type);
    }

    public string get_value () { return serialized_xml_node_value; }
    public void set_value (string val) { serialized_xml_node_value = val; }

    public string description ()
    {
      return TypeEnum.new_from_string (_type).description ();
    }

    public tP ()
    {
      _type = TypeEnum.IP.to_string ();
    }

    public tP.from_enum (TypeEnum type)
    {
      _type = type.to_string ();
    }

    public tP.from_string (string type)
    {
      _type = type;
    }

    public override bool serialize_use_xml_node_value () { return true; }

    public class Array : GXml.SerializableArrayList<tP> {
			public new tP get (int index) { return base.get (index); }
		}

    public enum TypeEnum
    {
      IP,
      IP_SUBNET,
      IP_GATEWAY,
      OSI_NSAP,
      OSI_TSEL,
      OSI_SSEL,
      OSI_PSEL,
      OSI_AP_TITLE,
      OSI_AP_INVOKE,
      OSI_AE_QUALIFIER,
      OSI_AE_INVOKE,
      MAC_ADDRESS,
      APPID,
      VLAN_PRIORITY,
      VLAN_ID,
      SNTP_PORT,
      MMS_PORT,
      EXTENSION;  //  For custom types

      public string to_string ()
      {
        string text = "";
        switch (this)
        {
          case TypeEnum.IP:
            text = "IP";
            break;
          case TypeEnum.IP_SUBNET:
            text = "IP-SUBNET";
            break;
          case TypeEnum.IP_GATEWAY:
            text = "IP-GATEWAY";
            break;
          case TypeEnum.OSI_NSAP:
            text = "OSI-NSAP";
            break;
          case TypeEnum.OSI_TSEL:
            text = "OSI-TSEL";
            break;
          case TypeEnum.OSI_SSEL:
            text = "OSI-SSEL";
            break;
          case TypeEnum.OSI_PSEL:
            text = "OSI-PSEL";
            break;
          case TypeEnum.OSI_AP_TITLE:
            text = "OSI-AP-Title";
            break;
          case TypeEnum.OSI_AP_INVOKE:
            text = "OSI-AP-Invoke";
            break;
          case TypeEnum.OSI_AE_QUALIFIER:
            text = "OSI-AE-Qualifier";
            break;
          case TypeEnum.OSI_AE_INVOKE:
            text = "OSI-AE-Invoke";
            break;
          case TypeEnum.MAC_ADDRESS:
            text = "MAC-Address";
            break;
          case TypeEnum.APPID:
            text = "APPID";
            break;
          case TypeEnum.VLAN_PRIORITY:
            text = "VLAN-PRIORITY";
            break;
          case TypeEnum.VLAN_ID:
            text = "VLAN-ID";
            break;
          case TypeEnum.SNTP_PORT:
            text = "SNTP-Port";
            break;
          case TypeEnum.MMS_PORT:
            text ="MMS-Port";
            break;
          default:
            text = "EXTENSION";
            break;
        }
        return text;
      }

      public string description ()
      {
        string text = "";
        switch (this)
        {
          case TypeEnum.IP:
            text = "TCP/IP Address";
            break;
          case TypeEnum.IP_SUBNET:
            text = "Subnetwork Mask for TCP/IP profiles";
            break;
          case TypeEnum.IP_GATEWAY:
            text = "First Hop IP gateway address for TCP/IP profiles";
            break;
          case TypeEnum.OSI_NSAP:
            text = "OSI Network Address";
            break;
          case TypeEnum.OSI_TSEL:
            text = "OSI Transport Selector";
            break;
          case TypeEnum.OSI_SSEL:
            text = "OSI Session Selector";
            break;
          case TypeEnum.OSI_PSEL:
            text = "OSI Presentation Selector";
            break;
          case TypeEnum.OSI_AP_TITLE:
            text = "OSI ACSE AP Title value";
            break;
          case TypeEnum.OSI_AP_INVOKE:
            text = "OSI ACSE AP Invoke ID";
            break;
          case TypeEnum.OSI_AE_QUALIFIER:
            text = "OSI ACSE AE Qualifier";
            break;
          case TypeEnum.OSI_AE_INVOKE:
            text = "OSI ACSE AE Invoke ID";
            break;
          case TypeEnum.MAC_ADDRESS:
            text = "Media Access Address value";
            break;
          case TypeEnum.APPID:
            text = "Application Identifier";
            break;
          case TypeEnum.VLAN_PRIORITY:
            text = "VLAN User Priority";
            break;
          case TypeEnum.VLAN_ID:
            text = "VLAN ID";
            break;
          case TypeEnum.SNTP_PORT:
            text = "SNTP Port";
            break;
          case TypeEnum.MMS_PORT:
            text ="MMS Port";
            break;
          default:
            text = "EXTENSION: Custom type";
            break;
        }
        return text;
      }

      public static TypeEnum new_from_string (string t)
      {
        TypeEnum type;
        switch (t)
        {
          case "IP":
            type = TypeEnum.IP;
            break;
          case "IP-SUBNET":
            type = TypeEnum.IP_SUBNET;
            break;
          case "IP-GATEWAY":
            type = TypeEnum.IP_GATEWAY;
            break;
          case "OSI-NSAP":
            type = TypeEnum.OSI_NSAP;
            break;
          case "OSI-TSEL":
            type = TypeEnum.OSI_TSEL;
            break;
          case "OSI-SSEL":
            type = TypeEnum.OSI_SSEL;
            break;
          case "OSI-PSEL":
            type = TypeEnum.OSI_PSEL;
            break;
          case "OSI-AP-Title":
            type = TypeEnum.OSI_AP_TITLE;
            break;
          case "OSI-AP-Invoke":
            type = TypeEnum.OSI_AP_INVOKE;
            break;
          case "OSI-AE-Qualifier":
            type = TypeEnum.OSI_AE_QUALIFIER;
            break;
          case "OSI-AE-Invoke":
            type = TypeEnum.OSI_AE_INVOKE;
            break;
          case "MAC-Address":
            type = TypeEnum.MAC_ADDRESS;
            break;
          case "APPID":
            type = TypeEnum.APPID;
            break;
          case "VLAN-PRIORITY":
            type = TypeEnum.VLAN_PRIORITY;
            break;
          case "VLAN-ID":
            type = TypeEnum.VLAN_ID;
            break;
          default:
            type = TypeEnum.EXTENSION;
            break;
        }
        return type;
      }
      public string pattern ()
      {
        string pattern = "";
        switch (this)
        {
          case TypeEnum.IP:
            pattern = """([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])""";
            break;
          case TypeEnum.IP_SUBNET:
            pattern = """([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])""";
            break;
          case TypeEnum.IP_GATEWAY:
            pattern = """([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])""";
            break;
          case TypeEnum.OSI_NSAP:
            pattern = """[0-9,A-F]+""";
            break;
          case TypeEnum.OSI_TSEL:
            pattern = """[0-9,A-F]+""";
            break;
          case TypeEnum.OSI_SSEL:
            pattern = """[0-9,A-F]+""";
            break;
          case TypeEnum.OSI_PSEL:
            pattern = """[0-9,A-F]+""";
            break;
          case TypeEnum.OSI_AP_TITLE:
            pattern = """[0-9,&#44;]+""";
            break;
          case TypeEnum.OSI_AP_INVOKE:
            pattern = """[0-9]+""";
            break;
          case TypeEnum.OSI_AE_QUALIFIER:
            pattern = """[0-9]+""";
            break;
          case TypeEnum.OSI_AE_INVOKE:
            pattern = """[0-9]+""";
            break;
          case TypeEnum.MAC_ADDRESS:
            pattern = """[0-9,A-F]{2}\-[0-9,A-F]{2}\-[0-9,A-F]{2}\-[0-9,A-F]{2}\-[0-9,A-F]{2}\-[0-9,A-F]{2}""";
            break;
          case TypeEnum.APPID:
            pattern = """[0-9,A-F]{4}""";
            break;
          case TypeEnum.VLAN_PRIORITY:
            pattern = """[0-7]""";
            break;
          case TypeEnum.VLAN_ID:
            pattern = """[0-9,A-F]{3}""";
            break;
          default:
            pattern = "";
            break;
        }
        return pattern;
      }
    }
    public override bool deserialize_property (GXml.Node property_node)
                                              throws GLib.Error
    {
      if (property_node is GXml.Attribute) {
        if (property_node.name == "type") {
          if ("tP_" in property_node.value )
            return false;
        }
      }
      return default_deserialize_property (property_node);
    }
  }

  public class tP_VLANID : tP 
  {
    public tP_VLANID() 
    {
      base.from_enum (tP.TypeEnum.VLAN_ID);
    }
  }

  public class tP_VLANPRIORITY : tP 
  {
    public tP_VLANPRIORITY() 
    {
      base.from_enum (tP.TypeEnum.VLAN_PRIORITY);
    }
  }

  public class tP_APPID : tP 
  {
    public tP_APPID()
    {
      base.from_enum (tP.TypeEnum.APPID);
    }
  }

  public class tP_MACAddress : tP
  {
    public tP_MACAddress() 
    {
      base.from_enum (tP.TypeEnum.MAC_ADDRESS);
    }
  }

  public class tP_OSIAEInvoke : tP
  {
    public tP_OSIAEInvoke()
    {
      base.from_enum (tP.TypeEnum.OSI_AE_INVOKE);
    }
  }

  public class tP_OSIAEQualifier : tP 
  {
    public tP_OSIAEQualifier() 
    {
      base.from_enum (tP.TypeEnum.OSI_AE_QUALIFIER);
    }
  }

  public class tP_OSIAPInvoke : tP 
  {
    public tP_OSIAPInvoke() 
    {
      base.from_enum (tP.TypeEnum.OSI_AP_INVOKE);
    }
  }

  public class tP_OSIAPTitle : tP 
  {
    public tP_OSIAPTitle()
    {
      base.from_enum (tP.TypeEnum.OSI_AP_TITLE);
    }
  }

  public class tP_OSIPSEL : tP 
  {
    public tP_OSIPSEL()
    {
      base.from_enum (tP.TypeEnum.OSI_PSEL);
    }
  }

  public class tP_OSISSEL : tP
  {
    public tP_OSISSEL()
    {
      base.from_enum (tP.TypeEnum.OSI_SSEL);
    }
  }

  public class tP_OSITSEL : tP 
  {
    public tP_OSITSEL() 
    {
      base.from_enum (tP.TypeEnum.OSI_TSEL);
    }
  }

  public class tP_OSINSAP : tP
  {
    public tP_OSINSAP()
    {
      base.from_enum (tP.TypeEnum.OSI_NSAP);
    }
  }

  public class tP_IPGATEWAY : tP 
  {
    public tP_IPGATEWAY()
    {
      base.from_enum (tP.TypeEnum.IP_GATEWAY);
    }
  }

  public class tP_IPSUBNET : tP 
  {
    public tP_IPSUBNET()
    {
      base.from_enum (tP.TypeEnum.IP_SUBNET);
    }
  }

  public class tP_IP : tP
  {
    public tP_IP()
    {
      base.from_enum (tP.TypeEnum.IP);
    }
  }
}
