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
 * Main interface to be implemented by Manufacturer's Plugins.
 * 
 * This object should manage connection to a device and use it to read and send
 * configurations to it.
 * 
 * Object should hold references to its {@link DeviceDataSet}, {@link DeviceGoose},
 * {@link DeviceGoExtRef} and {@link DeviceReport}, objects.
 */
public class DeviceDefault : Object, Lscl.DeviceObject {

  public static string DESCRIPTION = "Default Device Driver implementation";

  protected ArrayList<DeviceGoose> _gooses;
  protected ArrayList<DeviceReport> _reports;
  protected ArrayList<DeviceDataSet> _datasets;
  protected ArrayList<DeviceGoExtRef> _goextrefs;
  /**
   * List of GOOSE messages configured in the device.
   * 
   * This is a read only list, you should use {@link create_goose} and
   * {@link remove_goose} to manage its contents.
   * 
   * See {@link DeviceGoose} for more information.
   */
  public BidirList<DeviceGoose> gooses { owned get { return _gooses.read_only_view; } }
  /**
   * List of Reports configured in the device.
   * 
   * This is a read only list, you should use {@link create_report} and
   * {@link remove_report} to manage its contents.
   * 
   * See {@link DeviceReport} for more information.
   */
  public BidirList<DeviceReport> reports { owned get { return _reports.read_only_view; } }
  /**
   * List of DataSet configured in the device.
   * 
   * This is a read only list, you should use {@link create_dataset} and
   * {@link remove_dataseet} to manage its contents.
   * 
   * See {@link DeviceDataSet} for more information.
   */
  public BidirList<DeviceDataSet> datasets { owned get { return _datasets.read_only_view; } }
  /**
   * List of GOOSE external references to internal variables, configured in the device.
   * 
   * This is a read only list, you should use {@link create_goexref} and
   * {@link remove_goextref} to manage its contents.
   * 
   * See {@link DeviceGoExtRef} for more information.
   */
  public BidirList<DeviceGoExtRef> goextrefs { owned get { return _goextrefs.read_only_view; }}


  construct {
    _gooses = new ArrayList<DeviceGoose> ();
    _reports= new ArrayList<DeviceReport> ();
    _datasets = new ArrayList<DeviceDataSet> ();
    _goextrefs = new ArrayList<DeviceGoExtRef> ();
  }
  /**
   * Creates a new unconfigure GOOSE message representation in the device configuration.
   * 
   * Returned object could have intialized information, depends on the Manufacturer
   * implementation. Farder setup is expected, to configure a valid GOOSE message in
   * the device.
   * 
   * For devices with fixed GOOSE message, this method could return next unconfigured
   * GOOSE message available in the device.
   * 
   * See {@link DeviceGoose} for more information.
   */
  public DeviceGoose create_goose () {
    DeviceDefaultGoose g = (DeviceDefaultGoose) new Object (typeof (DeviceDefaultGoose), "connection", connection);
    _gooses.add (g);
    return g;
  }
  /**
   * Creates a new unconfigured DataSet representation in the device configuration.
   * 
   * Returned object could have intialized information, depends on the Manufacturer
   * implementation. Farder setup is expected, to configure a valid DataSet in
   * the device.
   * 
   * See {@link DeviceDataSet} for more information.
   */
  public DeviceDataSet create_dataset () {
    DeviceDefaultDataSet d = (DeviceDefaultDataSet) new  Object (typeof (DeviceDefaultDataSet), connection: connection);
    _datasets.add (d);
    return d;
  }
  /**
   * Creates a new unconfigured Report representation in the device configuration.
   * 
   * Returned object could have intialized information, depends on the Manufacturer
   * implementation. Farder setup is expected, to configure a valid Report in
   * the device.
   * 
   * For devices with fixed Reports, this method could return next unconfigured
   * GOOSE message available in the device.
   * 
   * See {@link DeviceReport} for more information.
   */
  public DeviceReport create_report () {
    DeviceDefaultReport r = (DeviceDefaultReport) new Object (typeof (DeviceDefaultReport), connection: connection);
    _reports.add (r);
    return r;
  }
  /**
   * Creates a new unconfigured GOOSE external reference representation in the
   * device configuration.
   * 
   * Returned object could have intialized information, depends on the Manufacturer
   * implementation. Farder setup is expected, to configure a valid {@link DeviceGoExtRef} in
   * the device.
   * 
   * For devices with fixed GOOSE external references, this method could return
   * next unconfigured GOOSE external reference available in the device.
   * 
   * See {@link DeviceReport} for more information.
   */
  public DeviceGoExtRef create_goexref () {
    DeviceDefaultGoExtRef g = (DeviceDefaultGoExtRef) new Object (typeof (DeviceDefaultGoExtRef), connection: connection);
    _goextrefs.add (g);
    return g;
  }
  /**
   * Removes a configured GOOSE messagein the
   * device configuration.
   * 
   * For devices with fixed GOOSE messages, this method should desable
   * a given {@link DeviceGoose} and set it as avaiable when {@link create_goose}
   * is called.
   * 
   * Returns: true on success.
   */
  public bool remove_goose (DeviceGoose goose) {
    if (_gooses.contains (goose))
      return _gooses.remove (goose);
    return false;
  }
  /**
   * Removes a configured DataSet in the
   * device configuration.
   * 
   * For devices with fixed DataSet, this method should desable
   * a given {@link DeviceDataSet} and set it as avaiable when {@link create_dataset}
   * is called.
   * 
   * Returns: true on success.
   */
  public bool remove_dataset (DeviceDataSet dataset) {
    if (_datasets.contains (dataset))
      return _datasets.remove (dataset);
    return false;
  }
  /**
   * Removes a configured Report in the
   * device configuration.
   * 
   * For devices with fixed Reports, this method should disable
   * a given {@link DeviceReport} and set it as avaiable when {@link create_report}
   * is called.
   * 
   * Returns: true on success.
   */
  public bool remove_report (DeviceReport report) {
    if (_reports.contains (report))
      return _reports.remove (report);
    return false;
  }
  /**
   * Removes a configured GOOSE external reference in the
   * device configuration.
   * 
   * For devices with fixed GOOSE external references, this method should disable
   * a given {@link DeviceGoExtRef} and set it as avaiable when {@link create_goexref}
   * is called.
   * 
   * Returns: true on success.
   */
  public bool remove_goexref (DeviceGoExtRef goextref) {
    if (_goextrefs.contains (goextref))
      return _goextrefs.remove (goextref);
    return false;
  }

  // DeviceObject interface implementation
  /**
   * Holds a connection reference to a device.
   * 
   * This property should be set on construction.
   * 
   * Should be used by implentor when {@link is_valid} is called.
   */
  public DeviceConnection connection { get; construct set; }
  /**
   * Holds a description of the object.
   * 
   * This property could be set on construction and read only, depends on
   * Manufacturer implementation.
   */
  public string description { get { return DESCRIPTION; } set { return; } }

  /**
   * Read configuration information to set up this object.
   */
  public bool read () {
    return true; // TODO: allow to read configuration from a SCL file
  }
  /**
   * Saves configuration information as changes to be sent by {@link DeviceConnection}
   * object to the device.
   */
  public bool save () {
    return true; // TODO: allow to save configuration to a file
  }
  /**
   * Verify if the information in the object is valid, for a given device connection.
   */
  public bool is_valid () {
    return true;
  }
}

