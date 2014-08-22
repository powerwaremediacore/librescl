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
  public class tServices : Serializable
  {
    [Description(nick="DynAssociation", blurb="All services for dynamic building of associations.")]
    public tDynAssociation dyn_association { get; set; }

    [Description(nick="SettingGroups", blurb="Setting group services belong to the setting group control block.")]
    public tSettingGroups setting_groups { get; set; }

    [Description(nick="GetDirectory", blurb="Service for reading the contents of a server, that is the LD and LN directories.")]
    public tGetDirectory get_directory { get; set; }

    [Description(nick="GetDataObjectDefinition", blurb="Service to retrieve the complete list of all DA definitions of the referenced data that are visible and thus accessible to the requesting client by the referenced LN.")]
    public tGetDataObjectDefinition get_data_object_definition { get; set; }

    [Description(nick="DataObjectDirectory", blurb="Service to get the DATA defined in a LN.")]
    public tDataObjectDirectory data_object_directory { get; set; }

    [Description(nick="GetDataSetValue", blurb="Service to retrieve all values of data referenced by the members of the data set.")]
    public tGetDataSetValue get_data_set_value { get; set; }

    [Description(nick="SetDataSetValue", blurb="Service to write all values of data referenced by the members of the data set.")]
    public tSetDataSetValue set_data_set_value { get; set; }

    [Description(nick="DataSetDirectory", blurb="Service to retrieve FCD/FCDA of all members referenced in the data set.")]
    public tDataSetDirectory data_set_directory { get; set; }

    [Description(nick="ConfDataSet", blurb="service to configure new data sets up to the defined max.")]
    public tConfDataSet conf_data_set { get; set; }

    [Description(nick="DynDataSet", blurb="Services to dynamically create and delete data sets.")]
    public tDynDataSet dyn_data_set { get; set; }

    [Description(nick="ReadWrite", blurb="Basic data read and write facility.")]
    public tReadWrite read_write { get; set; }

    [Description(nick="TimerActivatedControl", blurb="This element specifies that timer activated control services are supported.")]
    public tTimerActivatedControl timer_activated_control { get; set; }

    [Description(nick="ConfReportControl", blurb="Capability of static creation of report control blocks.")]
    public tConfReportControl conf_report_control { get; set; }

    [Description(nick="GetCBValues", blurb="Read values of control blocks.")]
    public tGetCBValues get_cb_values { get; set; }

    [Description(nick="ConfLogControl", blurb="Capability of static creation of log control blocks.")]
    public tConfLogControl conf_log_control { get; set; }

    [Description(nick="ReportSettings", blurb="The report control block attributes for which online setting is possible.")]
    public tReportSettings report_settings { get; set; }

    [Description(nick="LogSettings", blurb="The log control block attributes for which online setting is possible.")]
    public tLogSettings log_settings { get; set; }

    [Description(nick="GSESettings", blurb="The GSE control block attributes for which online setting is possible.")]
    public tGSESettings gse_settings { get; set; }

    [Description(nick="SMVSettings", blurb="The SMV control block attributes for which online setting is possible.")]
    public tSMVSettings smv_settings { get; set; }

    [Description(nick="GSEDir", blurb="GSE directory services.")]
    public tGSEDir gse_dir  { get; set; }

    [Description(nick="GOOSE", blurb="This element shows that the IED can be a GOOSE server and/or client.")]
    public tGOOSE goose { get; set; }

    [Description(nick="GSSE", blurb="This element shows that the IED can be a binary data GSSE server and/or client.")]
    public tGSSE gsse { get; set; }

    [Description(nick="FileHandling", blurb="All file handling services.")]
    public tFileHandling file_handling { get; set; }

    [Description(nick="ConfLNs", blurb="Describes what can be configured for LNs defined in an ICD file.")]
    public tConfLNs conf_lns { get; set; }
  }
  public class tDynAssociation : tServiceYesNo {}
  public class tFileHandling : tServiceYesNo {}
  public class tGSSE : tServiceWithMaxAndClient {}
  public class tGSEDir : tServiceYesNo {}
  public class tGOOSE : tServiceWithMaxAndClient {}
  public class tConfLogControl : tServiceWithMax {}
  public class tGetCBValues : tServiceYesNo {}
  public class tConfReportControl : tServiceWithMax {}
  public class tTimerActivatedControl : tServiceYesNo {}
  public class tReadWrite : tServiceYesNo {}
  public class tSettingGroups : tServicesSettingGroups {}
  public class tGetDirectory : tServiceYesNo {}
  public class tGetDataObjectDefinition : tServiceYesNo {}
  public class tDataObjectDirectory : tServiceYesNo {}
  public class tGetDataSetValue : tServiceYesNo {}
  public class tSetDataSetValue : tServiceYesNo {}
  public class tDataSetDirectory : tServiceYesNo {}
  public class tConfDataSet : tServiceWithMaxAndMaxAttributesAndModify {}
  public class tDynDataSet : tServiceWithMaxAndMaxAttributesAndModify {}
}

