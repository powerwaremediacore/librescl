/**
 *
 *  tLN0.vala
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
  public class tLN0 : tAnyLN
  {
		private tLNClassEnum _lnclass;
		construct {
			_lnclass = new tLNClassEnum ();
			_lnclass.value = "LLN0";
		}
    public tGSEControl.HashMap gse_controls { get; set; }
    public tSampledValueControl.Array sampled_value_controls { get; set; }
    public tSettingControl setting_control { get; set; }
    public tSCLControl scl_control { get; set; }
    [Description(nick="::Log",blurb="")]
    public tLog log { get; set; }
    [Description(nick="::lnClass",blurb="Allways set to LLN0")]
    public tLNClassEnum ln_class { get { return _lnclass; } set {} }
    [Description(nick="::inst",blurb="LLN0 have no instances")]
    public string inst { get { return ""; } set {} }
  }
}

