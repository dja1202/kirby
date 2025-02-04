#include "gba.h"

volatile unsigned short* videoBuffer = (volatile unsigned short*) 0x6000000;

void drawHorizontalLine(int y, int x1, int x2, volatile u16 color) {
    for (int i = x1; i <= x2; i++) {
        setPixel(i, y, color);
    }
}

void drawVerticalLine(int x, int y1, int y2, volatile u16 color) {
    for (int i = y1; i <= y2; i++) {
        setPixel(x, i, color);
    }
}

void drawRectangle(int x, int y, int width, int height, volatile u16 color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            setPixel(x + i, y + j, color);
        }
    }
}

//TODO: Add this function
void fillScreen(unsigned short color) {
    for (int y = 0; y < SCREENHEIGHT; y++) {
        for (int x = 0; x < SCREENWIDTH; x++) {
            setPixel(x, y, color);
        }
    }
}

//TODO: Add this function
void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160); 
}

// Declare functions for drawing Kirby's frames.
void drawFrame1() { 
    //drawRectangle(90, 40, 60, 54, LIGHTPINK);   //body
    drawRectangle(100, 50, 40, 34, LIGHTPINK);   //body
    drawRectangle(100, 49, 40, 2, BLACK);    //top border of the body
    drawRectangle(100, 84, 40, 2, BLACK);   //bottom border of the body
    drawRectangle(99, 49, 2, 37, BLACK);   //left side border of the body
    drawRectangle(140, 49, 2, 37, BLACK);   //right side border of the body
    drawRectangle(101, 51, 7, 33, PINK);
    drawRectangle(108, 51, 2, 2, PINK);
    drawRectangle(108, 82, 2, 2, PINK);
    drawRectangle(138, 51, 2, 2, PINK);
    drawRectangle(138, 82, 2, 2, PINK);
    drawRectangle(101, 51, 2, 2, HOTPINK);
    drawRectangle(101, 82, 2, 2, HOTPINK);



    drawRectangle(95, 66, 6, 12, PINK);   //left arm
    drawRectangle(101, 66, 6, 12, LIGHTPINK);   //left arm
    drawRectangle(95, 66, 12, 2, BLACK);  //top border of the left arm
    drawRectangle(95, 78, 12, 2, BLACK);  //bottom border of the left arm
    drawRectangle(94, 66, 2, 14, BLACK);    //left border of the left arm
    drawRectangle(107, 66, 2, 14, BLACK);   //right border of the left arm

    drawRectangle(142, 66, 4, 12, LIGHTPINK); //right arms
    drawRectangle(142, 66, 4, 2, BLACK);    //top border of the right arm
    drawRectangle(142, 78, 4, 2, BLACK);    //bottom border of the right arm
    drawRectangle(140, 66, 2, 14, BLACK);   //left border of the right arm
    drawRectangle(145, 66, 2, 14, BLACK);   //right border of the right arm

    drawRectangle(103, 85, 4, 6, DARKRED); //left foot
    drawRectangle(107, 85, 9, 6, RED); //left foot
    drawRectangle(103, 84, 13, 2, BLACK);    //top border of the left foot
    drawRectangle(103, 91, 13, 2, BLACK);    //bottom border of the left foot
    drawRectangle(101, 85, 2, 6, BLACK);   //left border of the left foot
    drawRectangle(116, 85, 2, 6, BLACK);   //right border of the left foot

    drawRectangle(123, 85, 13, 6, DARKRED); //right foot
    drawRectangle(135, 85, 5, 6, RED);  //right foot
    drawRectangle(123, 84, 17, 2, BLACK);    //top border of the right foot
    drawRectangle(123, 91, 17, 2, BLACK);   //bottom border of the right foot
    drawRectangle(121, 85, 2, 6, BLACK);   //left border of the right foot
    drawRectangle(140, 85, 2, 6, BLACK);   //right border of the right foot

    drawRectangle(98, 91, 5, 2, HOTPINK);   //line
    drawRectangle(116, 91, 7, 2, HOTPINK);  //line
    drawRectangle(140, 91, 5, 2, HOTPINK);  //line

    drawRectangle(117, 60, 2, 4, WHITE); //left eye
    drawRectangle(119, 60, 2, 4, BLACK); //left eye
    drawRectangle(117, 64, 4, 2, BLACK); //left eye
    drawRectangle(117, 66, 4, 4, DARKBLUE); //left eye
    drawRectangle(127, 60, 2, 4, WHITE); //right eye
    drawRectangle(129, 60, 2, 4, BLACK); //right eye
    drawRectangle(127, 64, 4, 2, BLACK); //right eye
    drawRectangle(127, 66, 4, 4, DARKBLUE); //right eye
    drawRectangle(122, 72, 5, 2, BLACK); //lip
    drawRectangle(113, 70, 4, 2, HOTPINK); //left blush
    drawRectangle(131, 70, 4, 2, HOTPINK); //right blush
}

