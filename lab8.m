clear;
FSR_PIN = 'A0'; % Pin that our FSR is connected to
% If we want to get accurate values we need to measure these things
VCC = 5 ; % Measured voltage of Ardunio 5V line
R_DIV = 500 ; % Measured resistance of the resistor. Check the size of your resistor!
W_0 = 1;

forceArduino = arduino('COM5' , 'uno' );% Connect to your arduino here!
waitTime = 1; % How long we want to wait between readings


% This while statement tells the Arduino we want to run
% all the code inside it forever (or until we press the
% stop button)
while(1)
    fsrVoltage = readVoltage(forceArduino,FSR_PIN) ; % read in the voltage from the FSR

 % If the reading from FSR is non-zero, we need to compute the force as
 % follows. Follow the specific instructions and write your code immediately below
 % each instruction
 
 % 1. If the FSR voltage is non-zero (write the appropriate if statement below)
if ((fsrVoltage > 0)||(fsrVoltage < 0) )
 %1.1 Compute the resistance and store the value in a variable
 % called fsrResistance
      fsrResistance = (((R_DIV*VCC)/fsrVoltage)-R_DIV);
      

 fprintf("Reistance is %f\n",fsrResistance); % print out the resistance
 %1.2 Compute the conductance and store the value in a variable
 % called fsrConductance
   fsrConductance = (1/fsrResistance);

 %1.3. If the resistance computed above is less than or equal to
 % 600, use the first equation to calculate the force
 % (see piecewise equation given in the problem statement.)
        if(fsrResistance <= 600)
            force = ((fsrConductance - 7.5E-4)/3.2639E-7);
            
            
 %1.4. Otherwise, use the second equation to calculate the force.
        else
            force = (fsrConductance / 6.42857E-7);

        end
        
        

 fprintf("\tThe force is %f\n",force); % print out the force
 
 
 writeDigitalPin(forceArduino, 'D7', 1); %LED on
 writeDigitalPin(forceArduino, 'D6', 0); %LED off
 writeDigitalPin(forceArduino, 'D5', 0); %LED off
 writeDigitalPin(forceArduino, 'D4', 0); %LED off
 writeDigitalPin(forceArduino, 'D3', 0); %LED off
 %1.5. Turn on LEDs that correspond with how much weight we are applying
 % based on the following criteria:
 % If force > 2000, turn on LEDs at pins D03, D04, D05, and D06
    if( force>2000)
         writeDigitalPin(forceArduino, 'D5', 1); %LED on
         writeDigitalPin(forceArduino, 'D6', 1);%LED on
         writeDigitalPin(forceArduino, 'D4', 1); %LED on
         writeDigitalPin(forceArduino, 'D3', 1);%LED on
    
 % If 1000 < force <= 2000, turn on LEDs at pins D04, D05, and D06
    elseif(( force > 1000+ W_0)&& (force <= 2000+W_0))
         writeDigitalPin(forceArduino, 'D5', 1); %LED on
         writeDigitalPin(forceArduino, 'D4', 1); %LED on
         writeDigitalPin(forceArduino, 'D6', 1);%LED on
 % If 500 < force <= 1000, turn on LEDs at pins D05, and D06
        elseif(( force > 500+ W_0)&&( force <=1000+ W_0))
         writeDigitalPin(forceArduino, 'D5', 1); %LED on
         writeDigitalPin(forceArduino, 'D6', 1);%LED on
 % If 250 < force <= 500, turn on LED at pin D06 
            elseif(( force>250+W_0)&&(force <= 500+ W_0))
                 writeDigitalPin(forceArduino, 'D6', 1);%LED on
                end
                
 
 pause(waitTime); % don't measure voltage a million times a second

 %2. If the FSR voltge is zero (i.e. if we don't measure voltage), don't compute force (but maybe
 % still do some stuff like say we found no voltage, or pause)
elseif( fsrVoltage == 0) %if FSR voltage is zero
        writeDigitalPin(forceArduino, 'D7',0); %LED on
        writeDigitalPin(forceArduino, 'D6', 0); %LED off
        writeDigitalPin(forceArduino, 'D5', 0); %LED off
        writeDigitalPin(forceArduino, 'D4', 0); %LED off
        writeDigitalPin(forceArduino, 'D3', 0); %LED off
    fprintf("No resistance detected\n");
    pause(waitTime);
 end %end of if statement ( it is supposed to be included above by you)

end %end of while loop
%Note: Remember to include end for your if statements
% Add equations and additional if statements as desired.
         
