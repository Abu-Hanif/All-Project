.MODEL SMALL
.STACK 100H
.DATA

M0 DB "PROJECT ON CALCULATOR $"
M1 DB "FOR ADDITION. TYPE:'1'$"
M2 DB "FOR SUBTRACTION. TYPE:'2'$"
M3 DB "FOR MULTIPLICATION. TYPE:'3'$"
M4 DB "FOR DIVISION. TYPE :'4'$"
M5 DB "ENTER TWO NUMBER FOR ADDITION :$"
M6 DB "ENTER TWO NUMBER FOR SUBTRACTION :$"
M7 DB "ENTER TWO NUMBER FOR MULTIPLICATION:$"
M8 DB "ENTER TWO NUMBER FOR DIVISION :$"
M9 DB "CHOOSE AN OPTION :$"
M10 DB "DECIMAL RESULT IS :$"
M11 DB "*** THANK YOU***$"
M12 DB "PLEASE ENTER AN VALID OPTION:$"
M13 DB "BINARY RESULT IS :$"
M14 DB "HEXADECIMAL RESULT  IS :$"
M15 DB "REMINDER IS :$"
M16 DB "FOR ANOTHER CALCULATION TYPE :'1'$"
M17 DB "TO EXIT TYPE :'2'$"
M18 DB "INVALID INPUT :$"

