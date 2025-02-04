# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 3 "main.c" 2


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
    buttons = (*(volatile unsigned short *)0x04000130);

    updateGame();
    waitForVBlank();
    drawGame();
    }

    return 0;

}

void initialize() {
    mgba_open();
    (*(volatile unsigned short *) 0x04000000) = ((3) & 7) | (1 << (8 + (2 & 15)));

    oldButtons = 0;
    buttons = (*(volatile unsigned short *)0x04000130);
}



void updateGame() {
    if ((!(~(oldButtons) & ((1 << 0))) && (~(buttons) & ((1 << 0))))) {
        mgba_printf("button A is pressed");
        if (imageFrame < 4) {
            imageFrame++;
        } else {
            imageFrame = 0;
        }
    }
    if ((!(~(oldButtons) & ((1 << 1))) && (~(buttons) & ((1 << 1))))) {
        mgba_printf("button B is pressed");
        if (imageFrame > 0) {
            imageFrame--;
        } else {
            imageFrame = 4;
        }
    }
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        mgba_printf("button start is pressed");
        if (loop == 0) {
            loop = 1;
        } else {
            loop = 0;
        }
    }
    if ((!(~(oldButtons) & ((1 << 2))) && (~(buttons) & ((1 << 2))))) {
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
    if ((!(~(oldButtons) & ((1 << 5))) && (~(buttons) & ((1 << 5))))) {
        mgba_printf("button left is pressed");
        imageFrame = 0;
    }
    if ((!(~(oldButtons) & ((1 << 4))) && (~(buttons) & ((1 << 4))))) {
        mgba_printf("button right is pressed");
        imageFrame = 4;
    }


    if ((!(~(oldButtons) & ((1 << 6))) && (~(buttons) & ((1 << 6))))) {
        mgba_printf("button up is pressed");
        if (speedLevel > 0) {
            speedLevel--;
            frameRate = frameRates[speedLevel];
            mgba_printf("frame rate went to %d", frameRates[speedLevel]);
        }
    }

    if ((!(~(oldButtons) & ((1 << 7))) && (~(buttons) & ((1 << 7))))) {
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
# 145 "main.c"
void drawGame() {
    fillScreen((((31) & 31) | (((16) & 31) << 5) | (((20) & 31) << 10)));

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
    } else if(imageFrame == 4) {
        drawFrame5();
        mgba_printf("frame5");
    }
}