void drawFrame2() {
    drawRectangle(100, 52, 40, 34, LIGHTPINK);   //body
    drawRectangle(100, 51, 40, 2, BLACK);    //top border of the body
    drawRectangle(100, 86, 40, 2, BLACK);   //bottom border of the body
    drawRectangle(99, 51, 2, 37, BLACK);   //left side border of the body
    drawRectangle(140, 51, 2, 37, BLACK);   //right side border of the body
    drawRectangle(101, 53, 7, 33, PINK);
    drawRectangle(108, 53, 2, 2, PINK);
    drawRectangle(108, 84, 2, 2, PINK);
    drawRectangle(138, 53, 2, 2, PINK);
    drawRectangle(138, 84, 2, 2, PINK);
    drawRectangle(101, 53, 2, 2, HOTPINK);
    drawRectangle(101, 84, 2, 2, HOTPINK);

    drawRectangle(95, 66, 6, 12, PINK);   //left arm
    drawRectangle(101, 66, 6, 12, LIGHTPINK);   //left arm
    drawRectangle(95, 66, 12, 2, BLACK);  //top border of the left arm
    drawRectangle(95, 78, 12, 2, BLACK);  //bottom border of the left arm
    drawRectangle(94, 66, 2, 14, BLACK);    //left border of the left arm
    drawRectangle(107, 66, 2, 14, BLACK);   //right border of the left arm

    drawRectangle(142, 66, 4, 12, LIGHTPINK); //right arms
    drawRectangle(142, 66, 4, 2, BLACK);    //top border of the right arm
    drawRectangle(142, 78, 4, 2, BLACK);    //bottom border of the right arm
    drawRectangle(140, 66, 2, 14, BLACK);   //left border of the right arm
    drawRectangle(145, 66, 2, 14, BLACK);   //right border of the right arm

    drawRectangle(103, 87, 4, 4, DARKRED); //left foot
    drawRectangle(107, 87, 9, 4, RED); //left foot
    drawRectangle(103, 86, 13, 2, BLACK);    //top border of the left foot
    drawRectangle(103, 91, 13, 2, BLACK);    //bottom border of the left foot
    drawRectangle(101, 87, 2, 4, BLACK);   //left border of the left foot
    drawRectangle(116, 87, 2, 4, BLACK);   //right border of the left foot

    drawRectangle(123, 87, 13, 4, DARKRED); //right foot
    drawRectangle(135, 87, 5, 4, RED);  //right foot
    drawRectangle(123, 86, 17, 2, BLACK);    //top border of the right foot
    drawRectangle(123, 91, 17, 2, BLACK);   //bottom border of the right foot
    drawRectangle(121, 87, 2, 4, BLACK);   //left border of the right foot
    drawRectangle(140, 87, 2, 4, BLACK);   //right border of the right foot

    drawRectangle(98, 91, 5, 2, HOTPINK);   //line
    drawRectangle(116, 91, 7, 2, HOTPINK);  //line
    drawRectangle(140, 91, 5, 2, HOTPINK);  //line

    drawRectangle(117, 68, 4, 2, HOTPINK); //left eye
    drawRectangle(127, 68, 4, 2, HOTPINK); //right eye
    drawRectangle(122, 74, 5, 2, BLACK); //lip
    drawRectangle(113, 72, 4, 2, HOTPINK); //left blush
    drawRectangle(131, 72, 4, 2, HOTPINK); //right blush
}

