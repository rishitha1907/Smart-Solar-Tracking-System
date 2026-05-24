#include <Servo.h>

Servo s;

void setup() {
  Serial.begin(9600);
  Serial.setTimeout(10);
  s.attach(9);
}

void loop() {

  // Read LDR sensors
  int east = analogRead(A0);
  int west = analogRead(A1);

  // Send sensor values to MATLAB
  Serial.print(east);
  Serial.print(" ");
  Serial.println(west);

  // Receive servo angle from MATLAB
  if (Serial.available()) {

    int angle = Serial.parseInt();

    // Clear remaining buffer
    while (Serial.available()) {
      Serial.read();
    }

    // Limit angle range
    angle = constrain(angle, 0, 180);

    // Move servo
    s.write(angle);
  }

  delay(20);
}