clear;
button_arduino = arduino('COM5', 'uno');
button_pin = 'D8';
button_pin1 = 'D9';
button_pin2 = 'D10';
button_state = readDigitalPin(button_arduino, button_pin);
SPEAK_PIN = 'D3';
yellow = 'D7';
green = 'D6';
red = 'D5';
writeDigitalPin(button_arduino, yellow , 0);
writeDigitalPin(button_arduino, green , 0);
writeDigitalPin(button_arduino, red , 0);


while(1)
    
    button_state = readDigitalPin(button_arduino, button_pin);
    button_state1 = readDigitalPin(button_arduino, button_pin1);
    button_state2 = readDigitalPin(button_arduino, button_pin2);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if button_state == 1
        playTone(button_arduino, SPEAK_PIN, 440, 2.5);
        i = 0;
        while i <= 4
        writeDigitalPin(button_arduino, yellow , 1);
        pause(0.1);
        writeDigitalPin(button_arduino, yellow , 0);
        pause(0.25);
        i = i +1;
        end
        while(button_state == 1)
            playTone(button_arduino, SPEAK_PIN, 440, 0.2);
            button_state = readDigitalPin(button_arduino, button_pin);
            writeDigitalPin(button_arduino, yellow , 1);
        end
        writeDigitalPin(button_arduino, yellow , 0);
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if button_state1 == 1
        playTone(button_arduino, SPEAK_PIN, 800, 2.5);
        i = 0;
        while i <= 4
        writeDigitalPin(button_arduino, green , 1);
        pause(0.1);
        writeDigitalPin(button_arduino, green , 0);
        pause(0.25);
        i = i +1;
        end
        while(button_state1 == 1)
            playTone(button_arduino, SPEAK_PIN, 800, 0.2);
            button_state1 = readDigitalPin(button_arduino, button_pin1);
            writeDigitalPin(button_arduino, green , 1);
        end 
        writeDigitalPin(button_arduino, green , 0);
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if button_state2 == 1
        
        playTone(button_arduino, SPEAK_PIN, 1600, 2.5);
        i = 0;
        while i <= 4
        writeDigitalPin(button_arduino, red , 1);
        pause(0.1);
        writeDigitalPin(button_arduino, red , 0);
        pause(0.25);
        i = i +1;
        end
        
        
        while(button_state2 == 1)
            playTone(button_arduino, SPEAK_PIN, 1600, 0.2);
            button_state2 = readDigitalPin(button_arduino, button_pin2);
            writeDigitalPin(button_arduino, red , 1);
        end 
        writeDigitalPin(button_arduino, red , 0);
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end
