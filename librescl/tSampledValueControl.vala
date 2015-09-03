
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
using GXml;
namespace Lscl
{
  public class tSampledValueControl : tControlWithIEDName
  {
    [Description(nick="SmvOpts", blurb="Sampled Values Options")]
    public tSampledValueControlSmvOpts smv_opts  { get; set; }
    [Description(nick="smvID", blurb="Idenitifier of the SMV, (Multicast CB or Unicast CB)")]
    public string smv_id  { get; set; }
    [Description(nick="multicast", blurb="If it's false indicates Unicast SMV services")]
    public bool multicast { get; set; default=true; }
    [Description(nick="smpRate", blurb="Sample rate")]
    public string smp_rate  { get; set; }
    [Description(nick="nofASDU", blurb="Number of ASDU (Application service data unit)")]
    public string nof_asdu  { get; set; }

    public class Array : SerializableArrayList<tSampledValueControl> {}
  }
}

