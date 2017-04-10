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

namespace Lscl
{
  public class tServices : Serializable
  {
    public tDynAssociation dyn_association { get; set; }

    public tSettingGroups setting_groups { get; set; }

    public tGetDirectory get_directory { get; set; }

    public tGetDataObjectDefinition get_data_object_definition { get; set; }

    public tDataObjectDirectory data_object_directory { get; set; }

    public tGetDataSetValue get_data_set_value { get; set; }

    public tSetDataSetValue set_data_set_value { get; set; }

    public tDataSetDirectory data_set_directory { get; set; }

    public tConfDataSet conf_data_set { get; set; }

    public tDynDataSet dyn_data_set { get; set; }

    public tReadWrite read_write { get; set; }

    public tTimerActivatedControl timer_activated_control { get; set; }

    public tConfReportControl conf_report_control { get; set; }

    public tGetCBValues get_cb_values { get; set; }

    public tConfLogControl conf_log_control { get; set; }

    public tReportSettings report_settings { get; set; }

    public tLogSettings log_settings { get; set; }

    public tGSESettings gse_settings { get; set; }

    public tSMVSettings smv_settings { get; set; }

    public tGSEDir gse_dir  { get; set; }

    public tGOOSE goose { get; set; }

    public tGSSE gsse { get; set; }

    public tFileHandling file_handling { get; set; }

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

