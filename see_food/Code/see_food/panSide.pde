

class PanSide {

  float nutrientBarsX = 0;
  float nutrientBarsY = 0;

  int numberOfCols = 6;
  int colIncrement = 70;
  int rowIncrement = 100;
  int startX = 545;
  int startY = 75;
  int picSize = 60;
  int ingredientsScrollVariable = 0;

  int scrollVariable = 0;

  boolean instructions = true;
  int selectedTab = -1;

  void panButton() {
    fill(50);
    stroke(255);
    rect(570, 350, 100, 40, 10, 10, 10, 10);
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Cook", 620, 365);
    textAlign(LEFT, TOP);
    fill(255);
    if (mouseX >= 570 && mouseX <=770) {
      if (mouseY >= 350 && mouseY <= 390) {
        if (mousePressed == true) {
          cookButtonPushed = true;
        }
      }
    }
  }

  void backgroundColour() {
    stroke(0);
    fill(240);
    rect(500, 0, 500, 500);
  }

  void backButton() {
    fill(50);
    stroke(255);
    rect(900, 460, 100, 40, 10, 0, 0, 0);
    fill(255);
    text("Back", 950, 475);
    fill(255);
    if (mouseX >= 900 && mouseX <= 1000) {
      if (mouseY >= 460 && mouseY <= 500) {
        if (mousePressed == true) {
          cookButtonPushed = false;
          for (int i = 0; i < ooRecipies.length; i++) {
           ooRecipies[i] = false; 
          }
        }
      }
    }
  }

  void drawingredients(String[] names, PImage[] imgs, boolean[] options, int scrollVariable) {

    fill(50);
    textSize(15);
    textAlign(CENTER, CENTER);
    int j = 0;
    for (int i = 0; i < imgs.length; i++) {
      int mouseCheckY = (startY + (j/numberOfCols));
      int mouseCheckX = (startX + (j * colIncrement));
      int offset = ((j/numberOfCols) * (numberOfCols * 70));
      if (options[i] == true) {
        image(imgs[i], mouseCheckX - offset, (mouseCheckY + scrollVariable) + offset/(numberOfCols - 1), picSize, picSize);
        text(names[i], (mouseCheckX - offset) + (picSize/2), (((mouseCheckY + 60) + scrollVariable) + offset/(numberOfCols - 1)) + 5);
        j++;
      }
      if (options[i] == true) {
        if (mouseX >= mouseCheckX && mouseX <= mouseCheckX + picSize) {
          if (mouseY >= mouseCheckY + scrollVariable && mouseY <= mouseCheckY + picSize + scrollVariable) {
            fill(50, 0, 0, 175);
            rect(mouseCheckX, mouseCheckY + (scrollVariable), picSize, picSize, 0, 0, 5, 0);
            fill(50, 200);
            line(mouseCheckX, mouseCheckY + (scrollVariable), mouseCheckX + picSize, mouseCheckY + picSize + (scrollVariable));
            line(mouseCheckX + picSize, mouseCheckY + (scrollVariable), mouseCheckX, mouseCheckY + picSize + (scrollVariable));
          }
        }
      }
      if (mouseY <= 475 && mouseY >= 25) { 
        if (mouseX >= mouseCheckX && mouseX <= mouseCheckX + picSize) {
          if (mouseY >= mouseCheckY + scrollVariable && mouseY <= mouseCheckY + picSize + scrollVariable) {
            if (mousePressed == true) {
              options[i] = false;
              print(names[i] +  " unselected              ");
              menuSide.nutrientBarsMove0();
            }
          }
        }
      }
    }
    textSize(30);
    fill(50);
  }

  void ingredientBox() {
    for (int i = 0; i < ingredientTabs.length; i++) {
      if (selectedTab == i) {
        fill(colours[i]);
      }
    }
    stroke(0);
    rect(530, 55, 440, 190);
    fill(50);
    text("Ingredients", 540, 5);
    fill(255);
    stroke(255);
  }

  void clearButton() {
    fill(50);
    stroke(0);
    rect(530, 245, 60, 20, 0, 0, 12, 12);
    fill(255);
    text("Clear", 560, 252);

    if (mouseX <= 590 && mouseX >= 530) {
      if (mouseY <= 265 && mouseY >= 245) {
        if (mousePressed == true) {
          print("hello");
          for (int i = 0; i < nutrientBars.length - 1; i++) {
            nutrientBars[i] = 0;
          }
          for (int f = 0; f < oFimgs.length; f++) {
            oFimgs[f] = false;
          }
          for (int v = 0; v < oVimgs.length; v++) {
            oVimgs[v] = false;
          }
          for (int g = 0; g < oGimgs.length; g++) {
            oGimgs[g] = false;
          }
          for (int m = 0; m < oMimgs.length; m++) {
            oMimgs[m] = false;
          }
          for (int d = 0; d < oDimgs.length; d++) {
            oDimgs[d] = false;
          }
        }
      }
    }
  }


  void tabs() {
    int x = 0;
    int y = 0;
    int sizeX = 88;
    int sizeY = 25;

    for (int i = 0; i < ingredientTabs.length; i++) {
      noStroke();
      fill(50);
      if (selectedTab == i) {
        fill(colours[i]);
      }
      rect((x + 530) + (i * sizeX), (y + 45), sizeX, sizeY, 10, 10, 0, 0);

      fill(50);
      if (selectedTab != i) {
        fill(colours[i]);
      }
      textSize(20);
      textAlign(CENTER, CENTER);
      text(categorys[i], ((x + 530) + (i * sizeX)) + (sizeX/2), (y + 45) + (sizeY/2));
    }

    for (int i =0; i <ingredientTabs.length; i++) {
      int mX0 = (x + 530) + (i * sizeX);
      int mX1 = mX0 + sizeX;
      if (mouseX <= mX1 && mouseX >= mX0) {
        if (mouseY <= (y + 45) + sizeY && mouseX >= (y + 45) ) {
          if (mousePressed == true) {
            selectedTab = i;
          }
        }
      }
    }
  }

