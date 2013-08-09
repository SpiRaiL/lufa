/* This is a customised file for LUFA boot loaders 
The application is private and specific to my projects. 
Since the code is THIS file is practicually useless for anything else: The code in THIS file is open for public use all. Anything that anyone does this this code is strictly and exclusivly their responsibility. Dont call me if you kitchen catches fire. */

#ifndef _MASS_STORAGE_CUSTOMISATION_H_ 
#define _MASS_STORAGE_CUSTOMISATION_H_

#define CUSTOMISATION_ENABLED
#ifdef CUSTOMISATION_ENABLED
#include <avr/io.h>

#define PREPARE_OUPUT_PORTS DDRF=0xff; PORTF=0xff
#define DISABLE_ALL_BOARDS PORTF=0xff; /*boards are already input by defauls, this enables pullsup to ensure high state */
#define PREPARE_BUTTONS DDRD&=0b00011111; PORTD|=0b11100000; DDRC&=~(1<<PC6); PORTC|=(1<<PC6)

#define EXIT_ON_BUTTON_PRESS \
    if (((~PIND)&(0b11000000)) | ((~PINC)&(0b01000000)) ) { \
        RunBootloader = false; \
    }

//#define CUSTOMISATION_BEFORE_MAIN ;
#define CUSTOMISATION_ON_START DISABLE_ALL_BOARDS;PREPARE_BUTTONS; 
#define CUSTOMISATION_IN_MAIN_LOOP EXIT_ON_BUTTON_PRESS;

#else
#define CUSTOMISATION_ON_START 
#define CUSTOMISATION_IN_MAIN_LOOP 
#endif

#endif //_MASS_STORAGE_CUSTOMISATION_H_ 
