
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
    [Description(nick=" ", blurb="Sampled Values Options")]
    public tSampledValueControlSmvOpts SmvOpts  { get; set; }
    [Description(nick=" ", blurb="Idenitifier of the SMV, (Multicast CB or Unicast CB)")]
    public string smvID  { get; set; }
    [Description(nick=" ", blurb="If it's false indicates Unicast SMV services")]
    public bool multicast  { get; set; default=true; }
    [Description(nick=" ", blurb="Sample rate")]
    public uint smpRate  { get; set; }
    [Description(nick=" ", blurb="Number of ASDU (Application service data unit)")]
    public uint nofASDU  { get; set; }

    public class Array : SerializableArrayList<tSampledValueControl> {}
  }
}

