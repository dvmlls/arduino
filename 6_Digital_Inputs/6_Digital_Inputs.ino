int ledPin = 5;
int buttonApin = 9;
int buttonBpin = 8;

byte leds = 0;

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(buttonApin, INPUT_PULLUP);  
  pinMode(buttonBpin, INPUT_PULLUP);  
}

void loop() {
  if (digitalRead(buttonApin) == LOW) {
    digitalWrite(ledPin, HIGH);
  } //else {
  //	digitalWrite(ledPin, LOW);
  //}
  if (digitalRead(buttonBpin) == LOW) {
    digitalWrite(ledPin, LOW);
  }
}
