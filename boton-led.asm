;===========
;autor,
;fecha,
;descripción
;============
    list p=16F84a
#include "p16f84a.inc"
    __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _CP_OFF
    org 0
    goto init
    org 5
init bsf STATUS,RP0
    bcf TRISB,0
    bsf TRISA,0
    bcf STATUS,RP0
    goto start
start btfsc PORTA,0
    bsf PORTB,0
    goto start
    END