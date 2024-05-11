asect 0x00
setsp 0xf0
L4:
ldi r1,0xf4
ld r1,r1
if 
	tst r1
is z
	ldi r2, 15
	ldi r0, 0xf1
  	st r0, r2
  	br L4
fi
ldi r1, 0xf2
ldi r2, 0xf3
ld r1, r1
ld r2, r2
move r1, r3
ldi r0, 0x1f
and r0, r1
ldi r0, 0x20
and r0, r3

if 
	tst r3
is nz             # beq 0x3b
	move r2, r3
	ldi r0, 0x1f
	and r0, r2
	ldi r0, 0x20
	and r0, r3
	if
		tst r3
	is nz            # beq 0x2e
		ldi r0, 0x1d
		sub r1, r0
		neg r0
		shra r0
		ldi r3, 0x1d
		add r0, r2
		if
			cmp r3, r2
		is lt          # bge 0x2c
			sub r2, r3
			ldi r2, 0x1d
			sub r2, r3
			move r2, r3
		fi              # br 0x3b
	else
		ldi r0, 0x1d
		sub r1, r0
		neg r0
		shra r0
		if
			cmp r2, r0            # bge 0x39
		is lt  
			sub r0, r2               # br 0x3b
		else
			sub r2, r0
			move r0, r2
		fi
	fi
	else
		ldi r2, 15
		ldi r0, 0xf1
  		st r0, r2
  		br L4  
fi
  ldi r0, 0xf1
  st r0, r2
  br L4                # br 0x2
  halt
end
