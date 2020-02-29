;============================
;autor
;fecha
;descripcion
;============================
    
    list p=16f84a
    #include "p16f84a.inc"
    __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _CP_OFF
    org 0
    goto init
    org 5
    
;subrutina de comparacion
;Pregunta para el lector, que pasa si Puerto A vale mas de 2?
compara addwf PCL,F ;agrega W y PCL y lo asigna a PCL
 nop;caso w=0
 nop;caso w=1
 retlw b'0001';caso w=2 regresa a bloque inicial de codigo con constante en w
 
init nop
    goto start
    
;Comparando el puerto A
start movfw PORTA
    call compara
    goto start
    END
 
