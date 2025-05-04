#include <ESP32Servo.h>

Servo myservo;  // create servo object to control a servo
// 16 servo objects can be created on the ESP32

int pos = 0;  // variable to store the servo position
// Possible PWM GPIO pins on the ESP32-S3: 0(used by on-board button),1-21,35-45,47,48(used by on-board LED)
int servoPin = 13;

void setup() {
	myservo.setPeriodHertz(50);            // standard 50 hz servo
	myservo.attach(servoPin, 1000, 2000);  // attaches the servo on pin 18 to the servo object
	// using default min/max of 1000us and 2000us
	// different servos may require different min/max settings
	// for an accurate 0 to 180 sweep

	Serial.begin(9600);
}

void loop() {

	if (Serial.available()) {
		String reading = Serial.readStringUntil('\n');
		Serial.print("read ");
		Serial.println(reading);

		int pos = reading.toInt();

		myservo.write(pos);
	}

  }
