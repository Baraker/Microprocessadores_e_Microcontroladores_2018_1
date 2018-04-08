            ;   R15 has dividend  
            ;   R14 has divisor
        
resto:      MOV.w   #16,R12
            clr.w   R13
loop_div:   rla.w   R15
            rlc.w   R13
            bis.w   #1, R15
            sub.w   R14,R13
            jge     loc1
            add.w   R14,R13
            bic.w   #1, R15
loc1:       dec.w   R12
            cmp.w   #0,R12
            jnz     loop_div
            MOV.w   R13, R15
            ret