#!/usr/bin/python

from gi.repository import Lscl
scl = Lscl.SclDocument()
print("Loading 'test.scd' file...")
scl.read_from_path('test.scd')
print("File loaded...")
scl.get_ieds().deserialize_children()
print("Deserialized IEDs")
print("List of IEDs")
for iedName in scl.get_ieds().list_keys():
  print ("IED: "+iedName)
print ("Getting first IED")
ied = scl.get_ieds().list_values()[0]
print ("Access Points in IED "+ied.get_name())
ied.get_access_points().deserialize_children()
for apl in ied.get_access_points().list_values():
  print ("AP: "+apl.get_name ())
ap = ied.get_access_points().list_values()[0]
print ("Logical Devices in IED "+ied.get_name ()+" for first AP: "+ap.get_name())
for ld in ap.get_server().get_logical_devices().list_values():
  print ("Logical Device: /"+ap.get_name()+"/"+ld.get_inst())

