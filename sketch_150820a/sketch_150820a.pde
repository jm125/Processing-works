void setup() {
  size(300,300);
  noLoop();
}

void draw() {
  drawTree(150, 300, true);
}

void drawTree(int startX, int startY, boolean isRootNode) {
  int newX1 = startX/8;
  int newX2 = 9*newX1;
  int newY1 = startY/8;
  int newY2 = 9*startY;

  line(startX, startY, newX1, newY1);
  line(startX, startY, newX2, newY2);
  
  
}