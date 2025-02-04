# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1
# 45 "gba.h"
typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short* videoBuffer;


void waitForVBlank();
void drawHorizontalLine(int, int, int, volatile u16);
void drawVerticalLine(int, int, int, volatile u16);
void drawRectangle(int, int, int, int, volatile u16);
void fillScreen(volatile u16);
void drawFrame1();
void drawFrame2();
void drawFrame3();
void drawFrame4();
void drawFrame5();
void drawFrame6();
void drawFrame7();
# 89 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "gba.c" 2

volatile unsigned short* videoBuffer = (volatile unsigned short*) 0x6000000;

void drawHorizontalLine(int y, int x1, int x2, volatile u16 color) {
    for (int i = x1; i <= x2; i++) {
        (videoBuffer[((y) * (240) + (i))] = color);
    }
}

void drawVerticalLine(int x, int y1, int y2, volatile u16 color) {
    for (int i = y1; i <= y2; i++) {
        (videoBuffer[((i) * (240) + (x))] = color);
    }
}

void drawRectangle(int x, int y, int width, int height, volatile u16 color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            (videoBuffer[((y + j) * (240) + (x + i))] = color);
        }
    }
}


void fillScreen(unsigned short color) {
    for (int y = 0; y < 160; y++) {
        for (int x = 0; x < 240; x++) {
            (videoBuffer[((y) * (240) + (x))] = color);
        }
    }
}


void waitForVBlank() {
    while ((*(volatile unsigned short *) 0x04000006) >= 160);
    while ((*(volatile unsigned short *) 0x04000006) < 160);
}


