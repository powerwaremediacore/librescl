using System;

public interface DeviceConnection {

  // Attributes
  public bool active;
  public string ip;
  public string params;
  public string manufacturer;
  public string model;
  public SCL scl;

  // Operation
  // return bool
  bool open ();
  // Operation
  // return bool
  bool close ();
  // Operation
  // return bool
  bool send ();

}