  void ingredientTabsContent() {
    switch(selectedTab) {
    case 0:
      drawingredients(fruitNames, Fimgs, oFimgs, scrollVariable);
      break;
    case 1:
      drawingredients(vegNames, Vimgs, oVimgs, scrollVariable);
      break;
    case 2:
      drawingredients(grainNames, Gimgs, oGimgs, scrollVariable);
      break;
    case 3:
      drawingredients(meatNames, Mimgs, oMimgs, scrollVariable);
      break;
    case 4:
      drawingredients(dairyNames, Dimgs, oDimgs, scrollVariable);
      break;
    default:
      instructions();
      break;
    }
  }

  void nutrientBars() {
    fill(50);
    textSize(30);
    text("food group", 815 + nutrientBarsX, 240 + nutrientBarsY);
    text("Content", 830 + nutrientBarsX, 270 + nutrientBarsY);
    stroke(50);
    noFill();
    rect(835 + nutrientBarsX, 310 + nutrientBarsY, 100, 20);
    rect(835 + nutrientBarsX, 340 + nutrientBarsY, 100, 20);
    rect(835 + nutrientBarsX, 370 + nutrientBarsY, 100, 20);
    rect(835 + nutrientBarsX, 400 + nutrientBarsY, 100, 20);
    rect(835 + nutrientBarsX, 430 + nutrientBarsY, 100, 20);
    rect(835 + nutrientBarsX, 460 + nutrientBarsY, 100, 20);

    for (int i = 0; i < nutrientBars.length -1; i++) {
      fill(colours[i]);
      if (nutrientBars[i] <= 5 && nutrientBars[i] >= 0) {
        rect(835 + nutrientBarsX, (i * 30) + 310 + nutrientBarsY, nutrientBars[i]*20, 20);
      } else if (nutrientBars[i] >= 6) {
        rect(835 + nutrientBarsX, (i * 30) + 310 + nutrientBarsY, 100, 20);
      }
    }

    fill(colours[5]);
    if (nutrientBars[5] <= 25 && nutrientBars[5] >= 0) {
      rect(835 + nutrientBarsX, 460 + nutrientBarsY, nutrientBars[5] * (20 / (nutrientBars.length - 1)), 20);
    } else if (nutrientBars[5] >= 6) {
      rect(835 + nutrientBarsX, 460 + nutrientBarsY, 100, 20);
    }


    nutrientBars[5]  = nutrientBars[0] + nutrientBars[1] + nutrientBars[2] + nutrientBars[3] + nutrientBars[4];

    textSize(20);
    fill(0);
    text(nutrientBars[0] + "/5", 875 + nutrientBarsX, 308 + nutrientBarsY);
    text(nutrientBars[1] + "/5", 875 + nutrientBarsX, 338 + nutrientBarsY);
    text(nutrientBars[2] + "/5", 875 + nutrientBarsX, 368 + nutrientBarsY);
    text(nutrientBars[3] +"/5", 875 + nutrientBarsX, 398 + nutrientBarsY);
    text(nutrientBars[4] + "/5", 875 + nutrientBarsX, 428 + nutrientBarsY);
    text(nutrientBars[5] + "/25", 937 + nutrientBarsX, 458 + nutrientBarsY);

    fill(colours[0]);
    text("fruit", 780 + nutrientBarsX, 310 + nutrientBarsY);
    fill(colours[1]);
    text("veg", 780 + nutrientBarsX, 340 + nutrientBarsY);
    fill(colours[2]);
    text("grain", 780 + nutrientBarsX, 370 + nutrientBarsY);
    fill(colours[3]);
    text("meat", 780 + nutrientBarsX, 400 + nutrientBarsY);
    fill(#D8D8D4);
    text("dairy", 780 + nutrientBarsX, 430 + nutrientBarsY);
    fill(colours[5]);
    text("total", 780 + nutrientBarsX, 460 + nutrientBarsY);

    boolean allEqual = nutrientBars[0] == nutrientBars[1];

    if (allEqual) {
      allEqual = nutrientBars[1] == nutrientBars[2];
    }

    if (allEqual) {
      allEqual = nutrientBars[2] == nutrientBars[3];
    }

    if (allEqual) {
      allEqual = nutrientBars[3] == nutrientBars[4];
    }

    if (allEqual && nutrientBars[0] >= 1) {
      textAlign(TOP, LEFT);
      textSize(21);
      text("Balanced", 840 + nutrientBarsX, 479 + nutrientBarsY);
      textSize(20);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Balanced", 885 + nutrientBarsX, 468 + nutrientBarsY);
    }

    fill(255);
    stroke(255);
    textSize(30);
  }

  void instructions() {
    if (tabSelect[0] && tabSelect[1] && tabSelect[2] && tabSelect[3] && tabSelect[4] == false) {
      instructions = true;
    }
    if (instructions == true) {
      textSize(30);
      textAlign(CENTER, CENTER);
      fill(50);
      text("Ingredients you have picked", 750, 150);
      text("will show up here", 750, 175);
    }
  }

  void run() {
    backgroundColour();
    if (cookButtonPushed == false) {
      panButton();
      ingredientBox();
      nutrientBars();
      ingredientTabsContent();
      tabs();
      clearButton();
    }
    if (cookButtonPushed == true) {
      backButton();
      foodCombos.run();
    }
  }
}