void drawFrame3() {
    drawRectangle(100, 52, 40, 34, LIGHTPINK);   //body
    drawRectangle(100, 51, 40, 2, BLACK);    //top border of the body
    drawRectangle(100, 86, 40, 2, BLACK);   //bottom border of the body
    drawRectangle(99, 51, 2, 37, BLACK);   //left side border of the body
    drawRectangle(140, 51, 2, 37, BLACK);   //right side border of the body
    drawRectangle(101, 53, 7, 33, PINK);
    drawRectangle(108, 53, 2, 2, PINK);
    drawRectangle(108, 84, 2, 2, PINK);
    drawRectangle(138, 53, 2, 2, PINK);
    drawRectangle(138, 84, 2, 2, PINK);
    drawRectangle(101, 53, 2, 2, HOTPINK);
    drawRectangle(101, 84, 2, 2, HOTPINK);

    drawRectangle(95, 68, 6, 12, PINK);   //left arm
    drawRectangle(101, 68, 6, 12, LIGHTPINK);   //left arm
    drawRectangle(95, 68, 12, 2, BLACK);  //top border of the left arm
    drawRectangle(95, 80, 12, 2, BLACK);  //bottom border of the left arm
    drawRectangle(94, 68, 2, 14, BLACK);    //left border of the left arm
    drawRectangle(107, 68, 2, 14, BLACK);   //right border of the left arm

    drawRectangle(142, 68, 4, 12, LIGHTPINK); //right arms
    drawRectangle(142, 68, 4, 2, BLACK);    //top border of the right arm
    drawRectangle(142, 80, 4, 2, BLACK);    //bottom border of the right arm
    drawRectangle(140, 68, 2, 14, BLACK);   //left border of the right arm
    drawRectangle(145, 68, 2, 14, BLACK);   //right border of the right arm

    drawRectangle(103, 87, 4, 4, DARKRED); //left foot
    drawRectangle(107, 87, 9, 4, RED); //left foot
    drawRectangle(103, 86, 13, 2, BLACK);    //top border of the left foot
    drawRectangle(103, 91, 13, 2, BLACK);    //bottom border of the left foot
    drawRectangle(101, 87, 2, 4, BLACK);   //left border of the left foot
    drawRectangle(116, 87, 2, 4, BLACK);   //right border of the left foot

    drawRectangle(123, 87, 13, 4, DARKRED); //right foot
    drawRectangle(135, 87, 5, 4, RED);  //right foot
    drawRectangle(123, 86, 17, 2, BLACK);    //top border of the right foot
    drawRectangle(123, 91, 17, 2, BLACK);   //bottom border of the right foot
    drawRectangle(121, 87, 2, 4, BLACK);   //left border of the right foot
    drawRectangle(140, 87, 2, 4, BLACK);   //right border of the right foot

    drawRectangle(98, 91, 5, 2, HOTPINK);   //line
    drawRectangle(116, 91, 7, 2, HOTPINK);  //line
    drawRectangle(140, 91, 5, 2, HOTPINK);  //line

    drawRectangle(117, 64, 4, 2, HOTPINK); //left eye
    drawRectangle(117, 66, 4, 2, BLACK); //left eye
    drawRectangle(117, 68, 4, 2, HOTPINK); //left eye
    drawRectangle(127, 64, 4, 2, HOTPINK); //right eye
    drawRectangle(127, 66, 4, 2, BLACK); //right eye
    drawRectangle(127, 68, 4, 2, HOTPINK); //right eye
    drawRectangle(122, 74, 5, 2, BLACK); //lip
    drawRectangle(113, 72, 4, 2, HOTPINK); //left blush
    drawRectangle(131, 72, 4, 2, HOTPINK); //right blush
}

