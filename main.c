#include "gba.h"
#include "print.h"

// Function Prototypes
void initialize();
void updateGame();
void drawGame();

unsigned short oldButtons;
unsigned short buttons;

int frameCount = 0;
int loop = 0; 
int direction = 1; 
int imageFrame = 0;

int frameRates[] = {5, 10, 15, 20, 25}; 
int speedLevel = 1; 
int frameRate = 60;

int main() {

    initialize();

    while (1) {
    oldButtons = buttons;
    buttons = REG_BUTTONS;

    updateGame();
    waitForVBlank();
    drawGame();   
    }

    return 0;

}

void initialize() {
    mgba_open();
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);

    oldButtons = 0;
    buttons = REG_BUTTONS;
}



void updateGame() {
    if (BUTTON_PRESSED(BUTTON_A)) { 
        mgba_printf("button A is pressed");
        if (imageFrame < 4) {
            imageFrame++;
        } else {
            imageFrame = 0;
        }
    } 
    if (BUTTON_PRESSED(BUTTON_B)) {
        mgba_printf("button B is pressed");
        if (imageFrame > 0) {
            imageFrame--;
        } else {
            imageFrame = 4;
        }
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        mgba_printf("button start is pressed");
        if (loop == 0) {
            loop = 1; 
        } else  {
            loop = 0; 
        }
    } 
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        mgba_printf("button select is pressed");
        if (loop == 0) {
            loop = 1;
        } else {
            if (direction == 1) { 
                direction = 0;
            } else {
                direction = 1;
            }
        }
    }
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        mgba_printf("button left is pressed");
        imageFrame = 0;
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        mgba_printf("button right is pressed");
        imageFrame = 4;
    }    

    //extra credit?
    if (BUTTON_PRESSED(BUTTON_UP)) {
        mgba_printf("button up is pressed");
        if (speedLevel > 0) { 
            speedLevel--;
            frameRate = frameRates[speedLevel];  
            mgba_printf("frame rate went to %d", frameRates[speedLevel]);
        }
    }

    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        mgba_printf("button down is pressed");
        if (speedLevel < 4) { 
            frameRate = frameRates[speedLevel];
            speedLevel++;  
            mgba_printf("frame rate went to %d", frameRates[speedLevel]);
        }
    }  
    if (loop == 1) {
        frameCount++;
        if (frameCount >= frameRate) {
            frameCount = 0;
            imageFrame += direction;
            if (imageFrame > 4) { 
                imageFrame = 0;
            } else if (imageFrame < 0) { 
                imageFrame = 4;
            }
        }
    }
}

    // if (loop == 1) {
    //     frameCount = (frameCount + 1) % frameRate;
    //     if (frameCount == 0) {
    //         if (direction == 1) {
    //             if (imageFrame < 3) {
    //                 imageFrame++;
    //             } else {
    //                 imageFrame = 0;
    //             }
    //         } else {
    //             if (imageFrame > 0) {
    //                 imageFrame--;
    //             } else {
    //                 imageFrame = 3;
    //             }
    //         }
    //     }
    // }

void drawGame() {
    //fillScreen(LIGHTPINK);
    //use the flicker to go next frame 
    if (imageFrame == 0) {
        drawFrame1();
        mgba_printf("frame1");
    } else if(imageFrame == 1) {
        drawFrame2();
        mgba_printf("frame2");
    } else if (imageFrame == 2) {
        drawFrame3();
        mgba_printf("frame3");
    } else if (imageFrame == 3) {
        drawFrame4();
        mgba_printf("frame4");
    }  else if(imageFrame == 4) {
        drawFrame5();
        mgba_printf("frame5");
    }
}