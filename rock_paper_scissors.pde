int gamestate = 0;

PImage logo;

void setup(){
    size(700, 700);
    logo = loadImage("minecraft.png");
}

void draw(){
    background(0);
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