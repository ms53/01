

class MenuSide {

  boolean instructions = true;

  int numberOfCols = 3;
  int startX = 125;
  int startY = 50;
  int colIncrement = 125;
  int rowIncrement = 150;
  int picSize = 100;

  int rangeForScroll(String[] names) {
    int offset = names.length % numberOfCols == 0 ? 1 : 0;
    return (-offset-2+int(names.length/numberOfCols)) * rowIncrement;
  }
  int[] names = new int[5];

  int selectedTab = -1;


  void nutrientBarsMove0() {
    for (int i = 0; i < nutrientBars.length; i++) {
      nutrientBars[i] = 0;
    }

    for (int i = 0; i < oFimgs.length; i++) {
      if (oFimgs[i] == true) {
        nutrientBars[0]++;
      }
    }
    for (int i = 0; i < oVimgs.length; i++) {
      if (oVimgs[i] == true) {
        nutrientBars[1]++;
      }
    }
    for (int i = 0; i < oGimgs.length; i++) {
      if (oGimgs[i] == true) {
        nutrientBars[2]++;
      }
    }
    for (int i = 0; i < oMimgs.length; i++) {
      if (oMimgs[i] == true) {
        nutrientBars[3]++;
      }
    }
    for (int i = 0; i < oDimgs.length; i++) {
      if (oDimgs[i] == true) {
        nutrientBars[4]++;
      }
    }
  }

  void nutrientBarsMove1() {
    for (int i = 0; i < nutrientBars.length; i++) {
      nutrientBars[i] = 0;
    }

    for (int i = 0; i < oFimgs.length; i++) {
      if (oFimgs[i] == true) {
        nutrientBars[0]--;
      }
    }
    for (int i = 0; i < oVimgs.length; i++) {
      if (oVimgs[i] == true) {
        nutrientBars[1]--;
      }
    }
    for (int i = 0; i < oGimgs.length; i++) {
      if (oGimgs[i] == true) {
        nutrientBars[2]--;
      }
    }
    for (int i = 0; i < oMimgs.length; i++) {
      if (oMimgs[i] == true) {
        nutrientBars[3]--;
      }
    }
    for (int i = 0; i < oDimgs.length; i++) {
      if (oDimgs[i] == true) {
        nutrientBars[4]--;
      }
    }
  }

  void drawTabContent(String[] names, PImage[] imgs, boolean[] options, int tabIndex) {
    fill(50);
    textSize(20);
    int scrollValue = selectedTab < 0 ? 0 : scrollVariable[selectedTab];

    for (int i = 0; i < imgs.length; i++) {
      int row = int(i/numberOfCols);
      int col = i%numberOfCols;
      int mouseCheckX = (startX + (col * colIncrement));
      int mouseCheckY = (startY + (row * rowIncrement));
      image(imgs[i], mouseCheckX, mouseCheckY + scrollValue, picSize, picSize);
      text(names[i], mouseCheckX + 50, (mouseCheckY + 110) + (scrollValue));
      if (options[i] == false) {
        if (mouseY <= 475 && mouseY >= 25) { 
          if (mouseX >= mouseCheckX && mouseX <= mouseCheckX + picSize) {
            if (mouseY >= mouseCheckY + (scrollValue) && mouseY <= (mouseCheckY + picSize) + (scrollValue)) {
              if (mousePressed == true && !options[i]) {
                options[i] = true;
                print(names[i] +  " selected              ");
                nutrientBarsMove0();
                panSide.selectedTab = tabIndex;
              }
            }
          }
        }
      }
      if (options[i] == true) {
        fill(50);
        rect(mouseCheckX, mouseCheckY + (scrollValue), picSize/5, picSize/5, 0, 0, 5, 0);
        fill(50, 200);
        line(mouseCheckX, mouseCheckY + (scrollValue), mouseCheckX + picSize/5, mouseCheckY + picSize/5 + (scrollValue));
        line(mouseCheckX + picSize/5, mouseCheckY + (scrollValue), mouseCheckX, mouseCheckY + picSize/5 + (scrollValue));
      }

      if (mouseY <= 475 && mouseY >= 25) { 
        if (mouseX >= mouseCheckX && mouseX <= mouseCheckX + picSize/5) {
          if (mouseY >= mouseCheckY + scrollValue && mouseY <= mouseCheckY + picSize/5 + scrollValue) {
            if (mousePressed == true) {
              options[i] = false;
              print(names[i] +  " unselected              ");
              nutrientBarsMove0();
            }
          }
        }
      }

      if (options[i] == true) {
        fill(50, 200);
        rect( mouseCheckX, mouseCheckY + (scrollValue), picSize, picSize);
      }
    }
    textSize(30);
    fill(50);
  }

