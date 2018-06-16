import java.util.Properties;

int numberOfRows = 3;
int numberOfColumns = 2;
int numberOfShapes = 12;

int currentOffsetX = 0;
int currentOffsetY = 0;

int[] colors = {#81CFE0, #F64747, #F7CA18, #FF8E8E, #65C6BB};

String author;
String title;

ArrayList<PShape> shapes = new ArrayList<PShape>();

static int Padding = 20;

void setup() {
  Properties props = loadCommandLine();
  author = props.getProperty("author");
  title = props.getProperty("title");

  size(400, 600);
  noStroke();
  shapes = loadShapes();
  drawGrid();
  saveFrame(props.getProperty("cover", "cover") + ".png");
  exit();
}

void drawGrid() {
  int textBlock = round(random(0, numberOfRows - 1));

  for(int row = 0; row < numberOfRows; row++) {
    for(int column = 0; column < numberOfColumns; column++) {
      if (textBlock == row) {
        drawTextBlock(column);
        continue;
      } else {
        drawBlock();
        drawShape();
      }

      currentOffsetX += blockWidth();
    }
    currentOffsetX = 0;
    currentOffsetY += blockHeight();
  }
  currentOffsetY = 0;
}

void drawShape() {
  int randomShapePosition = round(random(numberOfShapes -1));
  int randomShapeColorPosition = round(random(colors.length -1));

  PShape shape = shapes.get(randomShapePosition);
  shape.disableStyle();
  fill(colors[randomShapeColorPosition]);

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

  int textOffsetX;
  int textBoxWidth;
  int textBoxHeight = blockHeight() - Padding * 2 / 2;

  if(textWidth / 2 <= blockWidth()) {
    textOffsetX = currentOffsetX + blockWidth();;
    textBoxWidth = blockWidth() - Padding;
  } else {
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

ArrayList<PShape> loadShapes() {
  File[] shapeFiles = new File(dataPath("shapes")).listFiles();
  ArrayList<PShape> pShapes = new ArrayList<PShape>();

  for (File file : shapeFiles) {
    String fileName = file.getPath();
    if(fileName.endsWith(".svg")) {
      try {
        pShapes.add(loadShape(fileName));
      } catch(NullPointerException error) {
        println("Shape " + fileName + " couldn't be loaded");
      }
    }
  }

  return pShapes;
}

Properties loadCommandLine () {

  Properties props = new Properties();

  for (String arg:args) {
    String[] parsed = arg.split("=", 2);
    if (parsed.length == 2)
      props.setProperty(parsed[0], parsed[1]);
  }

  return props;

}
