            .ORIG   x3000
;initialization
            LD      R0, N
            LDR     R0, R0, #0
            LD      R1, p
            LDR     R1, R1, #0
            LD      R2, q
            LDR     R2, R2, #0
            ADD     R0, R0, #-1;R0<-N-2
            ADD     R4, R4, #1;R4<-F(1)=1
            ADD     R5, R5, #1;R5<-F(0)=1
;
NEGATE      NOT     R1, R1
            ADD     R1, R1, #1;R1<-(-p)
            NOT     R2, R2
            ADD     R2, R2, #1;R2<-(-q)
;
MODP        ADD     R5, R5, R1;R5<-F(N-2)-p
            BRp     MODP
            BRn     BACKP
            AND     R6, R6, #0;
            BRz     FORWARDR5
;
BACKP       NOT     R1, R1
            ADD     R1, R1, #1;R1<-p
            ADD     R6, R5, R1;R6<-F(N-2)%p
;
FORWARDR5   ADD     R5, R4, #0;R5<-F(N-1)
;
MODQ        ADD     R4, R4, R2;R7<-F(N-1)-q
            BRp     MODQ
            BRn     BACKQ
            AND     R7, R7, #0
            BRz     FORWARDR4
;
BACKQ       NOT     R2, R2
            ADD     R2, R2, #1;R2<-q
            ADD     R7, R4, R2;R7<-F(N-1)%q
;
FORWARDR4   ADD     R3, R6, R7;R3<-F(N)
            ADD     R4, R3, #0;R4<-F(N)
            ADD     R0, R0, #-1;
            BRp     NEGATE
;
            LD      R0, F(N)
            STR     R3, R0, #0
;
            HALT
;
p           .FILL   x3100
q           .FILL   x3101
N           .FILL   x3102
F(N)        .FILL   x3103
;
            .END
