;===========
;autor,
;fecha,
;descripción
;============
    list p=16F84a
#include "p16f84a.inc"
    __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _CP_OFF
    ;setting delay counter
    ctr equ 0x20
    org 0
    goto init
    org 5
init bsf STATUS,RP0
    bcf TRISB,0
    bsf TRISA,0
    bcf STATUS,RP0
    goto start
delay_20 movlw D'5'
    movwf ctr
del20 decfsz ctr
    goto del20
    return   
start btfsc PORTA,0
    bsf PORTB,0
    call delay_20
    goto start
    END