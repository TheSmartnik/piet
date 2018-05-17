var numberOfRows = 3;
var numberOfColumns = 2;

function setup() {
  createCanvas(400, 560);
  noStroke();
  drawGrid();
}

function draw() {
}

blockWidth = function() {
  return width / numberOfColumns;
}

blockHeight = function() {
  return height / numberOfRows;
}

drawGrid = function() {
  currentOffsetX = 0;
  currentOffsetY = 0;
  colors = ['#ff7800', '#37be8c', '#cda500', '#5a87e1', '#d7e6e1'];
  // colors = ['#1D35D6', '#FFD40E', '#FFFEF8','#FFFEF8','#FFFEF8', '#FF2F20', '#000000'];
  
  for(var row = 0; row < numberOfRows; row++) {
    for(var column = 0; column < numberOfColumns; column++) {
      fill(random(colors));
      rect(currentOffsetX, currentOffsetY, blockWidth(), blockHeight());
      currentOffsetX += blockWidth();
    }
    currentOffsetX = 0;
    currentOffsetY += blockHeight();
  }
}