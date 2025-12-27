import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;        // Data received from the serial port
int angle = 0;
int increment = 5;

void setup()
{
  size(200, 200);
  // Open whatever port is the one you're using.
  String portName = "/dev/cu.usbmodem1301";
  myPort = new Serial(this, portName, 9600);
  background(255);

  fill(180);
  rect(50, 50, 100, 100);
}

void draw() {
  background(255);
  
  if (mousePressed) {
    if (mouseButton == LEFT) {
      oneLeft();
    } else if (mouseButton == RIGHT) {
      oneRight();
    }
  }

  fill(angle);
  rect(50, 50, 100, 100);

  myPort.write(str(angle) + "\n");
  
  fill(220, 100, 0);
  text(angle, 20, 20);
}


void oneLeft() {
  angle = angle - increment;

  if (angle < 0) {
    angle = 0;
  }
}

void oneRight() {
  angle = angle + increment;

  if (angle > 180) {
    angle = 180;
  }
}

/*
  // Wiring/Arduino code:
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

 
 */
