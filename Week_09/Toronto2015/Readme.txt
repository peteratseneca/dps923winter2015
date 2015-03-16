
This is Readme.txt

Partial implementation of DPS923 & MAP523 Assignment 1.

Shows how to request data from a web service, and store the data on a local device.

The Core Data Object Model has these features:
- entities for Sport and Venue
- notice the data type of the logo, photo, and map properties (we will not use a value transformer)
- custom classes 

The Model class has these features:
- fetched results controller (frc) for the Sport entity

There is a new Extensions class:
- has a 'best practice' way to add objects in a many-to-many relationship

The Launch controller has these features:
- if the app is being launched for the first time, data will be loaded from the web service

Notice the cascading method calls:
1. check for local device data, if none, request the sports from the web service
2. request the venues from the web service
3. process the responses, by adding device-stored objects
