color[] COLORS = { #ef476f, #ffd166, #06d6a0, #118ab2 }; // #073b4c

class Square {
  float angle;
  color col;
  PVector position;
  float size;
  float increment;
  
  Square() {
    this.position = new PVector(random(0, width), random(0, height));
    this.col = COLORS[floor(random(COLORS.length))];
    this.angle = random(0, TWO_PI);
    this.size = random(300, 500);
    this.increment = random(0, 1) > 0.5 ? 0.1 : -0.1;
  }

  void update() {
    this.size -= random(10, 15);
    this.angle += this.increment;
  }
  
  void show() {
    translate(this.position.x, this.position.y);
    rotate(this.angle);
    fill(this.col);
    square(0, 0, this.size);
  }
}

Square s;

void setup() {
  fullScreen();
  background(0);
  rectMode(CENTER);
  stroke(255);

  s = new Square();
}

void draw() {
  s.update();
  s.show();

  if (s.size < 10) s = new Square();
}
