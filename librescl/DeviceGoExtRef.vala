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
 * Class to manage GOOSE suscriptions as External References to internal variables.
 * 
 * The specific Logical Node and attribute, could be infered using referer Device's
 * SCL configuration.
 * 
 * Device is not responsible to hold SCL configuration of referenced Devices, but
 * the information required to identify GOOSEs to be used to map their data to internal
 * device variables.
 */
public abstract class Lscl.DeviceGoExtRef : Object, DeviceObject {

  /**
   * GOOSE control block name reference.
   * 
   * This information is typically available on GOOSE frames, to identify them.
   */
  public string gcb_ref { get; set; }
  /**
   * DataSet reference name.
   * 
   * This information is typically available on GOOSE frames, to identify them.
   */
  public string datset { get; set; }
  /**
   * GOOSE ID reference.
   * 
   * This information is typically available on GOOSE frames, to identify them.
   */
  public string go_id { get; set; }
  /**
   * GOOSE revision number.
   * 
   * This information is typically available on GOOSE frames, to identify them.
   */
  public string conf_ref { get; set; }
  /**
   * Number of referer item in GOOSE frame.
   * 
   * This information is typically available on GOOSE frames, to identify them.
   */
  public int data_entry { get; set; }
  /**
   * Referenced data type in a GOOSE frame for a given {@link data_entry}.
   * 
   * This information is typically available on GOOSE frames, to identify them.
   */
  public Lscl.DataEntryType data_entry_type { get; set; }
  
  /**
   * Data reference to an internal variable.
   * 
   * References to Logical Nodes and its attributes are optional. Then commonly
   * just {@link DeviceDataRef.association} field is used.
   */
  public DeviceDataRef dataref { get; set; }

  // DeviceObject interface properties
  public DeviceConnection connection { get; construct set; }
  public string description { get; set;  default = ""; }

	public DeviceGoExtRef (DeviceConnection cnn) {
		connection = cnn;
	}
  // DeviceObject interface methods
  public abstract bool read ();
  public abstract bool save ();
  public abstract bool is_valid ();

}

public enum Lscl.DataEntryType {
  BOOLEAN,
  QUALITY,
  TIME_STAMP
}

