//This function draws the GAMEOVER screen.

void gameOver() {

  background (0);

  fill(pink);
  textSize(50);
  text("YOU LOSE!", width/2, 400);
  textSize(30);
  text("You won " + n + " rounds", width/2, 500);

  // Play Button
  home.show();

  if (home.clicked) {
    mode = INTRO;
    lives = 3;
    money = 30;
  }
}
