# PiTracker
This script creates GPS coordinates in Google Earth’s KML format using shell/python for the Raspberry Pi directly from a GPS Receiver that uses NMEA Standards.

Items needed:<br>
-Raspberry Pi<br>
-FTDI Basic Breakout USB-TTL<br>
-GPS Receiver<br>


To run script type ./GPS.sh it will begin dumping GPS data into Google.KML to break out "ctrl+c" or kill the PID.<br>


After reciving the data in the Google.KML file you must add the "wrapper" before opening it up in Google Earth. 
Copy All the data from Google.KML to wrapper.KML and replace line 19. (The last track might only have 1/2 of the coordinates and would need to be removed or Google Earth will not read the file)
