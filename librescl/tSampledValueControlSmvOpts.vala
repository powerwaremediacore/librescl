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
  public class tSampledValueControlSmvOpts : Serializable
  {
    [Description(nick="refreshTime", blurb="Time of refresh activity")]
    public bool refresh_time { get; set; default=false; }
    [Description(nick="sampleSynchronized", blurb="Samples are synchronized by clock signals")]
    public bool sample_synchronized { get; set; default=false; }
    [Description(nick="sampleRate", blurb="Sample rate from the instance")]
    public bool sample_rate { get; set; default=false; }
    [Description(nick="security", blurb="Security enabled")]
    public bool security { get; set; default=false; }
    [Description(nick="dataRef", blurb="If true, then the data set reference is included in the SV message")]
    public bool data_ref { get; set; default=false; }
  }
}

