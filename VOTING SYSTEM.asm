org 100h
include "emu8086.inc"
JMP start   
message0  db "WELCOME TO THE NATIONAL GENERAL ELECTIONS!! $" 
message01  db "KUMBUKA!! KURA YAKO SIRI YAKO!!! $" 
message02  db "LET'S BEGIN!! $" 
message1 db "PRESIDENT KAMAU OR PRESIDENT LOSH: $"
message2 db "KAMAU    LOSH  $"
message3 db "GOVERNOR BANGE  OR GOVERNOR LOSHILU:  $" 
message4 db "BANGE    LOSHILU  $"  
message5 db "SENATOR ONYANGO  OR SENATOR KINUTHIA:  $" 
message6 db "ONYANGO    KINUTHIA  $"
message7 db "MP KAMAU  OR MP NDUNG'U:  $" 
message8 db "KAMAU    NDUNG'U  $"  
message9 db "PRESIDENTIAL RESULTS$"  
message10 db "GOVERNOR RESULTS$" 
message100 db "SENATOR RESULTS$"      
message11 db "HIGHEST IS KAMAU WITH :$"
message12 db "RUTO:$"
message13 db "HIGHEST IS LOSH WITH:$"
message14 db "KAMAU:$"
message15 db "HIGHEST IS BANGE WITH:$"
message16 db "LOSHILU:$"
message17 db "HIGHEST IS LOSHILU WITH:$"
message18 db "BANGE:$"
message19 db "HIGHEST IS ONYANGO WITH:$"
message20 db "KINUTHIA:$"
message21 db "HIGHEST IS KINUTHIA WITH:$"
message22 db "ONYANGO:$"  
finishmsg1 db "AS IEBC WE ENSURE TRANSPARENCY IN THE VOTING PROCESS $"  
finishmsg2 db  "THANK YOU FOR VOTING $"
pres1 dw "KAMAU"
gov1 dw  "BANGE"  
sen1 dw  "ONYANGO"
mp1  dw   "KAMAU"
buffer1 dw 100 dup (?)
buffer2 dw 100 dup (?)
buffer3 dw 100 dup (?)  
buffer4 dw 100 dup (?) 
perc db 100
total1   db 0
total2   db 0
total3    db 0
total4 db 0
count1 db 0
count2 db 0
count3 db 0
count4 db 0 
count5 db 0
count6 db 0
count7 db 0
count8 db 0
size1 =($ - x1) / 2
size2 =($ - x1) / 2 
size3 =($ - x1) / 2 
size4 =($ - x1) / 2   

start:
MOV  CX,6
 
BIGLOOP: 
;printn "Choose your preferred President"
PUSH CX ; Save the counter value



LEA DX, message0
MOV AH,9
INT 21H
         

call CLEAR_SCREEN

       

LEA DX, message01
MOV AH,9
INT 21H    
        
        
PUTC 10
PUTC 13                 
                
PUTC 10
PUTC 13         

 
LEA DX, message02
MOV AH,9
INT 21H
                               
call CLEAR_SCREEN                 
                 

LEA DX, message1
MOV AH,9
INT 21H        

               
LEA SI,pres1   ;just a defined variable(offset )
LEA DI,buffer1  ;just a defined variable(offset ) to hold string
                
MOV AH,1 


READPRES: 
INT 21H
CMP AL,0DH
JE ENDOFPREZO
STOSB
JMP READPRES

ENDOFPREZO:
MOV AL, "$" 
STOSB
        
        
       
PUTC 10
PUTC 13
PUTC 10
PUTC 13

 
LEA DX, message2
MOV AH,9
INT 21H
      
MOV CX,size1
XOR BX,BX  
MOV DX,0

PREZO1:  
MOV   DX,[buffer1+BX]
CMP   DX,[SI]
JNZ   PREZO2    
INC  count1 
JMP EXIT1
 
 
PREZO2:
INC count2
JMP EXIT2

EXIT1: 
GOTOXY 1,4
MOV AH,2
MOV DL, count1 
ADD DL,30H      
INT 21H
                              

GOTOXY 14,4 
MOV AH,2
MOV DL, count2 
ADD DL,30H
INT 21H

PUTC 10
PUTC 13 
        
PUTC 10
PUTC 13        
        
