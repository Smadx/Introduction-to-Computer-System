            .ORIG       x3000
;
            LD          R0, NUM;R0<-N
            LD          R1, SCORE
            LD          R3, LIST
;
COPY        LDR         R2, R1, #0;R2 is the score to be copied
            STR         R2, R3, #0
            ADD         R1, R1, #1
            ADD         R3, R3, #1;R3 is the next copy destination address
            ADD         R0, R0, #-1
            BRp         COPY
;
            LD          R0, NUM
OUTER       ADD         R0, R0, #-1;N=N-1
            BRz         B
;       
            ADD         R4, R0, #0;R4<-N(inner counter)
;
            LD          R1, LIST;R1 is the pointer of score
            LDR         R2, R1, #0;R2 is the present score
;
INNER       ADD         R4, R4, #0;Judge whether the inner loop ends
            BRz         OUTER
;
            ADD         R3, R2, #0;R3 is the previous score
            ADD         R1, R1, #1
            LDR         R2, R1, #0;Load the new score
            ADD         R4, R4, #-1;Inner counter minus one
;
            NOT         R5, R3
            ADD         R5, R5, #1
            ADD         R5, R2, R5;R5<-R2-R3
            BRp         INNER
;
            ADD         R5, R2, #0;R5<-R2
            ADD         R2, R3, #0
            ADD         R3, R5, #0
            ADD         R5, R1, #-1;Load the address of the previous score into R5
            STR         R3, R5, #0
            STR         R2, R1, #0;Position of scores in memory before and after exchange
            BRnzp       INNER
;
B           LD          R1, LIST
            ADD         R1, R1, #15
            LD          R5, LINEB
            NOT         R5, R5
            ADD         R5, R5, #1;R5<-(-75)
;
CYCLEB      LD          R4, SHUTB
            NOT         R4, R4
            ADD         R4, R4, #1
            ADD         R4, R1, R4;R1?=SHUTB
            BRz         A
            LDR         R2, R1, #0
            ADD         R1, R1, #-1
            ADD         R4, R2, R5;Judge whether the current score reaches the standard of B
            BRn         CYCLEB
            ADD         R6, R6, #1;R6<-the number of students who reach B
            BRp         CYCLEB
;
A           LD          R1, LIST
            ADD         R1, R1, #15
            LD          R5, LINEA
            NOT         R5, R5
            ADD         R5, R5, #1;R5<-(-85)
;
CYCLEA      LD          R4, SHUTA
            NOT         R4, R4
            ADD         R4, R4, #1
            ADD         R4, R1, R4;R1?=SHUTA
            BRz         STORE
            LDR         R2, R1, #0
            ADD         R1, R1, #-1
            ADD         R4, R2, R5;Judge whether the current score reaches the standard of A
            BRn         CYCLEA
            ADD         R7, R7, #1;R7<-the number of students who reach A
            BRp         CYCLEA
;
STORE       NOT         R5, R7
            ADD         R5, R5, #1
            ADD         R6, R6, R5;B=R6-A
            STI         R7, AOA
            STI         R6, AOB
;
            HALT
;
LIST        .FILL       x5000
NUM         .FILL       x10
SCORE       .FILL       x4000
AOA         .FILL       x5100
AOB         .FILL       x5101
LINEB       .FILL       x4B
LINEA       .FILL       x55
SHUTB       .FILL       x5007
SHUTA       .FILL       x500B
;
            .END