void drawFrame1() {

    drawRectangle(100, 50, 40, 34, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(100, 49, 40, 2, 0);
    drawRectangle(100, 84, 40, 2, 0);
    drawRectangle(99, 49, 2, 37, 0);
    drawRectangle(140, 49, 2, 37, 0);
    drawRectangle(101, 51, 7, 33, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(108, 51, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(108, 82, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(138, 51, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(138, 82, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(101, 51, 2, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(101, 82, 2, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));



    drawRectangle(95, 66, 6, 12, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(101, 66, 6, 12, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(95, 66, 12, 2, 0);
    drawRectangle(95, 78, 12, 2, 0);
    drawRectangle(94, 66, 2, 14, 0);
    drawRectangle(107, 66, 2, 14, 0);

    drawRectangle(142, 66, 4, 12, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(142, 66, 4, 2, 0);
    drawRectangle(142, 78, 4, 2, 0);
    drawRectangle(140, 66, 2, 14, 0);
    drawRectangle(145, 66, 2, 14, 0);

    drawRectangle(103, 85, 4, 6, (((25) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(107, 85, 9, 6, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(103, 84, 13, 2, 0);
    drawRectangle(103, 91, 13, 2, 0);
    drawRectangle(101, 85, 2, 6, 0);
    drawRectangle(116, 85, 2, 6, 0);

    drawRectangle(123, 85, 13, 6, (((25) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(135, 85, 5, 6, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(123, 84, 17, 2, 0);
    drawRectangle(123, 91, 17, 2, 0);
    drawRectangle(121, 85, 2, 6, 0);
    drawRectangle(140, 85, 2, 6, 0);

    drawRectangle(98, 91, 5, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(116, 91, 7, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(140, 91, 5, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));

    drawRectangle(117, 60, 2, 4, 0x7FFF);
    drawRectangle(119, 60, 2, 4, 0);
    drawRectangle(117, 64, 4, 2, 0);
    drawRectangle(117, 66, 4, 4, (((5) & 31) | (((16) & 31) << 5) | (((28) & 31) << 10)));
    drawRectangle(127, 60, 2, 4, 0x7FFF);
    drawRectangle(129, 60, 2, 4, 0);
    drawRectangle(127, 64, 4, 2, 0);
    drawRectangle(127, 66, 4, 4, (((5) & 31) | (((16) & 31) << 5) | (((28) & 31) << 10)));
    drawRectangle(122, 72, 5, 2, 0);
    drawRectangle(113, 70, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(131, 70, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
}

void drawFrame2() {
    drawRectangle(100, 52, 40, 34, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(100, 51, 40, 2, 0);
    drawRectangle(100, 86, 40, 2, 0);
    drawRectangle(99, 51, 2, 37, 0);
    drawRectangle(140, 51, 2, 37, 0);
    drawRectangle(101, 53, 7, 33, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(108, 53, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(108, 84, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(138, 53, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(138, 84, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(101, 53, 2, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(101, 84, 2, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));

    drawRectangle(95, 66, 6, 12, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(101, 66, 6, 12, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(95, 66, 12, 2, 0);
    drawRectangle(95, 78, 12, 2, 0);
    drawRectangle(94, 66, 2, 14, 0);
    drawRectangle(107, 66, 2, 14, 0);

    drawRectangle(142, 66, 4, 12, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(142, 66, 4, 2, 0);
    drawRectangle(142, 78, 4, 2, 0);
    drawRectangle(140, 66, 2, 14, 0);
    drawRectangle(145, 66, 2, 14, 0);

    drawRectangle(103, 87, 4, 4, (((25) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(107, 87, 9, 4, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(103, 86, 13, 2, 0);
    drawRectangle(103, 91, 13, 2, 0);
    drawRectangle(101, 87, 2, 4, 0);
    drawRectangle(116, 87, 2, 4, 0);

    drawRectangle(123, 87, 13, 4, (((25) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(135, 87, 5, 4, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(123, 86, 17, 2, 0);
    drawRectangle(123, 91, 17, 2, 0);
    drawRectangle(121, 87, 2, 4, 0);
    drawRectangle(140, 87, 2, 4, 0);

    drawRectangle(98, 91, 5, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(116, 91, 7, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(140, 91, 5, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));

    drawRectangle(117, 68, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(127, 68, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(122, 74, 5, 2, 0);
    drawRectangle(113, 72, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(131, 72, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
}

void drawFrame3() {
    drawRectangle(100, 52, 40, 34, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(100, 51, 40, 2, 0);
    drawRectangle(100, 86, 40, 2, 0);
    drawRectangle(99, 51, 2, 37, 0);
    drawRectangle(140, 51, 2, 37, 0);
    drawRectangle(101, 53, 7, 33, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(108, 53, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(108, 84, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(138, 53, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(138, 84, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(101, 53, 2, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(101, 84, 2, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));

    drawRectangle(95, 68, 6, 12, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(101, 68, 6, 12, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(95, 68, 12, 2, 0);
    drawRectangle(95, 80, 12, 2, 0);
    drawRectangle(94, 68, 2, 14, 0);
    drawRectangle(107, 68, 2, 14, 0);

    drawRectangle(142, 68, 4, 12, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(142, 68, 4, 2, 0);
    drawRectangle(142, 80, 4, 2, 0);
    drawRectangle(140, 68, 2, 14, 0);
    drawRectangle(145, 68, 2, 14, 0);

    drawRectangle(103, 87, 4, 4, (((25) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(107, 87, 9, 4, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(103, 86, 13, 2, 0);
    drawRectangle(103, 91, 13, 2, 0);
    drawRectangle(101, 87, 2, 4, 0);
    drawRectangle(116, 87, 2, 4, 0);

    drawRectangle(123, 87, 13, 4, (((25) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(135, 87, 5, 4, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(123, 86, 17, 2, 0);
    drawRectangle(123, 91, 17, 2, 0);
    drawRectangle(121, 87, 2, 4, 0);
    drawRectangle(140, 87, 2, 4, 0);

    drawRectangle(98, 91, 5, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(116, 91, 7, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(140, 91, 5, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));

    drawRectangle(117, 64, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(117, 66, 4, 2, 0);
    drawRectangle(117, 68, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(127, 64, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(127, 66, 4, 2, 0);
    drawRectangle(127, 68, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(122, 74, 5, 2, 0);
    drawRectangle(113, 72, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(131, 72, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
}

void drawFrame4() {
    drawRectangle(100, 52, 40, 34, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(100, 51, 40, 2, 0);
    drawRectangle(100, 86, 40, 2, 0);
    drawRectangle(99, 51, 2, 37, 0);
    drawRectangle(140, 51, 2, 37, 0);
    drawRectangle(101, 53, 7, 33, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(108, 53, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(108, 84, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(138, 53, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(138, 84, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(101, 53, 2, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(101, 84, 2, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));

    drawRectangle(95, 68, 6, 12, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(101, 68, 6, 12, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(95, 68, 12, 2, 0);
    drawRectangle(95, 80, 12, 2, 0);
    drawRectangle(94, 68, 2, 14, 0);
    drawRectangle(107, 68, 2, 14, 0);

    drawRectangle(142, 68, 4, 12, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(142, 68, 4, 2, 0);
    drawRectangle(142, 80, 4, 2, 0);
    drawRectangle(140, 68, 2, 14, 0);
    drawRectangle(145, 68, 2, 14, 0);

    drawRectangle(103, 87, 4, 4, (((25) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(107, 87, 9, 4, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(103, 86, 13, 2, 0);
    drawRectangle(103, 91, 13, 2, 0);
    drawRectangle(101, 87, 2, 4, 0);
    drawRectangle(116, 87, 2, 4, 0);

    drawRectangle(123, 87, 13, 4, (((25) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(135, 87, 5, 4, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(123, 86, 17, 2, 0);
    drawRectangle(123, 91, 17, 2, 0);
    drawRectangle(121, 87, 2, 4, 0);
    drawRectangle(140, 87, 2, 4, 0);

    drawRectangle(98, 91, 5, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(116, 91, 7, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(140, 91, 5, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));

    drawRectangle(117, 62, 2, 4, 0x7FFF);
    drawRectangle(119, 62, 2, 4, 0);
    drawRectangle(117, 66, 4, 2, 0);
    drawRectangle(117, 68, 4, 4, (((5) & 31) | (((16) & 31) << 5) | (((28) & 31) << 10)));
    drawRectangle(127, 62, 2, 4, 0x7FFF);
    drawRectangle(129, 62, 2, 4, 0);
    drawRectangle(127, 66, 4, 2, 0);
    drawRectangle(127, 68, 4, 4, (((5) & 31) | (((16) & 31) << 5) | (((28) & 31) << 10)));
    drawRectangle(122, 74, 5, 2, 0);
    drawRectangle(113, 72, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(131, 72, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
}

void drawFrame5() {
    drawRectangle(100, 50, 40, 34, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(100, 49, 40, 2, 0);
    drawRectangle(100, 84, 40, 2, 0);
    drawRectangle(99, 49, 2, 37, 0);
    drawRectangle(140, 49, 2, 37, 0);
    drawRectangle(101, 51, 7, 33, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(108, 51, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(108, 82, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(138, 51, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(138, 82, 2, 2, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(101, 51, 2, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(101, 82, 2, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));

    drawRectangle(95, 68, 6, 12, (((30) & 31) | (((8) & 31) << 5) | (((15) & 31) << 10)));
    drawRectangle(101, 68, 6, 12, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(95, 68, 12, 2, 0);
    drawRectangle(95, 80, 12, 2, 0);
    drawRectangle(94, 68, 2, 14, 0);
    drawRectangle(107, 68, 2, 14, 0);

    drawRectangle(142, 68, 4, 12, (((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));
    drawRectangle(142, 68, 4, 2, 0);
    drawRectangle(142, 80, 4, 2, 0);
    drawRectangle(140, 68, 2, 14, 0);
    drawRectangle(145, 68, 2, 14, 0);

    drawRectangle(103, 85, 4, 6, (((25) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(107, 85, 9, 6, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(103, 84, 13, 2, 0);
    drawRectangle(103, 91, 13, 2, 0);
    drawRectangle(101, 85, 2, 6, 0);
    drawRectangle(116, 85, 2, 6, 0);

    drawRectangle(123, 85, 13, 6, (((25) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(135, 85, 5, 6, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
    drawRectangle(123, 84, 17, 2, 0);
    drawRectangle(123, 91, 17, 2, 0);
    drawRectangle(121, 85, 2, 6, 0);
    drawRectangle(140, 85, 2, 6, 0);

    drawRectangle(98, 91, 5, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(116, 91, 7, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(140, 91, 5, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));

    drawRectangle(117, 60, 2, 4, 0x7FFF);
    drawRectangle(119, 60, 2, 4, 0);
    drawRectangle(117, 64, 4, 2, 0);
    drawRectangle(117, 66, 4, 4, (((5) & 31) | (((16) & 31) << 5) | (((28) & 31) << 10)));
    drawRectangle(127, 60, 2, 4, 0x7FFF);
    drawRectangle(129, 60, 2, 4, 0);
    drawRectangle(127, 64, 4, 2, 0);
    drawRectangle(127, 66, 4, 4, (((5) & 31) | (((16) & 31) << 5) | (((28) & 31) << 10)));
    drawRectangle(122, 72, 5, 2, 0);
    drawRectangle(113, 70, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
    drawRectangle(131, 70, 4, 2, (((24) & 31) | (((4) & 31) << 5) | (((10) & 31) << 10)));
}