MOV AX,0
MOV AL, count1
ADD AL,count2
MOV total1,AL
XOR AX,AX
MOV AL,count1
MUL perc
DIV total1 
GOTOXY 1,5 
call print_num
GOTOXY 4,5
print "%"






MOV AX,0
MOV AL, count1
ADD AL,count2
MOV total1,AL
XOR AX,AX
MOV AL,count2
MUL perc
DIV total1
GOTOXY 14,5    
call print_num
GOTOXY 15,5
print "%"

JMP GOVERNOR    
       
EXIT2:  
GOTOXY 1,4
MOV AH,2
MOV DL, count1 
ADD DL,30H
INT 21H 
 
GOTOXY 14,4
MOV AH,2 
MOV DL, count2
ADD DL,30H
INT 21H 

PUTC 10
PUTC 13  

PUTC 10
PUTC 13

MOV AX,0
MOV AL, count1
ADD AL,count2
MOV total1,AL
XOR AX,AX
MOV AL,count1 
MUL perc
DIV total1
  
GOTOXY 1,5 
call print_num
GOTOXY 4,5
print "%"


MOV AX,0
MOV AL, count1
ADD AL,count2
MOV total1,AL
XOR AX,AX
MOV AL,count2
MUL perc
DIV total1
GOTOXY 14,5
call print_num

GOTOXY 17,5 
print "%"

JMP GOVERNOR      


   
GOVERNOR: 
PUTC 10
PUTC 13
        

call CLEAR_SCREEN
        
LEA DX, message3
MOV AH,9
INT 21H        

MOV SI, 0
LEA SI,gov1

MOV DI, 0
LEA DI,buffer2

MOV AH,1 


READGOV: 
INT 21H
CMP AL,0DH
JE ENDOFGOV
STOSB
JMP READGOV

ENDOFGOV:
MOV AL, "$" 
STOSB


PUTC 10
PUTC 13

PUTC 10
PUTC 13

LEA DX, message4
MOV AH,9
INT 21H

XOR CX,CX      
MOV CX,size2
XOR BX,BX 
MOV DX,0

GOVERNOR1:  
MOV   DX,[buffer2+BX]
CMP   DX,[SI]
JNZ   GOVERNOR2   
INC  count3
JMP EXIT3   

GOVERNOR2:
INC count4
JMP EXIT4


EXIT3: 
GOTOXY 1,4
MOV AH,2
MOV DL, count3 
ADD DL,30H
INT 21H 


GOTOXY 14,4
MOV AH,2 
MOV DL, count4
ADD DL,30H
INT 21H 


MOV AX,0
MOV AL, count3
ADD AL,count4
MOV total2,AL
XOR AX,AX
MOV AL,count3
MUL perc
DIV total2
  
GOTOXY 1,5
call print_num 
GOTOXY 4,5
print "%"
 



MOV AX,0
MOV AL, count3
ADD AL,count4
MOV total2,AL
XOR AX,AX
MOV AL,count4
MUL perc
DIV total2
  
GOTOXY 14,5
call print_num
GOTOXY 15,5
print "%"
 
JMP SENATOR

EXIT4: 
GOTOXY 1,4
MOV AH,2
MOV DL, count3 
ADD DL,30H
INT 21H
  
GOTOXY 14,4
MOV AH,2 
MOV DL, count4
ADD DL,30H
INT 21H 


MOV AX,0
MOV AL, count3
ADD AL,count4
MOV total2,AL
XOR AX,AX
MOV AL,count3 
MUL perc
DIV total2
  
GOTOXY 1,5
call print_num
GOTOXY 4,5
print "%"

 
 
MOV AX,0
MOV AL, count3
ADD AL,count4
MOV total2,AL
XOR AX,AX
MOV AL,count4
MUL perc
DIV total2
  
GOTOXY 14,5
call print_num
GOTOXY 17,5
print "%"
JMP SENATOR
   
SENATOR: 
        

call CLEAR_SCREEN
        
LEA DX, message5
MOV AH,9
INT 21H        

MOV SI, 0
LEA SI,sen1

MOV DI, 0
LEA DI,buffer3

MOV AH,1 


READSEN: 
INT 21H
CMP AL,0DH
JE ENDOFSEN
STOSB
JMP READSEN

ENDOFSEN:
MOV AL, "$" 
STOSB


PUTC 10
PUTC 13

PUTC 10
PUTC 13