void drawFrame4() {
    drawRectangle(100, 52, 40, 34, LIGHTPINK);   //body
    drawRectangle(100, 51, 40, 2, BLACK);    //top border of the body
    drawRectangle(100, 86, 40, 2, BLACK);   //bottom border of the body
    drawRectangle(99, 51, 2, 37, BLACK);   //left side border of the body
    drawRectangle(140, 51, 2, 37, BLACK);   //right side border of the body
    drawRectangle(101, 53, 7, 33, PINK);
    drawRectangle(108, 53, 2, 2, PINK);
    drawRectangle(108, 84, 2, 2, PINK);
    drawRectangle(138, 53, 2, 2, PINK);
    drawRectangle(138, 84, 2, 2, PINK);
    drawRectangle(101, 53, 2, 2, HOTPINK);
    drawRectangle(101, 84, 2, 2, HOTPINK);

    drawRectangle(95, 68, 6, 12, PINK);   //left arm
    drawRectangle(101, 68, 6, 12, LIGHTPINK);   //left arm
    drawRectangle(95, 68, 12, 2, BLACK);  //top border of the left arm
    drawRectangle(95, 80, 12, 2, BLACK);  //bottom border of the left arm
    drawRectangle(94, 68, 2, 14, BLACK);    //left border of the left arm
    drawRectangle(107, 68, 2, 14, BLACK);   //right border of the left arm

    drawRectangle(142, 68, 4, 12, LIGHTPINK); //right arms
    drawRectangle(142, 68, 4, 2, BLACK);    //top border of the right arm
    drawRectangle(142, 80, 4, 2, BLACK);    //bottom border of the right arm
    drawRectangle(140, 68, 2, 14, BLACK);   //left border of the right arm
    drawRectangle(145, 68, 2, 14, BLACK);   //right border of the right arm

    drawRectangle(103, 87, 4, 4, DARKRED); //left foot
    drawRectangle(107, 87, 9, 4, RED); //left foot
    drawRectangle(103, 86, 13, 2, BLACK);    //top border of the left foot
    drawRectangle(103, 91, 13, 2, BLACK);    //bottom border of the left foot
    drawRectangle(101, 87, 2, 4, BLACK);   //left border of the left foot
    drawRectangle(116, 87, 2, 4, BLACK);   //right border of the left foot

    drawRectangle(123, 87, 13, 4, DARKRED); //right foot
    drawRectangle(135, 87, 5, 4, RED);  //right foot
    drawRectangle(123, 86, 17, 2, BLACK);    //top border of the right foot
    drawRectangle(123, 91, 17, 2, BLACK);   //bottom border of the right foot
    drawRectangle(121, 87, 2, 4, BLACK);   //left border of the right foot
    drawRectangle(140, 87, 2, 4, BLACK);   //right border of the right foot

    drawRectangle(98, 91, 5, 2, HOTPINK);   //line
    drawRectangle(116, 91, 7, 2, HOTPINK);  //line
    drawRectangle(140, 91, 5, 2, HOTPINK);  //line

    drawRectangle(117, 62, 2, 4, WHITE); //left eye
    drawRectangle(119, 62, 2, 4, BLACK); //left eye
    drawRectangle(117, 66, 4, 2, BLACK); //left eye
    drawRectangle(117, 68, 4, 4, DARKBLUE); //left eye
    drawRectangle(127, 62, 2, 4, WHITE); //right eye
    drawRectangle(129, 62, 2, 4, BLACK); //right eye
    drawRectangle(127, 66, 4, 2, BLACK); //right eye
    drawRectangle(127, 68, 4, 4, DARKBLUE); //right eye
    drawRectangle(122, 74, 5, 2, BLACK); //lip
    drawRectangle(113, 72, 4, 2, HOTPINK); //left blush
    drawRectangle(131, 72, 4, 2, HOTPINK); //right blush
}

