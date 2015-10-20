using System;


public class DeviceGoExtRef {

  // Attributes
  public string gcb_ref;
  public string datset;
  public string go_id;
  public string conf_ref;
  public int data_entry;
  public enumeration data_entry_type = BOOLEAN|QUALITY|TIME_STAMP;
  public DeviceDataRef dataref;

  // Associations 
  private DeviceDataRef unnamed;

}

