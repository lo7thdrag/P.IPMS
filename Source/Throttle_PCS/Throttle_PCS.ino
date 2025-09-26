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
  "ShaftDrivenPS", "ShaftStopPS", "ShaftTrailingPS",
  "EmergencyStopPS", "LeverInServicePS", "TransferOverridePS",
  "EmergencyStopSB", "LeverInServiceSB", "TransferOverrideSB", 
  "ShaftDrivenSB", "ShaftStopSB", "ShaftTrailingSB"
};

bool lastState[12] = {HIGH}; 
bool toggleState[12] = {false};

String inputString = "";
boolean stringComplete = false;

enum ControlSource {SOURCE_NONE, SOURCE_BUTTON, SOURCE_REMOTE};
ControlSource lastSourcePS = SOURCE_NONE;
ControlSource lastSourceSB = SOURCE_NONE;

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
    throttlePSPosition = map(throttlePSValue, 0, 1023, 22, 0);
    
    if (throttlePSPosition != lastThrottlePS) {
    Serial.print("ThrottlePS :");
    Serial.print(throttlePSPosition);
    lastThrottlePS = throttlePSPosition;
    Serial.print('\n');
   }
    throttleSBValue    = analogRead(throttleSBPin);
    throttleSBValue    = constrain(throttleSBValue, 0, 1023);
    throttleSBPosition = map(throttleSBValue, 0, 1023, 22, 0);
    
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
 // Button shaft driven dan shaft stop PS
      if (i == 0 && toggleState[0]) {     //shaft driven
        toggleState[1] = false;           // shaft stop
        digitalWrite(ledPins[1], LOW);
      }
      if (i == 1 && toggleState[1]) { 
        toggleState[0] = false;
        digitalWrite(ledPins[0], LOW);
      }
   
      if (i == 2 && toggleState[2]) {     
        toggleState[1] = false;
        digitalWrite(ledPins[1], LOW);
      }
      if (i == 1 && toggleState[1]) {
        toggleState[2] = false;
        digitalWrite(ledPins[2], LOW);
      }

 // Button shaft driven dan shaft stop SB
      if (i == 9 && toggleState[9]) {
        toggleState[10] = false;
        digitalWrite(ledPins[10], LOW);
      }
      if (i == 10 && toggleState[10]) {
        toggleState[9] = false;
        digitalWrite(ledPins[9], LOW);
      }
  
      if (i == 11 && toggleState[11]) {
        toggleState[10] = false;
        digitalWrite(ledPins[10], LOW);
      }
      if (i == 10 && toggleState[10]) {
        toggleState[11] = false;
        digitalWrite(ledPins[11], LOW);
      }
        lastState[i] = currentState;
      }
    }

// Astern dan Ahead
    if (toggleState[5]) {
      digitalWrite(26, HIGH);
      digitalWrite(29, LOW);
      lastSourcePS = SOURCE_BUTTON;
    } else if (remoteOverridePS) {
      lastSourcePS = SOURCE_REMOTE;
    } else {
      digitalWrite(26, LOW);
      digitalWrite(29, HIGH);
    }

    if (toggleState[8]) {
      digitalWrite(27, HIGH);
      digitalWrite(28, LOW);
      lastSourceSB = SOURCE_BUTTON;
    } else if (remoteOverrideSB) {
      lastSourceSB = SOURCE_REMOTE;
    } else {
      digitalWrite(27, LOW);
      digitalWrite(28, HIGH);
    }


    if (currentMillis - lastSerialTime >= serialInterval) {
      lastSerialTime = currentMillis;
      
      if (stringComplete) {
      stringComplete = false;
  
      inputString.trim();  
  
      if (inputString == "LeverInServicePS:1") {
        digitalWrite(6, HIGH);
      } 
      else if (inputString == "LeverInServicePS:0") {
        digitalWrite(6, LOW);
      }
      
      if (inputString == "LeverInServiceSB:1") {
        digitalWrite(9, HIGH);
      } 
      else if (inputString == "LeverInServiceSB:0") {
        digitalWrite(9, LOW);
      }
  
      if (inputString == "AheadPS:1") {
        remoteOverridePS = true;
        if (lastSourcePS != SOURCE_BUTTON) {
          digitalWrite(29, HIGH);
          digitalWrite(26, LOW);
        }
      } else if (inputString == "AsternPS:1") {
        remoteOverridePS = true;
        if (lastSourcePS != SOURCE_BUTTON) {
          digitalWrite(26, HIGH);
          digitalWrite(29, LOW);
        }
      } else if (inputString == "AheadPS:0" || inputString == "AsternPS:0") {
        remoteOverridePS = false;
      }
  
      if (inputString == "AheadSB:1") {
        remoteOverrideSB = true;
        if (lastSourceSB != SOURCE_BUTTON) {
          digitalWrite(28, HIGH);
          digitalWrite(27, LOW);
        }
      } else if (inputString == "AsternSB:1") {
        remoteOverrideSB = true;
        if (lastSourceSB != SOURCE_BUTTON) {
          digitalWrite(27, HIGH);
          digitalWrite(28, LOW);
        }
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
