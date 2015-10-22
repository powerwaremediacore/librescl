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
  public class tSMVSettings : tServiceSettings 
  {
    [Description(nick="smpRate", blurb="Type of supported sample rate")]
    public tServiceSettingsType smp_rate  { get; set; }

    [Description(nick="svID", blurb="Sample value identifier.")]
    public tServiceSettingsType sv_id { get; set; }

    [Description(nick="optFields", blurb="Optional fields to include in report")]
    public tServiceSettingsType opt_fields { get; set; }

    [Description(nick="SmpRate", blurb="Sample Rate")]
    public tSmpRate.Array smp_rates { get; set; default = new tSmpRate.Array (); }
    // Edition 2.0
    [Description(nick="SamplesPerSec", blurb="Samples per second")]
    public tSamplesPerSec.Array samples_per_sec { get; set; default = new tSamplesPerSec.Array (); }
    [Description(nick="SecPerSamples", blurb="Seconds per samples")]
    public tSecPerSamples.Array sec_per_samples { get; set; default = new tSecPerSamples.Array (); }

    public tSMVSettings ()
    {
      _property_edition.set ("samples-per-sec", Edition.SECOND);
      _property_edition.set ("sec-per-samples", Edition.SECOND);
    }
  }
  /**
   * Base class for Samples Measured Values device capabilities.
   */
  public class tSamplesBase : Serializable
  {
    public string get_value () {
      if (serialized_xml_node_value == null)
        serialized_xml_node_value = "0";
      return serialized_xml_node_value;
    }
    public void set_value (string val) {
      serialized_xml_node_value = val;
    }
  }
  /**
   * Sample Rates supported by this device for Sample Measured Values.
   */
  public class tSmpRate : tSamplesBase
  {
    public class Array : GXml.SerializableArrayList <tSmpRate> {
			public new tSmpRate get (int index) { return base.get (index); }
		}
  }
  /**
   * Sample Rates supported by this device for Sample Measured Values.
   */
  public class tSamplesPerSec : tSamplesBase
  {
    public class Array : GXml.SerializableArrayList <tSamplesPerSec> {
			public new tSamplesPerSec get (int index) { return base.get (index); }
		}
  }
  /**
   * Sample Rates supported by this device for Sample Measured Values.
   */
  public class tSecPerSamples : tSamplesBase
  {
    public class Array : GXml.SerializableArrayList <tSecPerSamples> {
			public new tSecPerSamples get (int index) { return base.get (index); }
		}
  }
}
