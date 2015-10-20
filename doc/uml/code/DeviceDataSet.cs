using System;


public class DeviceDataSet : DeviceObjectRefence : DeviceObject {

  // Attributes
  public Array<DeviceDataRef> datarefs;
  public string name;

  // Associations 
  private DeviceDataRef unnamed;

  // Operation
  // param dataref
  // return bool
  public bool add_data_ref (DeviceDataRef dataref)
  {
    throw new System.Exception ("Not implemented yet!");
  }

}

