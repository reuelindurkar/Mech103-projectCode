%% Make sure to remove the arduino object from workspace
clear
clc
close all
% Connect to the Arduino. Specify which pins you connected the
% thermometer output voltage to, and which pin has your LED.
spicyArduino = arduino('COM5' , 'uno' );
tmp36Pin = 'A0';
ledPin = 'D13' ;
disp('Starting Reading...');
% How to get threshold? read a few voltages from pin from command window

readVoltage(arduino() , 'A0' ) ; 

threshold =  ; % threshold to turn on LED
dataPoints = 20; % number of data points to capture
% Enter in how long you want the delay to be between readings
delayTime = ;
% This gets the voltage from the arduino
voltage(1) = readVoltage(spicyArduino,tmp36Pin);
for j = 2:dataPoints
 % Read the voltage from the arduino
 % Maybe you want to write out the voltage to the computer?
 % Pause for delayTime

 % Check if the temperature being read is greater than threshold
 if voltage(j) >= threshold
 % if above the threshold, turn on the light

 else
 % or else, turn it off
 end

end
8
disp('Done reading voltages!');
% Convert the voltage array into a temperature array
% Figure out how to create a "time" array cooresponding to their delay
% Plot the temperature data
% Convert from C to F