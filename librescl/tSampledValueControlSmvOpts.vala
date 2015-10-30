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
  public class tSampledValueControlSmvOpts : Serializable
  {
    [Description(nick="refreshTime", blurb="Time of refresh activity")]
    public SerializableBool refresh_time { get; set; }
    [Description(nick="sampleSynchronized", blurb="Samples are synchronized by clock signals")]
    public SerializableBool sample_synchronized { get; set; }
    [Description(nick="sampleRate", blurb="Sample rate from the instance")]
    public SerializableBool sample_rate { get; set; }
    [Description(nick="security", blurb="Security enabled")]
    public SerializableBool security { get; set; }
    [Description(nick="dataRef", blurb="If true, then the data set reference is included in the SV message")]
    public SerializableBool data_ref { get; set; }
  }
}

