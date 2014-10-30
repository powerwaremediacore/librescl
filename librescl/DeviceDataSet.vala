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

/**
 * Abstract class to hold references to internal DataSet implementations in Devices.
 */
public abstract class Lscl.DeviceDataSet : Lscl.DeviceObjectRefence, Lscl.DeviceObject {
  protected ArrayList<DeviceDataRef> _datarefs;
  construct {
    _datarefs = new ArrayList<DeviceDataRef> ();
  }
  /**
   * Holds Data references in {@link DeviceDataRef} objects.
   * 
   * This should be a read only list.
   */
  public ArrayList<DeviceDataRef> datarefs { get { return _datarefs; } }
  /**
   * Data Set name.
   */
  public string name { get; set; }

  // DeviceObject interface properties
  public DeviceConnection connection { get; construct set; }
  public string description { get; set; default = ""; }

  public abstract bool add_data_ref (DeviceDataRef dataref);
  
  public DeviceDataSet (DeviceConnection cnn) {
  	connection = cnn;
  }
  // DeviceObject interface methods
  public abstract bool read ();
  public abstract bool save ();
  public abstract bool is_valid ();
}

