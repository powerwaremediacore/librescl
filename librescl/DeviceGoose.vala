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

/**
 * Abstract class to manage GOOSE publications in a device.
 * 
 * Represents a GOOSE configuration in a device. To create new GOOSE messages use
 * {@link Device.create_goose} method.
 */
public abstract class Lscl.DeviceGoose : Lscl.DeviceObjectRefence, DeviceObject {

  /**
   * If this GOOSE message is enable and publishing.
   * 
   * This property could be read only, on devices with fixed GOOSE messages.
   */
  public bool enable { get; set; }
  /**
   * MAC Address to publish to on broudcast.
   */
  public string mac { get; set; }
  /**
   * VLAN ID to publish on.
   */
  public string vlanid { get; set; }
  /**
   * VLAN priority when managed by switches, depends on its application.
   */
  public string vlanp { get; set; }
  /**
   * Appliation ID used in the system for GOOSE management. 
   */
  public string appid { get; set; }
  /**
   * Configuation revision.
   */
  public string revision { get; set; }
  /**
   * A {@link DeviceDataSet} configurated in the device and used by this GOOSE
   * message to get data from.
   */
  public DeviceDataSet dataset { get; set; }

  // DeviceObject interface properties
  public DeviceConnection connection { get; construct set; }
  public string description { get; set;  default = ""; }

	public DeviceGoose (DeviceConnection cnn) {
		connection = cnn;
	}
  // DeviceObject interface methods
  public abstract bool read ();
  public abstract bool save ();
  public abstract bool is_valid ();
}

