            .ORIG       x3000
            LDI         R0, NUM
            LD          R1, DATA;R1 is the pointer of the string
            LDR         R3, R1, #0
            ADD         R0, R0, #-1;initialization
;
CHECK1      ADD         R0, R0, #0;
            BRz         STORE;Judge whether to end the cycle
            ADD         R6, R7, #1;Initialize R6
;
CHECK2      ADD         R0, R0, #0;
            BRz         STORE;
            ADD         R4, R3, #0;Load the previous character into R4
            ADD         R1, R1, #1;
            LDR         R3, R1, #0;Load the next character into R3
            ADD         R0, R0, #-1;N<-N-1
;
            NOT         R5, R3;
            ADD         R5, R5, #1;
            ADD         R5, R4, R5;Judge whether R3 and R4 are equal
            BRnp        CHECK1;
;
            ADD         R6, R6, #1;
            NOT         R5, R6;
            ADD         R5, R5, #1;
            ADD         R5, R2, R5;Judge whether R6 is the longest
            BRp         CHECK2;
;
            ADD         R2, R6, #0;Update maximum length
            BRnzp       CHECK2;
;
STORE       STI         R2, RESULT;
            HALT
;
RESULT      .FILL       x3050
NUM         .FILL       x3100
DATA        .FILL       x3101
;
            .END
