MenuSide menuSide = new MenuSide();
PanSide panSide = new PanSide();
FoodCombonations foodCombos = new FoodCombonations();

boolean titleScreen = true;
boolean cookButtonPushed = false;

float logofade1a = 255;
float logofade1b = 255;
float logofade1c = 255;
float logofade2a = 255;
float logofade2b = 255;
float logofade2c = 255;
float logofade3 = 255;
float logofade4 = 255;
float logofade5 = 255;

boolean[] oFimgs = new boolean[21];
boolean[] oVimgs = new boolean[20];
boolean[] oGimgs = new boolean[11];
boolean[] oMimgs = new boolean[12];
boolean[] oDimgs = new boolean[22];

PImage[] Fimgs = new PImage[21];
PImage[] Vimgs = new PImage[20];
PImage[] Gimgs = new PImage[11];
PImage[] Mimgs = new PImage[12];
PImage[] Dimgs = new PImage[22];

PImage[] recipiesImgs = new PImage[8];
PImage[] recipiesImgsSub = new PImage[8];

boolean[] ingredientTabs = new boolean[5];

int[] nutrientBars = new int[6];
int totalContent = nutrientBars[0] + nutrientBars[1] + nutrientBars[2] + nutrientBars[3] + nutrientBars[4];

int[] colours = new int[6];

int[] tabWidth = new int[5];
int[] scrollVariable = new int[5];
boolean[] tabSelect = new boolean[5];

boolean[] oRecipies = new boolean[8];
boolean[] ooRecipies = new boolean[8];


String[] categorys = {
  "Fruit", 
  "Veg", 
  "Grain", 
  "Meat", 
  "Dairy", 
};

String[] recipieNames = {
  "corn beef stuffed chicken", 
  "french omlete",
  "scrambled eggs",
  "french toast",
  "buttered broccoli",
  "chicken curry",
  "grilled cheese",
  "waffles",
};

String[] fruitNames = {
  "apple", 
  "banana", 
  "blackberry", 
  "avacado", 
  "blueberry", 
  "dragon fruit", 
  "gooseberry", 
  "grapes", 
  "green grapes", 
  "kiwi", 
  "lemon", 
  "lychee", 
  "mango", 
  "nectarine", 
  "orange", 
  "peach", 
  "raspberry", 
  "red grapes", 
  "strawberry", 
  "tomato", 
  "watermelon", 
};

String[] vegNames = {
  "asparges", 
  "broccoli", 
  "cabbage", 
  "carrot", 
  "cauliflouer", 
  "celery", 
  "ginger", 
  "letuce", 
  "mushroom", 
  "okra", 
  "onion", 
  "potato", 
  "pumkin", 
  "radish", 
  "red onion", 
  "tomato", 
  "chili", 
  "eggplant", 
  "garlic", 
  "kale",
};

String[] grainNames = {
  "barley", 
  "bread", 
  "brown rice", 
  "buckwheat", 
  "corn", 
  "oatmeal", 
  "quinoa", 
  "wheat", 
  "armaranth", 
  "white rice", 
  "flour",
};

String[] meatNames = {
  "beaf", 
  "chicken rib", 
  "chicken thigh", 
  "chicken wing", 
  "drumstick", 
  "pig belly", 
  "pig fillet", 
  "pig leg", 
  "pig tenderloin", 
  "mutton chop", 
  "top sirloin", 
  "chicken breast",
};

String[] dairyNames = {
  "brie", 
  "butter", 
  "camembert", 
  "cheddar", 
  "colby-jack", 
  "cream", 
  "cream cheese", 
  "eggs", 
  "gargonzola", 
  "gouda", 
  "maasdam", 
  "margerinre", 
  "mascarpone", 
  "milk", 
  "mozzerella", 
  "parmesan", 
  "rademer", 
  "ricotta", 
  "roquefort", 
  "stilton", 
  "swiss", 
  "yogurt", 
};

