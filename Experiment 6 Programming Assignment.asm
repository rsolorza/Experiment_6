;------------------------------------------------------
; Programming Assignment
;------------------------------------------------------
.CSEG
.ORG 0x02

;my_subroutine: 
init:				MOV r20, 0x00		; lower byte
					MOV r21, 0x00		; upper byte
					MOV r25, 0xA3		; three-digit decimal value

		
hundreds_loop:		CMP r25, 0x64		; compare if less than 100
					BRCS tens_loop		; branch if carry flag is set
					SUB r25, 0x64		; subtracts 100 from three-digit decimal value
					ADD r21, 0x01   	; add hundred to upper byte
					BRN hundreds_loop 	; do tens_loop again

tens_loop:			CMP r25, 0x0A		; compare if less than 10
					BRCS ones_loop		; branch if carry flag is set
					SUB r25, 0x0A		; subtracts 10 from three-digit decimal value	
					ADD r20, 0x10 		; add ten to lower byte
					BRN tens_loop		; do tens_loop again

ones_loop:			CMP r25, 0x01		; compare if less than 1
					BRCS is_done		; branch of carry flag is set
					SUB r25, 0x01		; subtracts 1 from three-digit decimal value	
					ADD r20, 0x01 		; add one to lower byte
					BRN ones_loop		; do one_loop again

is_done: 			RET					; return
