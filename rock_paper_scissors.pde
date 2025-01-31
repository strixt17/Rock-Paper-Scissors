int gamestate = 0;

int playerstate = 1;

int player1 = 0;
int player2 = 4;

PImage logo;
PImage paper;
PImage scissors;
PImage rock;

int backdrop1x = 0;
int backdrop1y = 0;
int y1movement = 100;

int backdrop2x = 0;
int backdrop2y = 0;
int y2movement = 100;

int backdrop3x = 0;
int backdrop3y = 0;
int y3movement = 100;

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
    if(gamestate == 1){
        textSize(50);
        fill(255);
        text("Choose Item", 225, 350);

        image(paper, 275, 375, 150, 150);
        image(rock, 62, 375, 150, 150);
        image(scissors, 487, 375, 150, 150);
        if(player2 == 1)image(rock, 300, 250, 100, 100);
        if(player2 == 2)image(paper, 300, 250, 100, 100);
        if(player2 == 3)image(scissors, 300, 250, 100, 100);
        wincheck();
    }
    if(gamestate == 2){
        textSize(50);
        fill(255);
        text("Choose Item", 225, 350);

        image(paper, 275, 375, 150, 150);
        image(rock, 62, 375, 150, 150);
        image(scissors, 487, 375, 150, 150);

        text("Player " + playerstate + "turn", 220, 220);
        wincheck();
    }
    if(gamestate == 3){
        fill(255);
        textSize(50);
        text("Tie Game", 250, 220);
        againbutton();
    }
    if(gamestate == 4){
        fill(255);
        textSize(50);
        text("Player 1 Wins!", 225, 220);
        againbutton();

        if(player1 == 2 && player2 == 1){
            fill(255);
            text("Paper beats rock!", 150, 400);
        }
        if(player1 == 3 && player2 == 2){
            fill(255);
            text("Scissors beats paper!", 150, 400);
        }
        if(player1 == 1 && player2 == 3){
            fill(255);
            text("Rock beats scissors!", 150, 400);
        }
    }
    if(gamestate == 5){
        fill(255);
        textSize(50);
        text("Player 2 Wins!", 225, 220);
        againbutton();

        if(player1 == 1 && player2 == 2){
            fill(255);
            text("Paper beats rock!", 150, 400);
        }
        if(player1 == 2 && player2 == 3){
            fill(255);
            text("Scissors beats paper!", 150, 400);
        }
        if(player1 == 1 && player2 == 3){
            fill(255);
            text("Rock beats scissors!", 150, 400);
        }
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
    if(gamestate == 1 || gamestate == 2){
        if(mouseY >= 375 && mouseY <= 525){
            if(mouseX >= 62 && mouseX <= 212){
                if(playerstate == 1)player1 = 1;
                if(playerstate == 2)player2 = 1;
                ai();
                nextplayer();
            }
            if(mouseX >= 275 && mouseX <= 425){
                if(playerstate == 1)player1 = 2;
                if(playerstate == 2)player2 = 2;
                ai();
                nextplayer();
            }
            if(mouseX >= 487 && mouseX <= 637){
                if(playerstate == 1)player1 = 3;
                if(playerstate == 2)player2 = 3;
                ai();
                nextplayer();
            }
        }
    }
    if(gamestate == 3 || gamestate == 4 || gamestate == 5){
        if(mouseX >= 275 && mouseX <= 425 && mouseY >= 250 && mouseY <= 350){
            gamestate = 0;
            reset();
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

void ai(){
    if(gamestate == 1){
        player2 = floor(random(1, 4));
        delay(500);
    }
}

void againbutton(){
    rect(275, 250, 150, 100);
    fill(0);
    text("Again", 300, 300);
}

void reset(){
    playerstate = 1;
    player1 = 0;
    player2 = 4;
}

void nextplayer(){
    playerstate = playerstate + 1;
    if(playerstate == 3) playerstate = 1;
}

void wincheck(){
    if(player1 == 2 && player2 == 1 || player1 == 3 && player2 == 2 || player1 == 1 && player2 == 3){
        gamestate = 4;
    }
    if(player1 == 1 && player2 == 2 || player1 == 2 && player2 == 3 || player1 == 3 && player2 == 1){
        gamestate = 5;
    }
    if(player1 == player2){
        gamestate = 3;
    }
}