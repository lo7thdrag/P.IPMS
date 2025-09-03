// Throttle
const int throttlePSPin = A0;
int throttlePSValue = 0;
int throttlePSPosition = 0;

const int throttleSBPin = A1;
int throttleSBValue = 0;
int throttleSBPosition = 0;

int lastThrottlePS = -1;
int lastThrottleSB = -1;

bool remoteOverridePS = false;
bool remoteOverrideSB = false;

unsigned long throttleInterval = 500;
unsigned long buttonInterval = 50;
unsigned long serialInterval = 10;

unsigned long lastThrottleTime = 0;
unsigned long lastButtonTime = 0;
unsigned long lastSerialTime = 0;

// Button
const int buttonPins[12] = {14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25};
const int ledPins[12] = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
String buttonNames[12] = {
  "ShaftDrivenPS", "EmergencyStopPS", "LeverInServicePS",
  "ShaftStopPS", "ShaftTrailingPS", "TransferOverridePS",
  "EmergencyStopSB", "LeverInServiceSB", "TransferOverrideSB", 
  "ShaftDrivenSB", "ShaftStopSB", "ShaftTrailingSB"
};

bool lastState[12] = {HIGH}; 
bool toggleState[12] = {false};

String inputString = "";
boolean stringComplete = false;

void setup() {  
    Serial.begin(9600);
  
    for (int i = 0; i < 12; i++) {
    pinMode(buttonPins[i], INPUT_PULLUP);
    pinMode(ledPins[i], OUTPUT);
    digitalWrite(ledPins[i], LOW);
    }
    inputString.reserve(50);
    pinMode(4, OUTPUT);
    pinMode(9, OUTPUT);
    digitalWrite(4, LOW);
    digitalWrite(9, LOW);

    pinMode(26, OUTPUT);
    pinMode(29, OUTPUT);
    digitalWrite(26, LOW);
    digitalWrite(29, LOW);

    pinMode(27, OUTPUT);
    pinMode(28, OUTPUT);
    digitalWrite(27, LOW);
    digitalWrite(28, LOW);

}

void loop() {
  unsigned long currentMillis = millis();

  // Throttle
  if (currentMillis - lastThrottleTime >= throttleInterval) {
    lastThrottleTime = currentMillis;
    
    throttlePSValue    = analogRead(throttlePSPin);
    throttlePSValue    = constrain(throttlePSValue, 0, 1023);
    throttlePSPosition = map(throttlePSValue, 0, 1023, 24, 0);
    
    if (throttlePSPosition != lastThrottlePS) {
    Serial.print("ThrottlePS :");
    Serial.print(throttlePSPosition);
    lastThrottlePS = throttlePSPosition;
    Serial.print('\n');
   }
    throttleSBValue    = analogRead(throttleSBPin);
    throttleSBValue    = constrain(throttleSBValue, 0, 1023);
    throttleSBPosition = map(throttleSBValue, 0, 1023, 24, 0);
    
    if (throttleSBPosition != lastThrottleSB) {
    Serial.print("ThrottleSB :");
    Serial.print(throttleSBPosition);
    lastThrottleSB = throttleSBPosition; 
    Serial.print('\n');
   }
  }
 
  // Button
    if (currentMillis - lastButtonTime >= buttonInterval) {
      lastButtonTime = currentMillis;
      
      for (int i = 0; i < 12; i++) {
      bool currentState = digitalRead(buttonPins[i]);
  
      if (lastState[i] == HIGH && currentState == LOW) {
        toggleState[i] = !toggleState[i]; 
        digitalWrite(ledPins[i], toggleState[i] ? HIGH : LOW);
         
        Serial.print(buttonNames[i]);
        Serial.print(":");
        Serial.println(toggleState[i] ? "1" : "0");
        Serial.print('\n');
      }
  
      lastState[i] = currentState;
      }
    }

// Astern dan Ahead
  if (!remoteOverridePS) {
    if (toggleState[5]) {
      digitalWrite(26, HIGH);
      digitalWrite(29, LOW);
    } else {
      digitalWrite(26, LOW);
      digitalWrite(29, HIGH);
    }
  }

  if (!remoteOverrideSB) {
    if (toggleState[8]) {
      digitalWrite(27, HIGH);
      digitalWrite(28, LOW);
    } else {
      digitalWrite(27, LOW);
      digitalWrite(28, HIGH);
    }
  }

    if (currentMillis - lastSerialTime >= serialInterval) {
      lastSerialTime = currentMillis;
      
      if (stringComplete) {
      stringComplete = false;
  
      inputString.trim();  
  
      if (inputString == "LeverInServicePS:1") {
        digitalWrite(4, HIGH);
      } 
      else if (inputString == "LeverInServicePS:0") {
        digitalWrite(4, LOW);
      }
      
      if (inputString == "LeverInServiceSB:1") {
        digitalWrite(9, HIGH);
      } 
      else if (inputString == "LeverInServiceSB:0") {
        digitalWrite(9, LOW);
      }
  
      if (inputString == "AheadPS:1") {
        remoteOverridePS = true;
        digitalWrite(29, HIGH);
        digitalWrite(26, LOW);
      } else if (inputString == "AsternPS:1") {
        remoteOverridePS = true;
        digitalWrite(26, HIGH);
        digitalWrite(29, LOW);
      } else if (inputString == "AheadPS:0" || inputString == "AsternPS:0") {
        remoteOverridePS = false;
      }
  
      if (inputString == "AheadSB:1") {
        remoteOverrideSB = true;
        digitalWrite(28, HIGH);
        digitalWrite(27, LOW);
      } else if (inputString == "AsternSB:1") {
        remoteOverrideSB = true;
        digitalWrite(27, HIGH);
        digitalWrite(28, LOW);
      } else if (inputString == "AheadSB:0" || inputString == "AsternSB:0") {
        remoteOverrideSB = false;
      }
      inputString = "";
    }
  }
}

void serialEvent() {
  while (Serial.available()) {
    char inChar = (char)Serial.read();
    inputString += inChar;
    if (inChar == '\n') {
      stringComplete = true;
    }
  }
}