  void tabs() {
    fill(50);
    stroke(255);
    for (int i = 0; i < tabSelect.length; i++) {
      fill(50);
      stroke(255);
      if (selectedTab == i) {
        fill(colours[i]);
        noStroke();
        rect(105, 1, 15, 100);
      }
      rect(.5, (i*100) + .5, tabWidth[i], 99, 0, 15, 15, 0);

      stroke(255);
      textAlign(CENTER, CENTER);
      textSize(30);
      fill(50);

      if (selectedTab != i) {
        fill(colours[i]);
      }
      text(categorys[i], 50, (i*100) + 50);
    }

    switch(selectedTab) {
    case 0:
      drawTabContent(fruitNames, Fimgs, oFimgs, 0);
      break;
    case 1:
      drawTabContent(vegNames, Vimgs, oVimgs, 1);
      break;
    case 2:
      drawTabContent(grainNames, Gimgs, oGimgs, 2);
      break;
    case 3:
      drawTabContent(meatNames, Mimgs, oMimgs, 3);
      break;
    case 4:
      drawTabContent(dairyNames, Dimgs, oDimgs, 4);
      break;
    default:
      instructions = true;
      break;
    }

    fill(255);
  }


  void halfScreenColourTabsExtend() {
    fill(255);
    for (int i = 0; i < tabSelect.length; i++) {
      if (selectedTab == i) {
        fill(colours[i]);
        tabWidth[i] = 120;
      }
    }  
    for (int i = 0; i < tabSelect.length; i++) {
      if (selectedTab != i) {
        tabWidth[i] = 100;
      }
    }

    stroke(0);
    rect(0.5, 0.5, width/2, height);
  }

  void instructions() {
    fill(50);
    textAlign(LEFT, TOP);
    textSize(40);
    text("Instructions", 130, 50);
    textSize(30);
    text("Click on the tabs at the", 110, 100);
    text("side of the screen to", 110, 130);
    text("choose what foods you", 110, 160);
    text("will put into your", 110, 190);
    text("meal.", 110, 220);
    text("when you have chosen", 110, 250);
    text("your foods, click the cook", 110, 280);
    text("button to see recipes", 110, 310);
    textAlign(CENTER, CENTER);
    fill(255);
  }

  void tabsClick() {
    for (int i = 0; i < tabSelect.length; i++) {
      if (mouseX <= tabWidth[i]) {
        if (mouseY >= i * 100 && mouseY <= (i+1) * 100) {
          if (mousePressed == true) {
            selectedTab = i;
            instructions = false;
          }
        }
      }
    }
  }

  void instructionsButton() {
    stroke(255);
    fill(50);
    rect(440, 0, 60, 20, 0, 0, 0, 12);
    textSize(10);
    textAlign(LEFT, TOP);
    fill(240);
    text("instructions", 443, 5);
    textSize(30);
    textAlign(CENTER, CENTER);
    fill(255);
    if (mouseX <= 500 && mouseX >= 440) {
      if (mouseY <= 20) {
        if (mousePressed == true) {
          instructions = true;
          selectedTab = -1;
        }
      }
    }
    fill(255);
  }

  void scrollButtons() {
    names[0] = rangeForScroll(fruitNames) ;
    names[1] = rangeForScroll(vegNames) ;
    names[2] = rangeForScroll(grainNames) ;
    names[3] = rangeForScroll(meatNames) ;
    names[4] = rangeForScroll(dairyNames) ;

    for (int i = 0; i < tabSelect.length; i++)
      if (selectedTab == i) {
        stroke(255);
        fill(50);
        rect(125, 0, 300, 25, 0, 0, 10, 10);
        stroke(255);
        line(275, 5, 265, 20);
        line(275, 5, 285, 20);
        if (mouseX <= 425 && mouseX >= 125) {
          if (mouseY >= 0 && mouseY <= 25) {
            if (mousePressed == true) {
              scrollVariable[i] = scrollVariable[i] +7;
            }
          }
        }
        stroke(255);
        rect(125, 475, 300, 25, 10, 10, 0, 0);
        stroke(255);
        line(275, 495, 265, 480);
        line(275, 495, 285, 480);
        if (mouseX <= 425 && mouseX >= 125) {
          if (mouseY >= 475 && mouseY <= 500) {
            if (mousePressed == true) {
              scrollVariable[i] = scrollVariable[i] -7;
            }
          }
        }
        if (scrollVariable[i] >= 0) {
          scrollVariable[i] = 0;
        } 
        if (scrollVariable[i] <= - names[i]) {
          scrollVariable[i] = - names[i];
        }
      }
    fill(255);
  }

  void displayRecipies() {
    textSize(40);
    fill(0);
    text("Recipies", 250, 40);
    int scrollVariableR = 0;
    int jR = 0;
    for (int i = 0; i < ooRecipies.length; i++) {
      int startYR = 65;
      int startXR = 0;
      int picSizeR = 500;
      int numberOfColsR = 1;
      int colIncrementR = 0;
      int mouseCheckYR = (startYR + (jR/numberOfColsR));
      int mouseCheckXR = (startXR + (jR * colIncrementR));
      if ( ooRecipies[i] == true) {
        image(recipiesImgsSub[i], mouseCheckXR, (mouseCheckYR + scrollVariableR), picSizeR, recipiesImgsSub[i].height * picSizeR/recipiesImgsSub[i].width);
        jR++;
      }
    }
  }

  void run() {
    if (cookButtonPushed == false) {
      tabsClick();
      halfScreenColourTabsExtend();
      tabs();
      if (instructions == false) {
        instructionsButton();
        scrollButtons();
      }
      if (instructions == true) {
        instructions();
      }
    }
    if (cookButtonPushed == true) {
      displayRecipies();
    }
  }
}