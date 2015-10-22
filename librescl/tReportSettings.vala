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

namespace Lscl
{
  public class tReportSettings : tServiceSettings 
  {
    [Description(nick="rptID", blurb="Identifier for the report control block")]
    public tServiceSettingsType rpt_id  { get; set; }
    [Description(nick="optFields", blurb="Optional fields to include in report")]
    public tServiceSettingsType opt_fields  { get; set; }
    [Description(nick="bufTime", blurb="Buffer Time")]
    public tServiceSettingsType buf_time  { get; set; }
    [Description(nick="trgOps", blurb="TrgOps contains the reasons which causes the control block to report a value into the report.")]
    public tServiceSettingsType trg_ops  { get; set; }
    [Description(nick="intgPd", blurb="Integrity period: reporting all values initiated by the server based on this period")]
    public tServiceSettingsType intg_pd  { get; set; }
  }
}

