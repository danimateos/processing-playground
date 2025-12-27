int brightness = 0;
int increment = 1;

void setup() {
  size(800, 600);

  background(brightness);
}

void draw() {
  background(brightness);

  brightness = brightness + increment;

  if (brightness == 255) {
    increment = -1;
  } else if (brightness == 0) {
    increment = 1;
  }

  fill(120, 60, 120);
  
  if (mousePressed) {
     fill(255, 120, 0); 
  }
  noStroke();

  triangle(400, 420, mouseX, mouseY, 200, 20);
  text("YOOOO", mouseX + 20, mouseY + 20);
  
  
}


void mousePressed() {
   
   circle(mouseX, mouseY, 100);
}