void drawFrame5() {
    drawRectangle(100, 50, 40, 34, LIGHTPINK);   //body
    drawRectangle(100, 49, 40, 2, BLACK);    //top border of the body
    drawRectangle(100, 84, 40, 2, BLACK);   //bottom border of the body
    drawRectangle(99, 49, 2, 37, BLACK);   //left side border of the body
    drawRectangle(140, 49, 2, 37, BLACK);   //right side border of the body
    drawRectangle(101, 51, 7, 33, PINK);
    drawRectangle(108, 51, 2, 2, PINK);
    drawRectangle(108, 82, 2, 2, PINK);
    drawRectangle(138, 51, 2, 2, PINK);
    drawRectangle(138, 82, 2, 2, PINK);
    drawRectangle(101, 51, 2, 2, HOTPINK);
    drawRectangle(101, 82, 2, 2, HOTPINK);

    drawRectangle(95, 68, 6, 12, PINK);   //left arm
    drawRectangle(101, 68, 6, 12, LIGHTPINK);   //left arm
    drawRectangle(95, 68, 12, 2, BLACK);  //top border of the left arm
    drawRectangle(95, 80, 12, 2, BLACK);  //bottom border of the left arm
    drawRectangle(94, 68, 2, 14, BLACK);    //left border of the left arm
    drawRectangle(107, 68, 2, 14, BLACK);   //right border of the left arm

    drawRectangle(142, 68, 4, 12, LIGHTPINK); //right arms
    drawRectangle(142, 68, 4, 2, BLACK);    //top border of the right arm
    drawRectangle(142, 80, 4, 2, BLACK);    //bottom border of the right arm
    drawRectangle(140, 68, 2, 14, BLACK);   //left border of the right arm
    drawRectangle(145, 68, 2, 14, BLACK);   //right border of the right arm

    drawRectangle(103, 85, 4, 6, DARKRED); //left foot
    drawRectangle(107, 85, 9, 6, RED); //left foot
    drawRectangle(103, 84, 13, 2, BLACK);    //top border of the left foot
    drawRectangle(103, 91, 13, 2, BLACK);    //bottom border of the left foot
    drawRectangle(101, 85, 2, 6, BLACK);   //left border of the left foot
    drawRectangle(116, 85, 2, 6, BLACK);   //right border of the left foot

    drawRectangle(123, 85, 13, 6, DARKRED); //right foot
    drawRectangle(135, 85, 5, 6, RED);  //right foot
    drawRectangle(123, 84, 17, 2, BLACK);    //top border of the right foot
    drawRectangle(123, 91, 17, 2, BLACK);   //bottom border of the right foot
    drawRectangle(121, 85, 2, 6, BLACK);   //left border of the right foot
    drawRectangle(140, 85, 2, 6, BLACK);   //right border of the right foot

    drawRectangle(98, 91, 5, 2, HOTPINK);   //line
    drawRectangle(116, 91, 7, 2, HOTPINK);  //line
    drawRectangle(140, 91, 5, 2, HOTPINK);  //line

    drawRectangle(117, 60, 2, 4, WHITE); //left eye
    drawRectangle(119, 60, 2, 4, BLACK); //left eye
    drawRectangle(117, 64, 4, 2, BLACK); //left eye
    drawRectangle(117, 66, 4, 4, DARKBLUE); //left eye
    drawRectangle(127, 60, 2, 4, WHITE); //right eye
    drawRectangle(129, 60, 2, 4, BLACK); //right eye
    drawRectangle(127, 64, 4, 2, BLACK); //right eye
    drawRectangle(127, 66, 4, 4, DARKBLUE); //right eye
    drawRectangle(122, 72, 5, 2, BLACK); //lip
    drawRectangle(113, 70, 4, 2, HOTPINK); //left blush
    drawRectangle(131, 70, 4, 2, HOTPINK); //right blush
}