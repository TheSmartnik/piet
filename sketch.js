function setup() {
  createCanvas(400, 560);
  noStroke();
  // background(240, 120, 0);
  
  currentOffsetX = 0;
  currentOffsetY = 0;
  colors = ['#ff7800', '#37be8c', '#cda500', '#5a87e1', '#d7e6e1'];
  
  for(var row = 0; row < 3; row++) {
    for(var column = 0; column < 2; column++) {
      fill(random(colors));
      rect(currentOffsetX, currentOffsetY, blockWidth(), blockHeight());
      currentOffsetX += blockWidth();
    }
    currentOffsetX = 0;
    currentOffsetY += blockHeight();
  }
}

function draw() {
}

blockWidth = function() {
  return width / 2;
}

blockHeight = function() {
  return height / 3;
}