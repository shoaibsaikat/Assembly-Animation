.MODEL SMALL
.STACK 100H

DRAW_DIAGONAL MACRO X, Y
    LOCAL WHILE, EXIT
    MOV AH, 0CH
    MOV AL, 11
    MOV CX, Y
    MOV DX, X
    WHILE:
        INT 10H
        CMP CX, 559
        JE EXIT
        INC CX
        INC DX
        JMP WHILE
    EXIT:
ENDM

DRAW_DIAGONAL2 MACRO X, Y
    LOCAL WHILE, EXIT
    MOV AH, 0CH
    MOV AL, 11
    MOV CX, Y
    MOV DX, X
    WHILE:
        INT 10H
        CMP DX, 0
        JE EXIT
        INC CX
        DEC DX
        JMP WHILE
    EXIT:
ENDM

DRAW_ROW_BORDER MACRO X, Y
    LOCAL WHILE, EXIT
    MOV AH, 0CH
    MOV AL, 11
    MOV CX, Y
    MOV DX, X
    WHILE:
        INT 10H
        CMP CX, 559
        JE EXIT
        INC CX
        JMP WHILE
    EXIT:
ENDM

DRAW_COLUMN_BORDER MACRO X, Y
    LOCAL WHILE, EXIT
    MOV AH, 0CH
    MOV AL, 11
    MOV CX, Y
    MOV DX, X
    WHILE:
        INT 10H
        CMP DX, 479
        JE EXIT
        INC DX
        JMP WHILE
    EXIT:
ENDM

INIT MACRO
    MOV AX,CS
    MOV DS,AX
    MOV ES,AX
ENDM

MOVW MACRO X, Y
    PUSH AX
    MOV AX, Y
    MOV X, AX
    POP AX
ENDM

CMPW MACRO X, Y
    PUSH AX
    MOV AX, X
    CMP AX, Y
    POP AX
ENDM

ADDW MACRO X, Y
    PUSH AX
    MOV AX, Y
    ADD X, AX
    POP AX
ENDM

SUBW MACRO X, Y
    PUSH AX
    MOV AX, Y
    SUB X, AX
    POP AX
ENDM

XCNGW MACRO X, Y
    PUSH AX
    MOV AX, X
    MOVW X, Y
    MOV Y, AX
    POP AX
ENDM

SETPIXEL MACRO
    MOV AH, 0CH
    INT 10H
ENDM

INCR MACRO X
    LOCAL L
    PUSH AX
    INC X
    MOV AX, X
    CMP AX, 20
    JNE L
    MOV X, 0
    L:
    POP AX
ENDM

.DATA
FX DW ?
FY DW ?
TEMP DW ?

COL DB ?
ERR DW ?
RAD DW ?
X DW ?
Y DW ?
C_X DW ?
C_Y DW ?
CONST DW 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 0
    MOV AL, 12H
    INT 10H
    
    CALL SET_RECT
    
    TAG:
        MOV COL, 4
    
        ;;;1
        MOV C_Y, 220
        MOV C_X, 150
        MOVW RAD, CONST
        CALL CIRCLE
    
        MOV C_Y, 220
        MOV C_X, 170
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;;
        MOV C_Y, 260
        MOV C_X, 150
        MOVW RAD, CONST
        CALL CIRCLE
    
        MOV C_Y, 260
        MOV C_X, 170
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;1
        ;;;2
        MOV C_Y, 60
        MOV C_X, 310
        MOVW RAD, CONST
        CALL CIRCLE
   
        MOV C_Y, 60
        MOV C_X, 330
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;;
        MOV C_Y, 100
        MOV C_X, 310
        MOVW RAD, CONST
        CALL CIRCLE
   
        MOV C_Y, 100
        MOV C_X, 330
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;2
        ;;;3
        MOV C_Y, 220
        MOV C_X, 470
        MOVW RAD, CONST
        CALL CIRCLE
    
        MOV C_Y, 220
        MOV C_X, 490
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;;
        MOV C_Y, 260
        MOV C_X, 470
        MOVW RAD, CONST
        CALL CIRCLE
    
        MOV C_Y, 260
        MOV C_X, 490
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;3
        ;;;4
        MOV C_Y, 380
        MOV C_X, 310
        MOVW RAD, CONST
        CALL CIRCLE
 
        MOV C_Y, 380
        MOV C_X, 330
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;;
        MOV C_Y, 420
        MOV C_X, 310
        MOVW RAD, CONST
        CALL CIRCLE
 
        MOV C_Y, 420
        MOV C_X, 330
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;4
        
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
        MOV COL, 0
    
        ;;;1
        MOV C_Y, 220
        MOV C_X, 150
        MOVW RAD, CONST
        CALL CIRCLE
    
        MOV C_Y, 220
        MOV C_X, 170
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;;
        MOV C_Y, 260
        MOV C_X, 150
        MOVW RAD, CONST
        CALL CIRCLE
    
        MOV C_Y, 260
        MOV C_X, 170
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;1
        ;;;2
        MOV C_Y, 60
        MOV C_X, 310
        MOVW RAD, CONST
        CALL CIRCLE
   
        MOV C_Y, 60
        MOV C_X, 330
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;;
        MOV C_Y, 100
        MOV C_X, 310
        MOVW RAD, CONST
        CALL CIRCLE
   
        MOV C_Y, 100
        MOV C_X, 330
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;2
        ;;;3
        MOV C_Y, 220
        MOV C_X, 470
        MOVW RAD, CONST
        CALL CIRCLE
    
        MOV C_Y, 220
        MOV C_X, 490
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;;
        MOV C_Y, 260
        MOV C_X, 470
        MOVW RAD, CONST
        CALL CIRCLE
    
        MOV C_Y, 260
        MOV C_X, 490
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;3
        ;;;4
        MOV C_Y, 380
        MOV C_X, 310
        MOVW RAD, CONST
        CALL CIRCLE
 
        MOV C_Y, 380
        MOV C_X, 330
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;;
        MOV C_Y, 420
        MOV C_X, 310
        MOVW RAD, CONST
        CALL CIRCLE
 
        MOV C_Y, 420
        MOV C_X, 330
        MOVW RAD, CONST
        CALL CIRCLE
        ;;;4
        
        INCR CONST
        
        JMP TAG

    MOV AH, 4CH
    INT 21H