void setup() {
  size(1000, 500);

  colours[0] = #E37317;
  colours[1] = #3E9B0C;
  colours[2] = #E3941E;
  colours[3] = #FA3A3D;
  colours[4] = #FFFFFF;
  colours[5] = #000000;

  for (int i = 0; i < oRecipies.length; i++) {
    oRecipies[i] = false;
  }
  for (int i = 0; i < ooRecipies.length; i++) {
    ooRecipies[i] = false;
  }

  for (int i = 0; i < ingredientTabs.length; i++) {
    ingredientTabs[i] = false;
  }

  for (int i = 0; i < nutrientBars.length - 1; i++) {
    nutrientBars[i] = 0;
  }
  nutrientBars[5] = nutrientBars[0] + nutrientBars[1] + nutrientBars[2] + nutrientBars[3] + nutrientBars[4];

  for (int i = 0; i < tabWidth.length; i++) {
    tabWidth[i] = 100;
  }
  for (int i = 0; i < tabSelect.length; i++) {
    tabSelect[i] = false;
  }
  for (int i = 0; i < scrollVariable.length; i++) {
    scrollVariable[i] = 0;
  }

  for (int i = 0; i < oFimgs.length; i++) {
    oFimgs[i] = false;
  }
  for (int i = 0; i < oVimgs.length; i++) {
    oVimgs[i] = false;
  }
  for (int i = 0; i < oGimgs.length; i++) {
    oGimgs[i] = false;
  }
  for (int i = 0; i < oMimgs.length; i++) {
    oMimgs[i] = false;
  }
  for (int i = 0; i < oDimgs.length; i++) {
    oDimgs[i] = false;
  }


  for (int i = 0; i < Fimgs.length; i++) {
    Fimgs[i] = null;
  }
  for (int i = 0; i < Vimgs.length; i++) {
    Vimgs[i] = null;
  }
  for (int i = 0; i < Gimgs.length; i++) {
    Gimgs[i] = null;
  }
  for (int i = 0; i < Mimgs.length; i++) {
    Mimgs[i] = null;
  }
  for (int i = 0; i < Dimgs.length; i++) {
    Dimgs[i] = null;
  }
  
  recipiesImgs[0] = loadImage("corn beef stuffed chicken;;.jpg");
  recipiesImgs[1] = loadImage("omlete.jpg");
  recipiesImgs[2] = loadImage("scrambled eggs.jpg");
  recipiesImgs[3] = loadImage("french toast.jpg");
  recipiesImgs[4] = loadImage("2brocoli with lemon butter.jpg");
  recipiesImgs[5] = loadImage("3chicken curry.PNG");
  recipiesImgs[6] = loadImage("11 grilled cs.PNG");
  recipiesImgs[7] = loadImage("waffles.jpg");
  
  recipiesImgsSub[0] = loadImage("1recipe.png");
  recipiesImgsSub[1] = loadImage("omlete recipe.PNG");
  recipiesImgsSub[2] = loadImage("scrambled egg recipe.PNG");
  recipiesImgsSub[3] = loadImage("french toast recipe.PNG");
  recipiesImgsSub[4] = loadImage("2how to make.PNG");
  recipiesImgsSub[5] = loadImage("3recipe.PNG");
  recipiesImgsSub[6] = loadImage("11 recipe.PNG");
  recipiesImgsSub[7] = loadImage("Waffle recipe.PNG");

  Vimgs[0] = loadImage("asparges;;.jpg");
  Vimgs[1] = loadImage("broccoli;;.jpg");
  Vimgs[2] = loadImage("cabbage;;.jpg");
  Vimgs[3] = loadImage("carrot;;.jpg");
  Vimgs[4] = loadImage("cauliflouer;;.jpg");
  Vimgs[5] = loadImage("celery;;.jpg");
  Vimgs[6] = loadImage("ginger;;.jpg");
  Vimgs[7] = loadImage("letuce;;.jpg");
  Vimgs[8] = loadImage("mushroom;;.jpg");
  Vimgs[9] = loadImage("okra;;.jpg");
  Vimgs[10] = loadImage("onion;;.jpg");
  Vimgs[11] = loadImage("potatoe;;.jpg");
  Vimgs[12] = loadImage("pumkin;;.jpg");
  Vimgs[13] = loadImage("radish;;.jpg");
  Vimgs[14] = loadImage("red onion;;.jpg");
  Vimgs[15] = loadImage("tomato;;.jpg");
  Vimgs[16] = loadImage("chili;;.jpg");
  Vimgs[17] = loadImage("eggplant;;.jpg");
  Vimgs[18] = loadImage("garlic;;.jpg");
  Vimgs[19] = loadImage("kale;;.png");

  Fimgs[0] = loadImage("apple;;.jpg");
  Fimgs[1] = loadImage("banana;;.jpg");
  Fimgs[2] = loadImage("blackberry;;.jpg");
  Fimgs[3] = loadImage("avacado;;.jpg");
  Fimgs[4] = loadImage("blueberries;;.jpg");
  Fimgs[5] = loadImage("dragon fruit;;.jpg");
  Fimgs[6] = loadImage("gooseberry;;.jpg");
  Fimgs[7] = loadImage("grapes;;.jpg");
  Fimgs[8] = loadImage("green grapes;;.jpg");
  Fimgs[9] = loadImage("kiwi fruit;;.jpg");
  Fimgs[10] = loadImage("lemon;;.jpg");
  Fimgs[11] = loadImage("lychi;;.jpg");
  Fimgs[12] = loadImage("mango;;.jpg");
  Fimgs[13] = loadImage("nectairine;;.jpg");
  Fimgs[14] = loadImage("orange;;.jpg");
  Fimgs[15] = loadImage("peach;;.jpg");
  Fimgs[16] = loadImage("raspberry;;.jpg");
  Fimgs[17] = loadImage("red grapes;;.jpg");
  Fimgs[18] = loadImage("strawberry;;.jpg");
  Fimgs[19] = loadImage("tomato;;.jpg");
  Fimgs[20] = loadImage("watermelon;;.jpg");

  Gimgs[0] = loadImage("barley;;.jpg");
  Gimgs[1] = loadImage("bread;;.jpg");
  Gimgs[2] = loadImage("brown rice;;.jpg");
  Gimgs[3] = loadImage("buckwheat;;.jpg");
  Gimgs[4] = loadImage("corn;;.jpg");
  Gimgs[5] = loadImage("oatmeal;;.jpg");
  Gimgs[6] = loadImage("quinoa;;.jpg");
  Gimgs[7] = loadImage("wheat;;.jpg");
  Gimgs[8] = loadImage("armaranth;;.jpg");
  Gimgs[9] = loadImage("rice;;.jpg");
  Gimgs[10] = loadImage("flour;;.jpg");

  Mimgs[0] = loadImage("beaf;;.jpg");
  Mimgs[1] = loadImage("chicken rib;;.jpg");
  Mimgs[2] = loadImage("chicken thigh;;.jpg");
  Mimgs[3] = loadImage("chicken wing;;.jpg");
  Mimgs[4] = loadImage("drumstick;;.jpg");
  Mimgs[5] = loadImage("pig belly;;.jpg");
  Mimgs[6] = loadImage("pig fillet;;.jpg");
  Mimgs[7] = loadImage("pig leg;;.jpg");
  Mimgs[8] = loadImage("pig tenderloin;;.jpg");
  Mimgs[9] = loadImage("mutton chop;;.jpg");
  Mimgs[10] = loadImage("top sirloin;;.jpg");
  Mimgs[11] = loadImage("chicken breast;;.jpg");

  Dimgs[0] = loadImage("brie cheese;;.jpg");
  Dimgs[1] = loadImage("butter;;.jpg");
  Dimgs[2] = loadImage("camembert;;.jpg");
  Dimgs[3] = loadImage("cheedar cheese;;.jpg");
  Dimgs[4] = loadImage("colby-jack-cheese;;.jpg");
  Dimgs[5] = loadImage("cream;;.jpg");
  Dimgs[6] = loadImage("cream cheese;;.jpg");
  Dimgs[7] = loadImage("eggs;;.jpg");
  Dimgs[8] = loadImage("gargonzola;;.jpg");
  Dimgs[9] = loadImage("gouda cheese;;.jpg");
  Dimgs[10] = loadImage("maasdam cheese;;.jpg");
  Dimgs[11] = loadImage("margerinre;;.jpg");
  Dimgs[12] = loadImage("mascarpone cheese;;.jpg");
  Dimgs[13] = loadImage("milk;;.jpg");
  Dimgs[14] = loadImage("mozzerella cheese;;.jpg");
  Dimgs[15] = loadImage("parmesan cheese;;.jpg");
  Dimgs[16] = loadImage("rademer cheese;;.jpg");
  Dimgs[17] = loadImage("ricotta cheese;;.jpg");
  Dimgs[18] = loadImage("roquefort;;.jpg");
  Dimgs[19] = loadImage("stilton cheese;;.jpg");
  Dimgs[20] = loadImage("swiss cheese;;.jpg");
  Dimgs[21] = loadImage("yogurt;;.jpg");
}

