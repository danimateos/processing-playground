int hue = 0;
int saturation = 128;
int brightness = 128;

color backgroundColor;


void setup() {
  size(1024, 800);
  colorMode(HSB, 255);
  
  backgroundColor = color(hue, saturation, brightness);
  background(backgroundColor);
}

void draw() {
  hue = (hue + 1) % 255;
  backgroundColor = color(hue, saturation, brightness);

  background(backgroundColor);
};

void mousePressed() {
  if (mouseButton == LEFT) {
    background(hue, 0, 255);
    textSize(120);
    fill(hue, 0, 0);
    text("BOOOOOM!!", mouseX + 20 , mouseY - 20);
  } else if (mouseButton == RIGHT) {

  }
  
};
