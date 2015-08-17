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
  public class tAnyLN : tUnNaming 
  {
    [Description(blurb="DataSet controls")]
    public tDataSet.HashMap data_sets { get; set; }
    [Description(blurb="Report Controls")]
    public tReportControl.HashMap report_controls { get; set; }
    [Description(blurb="Log Controls")]
    public tLogControl.HashMap log_controls { get; set; }
    [Description(blurb="Data Object Instances")]
    public tDOI.HashMap dois { get; set; }
    [Description(nick="Inputs", blurb="Input source")]
    public tInputs inputs { get; set; }
    [Description(nick="lnType", blurb="The instantiable type definition of this logical node.")]
    public string ln_type { get; set; }
    // Serializable
    public override void init_containers ()
    {
      if (data_sets == null)
        data_sets = new tDataSet.HashMap ();
      if (report_controls == null)
        report_controls = new tReportControl.HashMap ();
      if (log_controls == null)
        log_controls = new tLogControl.HashMap ();
      if (dois == null)
        dois = new tDOI.HashMap ();
    }
	}
}

