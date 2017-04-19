
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
 *  Copyright (c) 2013, 2017 Daniel Espinosa
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
	 construct {
			_property_edition.set ("smp-mod", Edition.SECOND);
		}
    [Description(nick="::SmvOpts", blurb="Sampled Values Options")]
    public tSampledValueControlSmvOpts smv_opts  { get; set; }
    [Description(nick="::smvID", blurb="Idenitifier of the SMV, (Multicast CB or Unicast CB)")]
    public string smv_id  { get; set; }
    [Description(nick="::multicast", blurb="If it's false indicates Unicast SMV services")]
    public GomBoolean multicast { get; set; }
    [Description(nick="::smpRate", blurb="Sample rate")]
    public GomInt smp_rate  { get; set; }
    [Description(nick="::nofASDU", blurb="Number of ASDU (Application service data unit)")]
    public GomInt nof_asdu  { get; set; }
		// Edition 2.0
		[Description(nick="::smpMod", blurb="Number of ASDU (Application service data unit)")]
    public tSmpMod smp_mod  { get; set; }

    public class Array : GomArrayList {
    construct {
      try { initialize (typeof (tSampledValueControl)); }
      catch (GLib.Error e) { warning ("Error: "+e.message); }
    }
		}
  }
	public class tSmpMod : GomEnum
	{
		construct {
      try { initialize_enum (typeof (tSmpMod.Enum)); }
      catch (GLib.Error e) { warning ("Error: "+e.message); }
		}
		public enum Enum
		{
			SMP_PER_PERIOD,
			SMP_PER_SEC,
			SEC_PER_SMP
		}
	}
}

