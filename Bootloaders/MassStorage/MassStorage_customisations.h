/* This is a customised file for LUFA boot loaders 
The application is private and specific to my projects. 
Since the code is THIS file is practicually useless for anything else: The code in THIS file is open for public use all. Anything that anyone does this this code is strictly and exclusivly their responsibility. Dont call me if you kitchen catches fire. */

#ifndef _MASS_STORAGE_CUSTOMISATION_H_ 
#define _MASS_STORAGE_CUSTOMISATION_H_

#define CUSTOMISATION_ENABLED
#ifdef CUSTOMISATION_ENABLED
#include <avr/io.h>

#define LED_INIT DDRD|=(1<<PD5);
#define LED_ON PORTD|=(1<<PD5);
#define LED_OFF PORTD&=~(1<<PD5);
#define LED_TOGGLE PORTD^=(1<<PD5);

/*
 * Detection needs to be high-low-high states for 3 buttons + TXEN (4 pins)
 * as of V6.2 pins are PD4,6,7 and PC6
 */

// Take pins 4,6,7 on portD and pin 6 on portC (but put it into position 5)
#define PORTD_MASK (0b11010000)
#define BUTTON_MASK (PIND & PORTD_MASK | ( (PINC & (1<<PC6)) >> 1))
//#define BUTTON_MASK (PIND&(1<<PD6))
#define MIN_PRESS_TIMER 10000

#define INIT_VARS uint8_t prev_mask = BUTTON_MASK; uint8_t new_mask = prev_mask; uint16_t button_timer = 0;

//#define PREPARE_OUPUT_PORTS DDRF=0xff; PORTF=0xff
#define DISABLE_ALL_BOARDS PORTF=0xff; /*boards are already input by defauls, this enables pullsup to ensure high state */
#define PREPARE_BUTTONS DDRD&=~PORTD_MASK; PORTD|=PORTD_MASK; DDRC&=~(1<<PC6); PORTC|=(1<<PC6); MCUCR&=~(1<<PUD);

#define EXIT_ON_BUTTON_CHECK \
	new_mask = BUTTON_MASK; \
	if (button_timer<MIN_PRESS_TIMER) {button_timer++;} \
	if ((button_timer>=MIN_PRESS_TIMER) && (new_mask<prev_mask)) {button_timer = 0; LED_ON;} \
	if ((button_timer>=MIN_PRESS_TIMER) && (new_mask>prev_mask)) {RunBootloader = false; LED_OFF;} \
	prev_mask = new_mask;

	//if (new_mask) {;} else {LED_TOGGLE;}


//#define CUSTOMISATION_BEFORE_MAIN ;
#define CUSTOMISATION_ON_START DISABLE_ALL_BOARDS;PREPARE_BUTTONS; INIT_VARS; LED_INIT;
#define CUSTOMISATION_IN_MAIN_LOOP EXIT_ON_BUTTON_CHECK;

#else
#define CUSTOMISATION_ON_START 
#define CUSTOMISATION_IN_MAIN_LOOP 
#endif

#endif //_MASS_STORAGE_CUSTOMISATION_H_ 