.CODE 
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,M0
    MOV AH,9
    INT 21H
    
    START:
    CALL NL
    CALL NL
     LEA DX,M1
     MOV AH,9
     INT 21H
      CALL NL 
      
      LEA DX,M2
     MOV AH,9
     INT 21H 
     
     CALL NL
     
     LEA DX,M3
     MOV AH,9
     INT 21H  
     CALL NL
     
     LEA DX,M4
     MOV AH,9
     INT 21H  
      CALL NL
      CALL NL
      
      LEA DX,M9
     MOV AH,9
     INT 21H   
     
     CALC:
     
     MOV AH,1
     INT 21H
     MOV BL,AL
     
     CALL NL
     CALL NL
     
     CMP BL,'1'
     JE ADDD
      
      CMP BL,'2'
      
      JE SUBB
      
      
      CMP BL,'3'
      JE MULL
      
      CMP BL,'4'
      JE DIVV
      
      LEA DX,M12
     MOV AH,9
     INT 21H 
     JMP CALC
     
     ADDD:
     LEA DX,M5
     MOV AH,9
     INT 21H 
     
     MOV AH,1
     INT 21H
     MOV BL,AL
     
     MOV AH,2
     MOV DL,'+'
     INT 21H
     
     MOV AH,1
     INT 21H
     MOV CL,AL
     
     ADD BL,CL
     MOV BH,BL
     SUB BL,48
     CMP BL,'9'
     JG I
     
     CALL NL
     CALL NL
     CALL DR
     
     MOV AH,2
     MOV DL,BL
     INT 21H
     CALL NL
     CALL HR
     
     CALL NL
     CALL BR
     
     CALL NL 
     CALL NL
     
     LEA DX,M16
     MOV AH,9
     INT 21H 
     CALL NL
     
     LEA DX,M17
     MOV AH,9
     INT 21H    
     CALL NL
     
     LEA DX,M9
     MOV AH,9
     INT 21H  
     
     MOV AH,1
     INT 21H
     
     MOV BL,AL
     CMP BL,'1'
     JE START 
     CALL NL
     CALL NL
     CALL TNX
     JMP EXIT
     
     SUBB:
     
     LEA DX,M6
     MOV AH,9
     INT 21H  
     
     MOV AH,1
     INT 21H
     MOV BL,AL
     
     MOV AH,2
     MOV DL,'-'
     INT 21H
     
     MOV AH,1
     INT 21H
     MOV CL,AL
     CMP BL,CL
     JL J
     
     SUB BL,CL
     CMP BL,'9'
     JG J
     ADD BL,48
     
     CALL NL
     CALL NL
     CALL DR
     
     MOV AH,2
     MOV DL,BL
     INT 21H
      CALL NL
      CALL HR
      
      CALL NL
      CALL BR
      
      CALL NL
      CALL NL
      
      LEA DX,M16
     MOV AH,9
     INT 21H    
     CALL NL
     
     LEA DX,M17
     MOV AH,9
     INT 21H  
     CALL NL
     
     LEA DX,M9
     MOV AH,9
     INT 21H   
     
     MOV AH,1
     INT 21H
     
     MOV BL,AL
     CMP BL,'1'
     JE START 
     
     CALL NL
     CALL NL
     CALL TNX
     JMP EXIT
     
     MULL:
     
     LEA DX,M7
     MOV AH,9
     INT 21H 
     
     MOV AX,0
     MOV BX,0
     MOV CX,0
     MOV DX,0
     
     MOV AH,1
     INT 21H
     SUB AL,48
     MOV CL,AL
     MOV CH,0
     
     MOV AH,2
     MOV DL,'*'
     INT 21H
     
     MOV AH,1
     INT 21H
     SUB AL,48
     MOV BL,AL
     MOV BH,0
     
     MOV AX,CX
     
     MUL BX
     MOV CX,AX
     ADD CL,48
     CMP CL,'9'
     JG K
     
     CALL NL
     CALL NL
     CALL DR 
     
     MOV AH,2
     MOV DL,CL
     INT 21H
     MOV BL,CL
     CALL NL
     CALL HR
     
     CALL NL
     CALL BR
     CALL NL
     CALL NL
     
     LEA DX,M16
     MOV AH,9
     INT 21H 
     CALL NL
     
     LEA DX,M17
     MOV AH,9
     INT 21H  
     CALL NL
     
     LEA DX,M9
     MOV AH,9
     INT 21H  
     
     MOV AH,1
     INT 21H
     
     MOV BL,AL
     CMP BL,'1'
     JE START
     
     CALL NL
     CALL NL
     CALL TNX
     JMP EXIT
     
     DIVV:
     
     LEA DX,M8
     MOV AH,9
     INT 21H  
     
     MOV AX,0
     MOV BX,0
     MOV CX,0
     MOV DX,0
     
     MOV AH,1
     INT 21H
     SUB AL,48
     MOV CL,AL
     
     MOV AH,2
     MOV DL,'/'
     INT 21H
     
     MOV AH,1
     INT 21H
     
     SUB AL,48
     CMP AL,0
     JE L
     MOV BL,AL
     CMP CL,BL
     JL L
     
     MOV AX,CX
     DIV BL
     MOV CX,AX
     ADD CL,48
     
     CALL NL
     CALL NL
     CALL DR
     
     MOV AH,2
     MOV DL,CL
     INT 21H
     
     MOV BL,CL  
     
     LEA DX,M15
     MOV AH,9
     INT 21H 
     
     MOV CL,CH
     
     ADD CL,48
     MOV BH,CL
     MOV AH,2
     MOV DL,CL
     INT 21H
     
     CALL NL
     CALL HR
     
     LEA DX,M15
     MOV AH,9
     INT 21H 
     
     MOV AH,2
     MOV DL,'3'
     INT 21H
     MOV DL,BH
     INT 21H
     MOV DL,'H'
     INT 21H
     
     CALL NL
     CALL BR
     
     LEA DX,M15
     MOV AH,9
     INT 21H 
     
     ADD BL,BH
     CALL BR1
     CALL NL
     CALL NL
     
     LEA DX,M16
     MOV AH,9
     INT 21H 
     CALL NL
     
     LEA DX,M17
     MOV AH,9
     INT 21H  
     CALL NL
     
     LEA DX,M9
     MOV AH,9
     INT 21H  
     
     MOV AH,1
     INT 21H
     
     MOV BL,AL
     CMP BL,'1'
     JE START
     
     CALL NL
     CALL NL
     CALL TNX
     JMP EXIT
     
     NL:
     
     MOV AH,2 
     MOV DL,13
     INT 21H
     MOV DL,10
     INT 21H
     RET
     
     TNX:
     
     LEA DX,M11
     MOV AH,9
     INT 21H
     RET
     
     DR:
     
     LEA DX,M10
     MOV AH,9
     INT 21H 
     RET
     
     BR:
     
     LEA DX,M13
     MOV AH,9
     INT 21H   
     SUB BL,48
     MOV CX,8
     
     TOP:
     
     SHL BL,1
     JC ONE 
     
     MOV AH,2
     MOV DL,'0'
     INT 21H
     
     LOOP TOP 
     JMP NEXT
     
     ONE:
     MOV AH,2
     MOV DL,'1'
     INT 21H
     LOOP TOP 
     
     NEXT:
     
     RET
     
     HR:
     
     LEA DX,M14
     MOV AH,9
     INT 21H   
     
     MOV AH,2
     MOV DL,'3'
     INT 21H
     MOV DL,BL
     INT 21H
     MOV DL,'H'
     INT 21H
     RET
     
     BR1:
     SUB BL,48
     MOV CX,8
     
     TOP1:
     SHL BL,1
     JC ONE1
     
     MOV AH,2
     MOV DL,'0'
     INT 21H
     
     LOOP TOP1
     JMP NEXT1
     
     ONE1:
     MOV AH,2
     MOV DL,'1'
     INT 21H
     LOOP TOP1
     
     NEXT1:
     RET
     
     I:
     CALL NL
     CALL NL
     
     LEA DX,M18
     MOV AH,9
     INT 21H 
     CALL NL
     JMP ADDD
     
     J:
     CALL NL
     CALL NL
     
     LEA DX,M18
     MOV AH,9
     INT 21H 
     CALL NL
     JMP SUBB
     
     K:
     CALL NL
     CALL NL
     
     LEA DX,M18
     MOV AH,9
     INT 21H  
     CALL NL
     JMP MULL
     
     L:
     CALL NL 
     CALL NL
     
     LEA DX,M18
     MOV AH,9
     INT 21H   
     CALL NL
     JMP DIVV
     
     EXIT:
     MOV AH,4CH
     INT 21H
     
     MAIN ENDP
     
     END MAIN
     
     
     
     
      
     