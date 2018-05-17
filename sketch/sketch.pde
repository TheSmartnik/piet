int numberOfRows = 3;
int numberOfColumns = 2; 

void setup() {
  size(400, 560);
  noStroke();
  drawGrid();
}

void drawGrid() {
  int currentOffsetX = 0;
  int currentOffsetY = 0;
  
  int[] colors = {#ff7800, #37be8c, #cda500, #5a87e1, #d7e6e1};
  
  int textBlock = round(random(0, numberOfRows - 1));
  
  for(int row = 0; row < numberOfRows; row++) {
    for(int column = 0; column < numberOfColumns; column++) {
      if (textBlock == row) {
        fill(255);
        rect(currentOffsetX, currentOffsetY, blockWidth(), blockHeight());
      } else {
        int randomColorPosition = round(random(colors.length -1));
        fill(colors[randomColorPosition]);
        rect(currentOffsetX, currentOffsetY, blockWidth(), blockHeight());
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
