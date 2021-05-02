clear;
TRIG_PIN = 'D8';
ECHO_PIN = 'D7';
% Setup arduino object
sensyArduino = arduino('COM5','Uno','libraries','ultrasonic');
% Setup ultrasonic sensor
ultraSensor = ultrasonic(sensyArduino,TRIG_PIN,ECHO_PIN);
for numTests = 1:20
 distance = readDistance(ultraSensor) % omit ; so you can see in command window
 pause(0.25)
 
SPEAK_PIN = 'D9';
playTone(sensyArduino,SPEAK_PIN,440,1);




end

