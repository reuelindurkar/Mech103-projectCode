% Note: must do new arduinosetup and make sure ultrasonic is selected
clear;close all;clc;
% Define Pins
TRIG_PIN = 'D8';
ECHO_PIN = 'D7';
SPEAK_PIN = 'D9';
green1 = 'D6';
green2 = 'D5';
yellow1 ='D4';
red1 = 'D3';
red2 = 'D2';
% Setup arduino object, make sure to set up the arduino for ultrasonic
% as described above!

nineDeliverableArduino = arduino('COM5','Uno','libraries','ultrasonic');
% Setup ultrasonic sensor
ultraSensor = ultrasonic(nineDeliverableArduino,TRIG_PIN,ECHO_PIN);

% This while loop will run forever, so we will stick our distance reading,
% LED lighting, and noise making inside of here


while(1)
 % Read the distance from the ultrasonic sensor
 distance = readDistance(ultraSensor) % omit ; so you can see in command window
 pause(0.25)

    writeDigitalPin(nineDeliverableArduino, 'D6' , 0);
    writeDigitalPin(nineDeliverableArduino, 'D5' , 0);
    writeDigitalPin(nineDeliverableArduino, 'D4' , 0);
    writeDigitalPin(nineDeliverableArduino, 'D3' , 0);
    writeDigitalPin(nineDeliverableArduino, 'D2' , 0);
 
 % Use nested if statements to check distance and decide
 % Which if any lights need to go on

        

if ((distance<0.75)&&(distance>0))
    writeDigitalPin(nineDeliverableArduino, 'D2', 1);%gred2
end

if((distance<1.25)&&(distance>0.75))
        
            writeDigitalPin(nineDeliverableArduino, 'D4', 1);%yellow
    if((distance<1)&&(distance>0.75))
        writeDigitalPin(nineDeliverableArduino, 'D3', 1);%red       
    end
end 

if((distance <2)&&(distance > 1 ))
            writeDigitalPin(nineDeliverableArduino, 'D5', 1);%green2
elseif(distance >=2)
    writeDigitalPin(nineDeliverableArduino, 'D6' , 1);%green1
    writeDigitalPin(nineDeliverableArduino, 'D5' , 1);%green2
        
        
end


   




 % Use a pause so we aren't taking a million distance readings per
 % second
 pause(0.5);
end