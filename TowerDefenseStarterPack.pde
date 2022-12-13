//Tower Defense Game
//Alyssa Xu
//Programming 12

// ================ GLOBAL VARIABLES =================
final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAP      = 4;

int mode, MapType;
int lives       = 3;
int money       =1000;
int GUN         = 1;
int AOE         = 2;
int SNIPER      =3;
int GalaxyMap   = 1;
int JungleMap   = 2;
int p           = 0;

int towerSelect;
final int RESET = 1;
final int SELECT = 0;

boolean canBuild = false; 
boolean selected = false;

//Pallette
color pink = #ff595e;
color orange = #ffca3a;
color green = #8ac926;
color blue = #1982c4;
color purple = #6a4c93;
color white = #ffffff;
color black = #000000;
color red = #FC0303;
color yellow = #F6FF08;
color dblue= #0822FF;
color dgreen = #076401;

color MapStroke, MapFill, MapText;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start, Play, Build, Gun, Burst, home, Maps, Galaxy, Jungle, Sniper;

//Collections of objects
Node [] nodes, map1nodes;
Node [] map2nodes;
ArrayList <Mob> mobs;
ArrayList <Tower> towers;
ArrayList <Bullet> bullets;
ArrayList <Ring> rings;
ArrayList <Snipe> snipes;

//Images and Gifs
Gif introGif;
PImage play, galaxy, jungle;

//Fonts
PFont Paladins;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  introGif = new Gif("introGif/frame_", "_delay-0.05s.gif", 22, 1, width/2, height/2, width, height);
  play = loadImage( "play.png");
  galaxy = loadImage( "galaxy.png");
  jungle = loadImage("jungle.png");

  //Load Fonts
  Paladins = createFont("font/paladins.ttf", 80);

  //Create Collections of Objects
  mobs    = new ArrayList <Mob> ();
  towers  = new ArrayList<Tower>();
  bullets = new ArrayList <Bullet> ();
  rings   = new ArrayList <Ring> ();
  snipes  = new ArrayList <Snipe> ();
}

void makeButtons() {
  //INTRO - Start ========================================================================
  Maps = new Button ("MAPS", width/2, 3*height/4, 200, 100, white, black);

  // Map -Start
  //start = new Button("START", width/2, 700, 200, 100, white, purple); ==================
  Galaxy = new Button( galaxy, 300, 400, 300, 300, white, black);
  Jungle = new Button(jungle, 700, 400, 300, 300, white, black);

  //PLAY - Next Wave, To Build Mode ======================================================
  Play = new Button(play, 900, 150, 150, 80, white, black);

  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE ===================================
  Build   = new Button ("BUILD", 900, 250, 150, 80, white, black);
  Gun     = new Button ("Gun", 900, 250, 150, 80, white, black);
  Burst   = new Button("Burst", 900, 350, 150, 80, white, black);
  Sniper  = new Button( "Sniper", 900, 450, 150, 80, white, black);

  //GAMEOVER - Reset =====================================================================
  home = new Button ("RETURN", width/2, 3*height/4, 200, 100, white, black);
}

void makeNodes() {
  //Plot the nodes on the map

  //Jungle Nodes ===========================
  map1nodes = new Node[8];

  map1nodes[0] = new Node(200, 400, 0, +1);
  map1nodes[1] = new Node(200, 650, +1, 0);
  map1nodes[2] = new Node (400, 650, 0, -1);
  map1nodes[3] = new Node (400, 300, -1, 0);
  map1nodes[4] = new Node (300, 300, 0, -1);
  map1nodes[5] = new Node(300, 150, +1, 0);
  map1nodes[6] = new Node (600, 150, 0, +1);
  map1nodes[7] = new Node (600, 400, +1, 0);

  // Galaxy nodes===========================
  map2nodes = new Node[8];
  
  map2nodes[0] = new Node(200, 400, 0, -1);
  map2nodes[1] = new Node(200, 200, +1, 0);
  map2nodes[2] = new Node (400, 200, 0, +1);
  map2nodes[3] = new Node (400, 600, -1, 0);
  map2nodes[4] = new Node (300, 600, 0, -1);
  map2nodes[5] = new Node(300, 500, +1, 0);
  map2nodes[6] = new Node (500, 500, 0, -1);
  map2nodes[7] = new Node (500, 400, +1, 0);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == MAP) {
    Maps();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }

  textSize(20);
  fill(pink);
  text(mouseX + ", " + mouseY, mouseX, mouseY-20);
}
