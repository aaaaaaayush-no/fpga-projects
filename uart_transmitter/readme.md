The uart transmitter receives a starting bit before starting to send the data bits(8)


There are four states :
-idle
-start
-data
-end

during data state: 
it sends data from lsb to transmitter in each clock pulse until 8 data bits are transmittted;

data