LEA DX, message6
MOV AH,9
INT 21H

XOR CX,CX      
MOV CX,size3
XOR BX,BX 
MOV DX,0

SENATOR1:  
MOV   DX,[buffer3+BX]
CMP   DX,[SI]
JNZ   SENATOR2   
INC  count5
JMP EXIT5   

SENATOR2:
INC count6
JMP EXIT6


EXIT5: 
GOTOXY 1,4
MOV AH,2
MOV DL, count5 
ADD DL,30H
INT 21H 


GOTOXY 14,4
MOV AH,2 
MOV DL, count6
ADD DL,30H
INT 21H 
 


MOV AX,0
MOV AL, count5
ADD AL,count6
MOV total3,AL
XOR AX,AX
MOV AL,count5
MUL perc
DIV total3

PUTC 10
PUTC 13  
GOTOXY 1,5
call print_num
GOTOXY 4,5
print "%"




MOV AX,0
MOV AL, count5
ADD AL,count6
MOV total3,AL
XOR AX,AX
MOV AL,count6
MUL perc
DIV total3
 
PUTC 10
PUTC 13 
GOTOXY 14,5
call print_num 
GOTOXY 15,5
print "%"
JMP FINISH 

EXIT6: 
GOTOXY 1,4
MOV AH,2
MOV DL, count5 
ADD DL,30H
INT 21H
  
GOTOXY 14,4
MOV AH,2 
MOV DL, count6
ADD DL,30H
INT 21H 

                    

MOV AX,0
MOV AL, count5
ADD AL,count6
MOV total3,AL
XOR AX,AX
MOV AL,count5
MUL perc
DIV total3

PUTC 10
PUTC 13  
GOTOXY 1,5
call print_num
GOTOXY 4,5
print "%"
 
 
MOV AX,0
MOV AL, count5
ADD AL,count6
MOV total3,AL
XOR AX,AX
MOV AL,count6
MUL perc
DIV total3
  
GOTOXY 14,5
call print_num
GOTOXY 17,5
print "%"
JMP FINISH 


          
FINISH:
call CLEAR_SCREEN 




PRESRES:  

LEA DX, message9
MOV AH,9
INT 21H

XOR DX,DX
XOR BX,BX
MOV DL, count1
MOV BL,count2
CMP DL, BL
JG PRINTPRES1
JE PRINTPRESEQ
JMP PRINTPRES2

PRINTPRES1:
PUTC 10
PUTC 13

PUTC 10
PUTC 13

LEA DX, message11
MOV AH,9
INT 21H

  

MOV AH,2
MOV DL, count1 
ADD DL,30H      
INT 21H 
 
         
PUTC 32

print "VOTES!!!"  

PUTC 10
PUTC 13

PUTC 10
PUTC 13
           
LEA DX, message12
MOV AH,9
INT 21H
 
           

MOV AH,2
MOV DL, count2 
ADD DL,30H      
INT 21H            
 
PUTC 32

print "VOTES!!!" 

JMP GOVRES
           
PRINTPRES2:

PUTC 10
PUTC 13
 
PUTC 10
PUTC 13 

LEA DX, message13
MOV AH,9
INT 21H
 

MOV AH,2
MOV DL, count2 
ADD DL,30H      
INT 21H 
         
PUTC 32

print "VOTES!!!"      


PUTC 10
PUTC 13

PUTC 10
PUTC 13

LEA DX, message14
MOV AH,9
INT 21H
 

MOV AH,2
MOV DL, count1 
ADD DL,30H      
INT 21H 
 
         
PUTC 32

print "VOTES!!!"

JMP GOVRES

 
PRINTPRESEQ:  
PUTC 10
PUTC 13
PUTC 10
PUTC 13  
print "KAMAU WITH:"
MOV DL,count1
ADD DL,30H
MOV AH,2
INT 21H 
        
PUTC 10
PUTC 13  
print "RUTO WITH:"
MOV DL,count2
ADD DL,30H
MOV AH,2
INT 21H   

PUTC 10
PUTC 13      
        
print "THEY HAVE EQUAL VOTES!!!"     

JMP GOVRES        

GOVRES:  
call CLEAR_SCREEN

LEA DX, message10
MOV AH,9
INT 21H

XOR DX,DX
XOR BX,BX
MOV DL, count3
MOV BL,count4
CMP DL, BL
JG PRINTGOV1
JE PRINTGOVEQ
JMP PRINTGOV2

