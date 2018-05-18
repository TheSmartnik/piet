int numberOfRows = 3;
int numberOfColumns = 2; 
int numberOfShapes = 2; 
//PShape[] shapes = new PShape[12];

int[] colors = {#81CFE0, #F64747, #F7CA18, #FF8E8E, #65C6BB};

void setup() {
  size(400, 560);
  noStroke();
  //loadShapes();
  drawGrid();
}

//void loadShapes() {
//  for(int i = 0; i < numberOfShapes; i ++) {
//    String file_name = String.format("shapes/shape%s.svg", i);
//    println(file_name);
//    shapes[i] = loadShape("shapes/shape0.svg");
//  }
//}

void drawGrid() {
  int currentOffsetX = 0;
  int currentOffsetY = 0;
  
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
      } else {
        int randomShapeColorPosition = round(random(colors.length -1));
        int randomShapePosition = round(random(numberOfShapes -1));
        
        int randomColorPosition = round(random(colors.length -1));
        fill(colors[randomColorPosition]);
        rect(currentOffsetX, currentOffsetY, blockWidth(), blockHeight());
        
        PShape shape = shapes[randomShapePosition];
        shape.disableStyle();
        fill(colors[randomShapeColorPosition]);
        shape(shape, currentOffsetX, currentOffsetY, blockWidth(), blockHeight());
      }
  
      currentOffsetX += blockWidth();
    }
    currentOffsetX = 0;
    currentOffsetY += blockHeight();
  }
}

int blockWidth() {
  return width / numberOfColumns;
}

int blockHeight() {
  return height / numberOfRows;
}