void draw() {
  background(255);
  if (titleScreen == false) {
    menuSide.run();
    panSide.run();
  }
  if (titleScreen == true) {
    titleScreen();
  }
}

void titleScreen() {

  noStroke();
  fill(logofade1a, logofade1b, logofade1c); //214,193,32
  rect(175, 250, 550, 50);
  fill(logofade2a, logofade2b, logofade2c); //80,67,67
  rect(175, 125, 375, 300);
  fill(logofade3); //0
  rect(625, 250, 20, 50);
  rect(187.5, 137.5, 350, 275);
  fill(logofade4); //255

  rect(200, 150, 50, 100);
  rect(250, 150, 100, 50);
  rect(200, 250, 100, 50);
  rect(300, 250, 50, 100);
  rect(200, 350, 150, 50);
  rect(425, 150, 100, 50);
  rect(375, 150, 50, 250);
  rect(375, 250, 100, 50);
  textSize(50);
  text("ee", 250, 244);
  text("ood", 425, 244);
  fill(logofade5); //0
  logofade1a = logofade1a -1;
  if (logofade1a == 214) {
    logofade1a = logofade1a + 1;
  }
  logofade1b = logofade1b -1;
  if (logofade1b == 193) {
    logofade1b = logofade1b + 1 ;
  }
  logofade1c = logofade1c -1;
  if (logofade1c == 32) {
    logofade1c = logofade1c +1;
  }
  logofade2a = logofade2a -1;
  if (logofade2a == 80) {
    logofade2a = logofade2a +1;
  }
  logofade2b = logofade2b -1;
  if (logofade2b == 67) {
    logofade2b = logofade2b +1;
  }
  logofade2c = logofade2c -1;
  if (logofade2c == 67) {
    logofade2c = logofade2c+1;
  }
  logofade3 = logofade3 -1;
  logofade5 = logofade5 -1;

  fill(240, 0, 0);
  rect(700, 400, 100, 50, 5, 5, 5, 5);
  fill(255);
  textSize(30);
  text("Start", 715, 435);
  fill(255);
  if (mouseX >= 700 && mouseX <= 800) {
    if (mouseY >= 400 && mouseY <= 450) {
      if (mousePressed == true) {
        titleScreen = false;
      }
    }
  }
}