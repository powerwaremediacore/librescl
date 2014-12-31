/**
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *
 *  Copyright (c) 2014 Daniel Espinosa
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
using Gee;
using Lscl;

/**
 * Abstract class to hold references to internal DataSet implementations in Devices.
 */
public class DeviceDefaultDataSet : Lscl.DeviceDataSet {

  construct {
    description = "Default DataSet not configured";
    ied = "TEMPLATE";
    ap = "INVALID";
    ld_inst = "TEMPLATE";
    ln_class = "LLN0";
    ln_inst = "";
    ln_prefix = "";
    _datarefs = new ArrayList<DeviceDataRef> ();
  }

	
	public DeviceDefaultDataSet (DeviceConnection cnn) {
		base (cnn);
	}
  // Methods
  public override bool add_data_ref (DeviceDataRef dataref) {
    _datarefs.add (dataref);
    return true;
  }

  // DeviceObject interface methods overrides
  public override bool read () { return true; }
  public override bool save () { return true; }
  public override  bool is_valid () { return true; }
}

