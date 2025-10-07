PFont font;
int stage = 0;
int clears = 0;
boolean playing = false;
String message = "SPACEキーで開始";

void setup() {
  size(600, 400);
  // 日本語フォントを指定（WindowsならMS Gothic、Macならヒラギノなど）
  font = createFont("MS Gothic", 20, true);
  textFont(font);

  textAlign(CENTER, CENTER);
  textSize(20);
}

void draw() {
  background(0);
  fill(255);

  if (!playing) {
    text(message, width/2, height/2);
  } else {
    text("連続クリア: " + stage + " / 10", width/2, 50);

    // 青い扉
    fill(0, 100, 255);
    rect(100, 150, 150, 200);
    fill(255);
    text("青の扉", 175, 250);

    // 緑の扉
    fill(0, 200, 100);
    rect(350, 150, 150, 200);
    fill(255);
    text("緑の扉", 425, 250);

    fill(255);
    text("青か緑をクリックしてください", width/2, height - 30);
  }
}

void keyPressed() {
  if (key == ' ') {
    stage = 0;
    clears = 0;
    playing = true;
    message = "SPACEキーで開始";
  }
}

void mousePressed() {
  if (!playing) return;

  boolean correctBlue = random(1) < 0.5;
  boolean clickedBlue = (mouseX > 100 && mouseX < 250 && mouseY > 150 && mouseY < 350);
  boolean clickedGreen = (mouseX > 350 && mouseX < 500 && mouseY > 150 && mouseY < 350);

  if (clickedBlue || clickedGreen) {
    if ((clickedBlue && correctBlue) || (clickedGreen && !correctBlue)) {
      stage++;
      if (stage >= 10) {
        stage = 0;
          playing = false;
          message = "おめでとう！10回連続クリア達成！";
      }
    } else {
      stage = 0;
      clears = 0;
      playing = false;
      message = "残念！SPACEで再挑戦";
    }
  }
}
