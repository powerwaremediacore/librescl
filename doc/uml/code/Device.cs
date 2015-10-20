using System;


public interface Device : DeviceObject {

  // Attributes
  public Array<DeviceGoose> gooses;
  public Array<DeviceReport> reports;
  public Array<DeviceDataset> datasets;
  public Array<DeviceGooseSuscrioption> goose_suscriptions;
  public DeviceConnection connection;
  public DeviceConfEditor conf_editor;

  // Associations 
  private DeviceDataSet unnamed;
  private DeviceGoExtRef unnamed;
  private DeviceReport unnamed;
  private DeviceGoose unnamed;

  // Operation
  // return DeviceGoose
  DeviceGoose create_goose ();
  // Operation
  // return DeviceDataSet
  DeviceDataSet create_dataset ();
  // Operation
  // return DeviceReport
  public DeviceReport create_report ()
  {
    throw new System.Exception ("Not implemented yet!");
  }
  // Operation
  // return DeviceGoExtRef
  DeviceGoExtRef create_goexref ();

}