PRINTGOV1:
PUTC 10
PUTC 13

PUTC 10
PUTC 13

LEA DX, message15
MOV AH,9
INT 21H

  

MOV AH,2
MOV DL, count3 
ADD DL,30H      
INT 21H 
 
         
PUTC 32

print "VOTES!!!"  

PUTC 10
PUTC 13

PUTC 10
PUTC 13
           
LEA DX, message16
MOV AH,9
INT 21H
 
           

MOV AH,2
MOV DL, count4
ADD DL,30H      
INT 21H            
 
PUTC 32

print "VOTES!!!" 

JMP SENRES
           
PRINTGOV2:

PUTC 10
PUTC 13
 
PUTC 10
PUTC 13 

LEA DX, message17
MOV AH,9
INT 21H
 

MOV AH,2
MOV DL, count4 
ADD DL,30H      
INT 21H 
         
PUTC 32

print "VOTES!!!"      


PUTC 10
PUTC 13

PUTC 10
PUTC 13

LEA DX, message18
MOV AH,9
INT 21H
 

MOV AH,2
MOV DL, count3 
ADD DL,30H      
INT 21H 
 
         
PUTC 32

print "VOTES!!!"

JMP SENRES

PRINTGOVEQ: 
PUTC 10
PUTC 13
PUTC 10
PUTC 13  
print "BANGE WITH:"
MOV DL,count3
ADD DL,30H
MOV AH,2
INT 21H 
        
PUTC 10
PUTC 13  
print "LOSHILU WITH:"
MOV DL,count4
ADD DL,30H
MOV AH,2
INT 21H         

PUTC 10
PUTC 13       
print "THEY HAVE EQUAL VOTES!!!"             
 
JMP SENRES 


SENRES:  
call CLEAR_SCREEN

LEA DX, message100
MOV AH,9
INT 21H

XOR DX,DX
XOR BX,BX
MOV DL, count5
MOV BL,count6
CMP DL, BL
JG PRINTSEN1
JE PRINTSENEQ
JMP PRINTSEN2

PRINTSEN1:
PUTC 10
PUTC 13

PUTC 10
PUTC 13

LEA DX, message19
MOV AH,9
INT 21H

  

MOV AH,2
MOV DL, count5 
ADD DL,30H      
INT 21H 
 
         
PUTC 32

print "VOTES!!!"  

PUTC 10
PUTC 13

PUTC 10
PUTC 13
           
LEA DX, message20
MOV AH,9
INT 21H
 
           

MOV AH,2
MOV DL, count6
ADD DL,30H      
INT 21H            
 
PUTC 32

print "VOTES!!!" 

JMP FINISH2
           
PRINTSEN2:

PUTC 10
PUTC 13
 
PUTC 10
PUTC 13 

LEA DX, message21
MOV AH,9
INT 21H
 

MOV AH,2
MOV DL, count6 
ADD DL,30H      
INT 21H 
         
PUTC 32

print "VOTES!!!"      


PUTC 10
PUTC 13

PUTC 10
PUTC 13

LEA DX, message22
MOV AH,9
INT 21H
 

MOV AH,2
MOV DL, count5 
ADD DL,30H      
INT 21H 
 
         
PUTC 32

print "VOTES!!!"

JMP FINISH2


PRINTSENEQ:
PUTC 10
PUTC 13
PUTC 10
PUTC 13  
print "ONYANGO WITH:"
MOV DL,count5
ADD DL,30H
MOV AH,2
INT 21H 
        
PUTC 10
PUTC 13  
print "KINUYTHIA WITH:"
MOV DL,count6
ADD DL,30H
MOV AH,2
INT 21H         
            
PUTC 10
PUTC 13            
print "THEY HAVE EQUAL VOTES!!!" 

JMP FINISH2   

FINISH2:
 
call CLEAR_SCREEN 
         
LEA DX, finishmsg1
MOV AH,9
INT 21H   
  
 
 
PUTC 10
PUTC 13   

PUTC 10
PUTC 13

LEA DX, finishmsg2
MOV AH,9
INT 21H                    
                 
XOR CX,CX 
POP CX     

call CLEAR_SCREEN   
LOOP BIGLOOP   

DEFINE_CLEAR_SCREEN 
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS                                       