MAIN ENDP

CIRCLE PROC
    PUSHA
    ;INIT
    
    MOVW ERR, RAD
    NEG ERR
    MOVW X, RAD
    MOV Y, 0
    
    CMPW X, Y
    JL EXIT1
    
    WHILE1:
        CALL PLOT8POINTS
        ADDW ERR, Y
        INC Y
        ADDW ERR, Y
        
        CMP ERR, 0
        JL JMP_WHILE1
        DEC X
        SUBW ERR, X
        SUBW ERR, X
        JMP_WHILE1:
            CMPW X, Y
            JL EXIT1
            JMP WHILE1
     EXIT1:
        POPA
        RET  
CIRCLE ENDP

PLOT8POINTS PROC
    PUSHA
    ;INIT
    
    CALL PLOT4POINTS
    CMPW X, Y
    JE EXIT2
    XCNGW X, Y
    CALL PLOT4POINTS
    XCNGW X, Y
    EXIT2:
        POPA
        RET
PLOT8POINTS ENDP

PLOT4POINTS PROC
    PUSHA
    ;INIT
    
    MOV CX, C_X
    ADD CX, X
    MOV DX, C_Y
    ADD DX, Y
    
    MOV AL, COL
    SETPIXEL
    
    CMP X, 0
    JE IF2
    MOV CX, C_X
    SUB CX, X
    MOV DX, C_Y
    ADD DX, Y
    
    MOV AL, COL
    SETPIXEL
    
    IF2:       
        CMP Y, 0
        JE EXIT3
        MOV CX, C_X
        ADD CX, X
        MOV DX, C_Y
        SUB DX, Y
        
        MOV AL, COL
        SETPIXEL
        CMP X, 0
        JE EXIT3
        
        MOV CX, C_X
        SUB CX, X
        MOV DX, C_Y
        SUB DX, Y
        
        MOV AL, COL
        SETPIXEL
    EXIT3:
        POPA
        RET
PLOT4POINTS ENDP

SET_RECT PROC
    PUSHA
    ;INIT
    
    DRAW_DIAGONAL 1, 80
    DRAW_DIAGONAL2 479, 80
    
    DRAW_ROW_BORDER 0, 80
    DRAW_ROW_BORDER 479, 80
    DRAW_COLUMN_BORDER 1, 80
    DRAW_COLUMN_BORDER 1, 559
    
    MOV FX, 180
    MOV FY, 100
    CALL DRAW_RECTANGLE
    
    MOV FX, 20
    MOV FY, 260
    CALL DRAW_RECTANGLE
    
    MOV FX, 180
    MOV FY, 420
    CALL DRAW_RECTANGLE
    
    MOV FX, 340
    MOV FY, 260
    CALL DRAW_RECTANGLE
    
    POPA
    RET
SET_RECT ENDP

DRAW_RECTANGLE PROC
    PUSHA
    ;INIT
    
    MOV AH, 0CH
    MOV AL, 14
    MOV DX, FX
    MOV CX, FY
    
    MOV TEMP, CX
    ADD TEMP, 120
    LOOP1:
        INT 10H
        CMP CX, TEMP
        JE THEN1
        INC CX
        JMP LOOP1
        
    THEN1:
        MOV CX, FY      ;BECAUSE ITS VALUE IS CHANGED
        MOV TEMP, DX
        ADD TEMP, 120
        LOOP2:
            INT 10H
            CMP DX, TEMP
            JE THEN2
            INC DX
            JMP LOOP2
    THEN2:
        MOV TEMP, CX
        ADD TEMP, 120
        LOOP3:
            INT 10H
            CMP CX, TEMP
            JE THEN3
            INC CX
            JMP LOOP3
    THEN3:
        MOV TEMP, DX
        SUB TEMP, 120
        LOOP4:
            INT 10H
            CMP DX, TEMP
            JE EXIT
            DEC DX
            JMP LOOP4
            
    EXIT:
        POPA
        RET               
DRAW_RECTANGLE ENDP

END MAIN
