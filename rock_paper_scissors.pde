int gamestate = 0;

PImage logo;
PImage paper;
PImage scissors;
PImage rock;

int backdrop1x = 0;
int backdrop1y = 0;
int y1movement = 12;

int backdrop2x = 0;
int backdrop2y = 0;
int y2movement = 12;

int backdrop3x = 0;
int backdrop3y = 0;
int y3movement = 12;

void setup(){
    size(700, 700);
    logo = loadImage("minecraft.png");
    paper = loadImage("paper.png");
    scissors = loadImage("scissors.png");
    rock = loadImage("stone.png");
}

void draw(){
    background(0);
    background();
    if(gamestate == 0){
        fill(255);
        textSize(50);
        text("Rock Paper Scissors", 150, 220);
        image(logo, 155, 20, 400, 200);

        rect(175, 375, 150, 150);
        rect(375, 375, 150, 150);

        fill(0);
        textSize(125);
        text("AI", 200, 490);
        text(" 2", 400, 490);
    }
}

void mousePressed(){
    if(gamestate == 0){
        if(mouseY >= 375 && mouseY <= 525){
            if(mouseX >= 175 && mouseX <= 325){
                gamestate = 1;
            }
            if(mouseX >= 375 && mouseX <= 525){
                gamestate = 2;
            }
        }
    }
}

void background(){
    image(paper, backdrop1x, backdrop1y, 100, 100);
    backdrop1y = backdrop1y + y1movement;
    if(backdrop1y >= 700){
        y1movement = floor(random(10, 20));
        backdrop1x = floor(random(0, 700));
        backdrop1y = 0;
    }

    image(scissors, backdrop2x, backdrop2y, 100, 100);
    backdrop2y = backdrop2y + y2movement;
    if(backdrop2y >= 700){
        y2movement = floor(random(10, 20));
        backdrop2x = floor(random(0, 700));
        backdrop2y = 0;
    }

    image(rock, backdrop3x, backdrop3y, 100, 100);
    backdrop3y = backdrop3y + y3movement;
    if(backdrop3y >= 700){
        y3movement = floor(random(10, 20));
        backdrop3x = floor(random(0, 700));
        backdrop3y = 0;
    }
}