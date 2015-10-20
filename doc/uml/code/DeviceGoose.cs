using System;


public class DeviceGoose : DeviceObjectRefence : DeviceObject {

  // Attributes
  public bool enable;
  public string mac;
  public string vlanid = ([0-9][A-F]);
  public string vlanp = ([0-7]);
  public string appid = ([0-9][A-F]);
  public string revision;
  public DeviceDataSet dataset;

}

