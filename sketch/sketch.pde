int numberOfRows = 3;
int numberOfColumns = 2;
int numberOfShapes = 12;

int currentOffsetX = 0;
int currentOffsetY = 0;

int[] colors = {#81CFE0, #F64747, #F7CA18, #FF8E8E, #65C6BB};

String author = "Harper Lee";
String title = "Go Set a Watchman";

static int Padding = 20;

PShape[] shapes;

void setup() {
  size(400, 600);
  noStroke();
  drawGrid();
  saveFrame("cover.png");

}

void drawGrid() {
  int textBlock = round(random(0, numberOfRows - 1));

  PShape[] shapes = {
    loadShape("shapes/shape0.svg"),
    loadShape("shapes/shape1.svg"),
    loadShape("shapes/shape2.svg"),
    loadShape("shapes/shape3.svg"),
    loadShape("shapes/shape4.svg"),
    loadShape("shapes/shape5.svg"),
    loadShape("shapes/shape6.svg"),
    loadShape("shapes/shape7.svg"),
    loadShape("shapes/shape9.svg"),
    // loadShape("shapes/shape10.svg"),
    loadShape("shapes/shape11.svg"),
    loadShape("shapes/shape12.svg"),
    loadShape("shapes/shape13.svg"),
  };

  for(int row = 0; row < numberOfRows; row++) {
    for(int column = 0; column < numberOfColumns; column++) {
      if (textBlock == row) {
        drawTextBlock(column);
        column ++;
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
  float[] rotations = {0, PI / 2, PI, PI * 1.5, TWO_PI * 2};
  float rotation = rotations[round(random(0, 3))];
  shapeMode(CENTER);
  rotate(rotation);
  shape(shape, 0, 0, blockWidth(), blockHeight());
  popMatrix();
}

void drawBlock() {
  int randomColorPosition = round(random(colors.length -1));
  fill(colors[randomColorPosition]);
  rect(currentOffsetX, currentOffsetY, blockWidth(), blockHeight());
}

void drawTextBlock(int column) {
  fill(255);
  rect(currentOffsetX, currentOffsetY, blockWidth() * 2, blockHeight());

  PFont authorFont = createFont("fonts/Graphik LC-Light.otf", 16);
  PFont titleFont = createFont("fonts/Graphik LC-Medium.otf", 32);

  textFont(titleFont, 32);
  int textWidth = ceil(textWidth(title) + Padding * 2);

  int startingColumn;
  int textOffsetX;
  int textBoxWidth;
  int textBoxHeight = blockHeight() - Padding * 2 / 2;

  if(textWidth / 2 <= blockWidth()) {

    startingColumn =  1;
    textOffsetX = currentOffsetX + blockWidth();;
    textBoxWidth = blockWidth() - Padding;
  } else {
    startingColumn =  0;
    textOffsetX = currentOffsetX + Padding;
    textBoxWidth = blockWidth() * 2 - Padding * 2;
  }

  fill(0);

  textFont(authorFont, 24);
  text(author, textOffsetX, currentOffsetY + 40, textBoxWidth, textBoxHeight);

  textFont(titleFont, 32);
  text(title, textOffsetX, currentOffsetY + 80, textBoxWidth, textBoxHeight);

}

int blockWidth() {
  return width / numberOfColumns;
}

int blockHeight() {
  return height / numberOfRows;
}
