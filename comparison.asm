;===========
;autor,
;fecha,
;descripción
;============
    list p=16F84a
#include "p16f84a.inc"
    __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _CP_OFF
;setting delay counter
temp1 equ 0x20 ;RAM address
temp2 equ 0x21
temp3 equ 0x22
temp4 equ 0x23
    org 0
    goto init
    org 5
    
; Lo que quiero comparar contra el puerto B
init movlw b'0000'
    movwf temp1 
    movlw b'0001'
    movwf temp2
    movlw b'0010'
    movwf temp3
    movlw b'0011'
    movwf temp4 
    bsf STATUS,RP0
    bcf TRISA,0
    bcf TRISA,1
    ;entradas
    bsf TRISB,0
    bsf TRISB,1
    bcf STATUS,RP0
    goto start  

; Lo que quiero hacer en la primer combinacion
op1 bcf PORTA,0
    bcf PORTA,1
    goto start
; Lo que quiero hacer en la segunda combinacion
op2 bsf PORTA,0
    bcf PORTA,1
    goto start 
; Lo que quiero hacer en la tercera combinacion
op3 bcf PORTA,0
    bsf PORTA,1
    goto start
; Lo que quiero hacer en la cuarta combinacion
op4 bsf PORTA,0
    bsf PORTA,1
    goto start
; Cuarta comparacion
comp4 movf temp4,w
    subwf PORTB,w 
    btfss STATUS,Z
    goto start
    goto op4   
; Tercera comparacion  
comp3 movf temp3,w
    subwf PORTB,w 
    btfss STATUS,Z
    goto comp4
    goto op3
; Segunda comparacion
comp2 movf temp2,w
    subwf PORTB,w 
    btfss STATUS,Z
    goto comp3
    goto op2
    
start movf temp1,w
    subwf PORTB,w ;subtract temp2 from temp subwf Y,W if W==y Z=1
    btfss STATUS,Z
    goto comp2
    goto op1
    END