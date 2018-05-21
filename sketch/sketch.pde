int numberOfRows = 3;
int numberOfColumns = 2; 
int numberOfShapes = 9;

int currentOffsetX = 0;
int currentOffsetY = 0;

int[] colors = {#81CFE0, #F64747, #F7CA18, #FF8E8E, #65C6BB};

PShape[] shapes;

void setup() {
  size(400, 600);
  noStroke();
  drawGrid();
}

void drawGrid() {
  int textBlock = round(random(0, numberOfRows - 1));
  
  PShape[] shapes = {
    loadShape("shapes/shape0.svg"),
    loadShape("shapes/shape1.svg"),
    loadShape("shapes/shape2.svg"),
    loadShape("shapes/shape3.svg"),
    loadShape("shapes/shape4.svg"),
    loadShape("shapes/shape6.svg"),
    loadShape("shapes/shape7.svg"),
    loadShape("shapes/shape8.svg"),
    loadShape("shapes/shape9.svg"),
  };
  
  for(int row = 0; row < numberOfRows; row++) {
    for(int column = 0; column < numberOfColumns; column++) {
      if (textBlock == row) {
        fill(255);
        rect(currentOffsetX, currentOffsetY, blockWidth(), blockHeight());
        
        if(column == 1) {
          fill(0);
          PFont font = createFont("fonts/Graphik LC-Light.otf", 16);
          textFont(font, 24);
          text("Насим Талеб", currentOffsetX, currentOffsetY + 40, blockWidth() - 40, blockHeight() - 40);
          
          PFont font2 = createFont("fonts/Graphik LC-Regular.otf", 32);
          textFont(font2, 32);
          text("Черный Лебедь", currentOffsetX, currentOffsetY + 80, blockWidth() - 40, blockHeight() - 40);
        }
      } else {
        drawBlock();
        drawShape(shapes);
      }
  
      currentOffsetX += blockWidth();
    }
    currentOffsetX = 0;
    currentOffsetY += blockHeight();
  }
  currentOffsetY = 0;
}

void drawShape(PShape[] shapes) {
  int randomShapePosition = round(random(numberOfShapes -1));
  int randomShapeColorPosition = round(random(colors.length -1));
  
  PShape shape = shapes[randomShapePosition];
  shape.disableStyle();
  fill(colors[randomShapeColorPosition]);
  
  rotateShape(shape);
}

void rotateShape(PShape shape) {
  pushMatrix();
  translate(currentOffsetX + blockWidth() / 2, currentOffsetY + blockHeight() / 2);
  float[] rotations = {0, PI / 2, PI, PI * 1.5, PI * 2};
  float rotation = rotations[round(random(0, 3))];
  shapeMode(CENTER);
  rotate(radians(270));
  shape(shape, 0, 0, blockWidth(), blockHeight());
  popMatrix();
}

void drawBlock() {
  int randomColorPosition = round(random(colors.length -1));
  fill(colors[randomColorPosition]);
  rect(currentOffsetX, currentOffsetY, blockWidth(), blockHeight());
}

int blockWidth() {
  return width / numberOfColumns;
}

int blockHeight() {
  return height / numberOfRows;
}
