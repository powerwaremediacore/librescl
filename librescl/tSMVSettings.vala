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
    public tServiceSettingsEnum smp_rate  { get; set;  default=tServiceSettingsEnum.Fix; }

    [Description(nick="svID", blurb="Sample value identifier.")]
    public tServiceSettingsEnum sv_id { get; set; default=tServiceSettingsEnum.Fix; }

    [Description(nick="optFields", blurb="Optional fields to include in report")]
    public tServiceSettingsEnum opt_fields { get; set; default=tServiceSettingsEnum.Fix; }

    [Description(nick="SmpRate", blurb="Sample Rate")]
    public tSmpRate.Array smp_rates { get; set; }
    // Edition 2.0
    [Description(nick="SamplesPerSec", blurb="Samples per second")]
    public tSamplesPerSec.Array samples_per_sec { get; set; }
    [Description(nick="SecPerSamples", blurb="Seconds per samples")]
    public tSecPerSamples.Array sec_per_samples { get; set; }

    public tSMVSettings ()
    {
      _property_edition.set ("samples-per-sec", Edition.SECOND);
      _property_edition.set ("sec-per-samples", Edition.SECOND);
    }
    // SerializableContainer overrides
    public override void init_containers ()
    {
      if (smp_rates == null)
        smp_rates = new tSmpRate.Array ();
      if (samples_per_sec == null)
        samples_per_sec = new tSamplesPerSec.Array ();
      if (sec_per_samples == null)
        sec_per_samples = new tSecPerSamples.Array ();
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
    public class Array : GXml.SerializableArrayList <tSmpRate> {}
  }
  /**
   * Sample Rates supported by this device for Sample Measured Values.
   */
  public class tSamplesPerSec : tSamplesBase
  {
    public class Array : GXml.SerializableArrayList <tSamplesPerSec> {}
  }
  /**
   * Sample Rates supported by this device for Sample Measured Values.
   */
  public class tSecPerSamples : tSamplesBase
  {
    public class Array : GXml.SerializableArrayList <tSecPerSamples> {}
  }
}
