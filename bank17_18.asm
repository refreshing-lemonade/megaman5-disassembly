; 2 code banks

bank $17
org $8000

  LDA #$00                                  ; $178000 |
  STA $95                                   ; $178002 |
  LDA $30                                   ; $178004 |
  CMP #$07                                  ; $178006 |
  BEQ code_17801C                           ; $178008 |
  CMP #$10                                  ; $17800A |
  BEQ code_17801F                           ; $17800C |
  CMP #$23                                  ; $17800E |
  BNE code_178029                           ; $178010 |
  LDA #$0E                                  ; $178012 |
  STA $F6                                   ; $178014 |
  JSR select_PRG_banks                      ; $178016 |
  JMP $A000                                 ; $178019 |

code_17801C:
  JMP code_17859C                           ; $17801C |

code_17801F:
  LDA #$00                                  ; $17801F |
  STA $69                                   ; $178021 |
  JSR code_1FF465                           ; $178023 |
  JMP code_178860                           ; $178026 |

code_178029:
  LDA #$F0                                  ; $178029 |
  JSR code_1FEC5B                           ; $17802B |
  JSR code_1791C9                           ; $17802E |
  JSR code_1EC3F1                           ; $178031 |
  JSR code_1EC39D                           ; $178034 |
  JSR code_1EC38F                           ; $178037 |
  JSR code_1EC3B8                           ; $17803A |
  JSR async_next_frame                      ; $17803D |
  JSR code_1EC2D1                           ; $178040 |
  JSR code_1FF3F2                           ; $178043 |
  LDA #$01                                  ; $178046 |
  JSR code_1FFFB7                           ; $178048 |
  LDA #$10                                  ; $17804B |
  STA $27                                   ; $17804D |
  STA $26                                   ; $17804F |
  LDA #$08                                  ; $178051 |
  STA $10                                   ; $178053 |
  LDA #$01                                  ; $178055 |
  STA $23                                   ; $178057 |
  JSR code_1EDAFC                           ; $178059 |
  DEC $27                                   ; $17805C |
  LDA #$00                                  ; $17805E |
  STA $10                                   ; $178060 |
  LDA #$00                                  ; $178062 |
  STA $23                                   ; $178064 |
  JSR code_1EDAFC                           ; $178066 |
  LDY #$4C                                  ; $178069 |
  JSR code_1789FC                           ; $17806B |
  LDA #$02                                  ; $17806E |
  STA $FD                                   ; $178070 |
  JSR code_1EC2DB                           ; $178072 |
  JSR code_1EC3EB                           ; $178075 |
  LDA #$96                                  ; $178078 |
  JSR async_next_frame.a                    ; $17807A |
code_17807D:
  JSR $A000                                 ; $17807D |
  LDY #$00                                  ; $178080 |
  JSR code_1789FC                           ; $178082 |
  LDY #$00                                  ; $178085 |
  LDA #$10                                  ; $178087 |
  JSR code_178A29                           ; $178089 |
  LDA #$49                                  ; $17808C |
  JSR code_1FEC5B                           ; $17808E |
  LDA #$00                                  ; $178091 |
  STA $FD                                   ; $178093 |
  LDA #$A0                                  ; $178095 |
  STA $10                                   ; $178097 |
  LDA #$05                                  ; $178099 |
  STA $11                                   ; $17809B |
  JSR code_1EC3EB                           ; $17809D |
code_1780A0:
  JSR async_next_frame                      ; $1780A0 |
  JSR code_1EC2E5                           ; $1780A3 |
  LDA $14                                   ; $1780A6 |\
  AND #$90                                  ; $1780A8 | | pressing start or A?
  BNE code_1780D2                           ; $1780AA |/
  LDA $14                                   ; $1780AC |\
  AND #$2C                                  ; $1780AE | | not pressing select/up/down?
  BEQ code_1780BF                           ; $1780B0 |/
  LDA #$27                                  ; $1780B2 |\ play cursor sound
  JSR code_1FEC5D                           ; $1780B4 |/
  LDA $0200                                 ; $1780B7 |\
  EOR #$10                                  ; $1780BA | | switch cursor selection
  STA $0200                                 ; $1780BC |/
code_1780BF:
  LDA $10                                   ; $1780BF |
  SEC                                       ; $1780C1 |
  SBC #$01                                  ; $1780C2 |
  STA $10                                   ; $1780C4 |
  LDA $11                                   ; $1780C6 |
  SBC #$00                                  ; $1780C8 |
  STA $11                                   ; $1780CA |
  ORA $10                                   ; $1780CC |
  BNE code_1780A0                           ; $1780CE |
  BEQ code_17807D                           ; $1780D0 |
code_1780D2:
  LDA #$28                                  ; $1780D2 |
  JSR code_1FEC5D                           ; $1780D4 |
  LDA $0200                                 ; $1780D7 |
  CMP #$A7                                  ; $1780DA |
  BEQ code_1780E1                           ; $1780DC |
  JMP code_1783BA                           ; $1780DE |

code_1780E1:
  JSR code_1EC3F1                           ; $1780E1 |
  JSR code_1EC39D                           ; $1780E4 |
  JSR code_1EC38F                           ; $1780E7 |
  JSR code_1EC3B8                           ; $1780EA |
  JSR code_1FF3F2                           ; $1780ED |
  JSR async_next_frame                      ; $1780F0 |
  JSR code_1EC2D1                           ; $1780F3 |
  LDA #$10                                  ; $1780F6 |
  STA $26                                   ; $1780F8 |
  LDA #$0F                                  ; $1780FA |
  STA $27                                   ; $1780FC |
  LDA #$00                                  ; $1780FE |
  STA $10                                   ; $178100 |
  LDA #$02                                  ; $178102 |
  STA $23                                   ; $178104 |
  JSR code_1EDAFC                           ; $178106 |
  LDA #$08                                  ; $178109 |
  STA $10                                   ; $17810B |
  LDA #$04                                  ; $17810D |
  STA $23                                   ; $17810F |
  JSR code_1EDAFC                           ; $178111 |
  LDY #$26                                  ; $178114 |
  JSR code_1789FC                           ; $178116 |
  LDY #$10                                  ; $178119 |
  LDA #$E4                                  ; $17811B |
  JSR code_178A29                           ; $17811D |
  JSR code_178A94                           ; $178120 |
  JSR code_1EC2DB                           ; $178123 |
  JSR async_next_frame                      ; $178126 |
  JSR code_1EC3EB                           ; $178129 |
  LDA #$0D                                  ; $17812C |
  JSR code_1FEC5B                           ; $17812E |
  JSR code_178AF1                           ; $178131 |
  LDA #$01                                  ; $178134 |
  STA $10                                   ; $178136 |
  STA $11                                   ; $178138 |
  LDA #$00                                  ; $17813A |
  STA $14                                   ; $17813C |
  STA $9D                                   ; $17813E |
code_178140:
  LDA $14                                   ; $178140 |\
  AND #$90                                  ; $178142 | | pressing A or start?
  BEQ check_direction                       ; $178144 | | load stage
  JMP code_1781CD                           ; $178146 |/

check_direction:
  LDA $14                                   ; $178149 |\  if NO directional buttons pressed
  AND #$0F                                  ; $17814B | | skip all this
  BEQ code_17818A                           ; $17814D |/
  AND #$03                                  ; $17814F |\
  BEQ check_up_down                         ; $178151 | | if left/right is pressed
  AND #$01                                  ; $178153 | | store which one in y reg
  TAY                                       ; $178155 |/
  LDA $11                                   ; $178156 |\
  CLC                                       ; $178158 | | add 1 or subtract 1 to
  ADC $8D90,y                               ; $178159 | | X coord of cursor
  STA $11                                   ; $17815C |/
  CMP #$03                                  ; $17815E |\
  BCC check_up_down                         ; $178160 | | if coordinate < 0 or > 2
  CLC                                       ; $178162 | | handle wraparound by adding
  ADC $8D92,y                               ; $178163 | | or subtracting 3
  STA $11                                   ; $178166 |/
check_up_down:
  LDA $14                                   ; $178168 |\
  AND #$0C                                  ; $17816A | |
  BEQ code_178185                           ; $17816C | | if up/down is pressed
  AND #$04                                  ; $17816E | | store which one in y reg
  LSR                                       ; $178170 | |
  LSR                                       ; $178171 | |
  TAY                                       ; $178172 |/
  LDA $10                                   ; $178173 |\
  CLC                                       ; $178175 | | add 1 or subtract 1 to
  ADC $8D90,y                               ; $178176 | | Y coord of cursor
  STA $10                                   ; $178179 |/
  CMP #$03                                  ; $17817B |\
  BCC code_178185                           ; $17817D | | if coordinate < 0 or > 2
  CLC                                       ; $17817F | | handle wraparound by adding
  ADC $8D92,y                               ; $178180 | | or subtracting 3
  STA $10                                   ; $178183 |/
code_178185:
  LDA #$27                                  ; $178185 |
  JSR code_1FEC5D                           ; $178187 |
code_17818A:
  LDY $10                                   ; $17818A |
  LDA $8D8A,y                               ; $17818C |
  STA $00                                   ; $17818F |
  LDY $11                                   ; $178191 |
  LDA $8D8D,y                               ; $178193 |
  STA $01                                   ; $178196 |
  LDY #$00                                  ; $178198 |
  LDX #$00                                  ; $17819A |
code_17819C:
  LDA $00                                   ; $17819C |
  CLC                                       ; $17819E |
  ADC $8D94,y                               ; $17819F |
  STA $0200,x                               ; $1781A2 |
  LDA $01                                   ; $1781A5 |
  CLC                                       ; $1781A7 |
  ADC $8D9C,y                               ; $1781A8 |
  STA $0203,x                               ; $1781AB |
  LDA $9D                                   ; $1781AE |
  AND #$08                                  ; $1781B0 |
  BEQ code_1781B9                           ; $1781B2 |
  LDA #$F8                                  ; $1781B4 |
  STA $0200,x                               ; $1781B6 |
code_1781B9:
  INX                                       ; $1781B9 |
  INX                                       ; $1781BA |
  INX                                       ; $1781BB |
  INX                                       ; $1781BC |
  INY                                       ; $1781BD |
  CPY #$08                                  ; $1781BE |
  BNE code_17819C                           ; $1781C0 |
code_1781C2:
  INC $9D                                   ; $1781C2 |
  JSR async_next_frame                      ; $1781C4 |
  JSR code_1EC2E5                           ; $1781C7 |
  JMP code_178140                           ; $1781CA |

code_1781CD:
  LDA $10                                   ; $1781CD |
  ASL                                       ; $1781CF |
  ADC $10                                   ; $1781D0 |
  ADC $11                                   ; $1781D2 |
  STA $12                                   ; $1781D4 |
  TAY                                       ; $1781D6 |
  LDA $8DA4,y                               ; $1781D7 |
  STA $26                                   ; $1781DA |
  STA $6C                                   ; $1781DC |
  CMP #$08                                  ; $1781DE |
  BNE code_1781F0                           ; $1781E0 |
  LDA $6E                                   ; $1781E2 |
  CMP #$FF                                  ; $1781E4 |
  BNE code_1781C2                           ; $1781E6 |
  LDA #$28                                  ; $1781E8 |
  JSR code_1FEC5D                           ; $1781EA |
  JMP code_179272                           ; $1781ED |

code_1781F0:
  LDA #$28                                  ; $1781F0 |
  JSR code_1FEC5D                           ; $1781F2 |
  LDX #$08                                  ; $1781F5 |
code_1781F7:
  LDA $0610                                 ; $1781F7 |
  EOR #$3F                                  ; $1781FA |
  STA $0610                                 ; $1781FC |
  LDA #$FF                                  ; $1781FF |
  STA $18                                   ; $178201 |
  LDA #$08                                  ; $178203 |
  JSR async_next_frame.a                    ; $178205 |
  DEX                                       ; $178208 |
  BNE code_1781F7                           ; $178209 |
  LDA #$0F                                  ; $17820B |
  LDY #$0B                                  ; $17820D |
code_17820F:
  STA $0604,y                               ; $17820F |
  DEY                                       ; $178212 |
  BPL code_17820F                           ; $178213 |
  TAY                                       ; $178215 |
code_178216:
  LDA $8C42,y                               ; $178216 |
  STA $0630,y                               ; $178219 |
  DEY                                       ; $17821C |
  BPL code_178216                           ; $17821D |
  JSR code_1EC38F                           ; $17821F |
  JSR code_178B2E                           ; $178222 |
  LDX #$05                                  ; $178225 |
code_178227:
  LDA $8C8A,x                               ; $178227 |
  STA $EA                                   ; $17822A |
  LDY #$03                                  ; $17822C |
code_17822E:
  LDA $0620,y                               ; $17822E |
  SEC                                       ; $178231 |
  SBC $8C90,x                               ; $178232 |
  BCS code_178239                           ; $178235 |
  LDA #$0F                                  ; $178237 |
code_178239:
  STA $0600,y                               ; $178239 |
  DEY                                       ; $17823C |
  BPL code_17822E                           ; $17823D |
  STY $18                                   ; $17823F |
  LDA #$08                                  ; $178241 |
  JSR async_next_frame.a                    ; $178243 |
  DEX                                       ; $178246 |
  BPL code_178227                           ; $178247 |
  LDY #$1F                                  ; $178249 |
  LDA #$0F                                  ; $17824B |
code_17824D:
  STA $0600,y                               ; $17824D |
  STA $0620,y                               ; $178250 |
  DEY                                       ; $178253 |
  BPL code_17824D                           ; $178254 |
  STY $18                                   ; $178256 |
  JSR async_next_frame                      ; $178258 |
  LDY $6C                                   ; $17825B |
  LDA $F2B2,y                               ; $17825D |
  AND $6E                                   ; $178260 |
  BEQ code_178265                           ; $178262 |
  RTS                                       ; $178264 |

code_178265:
  JSR code_1EC2D1                           ; $178265 |
  LDA #$00                                  ; $178268 |
  STA $10                                   ; $17826A |
  LDA #$03                                  ; $17826C |
  STA $23                                   ; $17826E |
  JSR code_1EDAFC                           ; $178270 |
  JSR async_next_frame                      ; $178273 |
  JSR code_1EC2DB                           ; $178276 |
  LDA #$0E                                  ; $178279 |
  JSR code_1FEC5B                           ; $17827B |
  LDY #$1F                                  ; $17827E |
code_178280:
  LDA $8C32,y                               ; $178280 |
  STA $0620,y                               ; $178283 |
  DEY                                       ; $178286 |
  BPL code_178280                           ; $178287 |
  LDX #$01                                  ; $178289 |
code_17828B:
  LDA #$6D                                  ; $17828B |
  STA {entity_type},x                       ; $17828D |
  LDA #$00                                  ; $178290 |
  STA {x_position_high},x                   ; $178292 |
  STA {y_position_high},x                   ; $178295 |
  STA {entity_display_flags},x              ; $178298 |
  LDA $8E50,x                               ; $17829B |
  JSR code_1FEA98                           ; $17829E |
  LDA #$68                                  ; $1782A1 |
  STA {y_position_low},x                    ; $1782A3 |
  LDA #$80                                  ; $1782A6 |
  STA {x_position_low},x                    ; $1782A8 |
  DEX                                       ; $1782AB |
  BPL code_17828B                           ; $1782AC |
  LDA #$C8                                  ; $1782AE |
  STA $EA                                   ; $1782B0 |
  LDA #$CA                                  ; $1782B2 |
  STA $EB                                   ; $1782B4 |
  LDA #$57                                  ; $1782B6 |
  STA $FA                                   ; $1782B8 |
  LDA #$CE                                  ; $1782BA |
  STA $9B                                   ; $1782BC |
  LDA #$06                                  ; $1782BE |
  STA $99                                   ; $1782C0 |
  LDA #$96                                  ; $1782C2 |
  STA $05F1                                 ; $1782C4 |
  LDA #$00                                  ; $1782C7 |
  STA $05F9                                 ; $1782C9 |
  STA $05F5                                 ; $1782CC |
  JSR code_1EC3EB                           ; $1782CF |
code_1782D2:
  INC $95                                   ; $1782D2 |
  DEC $FA                                   ; $1782D4 |
  DEC $FA                                   ; $1782D6 |
  DEC $FA                                   ; $1782D8 |
  DEC $9B                                   ; $1782DA |
  DEC $9B                                   ; $1782DC |
  DEC $9B                                   ; $1782DE |
  DEC $95                                   ; $1782E0 |
  JSR async_next_frame                      ; $1782E2 |
  LDA $FA                                   ; $1782E5 |
  BNE code_1782D2                           ; $1782E7 |
  JSR code_178A3A                           ; $1782E9 |
code_1782EC:
  JSR code_178A4A                           ; $1782EC |
  LDA {animation_frame}                     ; $1782EF |
  CMP #$06                                  ; $1782F2 |
  BNE code_1782EC                           ; $1782F4 |
  LDX #$00                                  ; $1782F6 |
  STX $9D                                   ; $1782F8 |
  LDY $6C                                   ; $1782FA |
  LDA $8DB3,y                               ; $1782FC |
  JSR code_1FEA98                           ; $1782FF |
  LDA #$00                                  ; $178302 |
  STA $0301                                 ; $178304 |
  LDY #$0E                                  ; $178307 |
  LDA #$36                                  ; $178309 |
code_17830B:
  STA $0611,y                               ; $17830B |
  DEY                                       ; $17830E |
  BPL code_17830B                           ; $17830F |
  STY $18                                   ; $178311 |
code_178313:
  LDA #$00                                  ; $178313 |
  STA {animation_timer}                     ; $178315 |
  JSR code_178A4A                           ; $178318 |
  LDA $9D                                   ; $17831B |
  LSR                                       ; $17831D |
  AND #$07                                  ; $17831E |
  TAY                                       ; $178320 |
  LDA {entity_display_flags}                ; $178321 |
  AND #$FB                                  ; $178324 |
  ORA $8DC3,y                               ; $178326 |
  STA {entity_display_flags}                ; $178329 |
  CPY #$07                                  ; $17832C |
  BNE code_178313                           ; $17832E |
  LDA $6C                                   ; $178330 |
  ASL                                       ; $178332 |
  ASL                                       ; $178333 |
  ASL                                       ; $178334 |
  TAY                                       ; $178335 |
  LDX #$00                                  ; $178336 |
code_178338:
  LDA $8C42,x                               ; $178338 |
  STA $0610,x                               ; $17833B |
  LDA $8C4A,y                               ; $17833E |
  STA $0618,x                               ; $178341 |
  STA $0638,x                               ; $178344 |
  INY                                       ; $178347 |
  INX                                       ; $178348 |
  CPX #$08                                  ; $178349 |
  BNE code_178338                           ; $17834B |
  LDA #$FF                                  ; $17834D |
  STA $18                                   ; $17834F |
code_178351:
  JSR code_178A4A                           ; $178351 |
  LDY $6C                                   ; $178354 |
  LDA {animation_frame}                     ; $178356 |
  CMP $8DBB,y                               ; $178359 |
  BNE code_178351                           ; $17835C |
  LDA {animation_index}                     ; $17835E |
  CMP #$20                                  ; $178361 |
  BNE code_178385                           ; $178363 |
  LDX #$00                                  ; $178365 |
  LDY #$01                                  ; $178367 |
  LDA #$21                                  ; $178369 |
  JSR code_1FEAA4                           ; $17836B |
  LDA #$6D                                  ; $17836E |
  STA $0301                                 ; $178370 |
  LDA #$48                                  ; $178373 |
  STA $0379                                 ; $178375 |
code_178378:
  LDA #$00                                  ; $178378 |
  STA {animation_timer}                     ; $17837A |
  JSR code_178A4A                           ; $17837D |
  LDA $0301                                 ; $178380 |
  BNE code_178378                           ; $178383 |
code_178385:
  LDY #$04                                  ; $178385 |
code_178387:
  LDA $8DCB,y                               ; $178387 |
  STA $0780,y                               ; $17838A |
  DEY                                       ; $17838D |
  BPL code_178387                           ; $17838E |
  LDA $26                                   ; $178390 |
  ASL                                       ; $178392 |
  ASL                                       ; $178393 |
  ASL                                       ; $178394 |
  ASL                                       ; $178395 |
  TAY                                       ; $178396 |
code_178397:
  LDA $8DD0,y                               ; $178397 |
  CMP #$20                                  ; $17839A |
  BEQ code_1783AA                           ; $17839C |
  STA $0783                                 ; $17839E |
  LDA #$FF                                  ; $1783A1 |
  STA $19                                   ; $1783A3 |
  LDA #$08                                  ; $1783A5 |
  JSR code_178A7D                           ; $1783A7 |
code_1783AA:
  INY                                       ; $1783AA |
  INC $0781                                 ; $1783AB |
  LDA $0781                                 ; $1783AE |
  CMP #$17                                  ; $1783B1 |
  BNE code_178397                           ; $1783B3 |
  LDA #$B4                                  ; $1783B5 |
  JMP code_178A7D                           ; $1783B7 |

code_1783BA:
  JSR code_17866A                           ; $1783BA |
  LDY #$0F                                  ; $1783BD |
code_1783BF:
  LDA $9024,y                               ; $1783BF |
  STA $0200,y                               ; $1783C2 |
  DEY                                       ; $1783C5 |
  BPL code_1783BF                           ; $1783C6 |
  LDA #$13                                  ; $1783C8 |
  JSR code_1FEC5B                           ; $1783CA |
  JSR code_1EC3EB                           ; $1783CD |
code_1783D0:
  LDA #$00                                  ; $1783D0 |
  STA $10                                   ; $1783D2 |
  BEQ code_17840F                           ; $1783D4 |
code_1783D6:
  LDA $14                                   ; $1783D6 |
  AND #$90                                  ; $1783D8 |
  BEQ code_1783E5                           ; $1783DA |
  LDA $10                                   ; $1783DC |
  CMP #$02                                  ; $1783DE |
  BCC code_178441                           ; $1783E0 |
  JMP code_1786AB                           ; $1783E2 |

code_1783E5:
  LDA $14                                   ; $1783E5 |
  AND #$0C                                  ; $1783E7 |
  BEQ code_1783F8                           ; $1783E9 |
  LDA $10                                   ; $1783EB |
  EOR #$02                                  ; $1783ED |
  AND #$02                                  ; $1783EF |
  STA $10                                   ; $1783F1 |
  LDA #$27                                  ; $1783F3 |
  JSR code_1FEC5D                           ; $1783F5 |
code_1783F8:
  LDA $10                                   ; $1783F8 |
  CMP #$02                                  ; $1783FA |
  BCS code_17840F                           ; $1783FC |
  LDA $14                                   ; $1783FE |
  AND #$03                                  ; $178400 |
  BEQ code_17840F                           ; $178402 |
  LDA $10                                   ; $178404 |
  EOR #$01                                  ; $178406 |
  STA $10                                   ; $178408 |
  LDA #$27                                  ; $17840A |
  JSR code_1FEC5D                           ; $17840C |
code_17840F:
  LDY $10                                   ; $17840F |
  LDA $9034,y                               ; $178411 |
  STA $00                                   ; $178414 |
  LDA $9037,y                               ; $178416 |
  STA $01                                   ; $178419 |
  LDX $903A,y                               ; $17841B |
  LDY #$00                                  ; $17841E |
code_178420:
  LDA $903D,x                               ; $178420 |
  CLC                                       ; $178423 |
  ADC $00                                   ; $178424 |
  STA $0200,y                               ; $178426 |
  LDA $9045,x                               ; $178429 |
  CLC                                       ; $17842C |
  ADC $01                                   ; $17842D |
  STA $0203,y                               ; $17842F |
  INX                                       ; $178432 |
  INY                                       ; $178433 |
  INY                                       ; $178434 |
  INY                                       ; $178435 |
  INY                                       ; $178436 |
  CPY #$10                                  ; $178437 |
  BNE code_178420                           ; $178439 |
  JSR code_17851E                           ; $17843B |
  JMP code_1783D6                           ; $17843E |

code_178441:
  LDA #$00                                  ; $178441 |
  STA $12                                   ; $178443 |
  STA $13                                   ; $178445 |
  JMP code_1784EB                           ; $178447 |

code_17844A:
  LDA $14                                   ; $17844A |
  AND #$40                                  ; $17844C |
  BNE code_1783D0                           ; $17844E |
  LDA $14                                   ; $178450 |
  AND #$10                                  ; $178452 |
  BEQ code_17845C                           ; $178454 |
  LDA #$02                                  ; $178456 |
  STA $10                                   ; $178458 |
  BNE code_17840F                           ; $17845A |
code_17845C:
  LDA $14                                   ; $17845C |
  AND #$80                                  ; $17845E |
  BEQ code_1784AD                           ; $178460 |
  LDA $13                                   ; $178462 |
  ASL                                       ; $178464 |
  ASL                                       ; $178465 |
  STA $00                                   ; $178466 |
  LDA $12                                   ; $178468 |
  ASL                                       ; $17846A |
  ASL                                       ; $17846B |
  ASL                                       ; $17846C |
  STA $01                                   ; $17846D |
  ASL                                       ; $17846F |
  ADC $00                                   ; $178470 |
  ADC $01                                   ; $178472 |
  TAY                                       ; $178474 |
  LDA $0210,y                               ; $178475 |
  CMP #$F8                                  ; $178478 |
  BEQ code_17848D                           ; $17847A |
  LDX $10                                   ; $17847C |
  LDA $906F,x                               ; $17847E |
  CMP $0211,y                               ; $178481 |
  BNE code_17848D                           ; $178484 |
  LDA #$F8                                  ; $178486 |
  STA $0210,y                               ; $178488 |
  BNE code_1784EB                           ; $17848B |
code_17848D:
  LDX $12                                   ; $17848D |
  LDA $9063,x                               ; $17848F |
  STA $0210,y                               ; $178492 |
  LDX $13                                   ; $178495 |
  LDA $9069,x                               ; $178497 |
  STA $0213,y                               ; $17849A |
  LDX $10                                   ; $17849D |
  LDA $906F,x                               ; $17849F |
  STA $0211,y                               ; $1784A2 |
  LDA $9071,x                               ; $1784A5 |
  STA $0212,y                               ; $1784A8 |
  BNE code_1784EB                           ; $1784AB |
code_1784AD:
  LDA $14                                   ; $1784AD |
  AND #$03                                  ; $1784AF |
  BEQ code_1784CD                           ; $1784B1 |
  AND #$02                                  ; $1784B3 |
  TAY                                       ; $1784B5 |
  LDA #$27                                  ; $1784B6 |
  JSR code_1FEC5D                           ; $1784B8 |
  LDA $13                                   ; $1784BB |
  CLC                                       ; $1784BD |
  ADC $9059,y                               ; $1784BE |
  STA $13                                   ; $1784C1 |
  CMP #$06                                  ; $1784C3 |
  BCC code_1784CD                           ; $1784C5 |
  CLC                                       ; $1784C7 |
  ADC $905A,y                               ; $1784C8 |
  STA $13                                   ; $1784CB |
code_1784CD:
  LDA $14                                   ; $1784CD |
  AND #$0C                                  ; $1784CF |
  BEQ code_1784EB                           ; $1784D1 |
  TAY                                       ; $1784D3 |
  LDA #$27                                  ; $1784D4 |
  JSR code_1FEC5D                           ; $1784D6 |
  LDA $12                                   ; $1784D9 |
  CLC                                       ; $1784DB |
  ADC $9059,y                               ; $1784DC |
  STA $12                                   ; $1784DF |
  CMP #$06                                  ; $1784E1 |
  BCC code_1784EB                           ; $1784E3 |
  CLC                                       ; $1784E5 |
  ADC $905A,y                               ; $1784E6 |
  STA $12                                   ; $1784E9 |
code_1784EB:
  LDX $12                                   ; $1784EB |
  LDA $904D,x                               ; $1784ED |
  STA $00                                   ; $1784F0 |
  LDX $13                                   ; $1784F2 |
  LDA $9053,x                               ; $1784F4 |
  STA $01                                   ; $1784F7 |
  LDX #$00                                  ; $1784F9 |
  LDY #$00                                  ; $1784FB |
code_1784FD:
  LDA $903D,x                               ; $1784FD |
  CLC                                       ; $178500 |
  ADC $00                                   ; $178501 |
  STA $0200,y                               ; $178503 |
  LDA $9045,x                               ; $178506 |
  CLC                                       ; $178509 |
  ADC $01                                   ; $17850A |
  STA $0203,y                               ; $17850C |
  INX                                       ; $17850F |
  INY                                       ; $178510 |
  INY                                       ; $178511 |
  INY                                       ; $178512 |
  INY                                       ; $178513 |
  CPY #$10                                  ; $178514 |
  BNE code_1784FD                           ; $178516 |
  JSR code_17851E                           ; $178518 |
  JMP code_17844A                           ; $17851B |

code_17851E:
  LDA $9D                                   ; $17851E |
  INC $9D                                   ; $178520 |
  LSR                                       ; $178522 |
  LSR                                       ; $178523 |
  LSR                                       ; $178524 |
  BCS code_178535                           ; $178525 |
  LDA #$F8                                  ; $178527 |
  STA $0200                                 ; $178529 |
  STA $0204                                 ; $17852C |
  STA $0208                                 ; $17852F |
  STA $020C                                 ; $178532 |
code_178535:
  JSR async_next_frame                      ; $178535 |
  JMP code_1EC2E5                           ; $178538 |

code_17853B:
  JSR code_17866A                           ; $17853B |
  JSR code_1787B9                           ; $17853E |
  LDX #$03                                  ; $178541 |
  JSR code_17884A                           ; $178543 |
  LDA #$13                                  ; $178546 |
  JSR code_1FEC5B                           ; $178548 |
  LDA #$AF                                  ; $17854B |
  STA $0200                                 ; $17854D |
  LDA #$8F                                  ; $178550 |
  STA $0201                                 ; $178552 |
  LDA #$01                                  ; $178555 |
  STA $0202                                 ; $178557 |
  LDA #$48                                  ; $17855A |
  STA $0203                                 ; $17855C |
  JSR code_1EC3EB                           ; $17855F |
code_178562:
  JSR code_1EC2E5                           ; $178562 |
  JSR async_next_frame                      ; $178565 |
  LDA $14                                   ; $178568 |
  AND #$90                                  ; $17856A |
  BNE code_178583                           ; $17856C |
  LDA $14                                   ; $17856E |
  AND #$0C                                  ; $178570 |
  BEQ code_178562                           ; $178572 |
  LDA #$27                                  ; $178574 |
  JSR code_1FEC5D                           ; $178576 |
  LDA $0200                                 ; $178579 |
  EOR #$10                                  ; $17857C |
  STA $0200                                 ; $17857E |
  BNE code_178562                           ; $178581 |
code_178583:
  LDA $0200                                 ; $178583 |
  CMP #$AF                                  ; $178586 |
  BNE code_178590                           ; $178588 |
  JSR code_17865A                           ; $17858A |
  JMP code_1780E1                           ; $17858D |

code_178590:
  JSR code_17865A                           ; $178590 |
  LDA #$00                                  ; $178593 |
  STA $69                                   ; $178595 |
code_178597:
  LDA $6C                                   ; $178597 |
  STA $26                                   ; $178599 |
  RTS                                       ; $17859B |

code_17859C:
  LDA $BF                                   ; $17859C |
  BEQ code_1785E2                           ; $17859E |
  DEC $BF                                   ; $1785A0 |
  LDA #$00                                  ; $1785A2 |
  STA $F9                                   ; $1785A4 |
  STA $29                                   ; $1785A6 |
  STA $68                                   ; $1785A8 |
  LDA $6C                                   ; $1785AA |
  ASL                                       ; $1785AC |
  STA $00                                   ; $1785AD |
  ASL                                       ; $1785AF |
  ADC $00                                   ; $1785B0 |
  TAY                                       ; $1785B2 |
  LDA $69                                   ; $1785B3 |
  CMP $9169,y                               ; $1785B5 |
  BCC code_178597                           ; $1785B8 |
  LDA $9169,y                               ; $1785BA |
  STA $F9                                   ; $1785BD |
  LDA $916A,y                               ; $1785BF |
  STA $29                                   ; $1785C2 |
  LDA $916B,y                               ; $1785C4 |
  STA $68                                   ; $1785C7 |
  LDA $69                                   ; $1785C9 |
  CMP $916C,y                               ; $1785CB |
  BCC code_178597                           ; $1785CE |
  LDA $916C,y                               ; $1785D0 |
  STA $F9                                   ; $1785D3 |
  LDA $916D,y                               ; $1785D5 |
  STA $29                                   ; $1785D8 |
  LDA $916E,y                               ; $1785DA |
  STA $68                                   ; $1785DD |
  JMP code_178597                           ; $1785DF |

code_1785E2:
  LDA #$00                                  ; $1785E2 |
  STA $69                                   ; $1785E4 |
  LDA #$02                                  ; $1785E6 |
  STA $BF                                   ; $1785E8 |
  JSR code_1FF465                           ; $1785EA |
  JSR code_17866A                           ; $1785ED |
  JSR code_1787B9                           ; $1785F0 |
  LDX #$02                                  ; $1785F3 |
  STX $BF                                   ; $1785F5 |
  JSR code_17884A                           ; $1785F7 |
  LDA #$12                                  ; $1785FA |
  JSR code_1FEC5B                           ; $1785FC |
  JSR code_1EC3EB                           ; $1785FF |
  LDA #$00                                  ; $178602 |
  STA $14                                   ; $178604 |
  STA $10                                   ; $178606 |
  STA $6B                                   ; $178608 |
code_17860A:
  LDA $14                                   ; $17860A |
  AND #$C0                                  ; $17860C |
  BNE code_17861A                           ; $17860E |
  JSR code_1EC2E5                           ; $178610 |
  JSR async_next_frame                      ; $178613 |
  DEC $10                                   ; $178616 |
  BNE code_17860A                           ; $178618 |
code_17861A:
  LDA #$AF                                  ; $17861A |
  STA $0200                                 ; $17861C |
  LDA #$8F                                  ; $17861F |
  STA $0201                                 ; $178621 |
  LDA #$01                                  ; $178624 |
  STA $0202                                 ; $178626 |
  LDA #$48                                  ; $178629 |
  STA $0203                                 ; $17862B |
  LDA #$13                                  ; $17862E |
  JSR code_1FEC5B                           ; $178630 |
  LDA $6C                                   ; $178633 |
  CMP #$08                                  ; $178635 |
  BCS code_178641                           ; $178637 |
  LDX #$03                                  ; $178639 |
  JSR code_17884A                           ; $17863B |
  JMP code_178562                           ; $17863E |

code_178641:
  LDX #$04                                  ; $178641 |
  JSR code_17884A                           ; $178643 |
  LDA #$B7                                  ; $178646 |
  STA $0200                                 ; $178648 |
code_17864B:
  JSR code_1EC2E5                           ; $17864B |
  JSR async_next_frame                      ; $17864E |
  LDA $14                                   ; $178651 |
  AND #$90                                  ; $178653 |
  BEQ code_17864B                           ; $178655 |
  JMP code_178590                           ; $178657 |

code_17865A:
  LDY #$0C                                  ; $17865A |
code_17865C:
  LDA $00B0,y                               ; $17865C |
  BPL code_178666                           ; $17865F |
  LDA #$9C                                  ; $178661 |
  STA $00B0,y                               ; $178663 |
code_178666:
  DEY                                       ; $178666 |
  BPL code_17865C                           ; $178667 |
  RTS                                       ; $178669 |

code_17866A:
  JSR code_1EC3F1                           ; $17866A |
  JSR code_1EC3B8                           ; $17866D |
  JSR code_1EC39D                           ; $178670 |
  JSR code_1EC38F                           ; $178673 |
  JSR async_next_frame                      ; $178676 |
  JSR code_1EC2D1                           ; $178679 |
  JSR code_1FF3F2                           ; $17867C |
  LDA #$01                                  ; $17867F |
  JSR code_1FFFB7                           ; $178681 |
  LDA #$10                                  ; $178684 |
  STA $26                                   ; $178686 |
  LDA #$0F                                  ; $178688 |
  STA $27                                   ; $17868A |
  LDA #$00                                  ; $17868C |
  STA $10                                   ; $17868E |
  STA $05F0                                 ; $178690 |
  STA $05F1                                 ; $178693 |
  STA $05F2                                 ; $178696 |
  STA $05F3                                 ; $178699 |
  LDA #$01                                  ; $17869C |
  STA $23                                   ; $17869E |
  JSR code_1EDAFC                           ; $1786A0 |
  LDY #$72                                  ; $1786A3 |
  JSR code_1789FC                           ; $1786A5 |
  JMP code_1EC2DB                           ; $1786A8 |

code_1786AB:
  LDY #$10                                  ; $1786AB |
  LDA #$00                                  ; $1786AD |
  STA $00                                   ; $1786AF |
  STA $01                                   ; $1786B1 |
  STA $02                                   ; $1786B3 |
code_1786B5:
  LDA $0200,y                               ; $1786B5 |
  CMP #$F8                                  ; $1786B8 |
  BEQ code_1786CD                           ; $1786BA |
  INC $00                                   ; $1786BC |
  LDA $0201,y                               ; $1786BE |
  CMP #$8B                                  ; $1786C1 |
  BEQ code_1786C9                           ; $1786C3 |
  INC $02                                   ; $1786C5 |
  BNE code_1786D2                           ; $1786C7 |
code_1786C9:
  INC $01                                   ; $1786C9 |
  BNE code_1786D2                           ; $1786CB |
code_1786CD:
  LDA #$00                                  ; $1786CD |
  STA $0201,y                               ; $1786CF |
code_1786D2:
  INY                                       ; $1786D2 |
  INY                                       ; $1786D3 |
  INY                                       ; $1786D4 |
  INY                                       ; $1786D5 |
  BNE code_1786B5                           ; $1786D6 |
  LDA $00                                   ; $1786D8 |
  CMP #$06                                  ; $1786DA |
  BNE code_178728                           ; $1786DC |
  LDA $01                                   ; $1786DE |
  CMP #$03                                  ; $1786E0 |
  BNE code_178728                           ; $1786E2 |
  LDY #$02                                  ; $1786E4 |
  STY $00                                   ; $1786E6 |
code_1786E8:
  LDY $00                                   ; $1786E8 |
  LDX $90E0,y                               ; $1786EA |
  STX $02                                   ; $1786ED |
  LDA $90E3,x                               ; $1786EF |
  STA $01                                   ; $1786F2 |
  STA $03                                   ; $1786F4 |
  CLC                                       ; $1786F6 |
  ADC $02                                   ; $1786F7 |
  STA $02                                   ; $1786F9 |
  TAX                                       ; $1786FB |
code_1786FC:
  LDY $90E4,x                               ; $1786FC |
  LDA $0211,y                               ; $1786FF |
  CMP #$8B                                  ; $178702 |
  BEQ code_17870D                           ; $178704 |
  DEX                                       ; $178706 |
  DEC $01                                   ; $178707 |
  BPL code_1786FC                           ; $178709 |
  BMI code_178728                           ; $17870B |
code_17870D:
  LDY $90FB,x                               ; $17870D |
  LDA $0211,y                               ; $178710 |
  CMP #$8C                                  ; $178713 |
  BEQ code_17872B                           ; $178715 |
  LDX $02                                   ; $178717 |
code_178719:
  LDY $90E4,x                               ; $178719 |
  LDA $0211,y                               ; $17871C |
  CMP #$8C                                  ; $17871F |
  BEQ code_17872F                           ; $178721 |
  DEX                                       ; $178723 |
  DEC $03                                   ; $178724 |
  BPL code_178719                           ; $178726 |
code_178728:
  JMP code_17878E                           ; $178728 |

code_17872B:
  LDA $01                                   ; $17872B |
  STA $03                                   ; $17872D |
code_17872F:
  LDY $00                                   ; $17872F |
  LDA $01                                   ; $178731 |
  STA $0004,y                               ; $178733 |
  LDA $03                                   ; $178736 |
  STA $0007,y                               ; $178738 |
  DEC $00                                   ; $17873B |
  BPL code_1786E8                           ; $17873D |
  LDA #$28                                  ; $17873F |
  JSR code_1FEC5D                           ; $178741 |
  LDY #$06                                  ; $178744 |
code_178746:
  ASL $04                                   ; $178746 |
  ASL $07                                   ; $178748 |
  CPY #$04                                  ; $17874A |
  BCS code_178752                           ; $17874C |
  ASL $05                                   ; $17874E |
  ASL $08                                   ; $178750 |
code_178752:
  DEY                                       ; $178752 |
  BNE code_178746                           ; $178753 |
  LDA $04                                   ; $178755 |
  ORA $05                                   ; $178757 |
  ORA $06                                   ; $178759 |
  STA $6E                                   ; $17875B |
  STA $00                                   ; $17875D |
  STA $67                                   ; $17875F |
  LDY #$00                                  ; $178761 |
code_178763:
  LSR $00                                   ; $178763 |
  BCC code_178775                           ; $178765 |
  LDA #$9C                                  ; $178767 |
  LDX $9111,y                               ; $178769 |
  STA $B0,x                                 ; $17876C |
  LDX $9112,y                               ; $17876E |
  BEQ code_178775                           ; $178771 |
  STA $B0,x                                 ; $178773 |
code_178775:
  INY                                       ; $178775 |
  INY                                       ; $178776 |
  CPY #$10                                  ; $178777 |
  BNE code_178763                           ; $178779 |
  LDA $07                                   ; $17877B |
  ORA $08                                   ; $17877D |
  ORA $09                                   ; $17877F |
  STA $6D                                   ; $178781 |
  CMP #$FF                                  ; $178783 |
  BNE code_17878B                           ; $178785 |
  LDA #$9C                                  ; $178787 |
  STA $BC                                   ; $178789 |
code_17878B:
  JMP code_1780E1                           ; $17878B |

code_17878E:
  LDA #$2E                                  ; $17878E |
  JSR code_1FEC5D                           ; $178790 |
  LDX #$01                                  ; $178793 |
  JSR code_17884A                           ; $178795 |
code_178798:
  LDA #$73                                  ; $178798 |
  STA $0200                                 ; $17879A |
  STA $0204                                 ; $17879D |
  LDA #$7B                                  ; $1787A0 |
  STA $0208                                 ; $1787A2 |
  STA $020C                                 ; $1787A5 |
  JSR code_17851E                           ; $1787A8 |
  LDA $14                                   ; $1787AB |
  AND #$C0                                  ; $1787AD |
  BEQ code_178798                           ; $1787AF |
  LDX #$00                                  ; $1787B1 |
  JSR code_17884A                           ; $1787B3 |
  JMP code_1783D0                           ; $1787B6 |

code_1787B9:
  LDA $6E                                   ; $1787B9 |
  STA $04                                   ; $1787BB |
  STA $05                                   ; $1787BD |
  STA $06                                   ; $1787BF |
  LDA $6D                                   ; $1787C1 |
  STA $07                                   ; $1787C3 |
  STA $08                                   ; $1787C5 |
  STA $09                                   ; $1787C7 |
  LDY #$06                                  ; $1787C9 |
code_1787CB:
  LSR $04                                   ; $1787CB |
  LSR $07                                   ; $1787CD |
  CPY #$04                                  ; $1787CF |
  BCS code_1787D7                           ; $1787D1 |
  LSR $05                                   ; $1787D3 |
  LSR $08                                   ; $1787D5 |
code_1787D7:
  DEY                                       ; $1787D7 |
  BNE code_1787CB                           ; $1787D8 |
  LDY #$06                                  ; $1787DA |
code_1787DC:
  LDA $0004,y                               ; $1787DC |
  AND #$07                                  ; $1787DF |
  STA $0004,y                               ; $1787E1 |
  DEY                                       ; $1787E4 |
  BNE code_1787DC                           ; $1787E5 |
  LDA #$02                                  ; $1787E7 |
  STA $00                                   ; $1787E9 |
code_1787EB:
  LDY $00                                   ; $1787EB |
  LDA $90E0,y                               ; $1787ED |
  CLC                                       ; $1787F0 |
  ADC $0004,y                               ; $1787F1 |
  TAX                                       ; $1787F4 |
  LDA $90E4,x                               ; $1787F5 |
  TAY                                       ; $1787F8 |
  LSR                                       ; $1787F9 |
  TAX                                       ; $1787FA |
  LDA #$8B                                  ; $1787FB |
  STA $0211,y                               ; $1787FD |
  LDA #$03                                  ; $178800 |
  STA $0212,y                               ; $178802 |
  LDA $9121,x                               ; $178805 |
  STA $0210,y                               ; $178808 |
  LDA $9122,x                               ; $17880B |
  STA $0213,y                               ; $17880E |
  LDY $00                                   ; $178811 |
  LDA $0007,y                               ; $178813 |
  CLC                                       ; $178816 |
  ADC $90E0,y                               ; $178817 |
  TAX                                       ; $17881A |
  LDA $0004,y                               ; $17881B |
  CMP $0007,y                               ; $17881E |
  BNE code_178829                           ; $178821 |
  LDA $90FB,x                               ; $178823 |
  JMP code_17882C                           ; $178826 |

code_178829:
  LDA $90E4,x                               ; $178829 |
code_17882C:
  TAY                                       ; $17882C |
  LSR                                       ; $17882D |
  TAX                                       ; $17882E |
  LDA #$8C                                  ; $17882F |
  STA $0211,y                               ; $178831 |
  LDA #$02                                  ; $178834 |
  STA $0212,y                               ; $178836 |
  LDA $9121,x                               ; $178839 |
  STA $0210,y                               ; $17883C |
  LDA $9122,x                               ; $17883F |
  STA $0213,y                               ; $178842 |
  DEC $00                                   ; $178845 |
  BPL code_1787EB                           ; $178847 |
  RTS                                       ; $178849 |

code_17884A:
  LDY $9073,x                               ; $17884A |
  LDX #$00                                  ; $17884D |
code_17884F:
  LDA $9078,y                               ; $17884F |
  STA $0780,x                               ; $178852 |
  CMP #$FF                                  ; $178855 |
  BEQ code_17885D                           ; $178857 |
  INY                                       ; $178859 |
  INX                                       ; $17885A |
  BNE code_17884F                           ; $17885B |
code_17885D:
  STA $19                                   ; $17885D |
  RTS                                       ; $17885F |

code_178860:
  LDA #$00                                  ; $178860 |
  STA $95                                   ; $178862 |
  LDA $6C                                   ; $178864 |
  CMP #$08                                  ; $178866 |
  BCC code_17887B                           ; $178868 |
  CMP #$0B                                  ; $17886A |
  BEQ code_178878                           ; $17886C |
  CMP #$0C                                  ; $17886E |
  BCS code_178875                           ; $178870 |
  JMP code_179272                           ; $178872 |

code_178875:
  JMP code_1792CD                           ; $178875 |

code_178878:
  JMP code_179331                           ; $178878 |

code_17887B:
  LDY $6C                                   ; $17887B |
  LDA $F2B2,y                               ; $17887D |
  AND $67                                   ; $178880 |
  BEQ code_178887                           ; $178882 |
  JMP code_1780E1                           ; $178884 |

code_178887:
  LDA $6E                                   ; $178887 |
  STA $67                                   ; $178889 |
  JSR code_1EC3F1                           ; $17888B |
  JSR code_1EC39D                           ; $17888E |
  JSR code_1EC38F                           ; $178891 |
  JSR code_1EC3B8                           ; $178894 |
  JSR async_next_frame                      ; $178897 |
  JSR code_1EC2D1                           ; $17889A |
  JSR code_1FF3F2                           ; $17889D |
  LDA #$01                                  ; $1788A0 |
  JSR code_1FFFB7                           ; $1788A2 |
  LDA #$10                                  ; $1788A5 |
  STA $26                                   ; $1788A7 |
  LDA #$0F                                  ; $1788A9 |
  STA $27                                   ; $1788AB |
  LDA #$00                                  ; $1788AD |
  STA $10                                   ; $1788AF |
  LDA #$03                                  ; $1788B1 |
  STA $23                                   ; $1788B3 |
  JSR code_1EDAFC                           ; $1788B5 |
  LDA #$08                                  ; $1788B8 |
  STA $10                                   ; $1788BA |
  LDA #$04                                  ; $1788BC |
  STA $23                                   ; $1788BE |
  JSR code_1EDAFC                           ; $1788C0 |
  LDY #$98                                  ; $1788C3 |
  JSR code_1789FC                           ; $1788C5 |
  LDA #$01                                  ; $1788C8 |
  STA {entity_type}                         ; $1788CA |
  LDX #$00                                  ; $1788CD |
  STX {x_position_high}                     ; $1788CF |
  STX {y_position_high}                     ; $1788D2 |
  STX {entity_display_flags}                ; $1788D5 |
  LDA #$1B                                  ; $1788D8 |
  JSR code_1FEA98                           ; $1788DA |
  LDA #$6C                                  ; $1788DD |
  STA {y_position_low}                      ; $1788DF |
  LDA #$80                                  ; $1788E2 |
  STA {x_position_low}                      ; $1788E4 |
  LDA #$57                                  ; $1788E7 |
  STA $FA                                   ; $1788E9 |
  LDA #$CE                                  ; $1788EB |
  STA $9B                                   ; $1788ED |
  LDA #$06                                  ; $1788EF |
  STA $99                                   ; $1788F1 |
  JSR code_1EC2DB                           ; $1788F3 |
  JSR async_next_frame                      ; $1788F6 |
  LDA #$14                                  ; $1788F9 |
  JSR code_1FEC5B                           ; $1788FB |
  JSR code_1EC3EB                           ; $1788FE |
code_178901:
  INC $95                                   ; $178901 |
  DEC $FA                                   ; $178903 |
  DEC $FA                                   ; $178905 |
  DEC $FA                                   ; $178907 |
  DEC $9B                                   ; $178909 |
  DEC $9B                                   ; $17890B |
  DEC $9B                                   ; $17890D |
  DEC $95                                   ; $17890F |
  JSR async_next_frame                      ; $178911 |
  LDA $FA                                   ; $178914 |
  BNE code_178901                           ; $178916 |
  STA $9D                                   ; $178918 |
  LDA #$30                                  ; $17891A |
  STA $0F                                   ; $17891C |
  LDA #$04                                  ; $17891E |
  STA $0E                                   ; $178920 |
  JSR code_178A3A                           ; $178922 |
code_178925:
  LDA $9D                                   ; $178925 |
  AND #$07                                  ; $178927 |
  BNE code_178948                           ; $178929 |
  LDY #$07                                  ; $17892B |
code_17892D:
  LDA $0630,y                               ; $17892D |
  SEC                                       ; $178930 |
  SBC $0F                                   ; $178931 |
  BCS code_178937                           ; $178933 |
  LDA #$0F                                  ; $178935 |
code_178937:
  STA $0610,y                               ; $178937 |
  DEY                                       ; $17893A |
  BPL code_17892D                           ; $17893B |
  STY $18                                   ; $17893D |
  LDA $0F                                   ; $17893F |
  BEQ code_178948                           ; $178941 |
  SEC                                       ; $178943 |
  SBC #$10                                  ; $178944 |
  STA $0F                                   ; $178946 |
code_178948:
  JSR code_178A4A                           ; $178948 |
  LDA {animation_frame}                     ; $17894B |
  ORA {animation_timer}                     ; $17894E |
  BNE code_178925                           ; $178951 |
  DEC $0E                                   ; $178953 |
  BNE code_178925                           ; $178955 |
  STA $9D                                   ; $178957 |
  LDA #$02                                  ; $178959 |
  STA $0E                                   ; $17895B |
code_17895D:
  LDA $9D                                   ; $17895D |
  AND #$07                                  ; $17895F |
  BNE code_17898D                           ; $178961 |
  TAY                                       ; $178963 |
  LDX #$20                                  ; $178964 |
  LDA $9D                                   ; $178966 |
  AND #$08                                  ; $178968 |
  BEQ code_178971                           ; $17896A |
  LDA $6C                                   ; $17896C |
  ASL                                       ; $17896E |
  ASL                                       ; $17896F |
  TAX                                       ; $178970 |
code_178971:
  LDA $8ED7,x                               ; $178971 |
  STA $0610,y                               ; $178974 |
  STA $0630,y                               ; $178977 |
  LDA $8EFB,y                               ; $17897A |
  STA $0614,y                               ; $17897D |
  STA $0634,y                               ; $178980 |
  INX                                       ; $178983 |
  INY                                       ; $178984 |
  CPY #$04                                  ; $178985 |
  BNE code_178971                           ; $178987 |
  LDA #$FF                                  ; $178989 |
  STA $18                                   ; $17898B |
code_17898D:
  JSR code_178A4A                           ; $17898D |
  LDA {animation_frame}                     ; $178990 |
  ORA {animation_timer}                     ; $178993 |
  BNE code_17895D                           ; $178996 |
  DEC $0E                                   ; $178998 |
  BNE code_17895D                           ; $17899A |
  LDA #$3C                                  ; $17899C |
  JSR code_178A7D                           ; $17899E |
  LDY #$04                                  ; $1789A1 |
code_1789A3:
  LDA $8FDB,y                               ; $1789A3 |
  STA $0780,y                               ; $1789A6 |
  DEY                                       ; $1789A9 |
  BPL code_1789A3                           ; $1789AA |
  LDX $6C                                   ; $1789AC |
  LDY $8EFF,x                               ; $1789AE |
code_1789B1:
  LDA $8F07,y                               ; $1789B1 |
  CMP #$20                                  ; $1789B4 |
  BEQ code_1789DE                           ; $1789B6 |
  CMP #$5C                                  ; $1789B8 |
  BEQ code_1789D0                           ; $1789BA |
  STA $0783                                 ; $1789BC |
  PHA                                       ; $1789BF |
  LDA #$FF                                  ; $1789C0 |
  STA $19                                   ; $1789C2 |
  LDA #$08                                  ; $1789C4 |
  JSR code_178A7D                           ; $1789C6 |
  PLA                                       ; $1789C9 |
  CMP #$2E                                  ; $1789CA |
  BEQ code_1789E4                           ; $1789CC |
  BNE code_1789DE                           ; $1789CE |
code_1789D0:
  INY                                       ; $1789D0 |
  LDA $8F07,y                               ; $1789D1 |
  STA $0780                                 ; $1789D4 |
  LDA $8F08,y                               ; $1789D7 |
  STA $0781                                 ; $1789DA |
  INY                                       ; $1789DD |
code_1789DE:
  INY                                       ; $1789DE |
  INC $0781                                 ; $1789DF |
  BNE code_1789B1                           ; $1789E2 |
code_1789E4:
  LDX $8F08,y                               ; $1789E4 |
  LDA #$9C                                  ; $1789E7 |
  STA $B0,x                                 ; $1789E9 |
  LDX $8F09,y                               ; $1789EB |
  BEQ code_1789F4                           ; $1789EE |
  LDA #$9C                                  ; $1789F0 |
  STA $B0,x                                 ; $1789F2 |
code_1789F4:
  LDA #$B4                                  ; $1789F4 |
  JSR code_178A7D                           ; $1789F6 |
  JMP code_17853B                           ; $1789F9 |

code_1789FC:
  LDA $8B74,y                               ; $1789FC |
  STA $EA                                   ; $1789FF |
  LDA $8B75,y                               ; $178A01 |
  STA $EB                                   ; $178A04 |
  LDA $8B76,y                               ; $178A06 |
  STA $EC                                   ; $178A09 |
  LDA $8B77,y                               ; $178A0B |
  STA $ED                                   ; $178A0E |
  LDA $8B78,y                               ; $178A10 |
  STA $EE                                   ; $178A13 |
  LDA $8B79,y                               ; $178A15 |
  STA $EF                                   ; $178A18 |
  LDX #$00                                  ; $178A1A |
code_178A1C:
  LDA $8B7A,y                               ; $178A1C |
  STA $0620,x                               ; $178A1F |
  INY                                       ; $178A22 |
  INX                                       ; $178A23 |
  CPX #$20                                  ; $178A24 |
  BNE code_178A1C                           ; $178A26 |
  RTS                                       ; $178A28 |

code_178A29:
  STA $00                                   ; $178A29 |
  LDX #$00                                  ; $178A2B |
code_178A2D:
  LDA $8C96,y                               ; $178A2D |
  STA $0200,x                               ; $178A30 |
  INY                                       ; $178A33 |
  INX                                       ; $178A34 |
  CPX $00                                   ; $178A35 |
  BNE code_178A2D                           ; $178A37 |
  RTS                                       ; $178A39 |

code_178A3A:
  LDY #$3F                                  ; $178A3A |
code_178A3C:
  LDA $8FE0,y                               ; $178A3C |
  STA $02C0,y                               ; $178A3F |
  DEY                                       ; $178A42 |
  BPL code_178A3C                           ; $178A43 |
  LDA #$49                                  ; $178A45 |
  STA $ED                                   ; $178A47 |
  RTS                                       ; $178A49 |

code_178A4A:
  LDX #$3C                                  ; $178A4A |
code_178A4C:
  DEC $02C3,x                               ; $178A4C |
  INC $02C0,x                               ; $178A4F |
  LDA $02C0,x                               ; $178A52 |
  CMP #$F0                                  ; $178A55 |
  BNE code_178A5E                           ; $178A57 |
  LDA #$00                                  ; $178A59 |
  STA $02C0,x                               ; $178A5B |
code_178A5E:
  CPX #$20                                  ; $178A5E |
  BCS code_178A74                           ; $178A60 |
  DEC $02C3,x                               ; $178A62 |
  INC $02C0,x                               ; $178A65 |
  LDA $02C0,x                               ; $178A68 |
  CMP #$F0                                  ; $178A6B |
  BNE code_178A74                           ; $178A6D |
  LDA #$00                                  ; $178A6F |
  STA $02C0,x                               ; $178A71 |
code_178A74:
  DEX                                       ; $178A74 |
  DEX                                       ; $178A75 |
  DEX                                       ; $178A76 |
  DEX                                       ; $178A77 |
  BPL code_178A4C                           ; $178A78 |
  JMP code_1FF391                           ; $178A7A |

code_178A7D:
  STA $08                                   ; $178A7D |
  STX $09                                   ; $178A7F |
  STY $0A                                   ; $178A81 |
code_178A83:
  LDA #$00                                  ; $178A83 |
  STA {animation_timer}                     ; $178A85 |
  JSR code_178A4A                           ; $178A88 |
  DEC $08                                   ; $178A8B |
  BNE code_178A83                           ; $178A8D |
  LDX $09                                   ; $178A8F |
  LDY $0A                                   ; $178A91 |
  RTS                                       ; $178A93 |

code_178A94:
  LDY #$1C                                  ; $178A94 |
code_178A96:
  LDA $8E52,y                               ; $178A96 |
  STA $0780,y                               ; $178A99 |
  DEY                                       ; $178A9C |
  BPL code_178A96                           ; $178A9D |
  LDA $6E                                   ; $178A9F |
  STA $00                                   ; $178AA1 |
  LDA #$0E                                  ; $178AA3 |
  STA $01                                   ; $178AA5 |
code_178AA7:
  ASL $00                                   ; $178AA7 |
  BCC code_178AEA                           ; $178AA9 |
  LDY $01                                   ; $178AAB |
  LDA $8E6F,y                               ; $178AAD |
  STA $0780                                 ; $178AB0 |
  STA $0787                                 ; $178AB3 |
  STA $078E                                 ; $178AB6 |
  STA $0795                                 ; $178AB9 |
  LDA $8E70,y                               ; $178ABC |
  STA $0781                                 ; $178ABF |
  CLC                                       ; $178AC2 |
  ADC #$20                                  ; $178AC3 |
  STA $0788                                 ; $178AC5 |
  ADC #$20                                  ; $178AC8 |
  STA $078F                                 ; $178ACA |
  ADC #$20                                  ; $178ACD |
  STA $0796                                 ; $178ACF |
  LDX $8E7F,y                               ; $178AD2 |
  LDA $8E80,y                               ; $178AD5 |
  STA $02                                   ; $178AD8 |
  LDA #$F8                                  ; $178ADA |
code_178ADC:
  STA $0200,x                               ; $178ADC |
  INX                                       ; $178ADF |
  INX                                       ; $178AE0 |
  INX                                       ; $178AE1 |
  INX                                       ; $178AE2 |
  DEC $02                                   ; $178AE3 |
  BNE code_178ADC                           ; $178AE5 |
  JSR code_1EC298                           ; $178AE7 |
code_178AEA:
  DEC $01                                   ; $178AEA |
  DEC $01                                   ; $178AEC |
  BPL code_178AA7                           ; $178AEE |
  RTS                                       ; $178AF0 |

code_178AF1:
  LDA $6E                                   ; $178AF1 |
  CMP #$FF                                  ; $178AF3 |
  BNE code_178B2D                           ; $178AF5 |
  LDA #$10                                  ; $178AF7 |
  STA $9D                                   ; $178AF9 |
code_178AFB:
  LDA $0610                                 ; $178AFB |
  EOR #$3F                                  ; $178AFE |
  STA $0610                                 ; $178B00 |
  LDA #$FF                                  ; $178B03 |
  STA $18                                   ; $178B05 |
  LDA #$02                                  ; $178B07 |
  JSR async_next_frame.a                    ; $178B09 |
  DEC $9D                                   ; $178B0C |
  BNE code_178AFB                           ; $178B0E |
  LDY #$21                                  ; $178B10 |
code_178B12:
  LDA $8E8F,y                               ; $178B12 |
  STA $0780,y                               ; $178B15 |
  DEY                                       ; $178B18 |
  BPL code_178B12                           ; $178B19 |
  STY $19                                   ; $178B1B |
  LDX #$20                                  ; $178B1D |
  LDY #$00                                  ; $178B1F |
code_178B21:
  LDA $8EB1,y                               ; $178B21 |
  STA $0200,x                               ; $178B24 |
  INX                                       ; $178B27 |
  INY                                       ; $178B28 |
  CPY #$20                                  ; $178B29 |
  BNE code_178B21                           ; $178B2B |
code_178B2D:
  RTS                                       ; $178B2D |

code_178B2E:
  LDY #$1C                                  ; $178B2E |
code_178B30:
  LDA $8E52,y                               ; $178B30 |
  STA $0780,y                               ; $178B33 |
  STA $079C,y                               ; $178B36 |
  STA $07B8,y                               ; $178B39 |
  DEY                                       ; $178B3C |
  BPL code_178B30                           ; $178B3D |
  LDX #$38                                  ; $178B3F |
  LDY #$04                                  ; $178B41 |
code_178B43:
  LDA $8ED1,y                               ; $178B43 |
  STA $0780,x                               ; $178B46 |
  STA $0787,x                               ; $178B49 |
  STA $078E,x                               ; $178B4C |
  STA $0795,x                               ; $178B4F |
  LDA $8ED2,y                               ; $178B52 |
  STA $0781,x                               ; $178B55 |
  CLC                                       ; $178B58 |
  ADC #$20                                  ; $178B59 |
  STA $0788,x                               ; $178B5B |
  ADC #$20                                  ; $178B5E |
  STA $078F,x                               ; $178B60 |
  ADC #$20                                  ; $178B63 |
  STA $0796,x                               ; $178B65 |
  TXA                                       ; $178B68 |
  SEC                                       ; $178B69 |
  SBC #$1C                                  ; $178B6A |
  TAX                                       ; $178B6C |
  DEY                                       ; $178B6D |
  DEY                                       ; $178B6E |
  BPL code_178B43                           ; $178B6F |
  STY $19                                   ; $178B71 |
  RTS                                       ; $178B73 |

  db $C4, $C6, $00, $00, $08, $00, $0F, $21 ; $178B74 |
  db $20, $11, $0F, $26, $20, $16, $0F, $26 ; $178B7C |
  db $28, $16, $0F, $17, $27, $06, $0F, $00 ; $178B84 |
  db $00, $00, $0F, $00, $00, $00, $0F, $11 ; $178B8C |
  db $21, $16, $0F, $00, $00, $00, $C8, $CA ; $178B94 |
  db $00, $00, $08, $09, $0F, $20, $21, $11 ; $178B9C |
  db $0F, $20, $2A, $1A, $0F, $20, $27, $17 ; $178BA4 |
  db $0F, $20, $26, $16, $0F, $0F, $36, $26 ; $178BAC |
  db $0F, $0F, $20, $36, $0F, $26, $2C, $11 ; $178BB4 |
  db $0F, $27, $36, $26, $CC, $CE, $00, $00 ; $178BBC |
  db $00, $00, $0F, $27, $38, $02, $0F, $17 ; $178BC4 |
  db $27, $02, $0F, $20, $32, $22, $0F, $0F ; $178BCC |
  db $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F ; $178BD4 |
  db $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F ; $178BDC |
  db $0F, $0F, $D0, $D2, $00, $00, $08, $00 ; $178BE4 |
  db $0F, $20, $2C, $1C, $0F, $20, $16, $06 ; $178BEC |
  db $0F, $1C, $0C, $01, $0F, $20, $11, $02 ; $178BF4 |
  db $0F, $0F, $0F, $0F, $0F, $0F, $20, $36 ; $178BFC |
  db $0F, $0F, $20, $11, $0F, $0F, $20, $16 ; $178C04 |
  db $D2, $00, $00, $00, $00, $00, $0F, $20 ; $178C0C |
  db $26, $17, $0F, $20, $26, $17, $0F, $0F ; $178C14 |
  db $0F, $0B, $0F, $20, $0F, $0F, $0F, $0F ; $178C1C |
  db $2C, $11, $0F, $0F, $20, $37, $0F, $00 ; $178C24 |
  db $00, $00, $0F, $00, $00, $00, $0F, $20 ; $178C2C |
  db $2C, $1C, $0F, $31, $1C, $27, $0F, $31 ; $178C34 |
  db $1C, $01, $0F, $20, $0F, $0F, $0F, $0F ; $178C3C |
  db $2C, $11, $0F, $0F, $20, $37, $0F, $0F ; $178C44 |
  db $20, $11, $0F, $0F, $20, $15, $0F, $0F ; $178C4C |
  db $20, $2C, $0F, $0F, $27, $11, $0F, $0F ; $178C54 |
  db $20, $16, $0F, $0F, $38, $27, $0F, $0F ; $178C5C |
  db $20, $26, $0F, $0F, $20, $29, $0F, $0F ; $178C64 |
  db $20, $28, $0F, $0F, $27, $17, $0F, $0F ; $178C6C |
  db $10, $16, $0F, $0F, $20, $26, $0F, $0F ; $178C74 |
  db $20, $15, $0F, $0F, $27, $12, $0F, $0F ; $178C7C |
  db $20, $2C, $0F, $0F, $20, $1A, $78, $78 ; $178C84 |
  db $78, $76, $74, $C8, $40, $30, $20, $10 ; $178C8C |
  db $00, $00, $A7, $86, $02, $28, $F8, $90 ; $178C94 |
  db $02, $C0, $F8, $A0, $02, $C0, $F8, $B0 ; $178C9C |
  db $02, $C0, $57, $8D, $01, $68, $57, $8D ; $178CA4 |
  db $01, $6F, $57, $8D, $01, $88, $57, $8D ; $178CAC |
  db $01, $8F, $7F, $8D, $01, $68, $7F, $8D ; $178CB4 |
  db $01, $6F, $7F, $8D, $01, $88, $7F, $8D ; $178CBC |
  db $01, $8F, $67, $91, $00, $74, $67, $91 ; $178CC4 |
  db $40, $84, $6F, $92, $00, $74, $6F, $93 ; $178CCC |
  db $00, $7C, $6F, $94, $00, $84, $77, $95 ; $178CD4 |
  db $00, $74, $77, $96, $00, $7C, $77, $97 ; $178CDC |
  db $00, $84, $27, $AD, $03, $2C, $2F, $AE ; $178CE4 |
  db $03, $28, $2F, $AF, $03, $30, $1F, $B3 ; $178CEC |
  db $02, $78, $1F, $B4, $02, $80, $2F, $B5 ; $178CF4 |
  db $03, $78, $2F, $B6, $03, $80, $37, $B7 ; $178CFC |
  db $03, $78, $37, $B8, $03, $80, $1F, $B9 ; $178D04 |
  db $02, $C0, $1F, $BA, $02, $C8, $27, $BB ; $178D0C |
  db $02, $C0, $27, $BC, $02, $C8, $2F, $BD ; $178D14 |
  db $03, $C8, $2F, $BE, $03, $D0, $37, $BF ; $178D1C |
  db $02, $C8, $5F, $C0, $02, $38, $77, $C1 ; $178D24 |
  db $03, $28, $77, $C2, $03, $30, $5F, $C3 ; $178D2C |
  db $03, $C8, $5F, $C4, $03, $D0, $67, $C5 ; $178D34 |
  db $03, $C8, $67, $C6, $03, $D0, $6F, $C7 ; $178D3C |
  db $03, $C8, $6F, $C8, $03, $D0, $9F, $C9 ; $178D44 |
  db $03, $20, $9F, $CA, $03, $28, $9F, $CB ; $178D4C |
  db $03, $38, $A7, $CC, $03, $28, $A7, $CD ; $178D54 |
  db $03, $30, $AF, $CE, $03, $28, $AF, $CF ; $178D5C |
  db $03, $30, $A7, $D3, $02, $88, $AF, $D0 ; $178D64 |
  db $03, $78, $AF, $D1, $03, $80, $AF, $D4 ; $178D6C |
  db $02, $88, $B7, $D2, $03, $78, $9F, $D5 ; $178D74 |
  db $03, $C8, $A7, $D6, $03, $C8, $AF, $D7 ; $178D7C |
  db $03, $C8, $B7, $D8, $03, $C8, $17, $57 ; $178D84 |
  db $97, $18, $68, $B8, $FF, $01, $03, $FD ; $178D8C |
  db $00, $00, $00, $00, $28, $28, $28, $28 ; $178D94 |
  db $00, $07, $20, $27, $00, $07, $20, $27 ; $178D9C |
  db $02, $00, $07, $05, $08, $06, $01, $04 ; $178DA4 |
  db $03, $30, $70, $B0, $30, $80, $D0, $03 ; $178DAC |
  db $30, $10, $0D, $3E, $20, $3A, $1F, $0C ; $178DB4 |
  db $10, $09, $1D, $1E, $0C, $09, $15, $00 ; $178DBC |
  db $04, $00, $04, $00, $00, $04, $00, $2A ; $178DC4 |
  db $0A, $00, $00, $FF, $20, $47, $52, $41 ; $178DCC |
  db $56, $49, $54, $59, $20, $4D, $41, $4E ; $178DD4 |
  db $20, $20, $20, $20, $20, $20, $57, $41 ; $178DDC |
  db $56, $45, $20, $4D, $41, $4E, $20, $20 ; $178DE4 |
  db $20, $20, $20, $20, $20, $20, $53, $54 ; $178DEC |
  db $4F, $4E, $45, $20, $4D, $41, $4E, $20 ; $178DF4 |
  db $20, $20, $20, $20, $20, $20, $47, $59 ; $178DFC |
  db $52, $4F, $20, $4D, $41, $4E, $20, $20 ; $178E04 |
  db $20, $20, $20, $20, $20, $20, $53, $54 ; $178E0C |
  db $41, $52, $20, $4D, $41, $4E, $20, $20 ; $178E14 |
  db $20, $20, $20, $20, $20, $43, $48, $41 ; $178E1C |
  db $52, $47, $45, $20, $4D, $41, $4E, $20 ; $178E24 |
  db $20, $20, $20, $20, $20, $4E, $41, $50 ; $178E2C |
  db $41, $4C, $4D, $20, $4D, $41, $4E, $20 ; $178E34 |
  db $20, $20, $20, $20, $20, $43, $52, $59 ; $178E3C |
  db $53, $54, $41, $4C, $20, $4D, $41, $4E ; $178E44 |
  db $20, $20, $20, $20, $5B, $5C, $20, $00 ; $178E4C |
  db $03, $00, $00, $00, $00, $20, $00, $03 ; $178E54 |
  db $00, $00, $00, $00, $20, $00, $03, $00 ; $178E5C |
  db $00, $00, $00, $20, $00, $03, $00, $00 ; $178E64 |
  db $00, $00, $FF, $20, $8E, $22, $84, $20 ; $178E6C |
  db $84, $22, $98, $22, $8E, $21, $84, $21 ; $178E74 |
  db $98, $20, $98, $4C, $06, $A4, $07, $40 ; $178E7C |
  db $03, $D4, $04, $C0, $05, $80, $03, $8C ; $178E84 |
  db $06, $64, $07, $21, $8E, $03, $10, $11 ; $178E8C |
  db $16, $12, $21, $AE, $03, $20, $21, $26 ; $178E94 |
  db $17, $21, $CE, $03, $3A, $3B, $0B, $3C ; $178E9C |
  db $21, $EE, $03, $5C, $5D, $5E, $5F, $23 ; $178EA4 |
  db $DB, $01, $CC, $33, $FF, $67, $D3, $02 ; $178EAC |
  db $88, $6F, $D9, $00, $70, $6F, $DA, $00 ; $178EB4 |
  db $78, $6F, $DB, $00, $80, $6F, $D4, $02 ; $178EBC |
  db $88, $77, $DC, $00, $74, $77, $DD, $00 ; $178EC4 |
  db $7C, $F8, $00, $00, $00, $21, $8E, $21 ; $178ECC |
  db $98, $22, $84, $0F, $0F, $20, $14, $0F ; $178ED4 |
  db $0F, $20, $11, $0F, $0F, $20, $07, $0F ; $178EDC |
  db $0F, $20, $1A, $0F, $0F, $28, $17, $0F ; $178EE4 |
  db $0F, $20, $26, $0F, $0F, $27, $12, $0F ; $178EEC |
  db $0F, $20, $2C, $0F, $0F, $2C, $11, $0F ; $178EF4 |
  db $0F, $20, $37, $00, $17, $2C, $42, $69 ; $178EFC |
  db $92, $A8, $BE, $59, $4F, $55, $20, $47 ; $178F04 |
  db $4F, $54, $20, $47, $52, $41, $56, $49 ; $178F0C |
  db $54, $59, $20, $48, $4F, $4C, $44, $2E ; $178F14 |
  db $07, $00, $59, $4F, $55, $20, $47, $4F ; $178F1C |
  db $54, $20, $57, $41, $54, $45, $52, $20 ; $178F24 |
  db $57, $41, $56, $45, $2E, $01, $00, $59 ; $178F2C |
  db $4F, $55, $20, $47, $4F, $54, $20, $50 ; $178F34 |
  db $4F, $57, $45, $52, $20, $53, $54, $4F ; $178F3C |
  db $4E, $45, $2E, $06, $00, $59, $4F, $55 ; $178F44 |
  db $20, $47, $4F, $54, $20, $47, $59, $52 ; $178F4C |
  db $4F, $20, $41, $54, $54, $41, $43, $4B ; $178F54 |
  db $5C, $2B, $0D, $41, $4E, $44, $5C, $2B ; $178F5C |
  db $4B, $52, $55, $53, $48, $20, $4A, $45 ; $178F64 |
  db $54, $2E, $02, $0B, $59, $4F, $55, $20 ; $178F6C |
  db $47, $4F, $54, $20, $53, $54, $41, $52 ; $178F74 |
  db $20, $43, $52, $41, $53, $48, $5C, $2B ; $178F7C |
  db $0D, $41, $4E, $44, $5C, $2B, $49, $53 ; $178F84 |
  db $55, $50, $45, $52, $20, $41, $52, $52 ; $178F8C |
  db $4F, $57, $2E, $05, $09, $59, $4F, $55 ; $178F94 |
  db $20, $47, $4F, $54, $20, $43, $48, $41 ; $178F9C |
  db $52, $47, $45, $20, $4B, $49, $43, $4B ; $178FA4 |
  db $2E, $08, $00, $59, $4F, $55, $20, $47 ; $178FAC |
  db $4F, $54, $20, $4E, $41, $50, $41, $4C ; $178FB4 |
  db $4D, $20, $42, $4F, $4D, $42, $2E, $04 ; $178FBC |
  db $00, $59, $4F, $55, $20, $47, $4F, $54 ; $178FC4 |
  db $20, $43, $52, $59, $53, $54, $41, $4C ; $178FCC |
  db $20, $45, $59, $45, $2E, $03, $00, $2A ; $178FD4 |
  db $C6, $00, $00, $FF, $10, $76, $21, $20 ; $178FDC |
  db $20, $76, $21, $40, $30, $76, $21, $98 ; $178FE4 |
  db $18, $76, $21, $C8, $D0, $76, $21, $10 ; $178FEC |
  db $B8, $76, $21, $50, $C8, $76, $21, $88 ; $178FF4 |
  db $C0, $76, $21, $C8, $30, $77, $21, $20 ; $178FFC |
  db $18, $77, $21, $60, $08, $77, $21, $B0 ; $179004 |
  db $28, $77, $21, $D8, $C8, $77, $21, $20 ; $17900C |
  db $E8, $77, $21, $30, $B0, $77, $21, $B8 ; $179014 |
  db $E0, $77, $21, $D0, $F8, $00, $00, $00 ; $17901C |
  db $33, $8E, $01, $C4, $33, $8E, $41, $CC ; $179024 |
  db $3B, $8E, $81, $C4, $3B, $8E, $C1, $CC ; $17902C |
  db $33, $33, $73, $C4, $D4, $C4, $00, $00 ; $179034 |
  db $04, $00, $00, $08, $08, $00, $00, $08 ; $17903C |
  db $08, $00, $08, $00, $08, $00, $18, $00 ; $179044 |
  db $18, $2B, $3B, $4B, $5B, $6B, $7B, $34 ; $17904C |
  db $44, $54, $64, $74, $84, $01, $FA, $FF ; $179054 |
  db $06, $01, $FA, $00, $00, $FF, $06, $2F ; $17905C |
  db $3F, $4F, $5F, $6F, $7F, $38, $48, $58 ; $179064 |
  db $68, $78, $88, $8C, $8B, $02, $03, $00 ; $17906C |
  db $13, $26, $33, $5A, $22, $E9, $0E, $20 ; $179074 |
  db $20, $20, $20, $20, $20, $20, $20, $20 ; $17907C |
  db $20, $20, $20, $20, $20, $20, $FF, $22 ; $179084 |
  db $E9, $0E, $50, $41, $53, $53, $20, $57 ; $17908C |
  db $4F, $52, $44, $20, $45, $52, $52, $4F ; $179094 |
  db $52, $FF, $22, $EC, $08, $47, $41, $4D ; $17909C |
  db $45, $20, $4F, $56, $45, $52, $FF, $22 ; $1790A4 |
  db $CB, $0B, $53, $54, $41, $47, $45, $20 ; $1790AC |
  db $53, $45, $4C, $45, $43, $54, $22, $EC ; $1790B4 |
  db $08, $20, $20, $20, $20, $20, $20, $20 ; $1790BC |
  db $20, $20, $23, $0B, $07, $43, $4F, $4E ; $1790C4 |
  db $54, $49, $4E, $55, $45, $FF, $22, $EB ; $1790CC |
  db $09, $43, $4F, $4E, $54, $49, $4E, $55 ; $1790D4 |
  db $45, $20, $20, $FF, $00, $05, $0E, $03 ; $1790DC |
  db $18, $64, $4C, $30, $07, $50, $0C, $84 ; $1790E4 |
  db $68, $80, $6C, $08, $54, $07, $88, $44 ; $1790EC |
  db $2C, $10, $28, $14, $40, $8C, $03, $78 ; $1790F4 |
  db $04, $04, $78, $07, $20, $3C, $3C, $20 ; $1790FC |
  db $38, $24, $38, $24, $07, $70, $74, $74 ; $179104 |
  db $70, $58, $5C, $58, $5C, $07, $00, $01 ; $17910C |
  db $00, $06, $00, $02, $0B, $05, $09, $08 ; $179114 |
  db $00, $04, $00, $03, $00, $2F, $38, $2F ; $17911C |
  db $48, $2F, $58, $2F, $68, $2F, $78, $2F ; $179124 |
  db $88, $3F, $38, $3F, $48, $3F, $58, $3F ; $17912C |
  db $68, $3F, $78, $3F, $88, $4F, $38, $4F ; $179134 |
  db $48, $4F, $58, $4F, $68, $4F, $78, $4F ; $17913C |
  db $88, $5F, $38, $5F, $48, $5F, $58, $5F ; $179144 |
  db $68, $5F, $78, $5F, $88, $6F, $38, $6F ; $17914C |
  db $48, $6F, $58, $6F, $68, $6F, $78, $6F ; $179154 |
  db $88, $7F, $38, $7F, $48, $7F, $58, $7F ; $17915C |
  db $68, $7F, $78, $7F, $88, $09, $05, $01 ; $179164 |
  db $14, $0A, $01, $0B, $07, $02, $42, $0D ; $17916C |
  db $03, $11, $0C, $04, $20, $13, $05, $0F ; $179174 |
  db $08, $06, $1A, $0E, $06, $08, $03, $07 ; $17917C |
  db $15, $0A, $07, $0B, $03, $08, $1B, $07 ; $179184 |
  db $08, $10, $08, $09, $1B, $0D, $0A, $0F ; $17918C |
  db $07, $0B, $1B, $10, $0C, $0E, $04, $0D ; $179194 |
  db $15, $08, $0D, $0F, $08, $0E, $16, $0B ; $17919C |
  db $0E, $0E, $07, $0F, $1C, $0C, $0F, $00 ; $1791A4 |
  db $00, $00, $00, $00, $00, $0D, $09, $10 ; $1791AC |
  db $1A, $0E, $13, $0D, $04, $11, $17, $09 ; $1791B4 |
  db $14, $00, $00, $00, $03, $01, $12, $00 ; $1791BC |
  db $00, $00, $00, $00, $00                ; $1791C4 |

code_1791C9:
  JSR code_1EC3F1                           ; $1791C9 |
  JSR code_1EC39D                           ; $1791CC |
  JSR code_1EC38F                           ; $1791CF |
  JSR code_1EC3B8                           ; $1791D2 |
  JSR async_next_frame                      ; $1791D5 |
  JSR code_1EC2D1                           ; $1791D8 |
  JSR code_1FF3F2                           ; $1791DB |
  LDA #$20                                  ; $1791DE |
  LDX #$00                                  ; $1791E0 |
  LDY #$00                                  ; $1791E2 |
  JSR code_1EC343                           ; $1791E4 |
  LDY #$4F                                  ; $1791E7 |
code_1791E9:
  LDA $9213,y                               ; $1791E9 |
  STA $0780,y                               ; $1791EC |
  DEY                                       ; $1791EF |
  BPL code_1791E9                           ; $1791F0 |
  JSR code_1EC298                           ; $1791F2 |
  LDY #$0F                                  ; $1791F5 |
code_1791F7:
  LDA $9262,y                               ; $1791F7 |
  STA $0620,y                               ; $1791FA |
  DEY                                       ; $1791FD |
  BPL code_1791F7                           ; $1791FE |
  LDA #$C2                                  ; $179200 |
  STA $EA                                   ; $179202 |
  LDA #$C0                                  ; $179204 |
  STA $EB                                   ; $179206 |
  JSR code_1EC2DB                           ; $179208 |
  JSR code_1EC3EB                           ; $17920B |
  LDA #$78                                  ; $17920E |
  JMP async_next_frame.a                    ; $179210 |

  db $21, $04, $16, $F5, $00, $43, $41, $50 ; $179213 |
  db $43, $4F, $4D, $20, $43, $4F, $2E, $2C ; $17921B |
  db $20, $4C, $54, $44, $2E, $20, $31, $39 ; $179223 |
  db $39, $32, $21, $43, $19, $F5, $00, $43 ; $17922B |
  db $41, $50, $43, $4F, $4D, $20, $55, $2E ; $179233 |
  db $53, $2E, $41, $2E, $2C, $20, $49, $4E ; $17923B |
  db $43, $2E, $20, $31, $39, $39, $32, $22 ; $179243 |
  db $06, $13, $4C, $49, $43, $45, $4E, $53 ; $17924B |
  db $45, $44, $20, $42, $59, $20, $4E, $49 ; $179253 |
  db $4E, $54, $45, $4E, $44, $4F, $FF, $0F ; $17925B |
  db $20, $0F, $0F, $0F, $20, $0F, $0F, $0F ; $179263 |
  db $20, $0F, $0F, $0F, $20, $0F, $0F      ; $17926B |

code_179272:
  JSR code_1EC3F1                           ; $179272 |
  JSR code_1EC38F                           ; $179275 |
  JSR code_1EC3B8                           ; $179278 |
  JSR code_1FF3F2                           ; $17927B |
  JSR async_next_frame                      ; $17927E |
  JSR code_1EC2D1                           ; $179281 |
  LDY #$00                                  ; $179284 |
  JSR code_17968A                           ; $179286 |
  LDA #$00                                  ; $179289 |
  STA $10                                   ; $17928B |
  LDA #$01                                  ; $17928D |
  STA $23                                   ; $17928F |
  JSR code_1EDAFC                           ; $179291 |
  JSR code_1EC2DB                           ; $179294 |
  JSR async_next_frame                      ; $179297 |
  LDA #$0F                                  ; $17929A |
  JSR code_1FEC5B                           ; $17929C |
  JSR code_1EC3EB                           ; $17929F |
  JSR code_17965D                           ; $1792A2 |
  LDA #$08                                  ; $1792A5 |
  STA $26                                   ; $1792A7 |
  STA $6C                                   ; $1792A9 |
  LDY #$00                                  ; $1792AB |
  LDA #$20                                  ; $1792AD |
  STA $9F                                   ; $1792AF |
  JSR code_1796CA                           ; $1792B1 |
  LDY #$00                                  ; $1792B4 |
  LDA $6F                                   ; $1792B6 |
  AND #$0F                                  ; $1792B8 |
  JSR code_1797A3                           ; $1792BA |
  JSR code_179601                           ; $1792BD |
  LDA #$3C                                  ; $1792C0 |
  JSR code_179614                           ; $1792C2 |
  JSR code_1797EA                           ; $1792C5 |
  LDA #$B4                                  ; $1792C8 |
  JMP code_179614                           ; $1792CA |

code_1792CD:
  JSR code_1EC3F1                           ; $1792CD |
  JSR code_1EC38F                           ; $1792D0 |
  JSR code_1EC3B8                           ; $1792D3 |
  JSR code_1FF3F2                           ; $1792D6 |
  JSR async_next_frame                      ; $1792D9 |
  JSR code_1EC2D1                           ; $1792DC |
  LDY #$12                                  ; $1792DF |
  JSR code_17968A                           ; $1792E1 |
  LDA #$00                                  ; $1792E4 |
  STA $10                                   ; $1792E6 |
  STA $23                                   ; $1792E8 |
  JSR code_1EDAFC                           ; $1792EA |
  LDY #$20                                  ; $1792ED |
  LDA #$18                                  ; $1792EF |
  JSR code_1796CA                           ; $1792F1 |
  JSR code_1EC2DB                           ; $1792F4 |
  JSR async_next_frame                      ; $1792F7 |
  JSR code_1EC3EB                           ; $1792FA |
code_1792FD:
  LDA #$10                                  ; $1792FD |
  JSR code_1FEC5B                           ; $1792FF |
  JSR code_17965D                           ; $179302 |
  LDA #$0C                                  ; $179305 |
  STA $26                                   ; $179307 |
  STA $6C                                   ; $179309 |
  LDY #$20                                  ; $17930B |
  LDA #$38                                  ; $17930D |
  STA $9F                                   ; $17930F |
  JSR code_1796CA                           ; $179311 |
  LDY #$04                                  ; $179314 |
  LDA $6F                                   ; $179316 |
  LSR                                       ; $179318 |
  LSR                                       ; $179319 |
  LSR                                       ; $17931A |
  LSR                                       ; $17931B |
  AND #$0F                                  ; $17931C |
  JSR code_1797A3                           ; $17931E |
  JSR code_179601                           ; $179321 |
  LDA #$3C                                  ; $179324 |
  JSR code_179614                           ; $179326 |
  JSR code_1797EA                           ; $179329 |
  LDA #$B4                                  ; $17932C |
  JMP code_179614                           ; $17932E |

code_179331:
  JSR code_1796BB                           ; $179331 |
  STY $18                                   ; $179334 |
  LDA #$B4                                  ; $179336 |
  STA {y_position_low}                      ; $179338 |
  LDA #$38                                  ; $17933B |
  STA {x_position_low}                      ; $17933D |
  JSR code_1EC39D                           ; $179340 |
  JSR code_1FF363                           ; $179343 |
  LDA #$00                                  ; $179346 |
  STA $05F2                                 ; $179348 |
  STA $2D                                   ; $17934B |
  STA $2E                                   ; $17934D |
  STA $2F                                   ; $17934F |
  LDA #$0F                                  ; $179351 |
  STA $A9                                   ; $179353 |
  JSR code_1EC3F1                           ; $179355 |
  LDA #$01                                  ; $179358 |
  JSR code_1FFFB7                           ; $17935A |
  LDA #$06                                  ; $17935D |
  STA $23                                   ; $17935F |
  LDA #$28                                  ; $179361 |
  STA $10                                   ; $179363 |
  JSR code_1EDB23                           ; $179365 |
  LDA #$02                                  ; $179368 |
  STA $FD                                   ; $17936A |
  LDA #$C2                                  ; $17936C |
  STA $EA                                   ; $17936E |
  LDA #$C0                                  ; $179370 |
  STA $EB                                   ; $179372 |
  LDA #$20                                  ; $179374 |
  STA $0601                                 ; $179376 |
  JSR code_1796BB                           ; $179379 |
  LDA #$FF                                  ; $17937C |
  STA $18                                   ; $17937E |
  LDY #$00                                  ; $179380 |
  JSR code_1796DB                           ; $179382 |
  LDX #$00                                  ; $179385 |
  LDY #$02                                  ; $179387 |
code_179389:
  LDA $98D5,y                               ; $179389 |
  JSR code_1FEAA4                           ; $17938C |
  LDA #$00                                  ; $17938F |
  STA {entity_display_flags},y              ; $179391 |
  LDA #$6D                                  ; $179394 |
  STA {entity_type},y                       ; $179396 |
  LDA #$C0                                  ; $179399 |
  STA {x_position_low},y                    ; $17939B |
  LDA $98D7,y                               ; $17939E |
  STA {y_position_low},y                    ; $1793A1 |
  LDA #$80                                  ; $1793A4 |
  STA {x_speed_frac},y                      ; $1793A6 |
  LDA #$00                                  ; $1793A9 |
  STA {x_speed},y                           ; $1793AB |
  LDA #$50                                  ; $1793AE |
  STA {y_speed_frac},y                      ; $1793B0 |
  LDA #$00                                  ; $1793B3 |
  STA {y_speed},y                           ; $1793B5 |
  DEY                                       ; $1793B8 |
  BNE code_179389                           ; $1793B9 |
  LDA #$3C                                  ; $1793BB |
  JSR code_179754                           ; $1793BD |
  JSR code_17976F                           ; $1793C0 |
  LDY #$01                                  ; $1793C3 |
  JSR code_1796DB                           ; $1793C5 |
  LDA #$3C                                  ; $1793C8 |
  JSR code_179754                           ; $1793CA |
  JSR code_17976F                           ; $1793CD |
  LDY #$02                                  ; $1793D0 |
  JSR code_1796DB                           ; $1793D2 |
  LDA #$3C                                  ; $1793D5 |
  JSR code_179754                           ; $1793D7 |
  JSR code_17976F                           ; $1793DA |
  LDA #$0F                                  ; $1793DD |
  STA $0601                                 ; $1793DF |
  LDA #$FF                                  ; $1793E2 |
  STA $18                                   ; $1793E4 |
  JSR async_next_frame                      ; $1793E6 |
  LDY #$12                                  ; $1793E9 |
  JSR code_17968A                           ; $1793EB |
  LDA #$00                                  ; $1793EE |
  STA $EC                                   ; $1793F0 |
  JSR code_1796BB                           ; $1793F2 |
  LDA #$20                                  ; $1793F5 |
  STA $10                                   ; $1793F7 |
  LDA #$00                                  ; $1793F9 |
  STA $23                                   ; $1793FB |
  JSR code_1EDB23                           ; $1793FD |
code_179400:
  LDX #$01                                  ; $179400 |
  JSR apply_vertical_speed_up_alt           ; $179402 |
  JSR code_1FE90C                           ; $179405 |
  LDA $0379                                 ; $179408 |
  SEC                                       ; $17940B |
  SBC #$10                                  ; $17940C |
  STA $037A                                 ; $17940E |
  LDA $0331                                 ; $179411 |
  STA $0332                                 ; $179414 |
  JSR code_1795B6                           ; $179417 |
  LDA $0332                                 ; $17941A |
  CMP #$80                                  ; $17941D |
  BNE code_179400                           ; $17941F |
  LDA #$68                                  ; $179421 |
  STA $0379                                 ; $179423 |
  LDA #$58                                  ; $179426 |
  STA $037A                                 ; $179428 |
  LDY #$03                                  ; $17942B |
  LDX #$01                                  ; $17942D |
  LDA #$5D                                  ; $17942F |
  JSR code_1FEAA4                           ; $179431 |
  LDA #$6D                                  ; $179434 |
  STA {entity_type},y                       ; $179436 |
  LDA #$00                                  ; $179439 |
  STA {y_position_low},y                    ; $17943B |
  STA {y_speed_frac},y                      ; $17943E |
  STA $03D9                                 ; $179441 |
  STA $03DA                                 ; $179444 |
  LDA #$03                                  ; $179447 |
  STA {y_speed},y                           ; $179449 |
  STA $03F1                                 ; $17944C |
  STA $03F2                                 ; $17944F |
code_179452:
  LDX #$03                                  ; $179452 |
  JSR apply_vertical_speed_down_alt         ; $179454 |
  LDA #$54                                  ; $179457 |
  CMP {y_position_low},y                    ; $179459 |
  BCS code_179461                           ; $17945C |
  STA {y_position_low},y                    ; $17945E |
code_179461:
  JSR code_1795B6                           ; $179461 |
  LDA $037B                                 ; $179464 |
  CMP #$54                                  ; $179467 |
  BNE code_179452                           ; $179469 |
  LDA #$3C                                  ; $17946B |
  JSR code_1795CE                           ; $17946D |
code_179470:
  LDX #$03                                  ; $179470 |
code_179472:
  JSR apply_vertical_speed_up_alt           ; $179472 |
  DEX                                       ; $179475 |
  BNE code_179472                           ; $179476 |
  JSR code_1795B6                           ; $179478 |
  LDA $0391                                 ; $17947B |
  BEQ code_179470                           ; $17947E |
  LDA #$78                                  ; $179480 |
  JSR code_1795CE                           ; $179482 |
  LDA #$10                                  ; $179485 |
  STA $0E                                   ; $179487 |
  STA $0D                                   ; $179489 |
  JSR code_1795D8                           ; $17948B |
  LDA #$F8                                  ; $17948E |
  STA $0379                                 ; $179490 |
  LDA #$E8                                  ; $179493 |
  STA $037A                                 ; $179495 |
  LDA #$E4                                  ; $179498 |
  STA $037B                                 ; $17949A |
  LDA #$00                                  ; $17949D |
  STA $0391                                 ; $17949F |
  STA $0392                                 ; $1794A2 |
  STA $0393                                 ; $1794A5 |
  STA {entity_type}                         ; $1794A8 |
  LDA #$30                                  ; $1794AB |
  STA $0E                                   ; $1794AD |
  LDA #$F0                                  ; $1794AF |
  STA $0D                                   ; $1794B1 |
  JSR code_1795D8                           ; $1794B3 |
code_1794B6:
  LDX #$03                                  ; $1794B6 |
code_1794B8:
  JSR apply_vertical_speed_up_alt           ; $1794B8 |
  DEX                                       ; $1794BB |
  BNE code_1794B8                           ; $1794BC |
  JSR code_1795B6                           ; $1794BE |
  LDA $037B                                 ; $1794C1 |
  CMP #$63                                  ; $1794C4 |
  BNE code_1794B6                           ; $1794C6 |
  LDA #$78                                  ; $1794C8 |
  JSR code_1795CE                           ; $1794CA |
  LDA #$01                                  ; $1794CD |
  STA $03F3                                 ; $1794CF |
code_1794D2:
  LDX #$03                                  ; $1794D2 |
  JSR apply_vertical_speed_up_alt           ; $1794D4 |
  JSR code_1795B6                           ; $1794D7 |
  LDA $037B                                 ; $1794DA |
  CMP #$53                                  ; $1794DD |
  BNE code_1794D2                           ; $1794DF |
  LDA #$B4                                  ; $1794E1 |
  STA $0F                                   ; $1794E3 |
code_1794E5:
  JSR code_1795BD                           ; $1794E5 |
  DEC $0F                                   ; $1794E8 |
  BNE code_1794E5                           ; $1794EA |
  LDA #$00                                  ; $1794EC |
  STA $0541                                 ; $1794EE |
code_1794F1:
  LDX #$03                                  ; $1794F1 |
  JSR apply_vertical_speed_down_alt         ; $1794F3 |
  JSR code_1795B6                           ; $1794F6 |
  LDA $037B                                 ; $1794F9 |
  CMP #$63                                  ; $1794FC |
  BNE code_1794F1                           ; $1794FE |
  LDA #$00                                  ; $179500 |
  STA $0469                                 ; $179502 |
  STA $0481                                 ; $179505 |
code_179508:
  LDX #$03                                  ; $179508 |
  LDA $046B                                 ; $17950A |
  BNE code_179555                           ; $17950D |
  LDY $0483                                 ; $17950F |
  LDA $9935,y                               ; $179512 |
  BEQ code_17958A                           ; $179515 |
  PHA                                       ; $179517 |
  LDA $9937,y                               ; $179518 |
  STA $046B                                 ; $17951B |
  LDA $9938,y                               ; $17951E |
  STA $0543                                 ; $179521 |
  LDA $9936,y                               ; $179524 |
  TAY                                       ; $179527 |
  PLA                                       ; $179528 |
  JSR code_1FF470                           ; $179529 |
  INC $0483                                 ; $17952C |
  INC $0483                                 ; $17952F |
  INC $0483                                 ; $179532 |
  INC $0483                                 ; $179535 |
  LDA $0483                                 ; $179538 |
  CMP #$34                                  ; $17953B |
  BNE code_179555                           ; $17953D |
  LDA #$00                                  ; $17953F |
  STA $0301                                 ; $179541 |
  STA $0302                                 ; $179544 |
  LDA #$60                                  ; $179547 |
  JSR code_1FEA98                           ; $179549 |
  LDA $037B                                 ; $17954C |
  CLC                                       ; $17954F |
  ADC #$0C                                  ; $179550 |
  STA $037B                                 ; $179552 |
code_179555:
  JSR code_1FEA65                           ; $179555 |
  JSR code_1FEA86                           ; $179558 |
  JSR code_17959D                           ; $17955B |
  DEC $046B                                 ; $17955E |
  LDA $FD                                   ; $179561 |
  ORA $FA                                   ; $179563 |
  BEQ code_179577                           ; $179565 |
  INC $FA                                   ; $179567 |
  INC $FA                                   ; $179569 |
  LDA $FA                                   ; $17956B |
  CMP #$F0                                  ; $17956D |
  BNE code_179577                           ; $17956F |
  LDA #$00                                  ; $179571 |
  STA $FD                                   ; $179573 |
  STA $FA                                   ; $179575 |
code_179577:
  LDA #$00                                  ; $179577 |
  STA $9D                                   ; $179579 |
  STA $0571                                 ; $17957B |
  STA $0572                                 ; $17957E |
  STA $0573                                 ; $179581 |
  JSR code_1795B6                           ; $179584 |
  JMP code_179508                           ; $179587 |

code_17958A:
  LDY #$12                                  ; $17958A |
  JSR code_17968A                           ; $17958C |
  LDA #$FF                                  ; $17958F |
  STA $18                                   ; $179591 |
  LDY #$20                                  ; $179593 |
  LDA #$18                                  ; $179595 |
  JSR code_1796CA                           ; $179597 |
  JMP code_1792FD                           ; $17959A |

code_17959D:
  LDA $0333                                 ; $17959D |
  STA $0331                                 ; $1795A0 |
  STA $0332                                 ; $1795A3 |
  LDA $037B                                 ; $1795A6 |
  CLC                                       ; $1795A9 |
  ADC #$04                                  ; $1795AA |
  STA $037A                                 ; $1795AC |
  CLC                                       ; $1795AF |
  ADC #$10                                  ; $1795B0 |
  STA $0379                                 ; $1795B2 |
  RTS                                       ; $1795B5 |

code_1795B6:
  LDA #$00                                  ; $1795B6 |
  STA $9D                                   ; $1795B8 |
  STA $0572                                 ; $1795BA |
code_1795BD:
  JSR code_1FF363                           ; $1795BD |
  INC $48                                   ; $1795C0 |
  LDA $48                                   ; $1795C2 |
  AND #$0F                                  ; $1795C4 |
  BNE code_1795CD                           ; $1795C6 |
  LDA #$19                                  ; $1795C8 |
  JSR code_1FEC5D                           ; $1795CA |
code_1795CD:
  RTS                                       ; $1795CD |

code_1795CE:
  STA $0F                                   ; $1795CE |
code_1795D0:
  JSR code_1795B6                           ; $1795D0 |
  DEC $0F                                   ; $1795D3 |
  BNE code_1795D0                           ; $1795D5 |
  RTS                                       ; $1795D7 |

code_1795D8:
  LDA #$04                                  ; $1795D8 |
  STA $0C                                   ; $1795DA |
code_1795DC:
  LDY #$1F                                  ; $1795DC |
code_1795DE:
  LDA $0620,y                               ; $1795DE |
  SEC                                       ; $1795E1 |
  SBC $0E                                   ; $1795E2 |
  BCS code_1795E8                           ; $1795E4 |
  LDA #$0F                                  ; $1795E6 |
code_1795E8:
  STA $0600,y                               ; $1795E8 |
  DEY                                       ; $1795EB |
  BPL code_1795DE                           ; $1795EC |
  STY $18                                   ; $1795EE |
  LDA #$04                                  ; $1795F0 |
  JSR code_1795CE                           ; $1795F2 |
  LDA $0E                                   ; $1795F5 |
  CLC                                       ; $1795F7 |
  ADC $0D                                   ; $1795F8 |
  STA $0E                                   ; $1795FA |
  DEC $0C                                   ; $1795FC |
  BNE code_1795DC                           ; $1795FE |
  RTS                                       ; $179600 |

code_179601:
  LDA $6C                                   ; $179601 |
  ASL                                       ; $179603 |
  TAY                                       ; $179604 |
  LDA $9B22,y                               ; $179605 |
  STA $08                                   ; $179608 |
  LDA $9B23,y                               ; $17960A |
  STA $09                                   ; $17960D |
  LDA #$00                                  ; $17960F |
  STA $9D                                   ; $179611 |
  RTS                                       ; $179613 |

code_179614:
  STA $0C                                   ; $179614 |
  STX $0D                                   ; $179616 |
  STY $0E                                   ; $179618 |
code_17961A:
  LDY $09                                   ; $17961A |
  LDA $9D                                   ; $17961C |
  LSR                                       ; $17961E |
  LSR                                       ; $17961F |
  AND #$0F                                  ; $179620 |
  CMP $9B42,y                               ; $179622 |
  BCC code_17962B                           ; $179625 |
  LDA #$00                                  ; $179627 |
  STA $9D                                   ; $179629 |
code_17962B:
  CLC                                       ; $17962B |
  ADC $09                                   ; $17962C |
  TAY                                       ; $17962E |
  LDX $9B43,y                               ; $17962F |
  LDA $9B50,x                               ; $179632 |
  STA $0B                                   ; $179635 |
  LDY $08                                   ; $179637 |
code_179639:
  LDA $9B51,x                               ; $179639 |
  STA $0201,y                               ; $17963C |
  LDA $9B52,x                               ; $17963F |
  STA $0202,y                               ; $179642 |
  INY                                       ; $179645 |
  INY                                       ; $179646 |
  INY                                       ; $179647 |
  INY                                       ; $179648 |
  INX                                       ; $179649 |
  INX                                       ; $17964A |
  DEC $0B                                   ; $17964B |
  BPL code_179639                           ; $17964D |
  INC $9D                                   ; $17964F |
  JSR async_next_frame                      ; $179651 |
  DEC $0C                                   ; $179654 |
  BNE code_17961A                           ; $179656 |
  LDX $0D                                   ; $179658 |
  LDY $0E                                   ; $17965A |
  RTS                                       ; $17965C |

code_17965D:
  LDA #$00                                  ; $17965D |
  JSR async_next_frame.a                    ; $17965F |
  LDA #$00                                  ; $179662 |
  JSR async_next_frame.a                    ; $179664 |
  LDA #$02                                  ; $179667 |
  STA $02                                   ; $179669 |
  LDA #$17                                  ; $17966B |
  JSR code_1FEC5D                           ; $17966D |
  LDA #$08                                  ; $179670 |
  STA $03                                   ; $179672 |
code_179674:
  LDA $0610                                 ; $179674 |
  EOR #$3F                                  ; $179677 |
  STA $0610                                 ; $179679 |
  LDA #$FF                                  ; $17967C |
  STA $18                                   ; $17967E |
  LDA #$08                                  ; $179680 |
  JSR async_next_frame.a                    ; $179682 |
  DEC $03                                   ; $179685 |
  BNE code_179674                           ; $179687 |
  RTS                                       ; $179689 |

code_17968A:
  LDA $9822,y                               ; $17968A |
  STA $EA                                   ; $17968D |
  LDA $9823,y                               ; $17968F |
  STA $EB                                   ; $179692 |
  LDA #$08                                  ; $179694 |
  STA $EC                                   ; $179696 |
  LDX #$00                                  ; $179698 |
code_17969A:
  LDA $9824,y                               ; $17969A |
  STA $0620,x                               ; $17969D |
  STA $0600,x                               ; $1796A0 |
  LDA $9846,x                               ; $1796A3 |
  STA $0630,x                               ; $1796A6 |
  STA $0610,x                               ; $1796A9 |
  INY                                       ; $1796AC |
  INX                                       ; $1796AD |
  CPX #$10                                  ; $1796AE |
  BNE code_17969A                           ; $1796B0 |
  LDA #$11                                  ; $1796B2 |
  STA $27                                   ; $1796B4 |
  LDA #$10                                  ; $1796B6 |
  STA $26                                   ; $1796B8 |
  RTS                                       ; $1796BA |

code_1796BB:
  LDY #$07                                  ; $1796BB |
code_1796BD:
  LDA $9856,y                               ; $1796BD |
  STA $0610,y                               ; $1796C0 |
  STA $0630,y                               ; $1796C3 |
  DEY                                       ; $1796C6 |
  BPL code_1796BD                           ; $1796C7 |
  RTS                                       ; $1796C9 |

code_1796CA:
  STA $00                                   ; $1796CA |
  LDX #$00                                  ; $1796CC |
code_1796CE:
  LDA $985E,y                               ; $1796CE |
  STA $0200,x                               ; $1796D1 |
  INY                                       ; $1796D4 |
  INX                                       ; $1796D5 |
  CPX $00                                   ; $1796D6 |
  BNE code_1796CE                           ; $1796D8 |
  RTS                                       ; $1796DA |

code_1796DB:
  LDA #$28                                  ; $1796DB |
  LDX #$E4                                  ; $1796DD |
  STA $0780                                 ; $1796DF |
  STA $0C                                   ; $1796E2 |
  STX $0781                                 ; $1796E4 |
  STX $0D                                   ; $1796E7 |
  LDA $9B7A,y                               ; $1796E9 |
  STA $08                                   ; $1796EC |
  LDA $9B7D,y                               ; $1796EE |
  STA $09                                   ; $1796F1 |
  LDY #$00                                  ; $1796F3 |
code_1796F5:
  LDX #$00                                  ; $1796F5 |
  LDA ($08),y                               ; $1796F7 |
  BEQ code_179732                           ; $1796F9 |
  CMP #$FE                                  ; $1796FB |
  BEQ code_17973B                           ; $1796FD |
  CMP #$FF                                  ; $1796FF |
  BEQ code_179753                           ; $179701 |
  STA $0783                                 ; $179703 |
  JSR code_179769                           ; $179706 |
  LDA ($08),y                               ; $179709 |
  CMP #$DE                                  ; $17970B |
  BNE code_179716                           ; $17970D |
  STA $0784                                 ; $17970F |
  JSR code_179769                           ; $179712 |
  INX                                       ; $179715 |
code_179716:
  STX $0782                                 ; $179716 |
  LDA #$FF                                  ; $179719 |
  STA $0784,x                               ; $17971B |
  STA $19                                   ; $17971E |
  LDA #$08                                  ; $179720 |
  JSR code_179754                           ; $179722 |
code_179725:
  LDA $0781                                 ; $179725 |
  SEC                                       ; $179728 |
  ADC $0782                                 ; $179729 |
  STA $0781                                 ; $17972C |
  JMP code_1796F5                           ; $17972F |

code_179732:
  STA $0782                                 ; $179732 |
  JSR code_179769                           ; $179735 |
  JMP code_179725                           ; $179738 |

code_17973B:
  JSR code_179769                           ; $17973B |
  LDA $0D                                   ; $17973E |
  CLC                                       ; $179740 |
  ADC #$40                                  ; $179741 |
  STA $0D                                   ; $179743 |
  STA $0781                                 ; $179745 |
  LDA $0C                                   ; $179748 |
  ADC #$00                                  ; $17974A |
  STA $0C                                   ; $17974C |
  STA $0780                                 ; $17974E |
  BNE code_1796F5                           ; $179751 |
code_179753:
  RTS                                       ; $179753 |

code_179754:
  STY $0B                                   ; $179754 |
  STA $0A                                   ; $179756 |
code_179758:
  LDA #$00                                  ; $179758 |
  STA $9D                                   ; $17975A |
  STA $0572                                 ; $17975C |
  JSR code_1FF363                           ; $17975F |
  DEC $0A                                   ; $179762 |
  BNE code_179758                           ; $179764 |
  LDY $0B                                   ; $179766 |
code_179768:
  RTS                                       ; $179768 |

code_179769:
  INY                                       ; $179769 |
  BNE code_179768                           ; $17976A |
  INC $11                                   ; $17976C |
  RTS                                       ; $17976E |

code_17976F:
  LDY #$5B                                  ; $17976F |
code_179771:
  LDA $98DA,y                               ; $179771 |
  STA $0780,y                               ; $179774 |
  DEY                                       ; $179777 |
  BPL code_179771                           ; $179778 |
  STY $19                                   ; $17977A |
  JSR async_next_frame                      ; $17977C |
  LDA #$29                                  ; $17977F |
  STA $0780                                 ; $179781 |
  LDA #$A4                                  ; $179784 |
  STA $0781                                 ; $179786 |
  LDA #$29                                  ; $179789 |
  STA $079E                                 ; $17978B |
  LDA #$E4                                  ; $17978E |
  STA $079F                                 ; $179790 |
  LDA #$2A                                  ; $179793 |
  STA $07BC                                 ; $179795 |
  LDA #$24                                  ; $179798 |
  STA $07BD                                 ; $17979A |
  DEC $19                                   ; $17979D |
  JSR async_next_frame                      ; $17979F |
  RTS                                       ; $1797A2 |

code_1797A3:
  STA $10                                   ; $1797A3 |
  STY $11                                   ; $1797A5 |
code_1797A7:
  LDA $99D6,y                               ; $1797A7 |
  STA $02                                   ; $1797AA |
  LDA $99DE,y                               ; $1797AC |
  STA $03                                   ; $1797AF |
  LDY #$00                                  ; $1797B1 |
  LDA ($02),y                               ; $1797B3 |
  STA $04                                   ; $1797B5 |
  LSR $10                                   ; $1797B7 |
  BCC code_1797D9                           ; $1797B9 |
  INC $26                                   ; $1797BB |
  INC $6C                                   ; $1797BD |
  INY                                       ; $1797BF |
  LDX $9F                                   ; $1797C0 |
  LDA $04                                   ; $1797C2 |
  BEQ code_1797D1                           ; $1797C4 |
code_1797C6:
  LDA ($02),y                               ; $1797C6 |
  STA $0200,x                               ; $1797C8 |
  INY                                       ; $1797CB |
  INX                                       ; $1797CC |
  DEC $04                                   ; $1797CD |
  BNE code_1797C6                           ; $1797CF |
code_1797D1:
  STX $9F                                   ; $1797D1 |
  INC $11                                   ; $1797D3 |
  LDY $11                                   ; $1797D5 |
  BNE code_1797A7                           ; $1797D7 |
code_1797D9:
  LDY #$1F                                  ; $1797D9 |
code_1797DB:
  LDA $98B6,y                               ; $1797DB |
  STA $0600,y                               ; $1797DE |
  STA $0620,y                               ; $1797E1 |
  DEY                                       ; $1797E4 |
  BPL code_1797DB                           ; $1797E5 |
  STY $18                                   ; $1797E7 |
  RTS                                       ; $1797E9 |

code_1797EA:
  LDY $11                                   ; $1797EA |
  LDA $99D6,y                               ; $1797EC |
  STA $02                                   ; $1797EF |
  LDA $99DE,y                               ; $1797F1 |
  STA $03                                   ; $1797F4 |
  LDY #$00                                  ; $1797F6 |
  LDA ($02),y                               ; $1797F8 |
  BEQ code_179821                           ; $1797FA |
  STA $04                                   ; $1797FC |
  LDX $9F                                   ; $1797FE |
  INY                                       ; $179800 |
code_179801:
  LDA #$04                                  ; $179801 |
  STA $05                                   ; $179803 |
  LDA #$18                                  ; $179805 |
  JSR code_1FEC5D                           ; $179807 |
code_17980A:
  LDA ($02),y                               ; $17980A |
  STA $0200,x                               ; $17980C |
  INY                                       ; $17980F |
  INX                                       ; $179810 |
  DEC $04                                   ; $179811 |
  BEQ code_179821                           ; $179813 |
  DEC $05                                   ; $179815 |
  BNE code_17980A                           ; $179817 |
  LDA #$04                                  ; $179819 |
  JSR code_179614                           ; $17981B |
  JMP code_179801                           ; $17981E |

code_179821:
  RTS                                       ; $179821 |

  db $D8, $DA, $0F, $20, $25, $16, $0F, $20 ; $179822 |
  db $21, $13, $0F, $20, $21, $16, $0F, $20 ; $17982A |
  db $27, $16, $DC, $DE, $0F, $20, $24, $12 ; $179832 |
  db $0F, $20, $2C, $12, $0F, $20, $29, $12 ; $17983A |
  db $0F, $20, $26, $16, $0F, $20, $29, $0A ; $179842 |
  db $0F, $20, $16, $0A, $0F, $0F, $20, $36 ; $17984A |
  db $0F, $0F, $20, $16, $0F, $0F, $2C, $11 ; $179852 |
  db $0F, $0F, $20, $37, $B7, $24, $03, $18 ; $17985A |
  db $A7, $24, $03, $40, $87, $24, $03, $70 ; $179862 |
  db $6F, $24, $03, $C0, $3F, $21, $03, $BC ; $17986A |
  db $3F, $21, $43, $C4, $47, $31, $02, $BC ; $179872 |
  db $47, $31, $42, $C4, $77, $28, $01, $78 ; $17987A |
  db $77, $29, $01, $80, $7F, $2A, $00, $78 ; $179882 |
  db $7F, $2B, $00, $80, $87, $2C, $40, $78 ; $17988A |
  db $87, $2C, $00, $80, $5F, $24, $03, $18 ; $179892 |
  db $87, $24, $03, $40, $97, $24, $03, $A0 ; $17989A |
  db $97, $24, $03, $B0, $BB, $1C, $02, $C8 ; $1798A2 |
  db $BB, $1C, $42, $D0, $C3, $1E, $02, $C8 ; $1798AA |
  db $C3, $1E, $42, $D0, $0F, $11, $0C, $01 ; $1798B2 |
  db $0F, $11, $0C, $01, $0F, $11, $0C, $01 ; $1798BA |
  db $0F, $11, $0C, $01, $0F, $00, $11, $00 ; $1798C2 |
  db $0F, $00, $11, $00, $0F, $0F, $20, $36 ; $1798CA |
  db $0F, $0F, $20, $16, $5E, $5F, $90, $80 ; $1798D2 |
  db $28, $E4, $1A, $00, $00, $00, $00, $00 ; $1798DA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1798E2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1798EA |
  db $00, $00, $00, $00, $00, $00, $29, $24 ; $1798F2 |
  db $1A, $00, $00, $00, $00, $00, $00, $00 ; $1798FA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179902 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $17990A |
  db $00, $00, $00, $00, $29, $64, $1A, $00 ; $179912 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $17991A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179922 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $17992A |
  db $00, $00, $FF, $28, $03, $11, $00, $28 ; $179932 |
  db $02, $07, $00, $28, $01, $04, $00, $28 ; $17993A |
  db $00, $03, $00, $28, $0F, $04, $00, $28 ; $179942 |
  db $0E, $07, $00, $28, $0D, $0B, $00, $28 ; $17994A |
  db $0C, $10, $00, $28, $0B, $0B, $00, $28 ; $179952 |
  db $0A, $07, $00, $28, $09, $04, $00, $28 ; $17995A |
  db $08, $03, $00, $08, $07, $08, $00, $08 ; $179962 |
  db $06, $08, $00, $08, $05, $10, $00, $08 ; $17996A |
  db $04, $18, $00, $08, $05, $10, $00, $08 ; $179972 |
  db $06, $04, $00, $08, $07, $04, $00, $08 ; $17997A |
  db $08, $02, $00, $20, $09, $04, $01, $20 ; $179982 |
  db $0A, $04, $01, $20, $0B, $0C, $01, $20 ; $17998A |
  db $0C, $30, $01, $20, $0B, $0C, $01, $20 ; $179992 |
  db $0A, $04, $01, $20, $09, $04, $01, $20 ; $17999A |
  db $08, $02, $01, $20, $07, $02, $02, $20 ; $1799A2 |
  db $06, $02, $02, $20, $05, $06, $02, $20 ; $1799AA |
  db $04, $10, $02, $20, $05, $06, $02, $20 ; $1799B2 |
  db $06, $02, $02, $20, $07, $02, $02, $20 ; $1799BA |
  db $08, $02, $02, $20, $09, $02, $02, $20 ; $1799C2 |
  db $0A, $02, $02, $20, $0B, $02, $02, $20 ; $1799CA |
  db $0C, $02, $03, $00, $E6, $FF, $24, $65 ; $1799D2 |
  db $76, $B3, $10, $15, $99, $99, $9A, $9A ; $1799DA |
  db $9A, $9A, $9B, $9B, $18, $B7, $26, $02 ; $1799E2 |
  db $20, $B7, $26, $02, $28, $B7, $27, $C2 ; $1799EA |
  db $30, $AF, $25, $02, $30, $A7, $27, $02 ; $1799F2 |
  db $30, $A7, $26, $02, $38, $24, $A7, $26 ; $1799FA |
  db $02, $48, $A7, $26, $02, $50, $A7, $26 ; $179A02 |
  db $02, $58, $A7, $27, $C2, $60, $9F, $25 ; $179A0A |
  db $02, $60, $97, $25, $02, $60, $8F, $25 ; $179A12 |
  db $02, $60, $87, $27, $02, $60, $87, $26 ; $179A1A |
  db $02, $68, $40, $87, $26, $02, $78, $87 ; $179A22 |
  db $26, $02, $80, $87, $26, $02, $88, $87 ; $179A2A |
  db $27, $C2, $90, $7F, $25, $02, $90, $77 ; $179A32 |
  db $25, $02, $90, $6F, $25, $02, $90, $67 ; $179A3A |
  db $25, $02, $90, $5F, $27, $02, $90, $5F ; $179A42 |
  db $26, $02, $98, $5F, $26, $02, $A0, $5F ; $179A4A |
  db $26, $02, $A8, $5F, $27, $42, $B0, $67 ; $179A52 |
  db $25, $02, $B0, $6F, $27, $82, $B0, $6F ; $179A5A |
  db $26, $02, $B8, $10, $67, $25, $02, $C0 ; $179A62 |
  db $5F, $25, $02, $C0, $57, $25, $02, $C0 ; $179A6A |
  db $4F, $25, $02, $C0, $3C, $67, $25, $02 ; $179A72 |
  db $18, $6F, $25, $02, $18, $77, $25, $02 ; $179A7A |
  db $18, $7F, $25, $02, $18, $87, $25, $02 ; $179A82 |
  db $18, $8F, $25, $02, $18, $97, $25, $02 ; $179A8A |
  db $18, $9F, $27, $82, $18, $9F, $26, $02 ; $179A92 |
  db $20, $9F, $26, $02, $28, $9F, $27, $C2 ; $179A9A |
  db $30, $97, $25, $02, $30, $8F, $25, $02 ; $179AA2 |
  db $30, $87, $27, $02, $30, $87, $26, $02 ; $179AAA |
  db $38, $5C, $87, $26, $02, $48, $87, $27 ; $179AB2 |
  db $42, $50, $8F, $25, $02, $50, $97, $25 ; $179ABA |
  db $02, $50, $9F, $25, $02, $50, $A7, $25 ; $179AC2 |
  db $02, $50, $AF, $27, $82, $50, $AF, $26 ; $179ACA |
  db $02, $58, $AF, $26, $02, $60, $AF, $26 ; $179AD2 |
  db $02, $68, $AF, $27, $C2, $70, $A7, $27 ; $179ADA |
  db $02, $70, $A7, $26, $02, $78, $A7, $27 ; $179AE2 |
  db $42, $80, $AF, $25, $02, $80, $B7, $27 ; $179AEA |
  db $82, $80, $B7, $26, $02, $88, $B7, $26 ; $179AF2 |
  db $02, $90, $B7, $27, $C2, $98, $AF, $25 ; $179AFA |
  db $02, $98, $A7, $25, $02, $98, $9F, $25 ; $179B02 |
  db $02, $98, $97, $27, $02, $98, $04, $97 ; $179B0A |
  db $26, $02, $A8, $1C, $97, $27, $42, $B8 ; $179B12 |
  db $9F, $25, $02, $B8, $A7, $25, $02, $B8 ; $179B1A |
  db $AF, $25, $02, $B8, $B7, $25, $02, $B8 ; $179B22 |
  db $BF, $27, $82, $B8, $BF, $26, $02, $C0 ; $179B2A |
  db $04, $00, $08, $00, $0C, $00, $10, $0A ; $179B32 |
  db $1C, $00, $20, $00, $24, $00, $28, $05 ; $179B3A |
  db $04, $00, $00, $03, $03, $04, $06, $06 ; $179B42 |
  db $0F, $0F, $03, $18, $18, $21, $00, $24 ; $179B4A |
  db $03, $00, $23, $02, $03, $1C, $02, $1C ; $179B52 |
  db $42, $1E, $02, $1E, $42, $03, $1D, $42 ; $179B5A |
  db $1D, $02, $1F, $42, $1F, $02, $03, $21 ; $179B62 |
  db $03, $21, $43, $31, $02, $31, $42, $03 ; $179B6A |
  db $22, $43, $22, $03, $32, $42, $32, $02 ; $179B72 |
  db $80, $D7, $4E, $9B, $9B, $9C, $59, $4F ; $179B7A |
  db $55, $27, $56, $45, $20, $44, $4F, $4E ; $179B82 |
  db $45, $20, $57, $45, $4C, $4C, $2C, $20 ; $179B8A |
  db $4D, $45, $47, $41, $20, $4D, $41, $4E ; $179B92 |
  db $21, $FE, $49, $20, $4E, $45, $56, $45 ; $179B9A |
  db $52, $20, $45, $58, $50, $45, $43, $54 ; $179BA2 |
  db $45, $44, $20, $59, $4F, $55, $20, $54 ; $179BAA |
  db $4F, $FE, $44, $45, $46, $45, $41, $54 ; $179BB2 |
  db $20, $4D, $59, $20, $50, $4F, $57, $45 ; $179BBA |
  db $52, $46, $55, $4C, $20, $44, $41, $52 ; $179BC2 |
  db $4B, $4D, $41, $4E, $FE, $52, $4F, $42 ; $179BCA |
  db $4F, $54, $21, $21, $FF, $55, $4E, $54 ; $179BD2 |
  db $49, $4C, $20, $4E, $4F, $57, $20, $49 ; $179BDA |
  db $20, $48, $41, $56, $45, $20, $4D, $41 ; $179BE2 |
  db $4E, $41, $47, $45, $44, $FE, $54, $4F ; $179BEA |
  db $20, $46, $52, $41, $4D, $45, $20, $50 ; $179BF2 |
  db $52, $4F, $54, $4F, $4D, $41, $4E, $20 ; $179BFA |
  db $46, $4F, $52, $20, $4D, $59, $FE, $43 ; $179C02 |
  db $52, $49, $4D, $45, $53, $2C, $20, $42 ; $179C0A |
  db $55, $54, $20, $4E, $4F, $57, $20, $54 ; $179C12 |
  db $48, $45, $20, $52, $45, $41, $4C, $FE ; $179C1A |
  db $50, $52, $4F, $54, $4F, $4D, $41, $4E ; $179C22 |
  db $20, $48, $41, $53, $20, $41, $50, $50 ; $179C2A |
  db $45, $41, $52, $45, $44, $20, $41, $4E ; $179C32 |
  db $44, $FE, $53, $50, $4F, $49, $4C, $45 ; $179C3A |
  db $44, $20, $4D, $59, $20, $50, $4C, $41 ; $179C42 |
  db $4E, $21, $21, $FF, $44, $52, $2E, $4C ; $179C4A |
  db $49, $47, $48, $54, $20, $49, $53, $20 ; $179C52 |
  db $41, $20, $43, $41, $50, $54, $49, $56 ; $179C5A |
  db $45, $20, $49, $4E, $FE, $4D, $59, $20 ; $179C62 |
  db $4C, $41, $42, $2E, $FE, $43, $4F, $4D ; $179C6A |
  db $45, $20, $49, $46, $20, $59, $4F, $55 ; $179C72 |
  db $20, $44, $41, $52, $45, $21, $21, $FE ; $179C7A |
  db $48, $41, $2C, $20, $48, $41, $2C, $20 ; $179C82 |
  db $48, $41, $2E, $FF, $00, $00, $00, $00 ; $179C8A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179C92 |
  db $00, $00, $00, $00, $00, $00, $20, $00 ; $179C9A |
  db $00, $00, $00, $40, $00, $00, $20, $00 ; $179CA2 |
  db $02, $00, $00, $00, $00, $00, $00, $00 ; $179CAA |
  db $00, $01, $00, $00, $00, $00, $00, $00 ; $179CB2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179CBA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179CC2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179CCA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179CD2 |
  db $00, $00, $00, $00, $00, $00, $01, $00 ; $179CDA |
  db $00, $00, $40, $01, $29, $50, $30, $10 ; $179CE2 |
  db $C2, $41, $20, $08, $10, $10, $40, $01 ; $179CEA |
  db $18, $02, $80, $10, $00, $04, $41, $00 ; $179CF2 |
  db $40, $50, $00, $50, $48, $10, $00, $04 ; $179CFA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179D02 |
  db $00, $00, $00, $00, $04, $00, $00, $00 ; $179D0A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179D12 |
  db $00, $00, $00, $00, $00, $00, $40, $04 ; $179D1A |
  db $08, $00, $20, $00, $20, $00, $00, $00 ; $179D22 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179D2A |
  db $00, $00, $00, $01, $00, $00, $00, $00 ; $179D32 |
  db $00, $00, $00, $01, $00, $00, $00, $00 ; $179D3A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179D42 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179D4A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179D52 |
  db $00, $00, $00, $00, $00, $00, $00, $40 ; $179D5A |
  db $00, $10, $10, $00, $00, $01, $00, $00 ; $179D62 |
  db $10, $14, $09, $00, $40, $00, $00, $00 ; $179D6A |
  db $22, $08, $24, $00, $40, $00, $00, $00 ; $179D72 |
  db $00, $00, $10, $00, $00, $00, $00, $00 ; $179D7A |
  db $80, $00, $00, $00, $00, $00, $00, $00 ; $179D82 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179D8A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179D92 |
  db $00, $00, $00, $00, $00, $00, $01, $00 ; $179D9A |
  db $00, $00, $00, $00, $00, $10, $00, $04 ; $179DA2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179DAA |
  db $80, $00, $00, $00, $20, $40, $00, $00 ; $179DB2 |
  db $00, $01, $00, $00, $00, $00, $00, $00 ; $179DBA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179DC2 |
  db $02, $00, $00, $00, $04, $00, $00, $00 ; $179DCA |
  db $00, $00, $00, $01, $01, $00, $00, $00 ; $179DD2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179DDA |
  db $02, $00, $21, $00, $28, $00, $08, $41 ; $179DE2 |
  db $04, $00, $11, $41, $00, $40, $00, $04 ; $179DEA |
  db $06, $04, $20, $00, $02, $00, $40, $11 ; $179DF2 |
  db $00, $40, $00, $04, $C0, $01, $00, $00 ; $179DFA |
  db $00, $00, $10, $00, $00, $00, $00, $00 ; $179E02 |
  db $00, $10, $00, $00, $00, $00, $00, $00 ; $179E0A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179E12 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179E1A |
  db $02, $00, $00, $00, $00, $00, $00, $00 ; $179E22 |
  db $04, $04, $00, $00, $00, $00, $80, $00 ; $179E2A |
  db $00, $00, $00, $04, $00, $00, $00, $00 ; $179E32 |
  db $20, $00, $00, $00, $00, $00, $08, $00 ; $179E3A |
  db $00, $00, $00, $00, $00, $00, $01, $00 ; $179E42 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179E4A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179E52 |
  db $00, $00, $00, $00, $00, $00, $C0, $00 ; $179E5A |
  db $00, $40, $20, $14, $80, $40, $00, $00 ; $179E62 |
  db $00, $00, $00, $00, $00, $00, $80, $00 ; $179E6A |
  db $10, $00, $00, $00, $60, $03, $08, $00 ; $179E72 |
  db $00, $00, $00, $00, $20, $04, $00, $01 ; $179E7A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179E82 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179E8A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179E92 |
  db $40, $00, $00, $00, $00, $00, $00, $00 ; $179E9A |
  db $00, $00, $00, $00, $00, $40, $20, $00 ; $179EA2 |
  db $80, $00, $20, $00, $00, $00, $00, $00 ; $179EAA |
  db $00, $00, $00, $01, $00, $00, $08, $00 ; $179EB2 |
  db $00, $00, $00, $10, $40, $01, $00, $00 ; $179EBA |
  db $00, $00, $02, $00, $00, $00, $00, $00 ; $179EC2 |
  db $02, $00, $00, $00, $00, $00, $00, $00 ; $179ECA |
  db $00, $01, $00, $00, $00, $00, $00, $04 ; $179ED2 |
  db $00, $00, $00, $00, $00, $00, $10, $00 ; $179EDA |
  db $08, $00, $10, $00, $80, $41, $02, $00 ; $179EE2 |
  db $22, $44, $01, $00, $20, $18, $04, $10 ; $179EEA |
  db $00, $00, $45, $00, $02, $00, $00, $00 ; $179EF2 |
  db $18, $44, $00, $05, $01, $00, $00, $00 ; $179EFA |
  db $00, $00, $08, $00, $00, $00, $00, $00 ; $179F02 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179F0A |
  db $00, $00, $08, $00, $00, $00, $00, $00 ; $179F12 |
  db $00, $00, $00, $00, $00, $00, $40, $00 ; $179F1A |
  db $00, $00, $00, $00, $02, $00, $00, $00 ; $179F22 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179F2A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179F32 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179F3A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179F42 |
  db $00, $08, $00, $00, $00, $00, $00, $00 ; $179F4A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179F52 |
  db $00, $00, $00, $00, $00, $10, $00, $00 ; $179F5A |
  db $40, $00, $00, $04, $10, $40, $00, $00 ; $179F62 |
  db $20, $04, $00, $00, $00, $00, $20, $40 ; $179F6A |
  db $00, $40, $00, $80, $00, $80, $00, $40 ; $179F72 |
  db $08, $00, $00, $00, $08, $00, $00, $00 ; $179F7A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179F82 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179F8A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179F92 |
  db $00, $00, $00, $00, $00, $00, $00, $10 ; $179F9A |
  db $02, $00, $04, $00, $00, $00, $04, $04 ; $179FA2 |
  db $00, $04, $02, $00, $00, $00, $00, $00 ; $179FAA |
  db $00, $00, $00, $00, $00, $00, $08, $00 ; $179FB2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $179FBA |
  db $40, $00, $20, $00, $00, $04, $00, $00 ; $179FC2 |
  db $00, $04, $00, $00, $00, $00, $00, $00 ; $179FCA |
  db $00, $00, $00, $00, $00, $04, $80, $00 ; $179FD2 |
  db $00, $00, $00, $00, $00, $00, $02, $00 ; $179FDA |
  db $00, $00, $10, $00, $00, $10, $80, $00 ; $179FE2 |
  db $00, $00, $00, $00, $C0, $00, $12, $00 ; $179FEA |
  db $30, $00, $00, $00, $40, $00, $00, $00 ; $179FF2 |
  db $0C, $00, $00, $00, $10, $00           ; $179FFA |

bank $18
org $8000

  JMP code_18806C                           ; $188000 |

  JMP code_1880FE                           ; $188003 |

code_188006:
  LDA #$00                                  ; $188006 |
  STA $C2                                   ; $188008 |
  LDY #$08                                  ; $18800A |
code_18800C:
  ASL $C2                                   ; $18800C |
  ROL $C1                                   ; $18800E |
  BCC code_18801F                           ; $188010 |
  CLC                                       ; $188012 |
  LDA $C2                                   ; $188013 |
  ADC $C4                                   ; $188015 |
  STA $C2                                   ; $188017 |
  LDA $C1                                   ; $188019 |
  ADC #$00                                  ; $18801B |
  STA $C1                                   ; $18801D |
code_18801F:
  DEY                                       ; $18801F |
  BNE code_18800C                           ; $188020 |
  RTS                                       ; $188022 |

code_188023:
  ASL                                       ; $188023 |
  TAY                                       ; $188024 |
  INY                                       ; $188025 |
  PLA                                       ; $188026 |
  STA $C1                                   ; $188027 |
  PLA                                       ; $188029 |
  STA $C2                                   ; $18802A |
  LDA ($C1),y                               ; $18802C |
  PHA                                       ; $18802E |
  INY                                       ; $18802F |
  LDA ($C1),y                               ; $188030 |
  STA $C2                                   ; $188032 |
  PLA                                       ; $188034 |
  STA $C1                                   ; $188035 |
  JMP ($00C1)                               ; $188037 |

code_18803A:
  STY $C1                                   ; $18803A |
  LDY #$00                                  ; $18803C |
  CMP #$C0                                  ; $18803E |
  BCS code_188047                           ; $188040 |
  STA $C2                                   ; $188042 |
  LDA ($C1),y                               ; $188044 |
  RTS                                       ; $188046 |

code_188047:
  SEC                                       ; $188047 |
  SBC #$20                                  ; $188048 |
  STA $C2                                   ; $18804A |
  LDA #$07                                  ; $18804C |
  STA $8000                                 ; $18804E |
  LDA #$1A                                  ; $188051 |
  STA $8001                                 ; $188053 |
  LDA ($C1),y                               ; $188056 |
  PHA                                       ; $188058 |
  LDA #$07                                  ; $188059 |
  STA $8000                                 ; $18805B |
  LDA #$19                                  ; $18805E |
  STA $8001                                 ; $188060 |
  LDA #$20                                  ; $188063 |
  CLC                                       ; $188065 |
  ADC $C2                                   ; $188066 |
  STA $C2                                   ; $188068 |
  PLA                                       ; $18806A |
  RTS                                       ; $18806B |

code_18806C:
  LDA $C0                                   ; $18806C |
  LSR                                       ; $18806E |
  BCS code_1880D7                           ; $18806F |
  LDA $D0                                   ; $188071 |
  ORA $D1                                   ; $188073 |
  BEQ code_18807A                           ; $188075 |
  JSR code_188252                           ; $188077 |
code_18807A:
  CLC                                       ; $18807A |
  LDA $CA                                   ; $18807B |
  ADC $C8                                   ; $18807D |
  STA $C8                                   ; $18807F |
  LDA $C9                                   ; $188081 |
  ADC #$00                                  ; $188083 |
  STA $C7                                   ; $188085 |
  LDA $CF                                   ; $188087 |
  PHA                                       ; $188089 |
  LDX #$03                                  ; $18808A |
code_18808C:
  LSR $CF                                   ; $18808C |
  BCC code_188099                           ; $18808E |
  LDA $CF                                   ; $188090 |
  ORA #$80                                  ; $188092 |
  STA $CF                                   ; $188094 |
  JSR code_1882DE                           ; $188096 |
code_188099:
  LDA $C0                                   ; $188099 |
  AND #$02                                  ; $18809B |
  BNE code_1880A6                           ; $18809D |
  TXA                                       ; $18809F |
  PHA                                       ; $1880A0 |
  JSR code_188393                           ; $1880A1 |
  PLA                                       ; $1880A4 |
  TAX                                       ; $1880A5 |
code_1880A6:
  DEX                                       ; $1880A6 |
  BPL code_18808C                           ; $1880A7 |
  PLA                                       ; $1880A9 |
  STA $CF                                   ; $1880AA |
  LSR $C0                                   ; $1880AC |
  ASL $C0                                   ; $1880AE |
  LDA $CC                                   ; $1880B0 |
  AND #$7F                                  ; $1880B2 |
  BEQ code_1880D7                           ; $1880B4 |
  LDY #$00                                  ; $1880B6 |
  STY $C1                                   ; $1880B8 |
  LDY #$04                                  ; $1880BA |
code_1880BC:
  ASL                                       ; $1880BC |
  ROL $C1                                   ; $1880BD |
  DEY                                       ; $1880BF |
  BNE code_1880BC                           ; $1880C0 |
  CLC                                       ; $1880C2 |
  ADC $C0                                   ; $1880C3 |
  STA $C0                                   ; $1880C5 |
  LDA $C1                                   ; $1880C7 |
  ADC $CD                                   ; $1880C9 |
  BCC code_1880D5                           ; $1880CB |
  LDA $CC                                   ; $1880CD |
  AND #$80                                  ; $1880CF |
  STA $CC                                   ; $1880D1 |
  LDA #$FF                                  ; $1880D3 |
code_1880D5:
  STA $CD                                   ; $1880D5 |
code_1880D7:
  RTS                                       ; $1880D7 |

code_1880D8:
  TXA                                       ; $1880D8 |
  AND #$03                                  ; $1880D9 |
  EOR #$03                                  ; $1880DB |
  ASL                                       ; $1880DD |
  ASL                                       ; $1880DE |
  TAY                                       ; $1880DF |
  LDA #$30                                  ; $1880E0 |
  CPY #$08                                  ; $1880E2 |
  BNE code_1880E8                           ; $1880E4 |
  LDA #$00                                  ; $1880E6 |
code_1880E8:
  STA $4000,y                               ; $1880E8 |
  RTS                                       ; $1880EB |

code_1880EC:
  PHA                                       ; $1880EC |
  TXA                                       ; $1880ED |
  AND #$03                                  ; $1880EE |
  EOR #$03                                  ; $1880F0 |
  ASL                                       ; $1880F2 |
  ASL                                       ; $1880F3 |
  STY $C4                                   ; $1880F4 |
  ORA $C4                                   ; $1880F6 |
  TAY                                       ; $1880F8 |
  PLA                                       ; $1880F9 |
  STA $4000,y                               ; $1880FA |
  RTS                                       ; $1880FD |

code_1880FE:
  INC $C0                                   ; $1880FE |
  JSR code_188106                           ; $188100 |
  DEC $C0                                   ; $188103 |
  RTS                                       ; $188105 |

code_188106:
  CMP #$F0                                  ; $188106 |
  BCC code_18810D                           ; $188108 |
  JMP code_1881AE                           ; $18810A |

code_18810D:
  CMP $8A40                                 ; $18810D |
  BCC code_188118                           ; $188110 |
  SEC                                       ; $188112 |
  SBC $8A40                                 ; $188113 |
  BCS code_18810D                           ; $188116 |
code_188118:
  ASL                                       ; $188118 |
  TAX                                       ; $188119 |
  LDY $8A44,x                               ; $18811A |
  TYA                                       ; $18811D |
  ORA $8A43,x                               ; $18811E |
  BEQ code_18816E                           ; $188121 |
  LDA $8A43,x                               ; $188123 |
  JSR code_18803A                           ; $188126 |
  TAY                                       ; $188129 |
  BEQ code_18816F                           ; $18812A |
  LDY #$00                                  ; $18812C |
  INX                                       ; $18812E |
  STA $C4                                   ; $18812F |
  AND #$7F                                  ; $188131 |
  CMP $CE                                   ; $188133 |
  BCC code_18816E                           ; $188135 |
  STA $CE                                   ; $188137 |
  BNE code_188145                           ; $188139 |
  LDA $D6                                   ; $18813B |
  BPL code_188145                           ; $18813D |
  LDA $C4                                   ; $18813F |
  BMI code_188145                           ; $188141 |
  STY $D7                                   ; $188143 |
code_188145:
  STY $D6                                   ; $188145 |
  ASL $C4                                   ; $188147 |
  ROR $D6                                   ; $188149 |
  BPL code_18814F                           ; $18814B |
  STX $D7                                   ; $18814D |
code_18814F:
  INC $C1                                   ; $18814F |
  LDA $C1                                   ; $188151 |
  STA $D0                                   ; $188153 |
  BNE code_188159                           ; $188155 |
  INC $C2                                   ; $188157 |
code_188159:
  LDA $C2                                   ; $188159 |
  STA $D1                                   ; $18815B |
  TYA                                       ; $18815D |
  STA $D2                                   ; $18815E |
  STA $D3                                   ; $188160 |
  STA $D4                                   ; $188162 |
  STA $D5                                   ; $188164 |
  LDY #$27                                  ; $188166 |
code_188168:
  STA $0700,y                               ; $188168 |
  DEY                                       ; $18816B |
  BPL code_188168                           ; $18816C |
code_18816E:
  RTS                                       ; $18816E |

code_18816F:
  LDX #$01                                  ; $18816F |
  STX $C9                                   ; $188171 |
  LDX #$99                                  ; $188173 |
  STX $CA                                   ; $188175 |
  STA $C8                                   ; $188177 |
  STA $CB                                   ; $188179 |
  STA $CC                                   ; $18817B |
  STA $CD                                   ; $18817D |
  LDX #$53                                  ; $18817F |
code_188181:
  STA $0728,x                               ; $188181 |
  DEX                                       ; $188184 |
  BPL code_188181                           ; $188185 |
  LDX #$03                                  ; $188187 |
code_188189:
  INC $C1                                   ; $188189 |
  BNE code_18818F                           ; $18818B |
  INC $C2                                   ; $18818D |
code_18818F:
  LDY $C1                                   ; $18818F |
  LDA $C2                                   ; $188191 |
  JSR code_18803A                           ; $188193 |
  STA $0754,x                               ; $188196 |
  INC $C1                                   ; $188199 |
  BNE code_18819F                           ; $18819B |
  INC $C2                                   ; $18819D |
code_18819F:
  LDY $C1                                   ; $18819F |
  LDA $C2                                   ; $1881A1 |
  JSR code_18803A                           ; $1881A3 |
  STA $0750,x                               ; $1881A6 |
  DEX                                       ; $1881A9 |
  BPL code_188189                           ; $1881AA |
  BMI code_1881F1                           ; $1881AC |
code_1881AE:
  STY $C3                                   ; $1881AE |
  AND #$07                                  ; $1881B0 |
  JSR code_188023                           ; $1881B2 |

  db $C5, $81, $C8, $81, $E4, $81, $1E, $82 ; $1881B5 |
  db $26, $82, $2D, $82, $34, $82, $4A, $82 ; $1881BD |

  JSR code_1881E4                           ; $1881C5 |
code_1881C8:
  LDA #$00                                  ; $1881C8 |
  STA $CE                                   ; $1881CA |
  STA $D0                                   ; $1881CC |
  STA $D1                                   ; $1881CE |
  STA $D7                                   ; $1881D0 |
  STA $D8                                   ; $1881D2 |
code_1881D4:
  LDA $CF                                   ; $1881D4 |
  BEQ code_1881E3                           ; $1881D6 |
  EOR #$0F                                  ; $1881D8 |
  STA $CF                                   ; $1881DA |
  JSR code_1881F1                           ; $1881DC |
  LDA #$00                                  ; $1881DF |
  STA $CF                                   ; $1881E1 |
code_1881E3:
  RTS                                       ; $1881E3 |

code_1881E4:
  LDA #$00                                  ; $1881E4 |
  LDX #$03                                  ; $1881E6 |
code_1881E8:
  STA $0754,x                               ; $1881E8 |
  STA $0750,x                               ; $1881EB |
  DEX                                       ; $1881EE |
  BPL code_1881E8                           ; $1881EF |
code_1881F1:
  LDA $CF                                   ; $1881F1 |
  PHA                                       ; $1881F3 |
  LDX #$03                                  ; $1881F4 |
code_1881F6:
  LSR $CF                                   ; $1881F6 |
  BCS code_18820A                           ; $1881F8 |
  JSR code_1880D8                           ; $1881FA |
  LDA $0754,x                               ; $1881FD |
  ORA $0750,x                               ; $188200 |
  BEQ code_18820A                           ; $188203 |
  LDA #$FF                                  ; $188205 |
  STA $077C,x                               ; $188207 |
code_18820A:
  DEX                                       ; $18820A |
  BPL code_1881F6                           ; $18820B |
  PLA                                       ; $18820D |
  STA $CF                                   ; $18820E |
  LDA #$08                                  ; $188210 |
  STA $4001                                 ; $188212 |
  STA $4005                                 ; $188215 |
  LDA #$0F                                  ; $188218 |
  STA $4015                                 ; $18821A |
  RTS                                       ; $18821D |

  LDA $C0                                   ; $18821E |
  ORA #$02                                  ; $188220 |
  STA $C0                                   ; $188222 |
  BNE code_1881F1                           ; $188224 |
  LDA $C0                                   ; $188226 |
  AND #$FD                                  ; $188228 |
  STA $C0                                   ; $18822A |
  RTS                                       ; $18822C |

  ASL $C3                                   ; $18822D |
  BEQ code_188234                           ; $18822F |
  SEC                                       ; $188231 |
  ROR $C3                                   ; $188232 |
code_188234:
  LDA $C0                                   ; $188234 |
  AND #$0F                                  ; $188236 |
  STA $C0                                   ; $188238 |
  LDY $C3                                   ; $18823A |
  STY $CC                                   ; $18823C |
  BEQ code_188247                           ; $18823E |
  LDY #$FF                                  ; $188240 |
  CPY $CD                                   ; $188242 |
  BNE code_188249                           ; $188244 |
  INY                                       ; $188246 |
code_188247:
  STY $CD                                   ; $188247 |
code_188249:
  RTS                                       ; $188249 |

  LDA #$00                                  ; $18824A |
  SEC                                       ; $18824C |
  SBC $C3                                   ; $18824D |
  STA $D8                                   ; $18824F |
  RTS                                       ; $188251 |

code_188252:
  LDA $D3                                   ; $188252 |
  BEQ code_18825B                           ; $188254 |
  DEC $D3                                   ; $188256 |
  DEC $D5                                   ; $188258 |
  RTS                                       ; $18825A |

code_18825B:
  JSR code_188386                           ; $18825B |
  STA $C4                                   ; $18825E |
  ASL                                       ; $188260 |
  BCC code_188273                           ; $188261 |
  STY $CE                                   ; $188263 |
  LDA $D7                                   ; $188265 |
  LSR                                       ; $188267 |
  BCC code_188270                           ; $188268 |
  JSR code_188118                           ; $18826A |
  JMP code_18825B                           ; $18826D |

code_188270:
  JMP code_1881C8                           ; $188270 |

code_188273:
  LSR $C4                                   ; $188273 |
  BCC code_1882A6                           ; $188275 |
  JSR code_188386                           ; $188277 |
  ASL                                       ; $18827A |
  BEQ code_188289                           ; $18827B |
  ASL $D6                                   ; $18827D |
  PHP                                       ; $18827F |
  CMP $D6                                   ; $188280 |
  BEQ code_188296                           ; $188282 |
  PLP                                       ; $188284 |
  ROR $D6                                   ; $188285 |
  INC $D6                                   ; $188287 |
code_188289:
  JSR code_188386                           ; $188289 |
  TAX                                       ; $18828C |
  JSR code_188386                           ; $18828D |
  STA $D0                                   ; $188290 |
  STX $D1                                   ; $188292 |
  BNE code_18825B                           ; $188294 |
code_188296:
  TYA                                       ; $188296 |
  PLP                                       ; $188297 |
  ROR                                       ; $188298 |
  STA $D6                                   ; $188299 |
  CLC                                       ; $18829B |
  LDA #$02                                  ; $18829C |
  ADC $D0                                   ; $18829E |
  STA $D0                                   ; $1882A0 |
  BCC code_1882A6                           ; $1882A2 |
  INC $D1                                   ; $1882A4 |
code_1882A6:
  LSR $C4                                   ; $1882A6 |
  BCC code_1882AF                           ; $1882A8 |
  JSR code_188386                           ; $1882AA |
  STA $D4                                   ; $1882AD |
code_1882AF:
  LSR $C4                                   ; $1882AF |
  BCC code_1882B8                           ; $1882B1 |
  JSR code_188386                           ; $1882B3 |
  STA $D2                                   ; $1882B6 |
code_1882B8:
  JSR code_188386                           ; $1882B8 |
  STA $D3                                   ; $1882BB |
  STA $C1                                   ; $1882BD |
  LDA $D4                                   ; $1882BF |
  STA $C4                                   ; $1882C1 |
  JSR code_188006                           ; $1882C3 |
  LDY $C1                                   ; $1882C6 |
  INY                                       ; $1882C8 |
  STY $D5                                   ; $1882C9 |
  INC $C0                                   ; $1882CB |
  JSR code_188386                           ; $1882CD |
  PHA                                       ; $1882D0 |
  EOR $CF                                   ; $1882D1 |
  BEQ code_1882DA                           ; $1882D3 |
  STA $CF                                   ; $1882D5 |
  JSR code_1881D4                           ; $1882D7 |
code_1882DA:
  PLA                                       ; $1882DA |
  STA $CF                                   ; $1882DB |
  RTS                                       ; $1882DD |

code_1882DE:
  LDY $0700,x                               ; $1882DE |
  BEQ code_1882E6                           ; $1882E1 |
  JSR code_188684                           ; $1882E3 |
code_1882E6:
  LDA $C0                                   ; $1882E6 |
  LSR                                       ; $1882E8 |
  BCS code_18830A                           ; $1882E9 |
  JSR code_1886BA                           ; $1882EB |
  LDA $D3                                   ; $1882EE |
  BEQ code_1882FA                           ; $1882F0 |
  CPX #$01                                  ; $1882F2 |
  BEQ code_1882FB                           ; $1882F4 |
  LDA $D5                                   ; $1882F6 |
  BEQ code_188300                           ; $1882F8 |
code_1882FA:
  RTS                                       ; $1882FA |

code_1882FB:
  DEC $0710,x                               ; $1882FB |
  BNE code_1882FA                           ; $1882FE |
code_188300:
  LDA $0704,x                               ; $188300 |
  AND #$04                                  ; $188303 |
  BNE code_1882FA                           ; $188305 |
  JMP code_1885A3                           ; $188307 |

code_18830A:
  LDA #$00                                  ; $18830A |
  STA $C4                                   ; $18830C |
  JSR code_188386                           ; $18830E |
code_188311:
  LSR                                       ; $188311 |
  BCC code_188320                           ; $188312 |
  PHA                                       ; $188314 |
  JSR code_188386                           ; $188315 |
  STA $C3                                   ; $188318 |
  LDA $C4                                   ; $18831A |
  JSR code_188326                           ; $18831C |
  PLA                                       ; $18831F |
code_188320:
  BEQ code_188333                           ; $188320 |
  INC $C4                                   ; $188322 |
  BNE code_188311                           ; $188324 |
code_188326:
  JSR code_188023                           ; $188326 |

  db $6F, $86, $AD, $86, $5A, $86, $A7, $86 ; $188329 |
  db $A1, $86                               ; $188331 |

code_188333:
  JSR code_188386                           ; $188333 |
  TAY                                       ; $188336 |
  BNE code_188349                           ; $188337 |
  STA $0710,x                               ; $188339 |
  LDA $0704,x                               ; $18833C |
  AND #$F8                                  ; $18833F |
  ORA #$04                                  ; $188341 |
  STA $0704,x                               ; $188343 |
  JMP code_1880D8                           ; $188346 |

code_188349:
  LDA $0704,x                               ; $188349 |
  ORA #$20                                  ; $18834C |
  STA $0704,x                               ; $18834E |
  LDA $0718,x                               ; $188351 |
  ASL                                       ; $188354 |
  LDA #$54                                  ; $188355 |
  BCS code_18835B                           ; $188357 |
  LDA #$0A                                  ; $188359 |
code_18835B:
  STA $071C,x                               ; $18835B |
  TYA                                       ; $18835E |
  BPL code_18836B                           ; $18835F |
  CPX #$01                                  ; $188361 |
  BNE code_188368                           ; $188363 |
  JSR code_1885AE                           ; $188365 |
code_188368:
  JMP code_188644                           ; $188368 |

code_18836B:
  JSR code_1885AE                           ; $18836B |
  LDA #$FF                                  ; $18836E |
  STA $077C,x                               ; $188370 |
  DEY                                       ; $188373 |
  TXA                                       ; $188374 |
  BNE code_18837F                           ; $188375 |
  STA $C3                                   ; $188377 |
  TYA                                       ; $188379 |
  EOR #$0F                                  ; $18837A |
  JMP code_188636                           ; $18837C |

code_18837F:
  TYA                                       ; $18837F |
  CLC                                       ; $188380 |
  ADC $D2                                   ; $188381 |
  JMP code_1885DE                           ; $188383 |

code_188386:
  LDY $D0                                   ; $188386 |
  LDA $D1                                   ; $188388 |
  INC $D0                                   ; $18838A |
  BNE code_188390                           ; $18838C |
  INC $D1                                   ; $18838E |
code_188390:
  JMP code_18803A                           ; $188390 |

code_188393:
  TXA                                       ; $188393 |
  ORA #$28                                  ; $188394 |
  TAX                                       ; $188396 |
  LDA $0728,x                               ; $188397 |
  ORA $072C,x                               ; $18839A |
  BEQ code_1883CC                           ; $18839D |
  LDA $0738,x                               ; $18839F |
  BEQ code_1883CD                           ; $1883A2 |
  LDY $0700,x                               ; $1883A4 |
  BEQ code_1883AF                           ; $1883A7 |
  JSR code_188684                           ; $1883A9 |
  JSR code_1886BA                           ; $1883AC |
code_1883AF:
  LDA $0740,x                               ; $1883AF |
  SEC                                       ; $1883B2 |
  SBC $C7                                   ; $1883B3 |
  STA $0740,x                               ; $1883B5 |
  BEQ code_1883BC                           ; $1883B8 |
  BCS code_1883BF                           ; $1883BA |
code_1883BC:
  JSR code_1885A3                           ; $1883BC |
code_1883BF:
  LDA $0738,x                               ; $1883BF |
  SEC                                       ; $1883C2 |
  SBC $C7                                   ; $1883C3 |
  STA $0738,x                               ; $1883C5 |
  BEQ code_1883CD                           ; $1883C8 |
  BCC code_1883CD                           ; $1883CA |
code_1883CC:
  RTS                                       ; $1883CC |

code_1883CD:
  JSR code_188592                           ; $1883CD |
  CMP #$20                                  ; $1883D0 |
  BCS code_1883DA                           ; $1883D2 |
  JSR code_188497                           ; $1883D4 |
  JMP code_1883CD                           ; $1883D7 |

code_1883DA:
  PHA                                       ; $1883DA |
  ROL                                       ; $1883DB |
  ROL                                       ; $1883DC |
  ROL                                       ; $1883DD |
  ROL                                       ; $1883DE |
  AND #$07                                  ; $1883DF |
  TAY                                       ; $1883E1 |
  DEY                                       ; $1883E2 |
  LDA $0730,x                               ; $1883E3 |
  ASL                                       ; $1883E6 |
  ASL                                       ; $1883E7 |
  BPL code_1883EF                           ; $1883E8 |
  LDA $8915,y                               ; $1883EA |
  BNE code_188406                           ; $1883ED |
code_1883EF:
  ASL                                       ; $1883EF |
  ASL                                       ; $1883F0 |
  LDA $891C,y                               ; $1883F1 |
  BCC code_188406                           ; $1883F4 |
  STA $C3                                   ; $1883F6 |
  LDA $0730,x                               ; $1883F8 |
  AND #$EF                                  ; $1883FB |
  STA $0730,x                               ; $1883FD |
  LDA $C3                                   ; $188400 |
  LSR                                       ; $188402 |
  CLC                                       ; $188403 |
  ADC $C3                                   ; $188404 |
code_188406:
  CLC                                       ; $188406 |
  ADC $0738,x                               ; $188407 |
  STA $0738,x                               ; $18840A |
  TAY                                       ; $18840D |
  PLA                                       ; $18840E |
  AND #$1F                                  ; $18840F |
  BNE code_188419                           ; $188411 |
  JSR code_1885A3                           ; $188413 |
  JMP code_188491                           ; $188416 |

code_188419:
  PHA                                       ; $188419 |
  STY $C4                                   ; $18841A |
  LDA $073C,x                               ; $18841C |
  STA $C1                                   ; $18841F |
  JSR code_188006                           ; $188421 |
  LDA $C1                                   ; $188424 |
  BNE code_18842A                           ; $188426 |
  LDA #$01                                  ; $188428 |
code_18842A:
  STA $0740,x                               ; $18842A |
  PLA                                       ; $18842D |
  TAY                                       ; $18842E |
  DEY                                       ; $18842F |
  LDA $0730,x                               ; $188430 |
  BPL code_188440                           ; $188433 |
  LDA $0718,x                               ; $188435 |
  BNE code_188454                           ; $188438 |
  JSR code_188644                           ; $18843A |
  JMP code_18847E                           ; $18843D |

code_188440:
  JSR code_1885AE                           ; $188440 |
  LDA $CF                                   ; $188443 |
  BMI code_188454                           ; $188445 |
  STY $C3                                   ; $188447 |
  TXA                                       ; $188449 |
  AND #$03                                  ; $18844A |
  TAY                                       ; $18844C |
  LDA #$FF                                  ; $18844D |
  STA $077C,y                               ; $18844F |
  LDY $C3                                   ; $188452 |
code_188454:
  TXA                                       ; $188454 |
  AND #$03                                  ; $188455 |
  BNE code_188466                           ; $188457 |
  STA $C3                                   ; $188459 |
  TYA                                       ; $18845B |
  AND #$0F                                  ; $18845C |
  EOR #$0F                                  ; $18845E |
  JSR code_188636                           ; $188460 |
  JMP code_18847E                           ; $188463 |

code_188466:
  STY $C3                                   ; $188466 |
  LDA $0730,x                               ; $188468 |
  AND #$0F                                  ; $18846B |
  TAY                                       ; $18846D |
  LDA $8923,y                               ; $18846E |
  CLC                                       ; $188471 |
  ADC $C3                                   ; $188472 |
  CLC                                       ; $188474 |
  ADC $CB                                   ; $188475 |
  CLC                                       ; $188477 |
  ADC $0734,x                               ; $188478 |
  JSR code_1885DE                           ; $18847B |
code_18847E:
  LDA $0730,x                               ; $18847E |
  TAY                                       ; $188481 |
  AND #$40                                  ; $188482 |
  ASL                                       ; $188484 |
  STA $C4                                   ; $188485 |
  TYA                                       ; $188487 |
  AND #$7F                                  ; $188488 |
  ORA $C4                                   ; $18848A |
  STA $0730,x                               ; $18848C |
  BPL code_188496                           ; $18848F |
code_188491:
  LDA #$FF                                  ; $188491 |
  STA $0740,x                               ; $188493 |
code_188496:
  RTS                                       ; $188496 |

code_188497:
  CMP #$04                                  ; $188497 |
  BCC code_1884A4                           ; $188499 |
  STA $C4                                   ; $18849B |
  JSR code_188592                           ; $18849D |
  STA $C3                                   ; $1884A0 |
  LDA $C4                                   ; $1884A2 |
code_1884A4:
  JSR code_188023                           ; $1884A4 |

  db $D9, $84, $DD, $84, $E1, $84, $E8, $84 ; $1884A7 |
  db $75, $85, $F1, $84, $FF, $84, $5A, $86 ; $1884AF |
  db $6F, $86, $05, $85, $10, $85, $15, $85 ; $1884B7 |
  db $A1, $86, $A7, $86, $1B, $85, $1F, $85 ; $1884BF |
  db $23, $85, $27, $85, $1B, $85, $1F, $85 ; $1884C7 |
  db $23, $85, $27, $85, $5A, $85, $80, $85 ; $1884CF |
  db $AD, $86                               ; $1884D7 |

  LDA #$20                                  ; $1884D9 |
  BNE code_1884EA                           ; $1884DB |
  LDA #$40                                  ; $1884DD |
  BNE code_1884EA                           ; $1884DF |
  LDA #$10                                  ; $1884E1 |
  ORA $0730,x                               ; $1884E3 |
  BNE code_1884ED                           ; $1884E6 |
  LDA #$08                                  ; $1884E8 |
code_1884EA:
  EOR $0730,x                               ; $1884EA |
code_1884ED:
  STA $0730,x                               ; $1884ED |
  RTS                                       ; $1884F0 |

  LDA #$00                                  ; $1884F1 |
  STA $C8                                   ; $1884F3 |
  JSR code_188592                           ; $1884F5 |
  LDY $C3                                   ; $1884F8 |
  STA $CA                                   ; $1884FA |
  STY $C9                                   ; $1884FC |
  RTS                                       ; $1884FE |

  LDA $C3                                   ; $1884FF |
  STA $073C,x                               ; $188501 |
  RTS                                       ; $188504 |

  LDA $0730,x                               ; $188505 |
  AND #$F8                                  ; $188508 |
  ORA $C3                                   ; $18850A |
  STA $0730,x                               ; $18850C |
  RTS                                       ; $18850F |

  LDA $C3                                   ; $188510 |
  STA $CB                                   ; $188512 |
  RTS                                       ; $188514 |

  LDA $C3                                   ; $188515 |
  STA $0734,x                               ; $188517 |
  RTS                                       ; $18851A |

  LDA #$00                                  ; $18851B |
  BEQ code_188529                           ; $18851D |
  LDA #$04                                  ; $18851F |
  BNE code_188529                           ; $188521 |
  LDA #$08                                  ; $188523 |
  BNE code_188529                           ; $188525 |
  LDA #$0C                                  ; $188527 |
code_188529:
  STA $C2                                   ; $188529 |
  TXA                                       ; $18852B |
  CLC                                       ; $18852C |
  ADC $C2                                   ; $18852D |
  TAY                                       ; $18852F |
  LDA $C4                                   ; $188530 |
  CMP #$12                                  ; $188532 |
  BCS code_188547                           ; $188534 |
  LDA $0744,y                               ; $188536 |
  SEC                                       ; $188539 |
  SBC #$01                                  ; $18853A |
  BCS code_188540                           ; $18853C |
  LDA $C3                                   ; $18853E |
code_188540:
  STA $0744,y                               ; $188540 |
  BEQ code_188566                           ; $188543 |
  BNE code_188555                           ; $188545 |
code_188547:
  LDA $0744,y                               ; $188547 |
  SEC                                       ; $18854A |
  SBC #$01                                  ; $18854B |
  BNE code_188566                           ; $18854D |
  STA $0744,y                               ; $18854F |
  JSR code_188575                           ; $188552 |
code_188555:
  JSR code_188592                           ; $188555 |
  STA $C3                                   ; $188558 |
  JSR code_188592                           ; $18855A |
  STA $0728,x                               ; $18855D |
  LDA $C3                                   ; $188560 |
  STA $072C,x                               ; $188562 |
  RTS                                       ; $188565 |

code_188566:
  LDA #$02                                  ; $188566 |
  CLC                                       ; $188568 |
  ADC $0728,x                               ; $188569 |
  STA $0728,x                               ; $18856C |
  BCC code_188574                           ; $18856F |
  INC $072C,x                               ; $188571 |
code_188574:
  RTS                                       ; $188574 |

code_188575:
  LDA $0730,x                               ; $188575 |
  AND #$97                                  ; $188578 |
  ORA $C3                                   ; $18857A |
  STA $0730,x                               ; $18857C |
  RTS                                       ; $18857F |

  PLA                                       ; $188580 |
  PLA                                       ; $188581 |
  LDA #$00                                  ; $188582 |
  STA $0728,x                               ; $188584 |
  STA $072C,x                               ; $188587 |
  LDA $CF                                   ; $18858A |
  BMI code_188591                           ; $18858C |
  JMP code_1880D8                           ; $18858E |

code_188591:
  RTS                                       ; $188591 |

code_188592:
  LDY $0728,x                               ; $188592 |
  LDA $072C,x                               ; $188595 |
  INC $0728,x                               ; $188598 |
  BNE code_1885A0                           ; $18859B |
  INC $072C,x                               ; $18859D |
code_1885A0:
  JMP code_18803A                           ; $1885A0 |

code_1885A3:
  LDA $0704,x                               ; $1885A3 |
  AND #$F8                                  ; $1885A6 |
  ORA #$03                                  ; $1885A8 |
  STA $0704,x                               ; $1885AA |
  RTS                                       ; $1885AD |

code_1885AE:
  TYA                                       ; $1885AE |
  PHA                                       ; $1885AF |
  LDY #$00                                  ; $1885B0 |
  LDA $0704,x                               ; $1885B2 |
  AND #$F8                                  ; $1885B5 |
  STA $0704,x                               ; $1885B7 |
  CPX #$29                                  ; $1885BA |
  BEQ code_1885D0                           ; $1885BC |
  CPX #$01                                  ; $1885BE |
  BNE code_1885D7                           ; $1885C0 |
  LDA $D3                                   ; $1885C2 |
  STA $C1                                   ; $1885C4 |
  LDA $070C,x                               ; $1885C6 |
  STA $C4                                   ; $1885C9 |
  JSR code_188006                           ; $1885CB |
  LDY $C1                                   ; $1885CE |
code_1885D0:
  INY                                       ; $1885D0 |
  INC $0704,x                               ; $1885D1 |
  INC $0704,x                               ; $1885D4 |
code_1885D7:
  TYA                                       ; $1885D7 |
  STA $0710,x                               ; $1885D8 |
  PLA                                       ; $1885DB |
  TAY                                       ; $1885DC |
  RTS                                       ; $1885DD |

code_1885DE:
  CMP #$60                                  ; $1885DE |
  BCC code_1885E4                           ; $1885E0 |
  LDA #$5F                                  ; $1885E2 |
code_1885E4:
  STA $C3                                   ; $1885E4 |
  INC $C3                                   ; $1885E6 |
  CPX #$28                                  ; $1885E8 |
  BCC code_18862A                           ; $1885EA |
  LDA $071C,x                               ; $1885EC |
  BEQ code_18861D                           ; $1885EF |
  CMP $C3                                   ; $1885F1 |
  BNE code_1885FC                           ; $1885F3 |
  LDA $0730,x                               ; $1885F5 |
  BPL code_18861D                           ; $1885F8 |
  BMI code_188644                           ; $1885FA |
code_1885FC:
  LDA $0718,x                               ; $1885FC |
  BEQ code_18861D                           ; $1885FF |
  BCS code_188607                           ; $188601 |
  ORA #$80                                  ; $188603 |
  BNE code_188609                           ; $188605 |
code_188607:
  AND #$7F                                  ; $188607 |
code_188609:
  STA $0718,x                               ; $188609 |
  LDA $0704,x                               ; $18860C |
  ORA #$20                                  ; $18860F |
  STA $0704,x                               ; $188611 |
  LDA $C3                                   ; $188614 |
  LDY $071C,x                               ; $188616 |
  STY $C3                                   ; $188619 |
  BNE code_188627                           ; $18861B |
code_18861D:
  LDA $0704,x                               ; $18861D |
  AND #$DF                                  ; $188620 |
  STA $0704,x                               ; $188622 |
  LDA $C3                                   ; $188625 |
code_188627:
  STA $071C,x                               ; $188627 |
code_18862A:
  ASL $C3                                   ; $18862A |
  LDY $C3                                   ; $18862C |
  LDA $8959,y                               ; $18862E |
  STA $C3                                   ; $188631 |
  LDA $895A,y                               ; $188633 |
code_188636:
  STA $0724,x                               ; $188636 |
  LDA $C3                                   ; $188639 |
  STA $0720,x                               ; $18863B |
  LDY #$04                                  ; $18863E |
  LDA ($C5),y                               ; $188640 |
  BMI code_18864C                           ; $188642 |
code_188644:
  LDA $0704,x                               ; $188644 |
  AND #$08                                  ; $188647 |
  BNE code_18864C                           ; $188649 |
  RTS                                       ; $18864B |

code_18864C:
  LDA #$00                                  ; $18864C |
  STA $0708,x                               ; $18864E |
  LDA $0704,x                               ; $188651 |
  AND #$37                                  ; $188654 |
  STA $0704,x                               ; $188656 |
  RTS                                       ; $188659 |

  CPX #$01                                  ; $18865A |
  BNE code_188662                           ; $18865C |
  LDA $C3                                   ; $18865E |
  BNE code_18866B                           ; $188660 |
code_188662:
  LDA $070C,x                               ; $188662 |
  AND #$C0                                  ; $188665 |
  ORA $C3                                   ; $188667 |
  ORA #$30                                  ; $188669 |
code_18866B:
  STA $070C,x                               ; $18866B |
  RTS                                       ; $18866E |

  INC $C3                                   ; $18866F |
  LDA $C3                                   ; $188671 |
  CMP $0700,x                               ; $188673 |
  BEQ code_1886A0                           ; $188676 |
  STA $0700,x                               ; $188678 |
  TAY                                       ; $18867B |
  LDA $0704,x                               ; $18867C |
  ORA #$08                                  ; $18867F |
  STA $0704,x                               ; $188681 |
code_188684:
  DEY                                       ; $188684 |
  LDA #$00                                  ; $188685 |
  STA $C3                                   ; $188687 |
  TYA                                       ; $188689 |
  ASL                                       ; $18868A |
  ROL $C3                                   ; $18868B |
  ASL                                       ; $18868D |
  ROL $C3                                   ; $18868E |
  ASL                                       ; $188690 |
  ROL $C3                                   ; $188691 |
  CLC                                       ; $188693 |
  ADC $8A42                                 ; $188694 |
  STA $C5                                   ; $188697 |
  LDA $C3                                   ; $188699 |
  ADC $8A41                                 ; $18869B |
  STA $C6                                   ; $18869E |
code_1886A0:
  RTS                                       ; $1886A0 |

  LDA $C3                                   ; $1886A1 |
  STA $0714,x                               ; $1886A3 |
  RTS                                       ; $1886A6 |

  LDA $C3                                   ; $1886A7 |
  STA $0718,x                               ; $1886A9 |
  RTS                                       ; $1886AC |

  LDA $070C,x                               ; $1886AD |
  AND #$0F                                  ; $1886B0 |
  ORA $C3                                   ; $1886B2 |
  ORA #$30                                  ; $1886B4 |
  STA $070C,x                               ; $1886B6 |
  RTS                                       ; $1886B9 |

code_1886BA:
  LDA $0710,x                               ; $1886BA |
  STA $C4                                   ; $1886BD |
  LDA $0704,x                               ; $1886BF |
  AND #$07                                  ; $1886C2 |
  JSR code_188023                           ; $1886C4 |

  db $D1, $86, $E6, $86, $20, $87, $02, $87 ; $1886C7 |
  db $14, $89                               ; $1886CF |

  LDY #$00                                  ; $1886D1 |
  LDA ($C5),y                               ; $1886D3 |
  TAY                                       ; $1886D5 |
  LDA $C4                                   ; $1886D6 |
  CLC                                       ; $1886D8 |
  ADC $8933,y                               ; $1886D9 |
  BCS code_1886E2                           ; $1886DC |
  CMP #$F0                                  ; $1886DE |
  BCC code_18871D                           ; $1886E0 |
code_1886E2:
  LDA #$F0                                  ; $1886E2 |
  BNE code_18871A                           ; $1886E4 |
  LDY #$01                                  ; $1886E6 |
  LDA ($C5),y                               ; $1886E8 |
  BEQ code_1886FB                           ; $1886EA |
  TAY                                       ; $1886EC |
  LDA $C4                                   ; $1886ED |
  SEC                                       ; $1886EF |
  SBC $8933,y                               ; $1886F0 |
  BCC code_1886FB                           ; $1886F3 |
  LDY #$02                                  ; $1886F5 |
  CMP ($C5),y                               ; $1886F7 |
  BCS code_18871D                           ; $1886F9 |
code_1886FB:
  LDY #$02                                  ; $1886FB |
  LDA ($C5),y                               ; $1886FD |
  JMP code_18871A                           ; $1886FF |

  TXA                                       ; $188702 |
  AND #$03                                  ; $188703 |
  CMP #$01                                  ; $188705 |
  BEQ code_188718                           ; $188707 |
  LDY #$03                                  ; $188709 |
  LDA ($C5),y                               ; $18870B |
  BEQ code_188720                           ; $18870D |
  TAY                                       ; $18870F |
  LDA $C4                                   ; $188710 |
  SEC                                       ; $188712 |
  SBC $8933,y                               ; $188713 |
  BCS code_18871D                           ; $188716 |
code_188718:
  LDA #$00                                  ; $188718 |
code_18871A:
  INC $0704,x                               ; $18871A |
code_18871D:
  STA $0710,x                               ; $18871D |
code_188720:
  CPX #$28                                  ; $188720 |
  BCC code_188737                           ; $188722 |
  LDA $CF                                   ; $188724 |
  BPL code_18872B                           ; $188726 |
  JMP code_1888A0                           ; $188728 |

code_18872B:
  LDA $CD                                   ; $18872B |
  LDY $CC                                   ; $18872D |
  BMI code_188733                           ; $18872F |
  EOR #$FF                                  ; $188731 |
code_188733:
  CMP #$FF                                  ; $188733 |
  BNE code_188740                           ; $188735 |
code_188737:
  TXA                                       ; $188737 |
  AND #$03                                  ; $188738 |
  CMP #$01                                  ; $18873A |
  BNE code_188760                           ; $18873C |
  BEQ code_188752                           ; $18873E |
code_188740:
  CPX #$29                                  ; $188740 |
  BNE code_18875B                           ; $188742 |
  STA $C4                                   ; $188744 |
  LDA $0740,x                               ; $188746 |
  STA $C1                                   ; $188749 |
  JSR code_188006                           ; $18874B |
  LDA $C1                                   ; $18874E |
  BEQ code_1887AA                           ; $188750 |
code_188752:
  LDA $0710,x                               ; $188752 |
  BEQ code_1887AA                           ; $188755 |
  LDA #$FF                                  ; $188757 |
  BNE code_1887AA                           ; $188759 |
code_18875B:
  CMP $0710,x                               ; $18875B |
  BCC code_188763                           ; $18875E |
code_188760:
  LDA $0710,x                               ; $188760 |
code_188763:
  LSR                                       ; $188763 |
  LSR                                       ; $188764 |
  LSR                                       ; $188765 |
  LSR                                       ; $188766 |
  EOR #$0F                                  ; $188767 |
  STA $C3                                   ; $188769 |
  LDY #$06                                  ; $18876B |
  LDA ($C5),y                               ; $18876D |
  CMP #$05                                  ; $18876F |
  BCC code_188797                           ; $188771 |
  STA $C4                                   ; $188773 |
  LDY $0708,x                               ; $188775 |
  LDA $0704,x                               ; $188778 |
  ASL                                       ; $18877B |
  ASL                                       ; $18877C |
  TYA                                       ; $18877D |
  BCC code_188782                           ; $18877E |
  EOR #$FF                                  ; $188780 |
code_188782:
  BEQ code_188797                           ; $188782 |
  STA $C1                                   ; $188784 |
  JSR code_188006                           ; $188786 |
  LDA $C1                                   ; $188789 |
  LSR                                       ; $18878B |
  LSR                                       ; $18878C |
  CMP #$10                                  ; $18878D |
  BCS code_1887A5                           ; $18878F |
  CMP $C3                                   ; $188791 |
  BCC code_188797                           ; $188793 |
  STA $C3                                   ; $188795 |
code_188797:
  LDA #$10                                  ; $188797 |
  STA $C4                                   ; $188799 |
  LDA $070C,x                               ; $18879B |
  SEC                                       ; $18879E |
  SBC $C3                                   ; $18879F |
  BIT $C4                                   ; $1887A1 |
  BNE code_1887AA                           ; $1887A3 |
code_1887A5:
  LDA $070C,x                               ; $1887A5 |
  AND #$F0                                  ; $1887A8 |
code_1887AA:
  LDY #$00                                  ; $1887AA |
  JSR code_1880EC                           ; $1887AC |
  TXA                                       ; $1887AF |
  AND #$03                                  ; $1887B0 |
  TAY                                       ; $1887B2 |
  LDA $077C,y                               ; $1887B3 |
  BMI code_18880C                           ; $1887B6 |
  LDY #$05                                  ; $1887B8 |
  LDA ($C5),y                               ; $1887BA |
  BEQ code_18880C                           ; $1887BC |
  STA $C4                                   ; $1887BE |
  LDY $0708,x                               ; $1887C0 |
  LDA $0704,x                               ; $1887C3 |
  ASL                                       ; $1887C6 |
  ASL                                       ; $1887C7 |
  TYA                                       ; $1887C8 |
  BCC code_1887CD                           ; $1887C9 |
  EOR #$FF                                  ; $1887CB |
code_1887CD:
  BEQ code_18880C                           ; $1887CD |
  STA $C1                                   ; $1887CF |
  JSR code_188006                           ; $1887D1 |
  LDA $C1                                   ; $1887D4 |
  LSR                                       ; $1887D6 |
  ROR $C2                                   ; $1887D7 |
  LSR                                       ; $1887D9 |
  ROR $C2                                   ; $1887DA |
  LSR                                       ; $1887DC |
  ROR $C2                                   ; $1887DD |
  LSR                                       ; $1887DF |
  ROR $C2                                   ; $1887E0 |
  TAY                                       ; $1887E2 |
  ORA $C2                                   ; $1887E3 |
  BEQ code_18880C                           ; $1887E5 |
  LDA $0704,x                               ; $1887E7 |
  BMI code_1887FA                           ; $1887EA |
  CLC                                       ; $1887EC |
  LDA $C2                                   ; $1887ED |
  ADC $0720,x                               ; $1887EF |
  STA $C2                                   ; $1887F2 |
  TYA                                       ; $1887F4 |
  ADC $0724,x                               ; $1887F5 |
  BNE code_188809                           ; $1887F8 |
code_1887FA:
  SEC                                       ; $1887FA |
  LDA $0720,x                               ; $1887FB |
  SBC $C2                                   ; $1887FE |
  STA $C2                                   ; $188800 |
  LDA $0724,x                               ; $188802 |
  STY $C1                                   ; $188805 |
  SBC $C1                                   ; $188807 |
code_188809:
  TAY                                       ; $188809 |
  BNE code_188814                           ; $18880A |
code_18880C:
  LDA $0720,x                               ; $18880C |
  STA $C2                                   ; $18880F |
  LDY $0724,x                               ; $188811 |
code_188814:
  CPX #$28                                  ; $188814 |
  BCS code_188835                           ; $188816 |
  LDA $D6                                   ; $188818 |
  BPL code_188835                           ; $18881A |
  LDA $D8                                   ; $18881C |
  BEQ code_188835                           ; $18881E |
  STA $C4                                   ; $188820 |
  STY $C1                                   ; $188822 |
  LDA $C2                                   ; $188824 |
  PHA                                       ; $188826 |
  JSR code_188006                           ; $188827 |
  PLA                                       ; $18882A |
  CLC                                       ; $18882B |
  ADC $C2                                   ; $18882C |
  STA $C2                                   ; $18882E |
  LDA #$00                                  ; $188830 |
  ADC $C1                                   ; $188832 |
  TAY                                       ; $188834 |
code_188835:
  TXA                                       ; $188835 |
  AND #$03                                  ; $188836 |
  BNE code_188849                           ; $188838 |
  TYA                                       ; $18883A |
  AND #$0F                                  ; $18883B |
  LDY #$07                                  ; $18883D |
  ORA ($C5),y                               ; $18883F |
  STA $C2                                   ; $188841 |
  LDA #$00                                  ; $188843 |
  STA $C1                                   ; $188845 |
  BEQ code_188884                           ; $188847 |
code_188849:
  TYA                                       ; $188849 |
  LDY #$08                                  ; $18884A |
code_18884C:
  DEY                                       ; $18884C |
  CMP $8953,y                               ; $18884D |
  BCC code_18884C                           ; $188850 |
  STA $C1                                   ; $188852 |
  TYA                                       ; $188854 |
  CLC                                       ; $188855 |
  ADC $C1                                   ; $188856 |
  TAY                                       ; $188858 |
  AND #$07                                  ; $188859 |
  CLC                                       ; $18885B |
  ADC #$07                                  ; $18885C |
  STA $C1                                   ; $18885E |
  TYA                                       ; $188860 |
  AND #$38                                  ; $188861 |
  EOR #$38                                  ; $188863 |
  BEQ code_188870                           ; $188865 |
code_188867:
  LSR $C1                                   ; $188867 |
  ROR $C2                                   ; $188869 |
  SEC                                       ; $18886B |
  SBC #$08                                  ; $18886C |
  BNE code_188867                           ; $18886E |
code_188870:
  LDY #$00                                  ; $188870 |
  LDA $0714,x                               ; $188872 |
  BEQ code_188884                           ; $188875 |
  BPL code_18887A                           ; $188877 |
  DEY                                       ; $188879 |
code_18887A:
  CLC                                       ; $18887A |
  ADC $C2                                   ; $18887B |
  STA $C2                                   ; $18887D |
  TYA                                       ; $18887F |
  ADC $C1                                   ; $188880 |
  STA $C1                                   ; $188882 |
code_188884:
  LDY #$02                                  ; $188884 |
  LDA $C2                                   ; $188886 |
  JSR code_1880EC                           ; $188888 |
  TXA                                       ; $18888B |
  AND #$03                                  ; $18888C |
  TAY                                       ; $18888E |
  LDA $C1                                   ; $18888F |
  CMP $077C,y                               ; $188891 |
  BEQ code_1888A0                           ; $188894 |
  STA $077C,y                               ; $188896 |
  ORA #$08                                  ; $188899 |
  LDY #$03                                  ; $18889B |
  JSR code_1880EC                           ; $18889D |
code_1888A0:
  LDA $0704,x                               ; $1888A0 |
  AND #$20                                  ; $1888A3 |
  BEQ code_1888FA                           ; $1888A5 |
  LDA $0718,x                               ; $1888A7 |
  BEQ code_1888F2                           ; $1888AA |
  LDY #$00                                  ; $1888AC |
  ASL                                       ; $1888AE |
  PHP                                       ; $1888AF |
  BCC code_1888B8                           ; $1888B0 |
  EOR #$FF                                  ; $1888B2 |
  CLC                                       ; $1888B4 |
  ADC #$01                                  ; $1888B5 |
  DEY                                       ; $1888B7 |
code_1888B8:
  CLC                                       ; $1888B8 |
  ADC $0720,x                               ; $1888B9 |
  STA $0720,x                               ; $1888BC |
  TYA                                       ; $1888BF |
  ADC $0724,x                               ; $1888C0 |
  STA $0724,x                               ; $1888C3 |
  LDA $071C,x                               ; $1888C6 |
  ASL                                       ; $1888C9 |
  TAY                                       ; $1888CA |
  SEC                                       ; $1888CB |
  LDA $0720,x                               ; $1888CC |
  SBC $8959,y                               ; $1888CF |
  LDA $0724,x                               ; $1888D2 |
  AND #$3F                                  ; $1888D5 |
  SBC $895A,y                               ; $1888D7 |
  LDA #$FF                                  ; $1888DA |
  ADC #$00                                  ; $1888DC |
  PLP                                       ; $1888DE |
  ADC #$00                                  ; $1888DF |
  BNE code_1888FA                           ; $1888E1 |
  TXA                                       ; $1888E3 |
  BEQ code_1888FA                           ; $1888E4 |
  LDA $8959,y                               ; $1888E6 |
  STA $0720,x                               ; $1888E9 |
  LDA $895A,y                               ; $1888EC |
  STA $0724,x                               ; $1888EF |
code_1888F2:
  LDA $0704,x                               ; $1888F2 |
  AND #$DF                                  ; $1888F5 |
  STA $0704,x                               ; $1888F7 |
code_1888FA:
  LDY #$04                                  ; $1888FA |
  LDA ($C5),y                               ; $1888FC |
  AND #$7F                                  ; $1888FE |
  BEQ code_188914                           ; $188900 |
  CLC                                       ; $188902 |
  ADC $0708,x                               ; $188903 |
  STA $0708,x                               ; $188906 |
  BCC code_188914                           ; $188909 |
  LDA $0704,x                               ; $18890B |
  CLC                                       ; $18890E |
  ADC #$40                                  ; $18890F |
  STA $0704,x                               ; $188911 |
code_188914:
  RTS                                       ; $188914 |

  db $02, $04, $08, $10, $20, $40, $80, $03 ; $188915 |
  db $06, $0C, $18, $30, $60, $C0, $00, $0C ; $18891D |
  db $18, $24, $30, $3C, $48, $54, $18, $24 ; $188925 |
  db $30, $3C, $48, $54, $60, $6C, $00, $01 ; $18892D |
  db $02, $03, $04, $05, $06, $07, $08, $09 ; $188935 |
  db $0A, $0B, $0C, $0E, $0F, $10, $12, $13 ; $18893D |
  db $14, $16, $18, $1B, $1E, $23, $28, $30 ; $188945 |
  db $3C, $50, $7E, $7F, $FE, $FF, $00, $07 ; $18894D |
  db $0E, $15, $1C, $23, $2A, $31, $5C, $37 ; $188955 |
  db $9C, $36, $E7, $35, $3C, $35, $9B, $34 ; $18895D |
  db $02, $34, $72, $33, $EA, $32, $6A, $32 ; $188965 |
  db $F1, $31, $80, $31, $14, $31, $5C, $30 ; $18896D |
  db $9C, $2F, $E7, $2E, $3C, $2E, $9B, $2D ; $188975 |
  db $02, $2D, $72, $2C, $EA, $2B, $6A, $2B ; $18897D |
  db $F1, $2A, $80, $2A, $14, $2A, $5C, $29 ; $188985 |
  db $9C, $28, $E7, $27, $3C, $27, $9B, $26 ; $18898D |
  db $02, $26, $72, $25, $EA, $24, $6A, $24 ; $188995 |
  db $F1, $23, $80, $23, $14, $23, $5C, $22 ; $18899D |
  db $9C, $21, $E7, $20, $3C, $20, $9B, $1F ; $1889A5 |
  db $02, $1F, $72, $1E, $EA, $1D, $6A, $1D ; $1889AD |
  db $F1, $1C, $80, $1C, $14, $1C, $5C, $1B ; $1889B5 |
  db $9C, $1A, $E7, $19, $3C, $19, $9B, $18 ; $1889BD |
  db $02, $18, $72, $17, $EA, $16, $6A, $16 ; $1889C5 |
  db $F1, $15, $80, $15, $14, $15, $5C, $14 ; $1889CD |
  db $9C, $13, $E7, $12, $3C, $12, $9B, $11 ; $1889D5 |
  db $02, $11, $72, $10, $EA, $0F, $6A, $0F ; $1889DD |
  db $F1, $0E, $80, $0E, $14, $0E, $5C, $0D ; $1889E5 |
  db $9C, $0C, $E7, $0B, $3C, $0B, $9B, $0A ; $1889ED |
  db $02, $0A, $72, $09, $EA, $08, $6A, $08 ; $1889F5 |
  db $F1, $07, $80, $07, $14, $07, $5C, $06 ; $1889FD |
  db $9C, $05, $E7, $04, $3C, $04, $9B, $03 ; $188A05 |
  db $02, $03, $72, $02, $EA, $01, $6A, $01 ; $188A0D |
  db $F1, $00, $80, $00, $14, $00, $00, $00 ; $188A15 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $188A1D |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $188A25 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $188A2D |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $188A35 |
  db $00, $00, $00, $4C, $8A, $DB, $8D, $13 ; $188A3D |
  db $93, $02, $97, $7E, $9B, $B2, $9F, $10 ; $188A45 |
  db $A2, $A7, $A6, $EA, $AA, $B5, $AE, $7D ; $188A4D |
  db $B2, $64, $B7, $48, $BA, $DC, $BD, $C8 ; $188A55 |
  db $C3, $90, $C4, $D5, $C5, $DD, $C6, $F3 ; $188A5D |
  db $C7, $C0, $C8, $34, $C8, $D0, $C9, $E0 ; $188A65 |
  db $CA, $72, $CB, $B0, $CF, $93, $CF, $CF ; $188A6D |
  db $CF, $E2, $CF, $FB, $D0, $07, $D0, $22 ; $188A75 |
  db $D0, $40, $D0, $84, $D0, $94, $D0, $A7 ; $188A7D |
  db $D0, $C4, $D0, $EB, $D1, $2F, $D1, $49 ; $188A85 |
  db $D1, $AF, $D1, $D6, $D1, $EC, $D1, $FE ; $188A8D |
  db $D2, $20, $D2, $3D, $D2, $4D, $D2, $66 ; $188A95 |
  db $D2, $84, $D2, $9B, $D2, $AB, $D2, $E0 ; $188A9D |
  db $D3, $0F, $D3, $33, $D3, $86, $D3, $AB ; $188AA5 |
  db $D3, $D0, $D4, $29, $D4, $56, $D4, $84 ; $188AAD |
  db $D4, $A1, $D4, $B7, $D4, $C9, $D4, $D5 ; $188AB5 |
  db $D4, $E1, $D4, $EF, $D5, $03, $D5, $0F ; $188ABD |
  db $D5, $21, $D5, $41, $D5, $63, $D5, $91 ; $188AC5 |
  db $D5, $B4, $D5, $D0, $D6, $15, $D6, $57 ; $188ACD |
  db $D6, $67, $D8, $58, $D8, $B8, $1F, $01 ; $188AD5 |
  db $F0, $10, $80, $00, $00, $00, $1F, $1D ; $188ADD |
  db $E0, $0F, $D9, $01, $00, $00, $1F, $1D ; $188AE5 |
  db $E0, $11, $80, $00, $00, $80, $1D, $1B ; $188AED |
  db $A0, $02, $80, $00, $00, $00, $1F, $01 ; $188AF5 |
  db $D0, $0F, $82, $00, $39, $00, $1F, $01 ; $188AFD |
  db $E0, $0A, $00, $00, $00, $00, $1F, $1D ; $188B05 |
  db $E0, $0F, $80, $00, $00, $80, $1F, $1D ; $188B0D |
  db $E0, $0D, $80, $00, $00, $80, $1E, $15 ; $188B15 |
  db $E0, $0A, $E0, $01, $00, $00, $1F, $1B ; $188B1D |
  db $A0, $05, $CB, $02, $3C, $00, $1E, $14 ; $188B25 |
  db $A0, $10, $C9, $00, $42, $00, $1F, $1D ; $188B2D |
  db $D0, $0F, $E3, $03, $00, $00, $1E, $0D ; $188B35 |
  db $80, $07, $E5, $04, $17, $00, $1D, $09 ; $188B3D |
  db $90, $03, $CB, $01, $37, $00, $1E, $0D ; $188B45 |
  db $E0, $12, $F0, $01, $1F, $00, $1F, $1B ; $188B4D |
  db $F0, $10, $E6, $01, $01, $00, $1F, $1D ; $188B55 |
  db $D0, $0F, $F0, $05, $0F, $00, $1F, $1D ; $188B5D |
  db $E0, $08, $B7, $01, $40, $00, $1F, $1C ; $188B65 |
  db $D0, $08, $9A, $01, $22, $00, $1F, $13 ; $188B6D |
  db $E0, $0D, $58, $00, $15, $00, $1F, $19 ; $188B75 |
  db $50, $10, $9E, $20, $26, $00, $1F, $1F ; $188B7D |
  db $E0, $1B, $9E, $58, $7C, $00, $18, $00 ; $188B85 |
  db $D0, $13, $80, $00, $00, $00, $1E, $14 ; $188B8D |
  db $E0, $0F, $0F, $00, $16, $00, $07, $1F ; $188B95 |
  db $F0, $06, $80, $00, $00, $00, $1F, $01 ; $188B9D |
  db $D0, $1E, $72, $23, $11, $80, $1F, $1B ; $188BA5 |
  db $C0, $05, $D2, $03, $48, $00, $1E, $0D ; $188BAD |
  db $F0, $14, $F8, $01, $2E, $00, $1E, $13 ; $188BB5 |
  db $E0, $02, $DA, $00, $01, $00, $1F, $1D ; $188BBD |
  db $D0, $06, $E3, $03, $00, $00, $1F, $1A ; $188BC5 |
  db $A0, $05, $FF, $01, $33, $00, $1E, $1A ; $188BCD |
  db $A0, $05, $E4, $04, $00, $00, $1F, $19 ; $188BD5 |
  db $A0, $02, $00, $00, $00, $00, $1F, $04 ; $188BDD |
  db $80, $02, $80, $00, $00, $00, $1F, $1E ; $188BE5 |
  db $D0, $01, $C6, $00, $32, $00, $1F, $1C ; $188BED |
  db $F0, $1F, $EF, $4B, $06, $00, $19, $1F ; $188BF5 |
  db $F0, $1F, $95, $02, $1D, $00, $1F, $1E ; $188BFD |
  db $F0, $02, $EF, $00, $46, $00, $17, $02 ; $188C05 |
  db $E0, $0F, $00, $00, $00, $00, $1F, $1F ; $188C0D |
  db $F0, $1F, $FF, $09, $18, $80, $1F, $1F ; $188C15 |
  db $F0, $1F, $00, $00, $00, $00, $1F, $1F ; $188C1D |
  db $F0, $1F, $FF, $02, $00, $00, $1F, $1F ; $188C25 |
  db $F0, $1F, $92, $7F, $00, $00, $1F, $01 ; $188C2D |
  db $00, $0F, $E3, $7F, $00, $00, $1F, $1F ; $188C35 |
  db $F0, $1F, $FF, $4C, $00, $00, $1F, $1F ; $188C3D |
  db $F0, $1F, $99, $7F, $00, $00, $1D, $1F ; $188C45 |
  db $F0, $1F, $80, $00, $00, $00, $1F, $1F ; $188C4D |
  db $F0, $1F, $B7, $27, $00, $00, $1F, $1A ; $188C55 |
  db $A0, $07, $CF, $36, $00, $80, $1F, $1F ; $188C5D |
  db $F0, $1F, $A6, $7F, $00, $80, $1C, $13 ; $188C65 |
  db $10, $1F, $FF, $7F, $00, $00, $1F, $1E ; $188C6D |
  db $F0, $1F, $EB, $7C, $47, $80, $1F, $1B ; $188C75 |
  db $D0, $0F, $E1, $67, $18, $00, $1F, $1F ; $188C7D |
  db $F0, $1F, $80, $00, $00, $80, $1F, $1F ; $188C85 |
  db $F0, $1F, $D4, $03, $41, $00, $1F, $1F ; $188C8D |
  db $F0, $0F, $D7, $56, $7F, $00, $1F, $16 ; $188C95 |
  db $E0, $19, $E4, $64, $1E, $00, $1F, $1F ; $188C9D |
  db $F0, $10, $BC, $02, $00, $00, $1F, $1F ; $188CA5 |
  db $F0, $1F, $A5, $7F, $00, $00, $1F, $1F ; $188CAD |
  db $F0, $1F, $D3, $16, $00, $00, $1F, $1F ; $188CB5 |
  db $F0, $04, $80, $00, $00, $00, $1A, $1F ; $188CBD |
  db $E0, $1C, $00, $00, $00, $00, $1F, $1E ; $188CC5 |
  db $C0, $07, $00, $00, $00, $80, $1F, $01 ; $188CCD |
  db $F0, $05, $E1, $0D, $00, $00, $1F, $1F ; $188CD5 |
  db $F0, $1F, $FF, $7F, $00, $00, $1C, $1F ; $188CDD |
  db $F0, $07, $FF, $7F, $36, $00, $19, $0B ; $188CE5 |
  db $F0, $12, $FF, $7F, $36, $00, $1F, $12 ; $188CED |
  db $40, $1E, $FF, $7F, $51, $00, $1F, $1F ; $188CF5 |
  db $F0, $1F, $FF, $19, $00, $00, $1F, $1F ; $188CFD |
  db $F0, $0F, $D7, $09, $7F, $00, $00, $00 ; $188D05 |
  db $00, $00, $00, $00, $00, $00, $00, $8D ; $188D0D |
  db $1C, $8E, $E8, $90, $F1, $92, $23, $05 ; $188D15 |
  db $01, $D8, $04, $00, $A0, $18, $40, $07 ; $188D1D |
  db $0B, $09, $02, $08, $17, $06, $E6, $02 ; $188D25 |
  db $9F, $08, $04, $06, $0A, $02, $01, $DD ; $188D2D |
  db $01, $7D, $18, $C0, $08, $0E, $07, $08 ; $188D35 |
  db $7D, $7F, $03, $6C, $73, $72, $6B, $6A ; $188D3D |
  db $62, $61, $68, $67, $03, $78, $12, $00 ; $188D45 |
  db $8D, $7D, $73, $02, $80, $18, $40, $08 ; $188D4D |
  db $17, $06, $E6, $07, $0B, $02, $03, $8C ; $188D55 |
  db $08, $04, $06, $0A, $02, $01, $CB, $01 ; $188D5D |
  db $6B, $18, $C0, $08, $0E, $07, $08, $6C ; $188D65 |
  db $6B, $71, $65, $67, $6B, $71, $65, $67 ; $188D6D |
  db $03, $71, $72, $73, $0E, $01, $8D, $1F ; $188D75 |
  db $80, $18, $40, $08, $02, $06, $E6, $07 ; $188D7D |
  db $09, $7C, $7A, $7C, $7E, $60, $02, $01 ; $188D85 |
  db $03, $8C, $08, $10, $02, $01, $AC, $04 ; $188D8D |
  db $00, $04, $00, $08, $02, $06, $F0, $93 ; $188D95 |
  db $71, $60, $73, $60, $76, $60, $9A, $60 ; $188D9D |
  db $7A, $80, $02, $9A, $60, $78, $02, $80 ; $188DA5 |
  db $B1, $06, $64, $93, $96, $9A, $06, $F0 ; $188DAD |
  db $02, $9D, $02, $9C, $98, $02, $9C, $02 ; $188DB5 |
  db $9D, $9F, $01, $B8, $08, $0B, $02, $01 ; $188DBD |
  db $D8, $80, $08, $02, $91, $73, $60, $9A ; $188DC5 |
  db $80, $02, $9A, $60, $BA, $BB, $BA, $BB ; $188DCD |
  db $9A, $02, $B9, $D5, $77, $79, $01, $BA ; $188DD5 |
  db $08, $0B, $02, $01, $DA, $0E, $01, $8D ; $188DDD |
  db $96, $04, $48, $08, $02, $06, $FF, $07 ; $188DE5 |
  db $05, $89, $08, $18, $07, $07, $69, $07 ; $188DED |
  db $09, $69, $07, $0A, $89, $07, $0B, $02 ; $188DF5 |
  db $A9, $01, $69, $60, $08, $02, $07, $08 ; $188DFD |
  db $67, $02, $01, $89, $07, $09, $69, $07 ; $188E05 |
  db $0A, $C9, $01, $89, $60, $07, $08, $67 ; $188E0D |
  db $01, $69, $01, $A9, $87, $89, $80, $89 ; $188E15 |
  db $80, $A9, $8E, $90, $01, $C9, $01, $89 ; $188E1D |
  db $80, $03, $93, $98, $BF, $BD, $98, $9A ; $188E25 |
  db $9B, $80, $02, $BD, $BF, $02, $03, $C9 ; $188E2D |
  db $A7, $12, $08, $8E, $44, $A4, $A6, $A7 ; $188E35 |
  db $02, $89, $60, $0E, $01, $8D, $E6, $A4 ; $188E3D |
  db $A9, $AB, $02, $8D, $6E, $60, $06, $E6 ; $188E45 |
  db $03, $6C, $80, $6C, $60, $18, $00, $03 ; $188E4D |
  db $6E, $6C, $69, $87, $88, $89, $03, $78 ; $188E55 |
  db $9F, $7D, $03, $88, $87, $03, $98, $9A ; $188E5D |
  db $7D, $02, $98, $18, $40, $6C, $60, $6C ; $188E65 |
  db $80, $6C, $60, $18, $00, $78, $7A, $7D ; $188E6D |
  db $9F, $01, $9D, $00, $01, $5D, $03, $8A ; $188E75 |
  db $88, $06, $64, $89, $84, $83, $82, $8F ; $188E7D |
  db $88, $87, $8D, $86, $06, $E6, $02, $00 ; $188E85 |
  db $85, $18, $C0, $07, $0B, $03, $6C, $60 ; $188E8D |
  db $6C, $80, $6C, $18, $00, $06, $64, $7F ; $188E95 |
  db $03, $73, $73, $60, $72, $66, $66, $60 ; $188E9D |
  db $65, $70, $63, $00, $82, $8E, $82, $81 ; $188EA5 |
  db $03, $98, $03, $8B, $03, $96, $03, $89 ; $188EAD |
  db $03, $94, $00, $03, $68, $63, $62, $03 ; $188EB5 |
  db $73, $80, $06, $E6, $75, $7A, $72, $75 ; $188EBD |
  db $7A, $7E, $03, $69, $66, $62, $03, $78 ; $188EC5 |
  db $7A, $7E, $03, $69, $6C, $66, $67, $69 ; $188ECD |
  db $6E, $6F, $6E, $66, $01, $B1, $08, $0B ; $188ED5 |
  db $B1, $01, $71, $18, $40, $07, $09, $16 ; $188EDD |
  db $8D, $94, $17, $04, $00, $A0, $07, $0A ; $188EE5 |
  db $09, $02, $0C, $FF, $18, $40, $08, $17 ; $188EED |
  db $06, $E6, $02, $9A, $08, $04, $06, $0A ; $188EF5 |
  db $02, $01, $D8, $01, $78, $60, $18, $C0 ; $188EFD |
  db $07, $04, $09, $03, $7D, $7F, $03, $6C ; $188F05 |
  db $73, $72, $6B, $6A, $62, $61, $68, $67 ; $188F0D |
  db $12, $08, $8F, $49, $03, $78, $73, $80 ; $188F15 |
  db $18, $40, $07, $09, $08, $17, $06, $E6 ; $188F1D |
  db $51, $01, $93, $01, $53, $08, $04, $06 ; $188F25 |
  db $0A, $02, $01, $D1, $01, $71, $60, $18 ; $188F2D |
  db $C0, $07, $04, $03, $6C, $6B, $71, $65 ; $188F35 |
  db $67, $6B, $71, $65, $67, $03, $71, $72 ; $188F3D |
  db $0E, $01, $8E, $E8, $80, $09, $02, $07 ; $188F45 |
  db $09, $06, $E6, $03, $78, $77, $78, $7A ; $188F4D |
  db $60, $02, $01, $9D, $08, $10, $02, $01 ; $188F55 |
  db $BD, $04, $00, $04, $00, $04, $00, $09 ; $188F5D |
  db $02, $08, $11, $07, $08, $06, $3C, $18 ; $188F65 |
  db $80, $7F, $7F, $73, $60, $73, $60, $7F ; $188F6D |
  db $7F, $60, $73, $7F, $02, $80, $73, $7F ; $188F75 |
  db $12, $00, $8F, $B0, $03, $69, $69, $03 ; $188F7D |
  db $75, $60, $75, $60, $03, $69, $69, $60 ; $188F85 |
  db $03, $75, $7A, $03, $69, $80, $03, $75 ; $188F8D |
  db $03, $69, $6A, $6A, $03, $76, $60, $76 ; $188F95 |
  db $60, $03, $6A, $6A, $60, $03, $76, $03 ; $188F9D |
  db $6A, $02, $80, $03, $76, $03, $6A, $0E ; $188FA5 |
  db $01, $8F, $62, $7B, $7B, $6F, $60, $80 ; $188FAD |
  db $06, $FF, $08, $02, $8F, $B3, $B6, $02 ; $188FB5 |
  db $B8, $02, $B6, $B4, $02, $B3, $B0, $AE ; $188FBD |
  db $8D, $13, $00, $8F, $DE, $6E, $60, $18 ; $188FC5 |
  db $00, $92, $98, $3C, $01, $9D, $02, $7D ; $188FCD |
  db $01, $3D, $9B, $9A, $98, $0F, $01, $8F ; $188FD5 |
  db $60, $AE, $80, $B2, $93, $95, $9A, $04 ; $188FDD |
  db $00, $04, $00, $80, $08, $12, $07, $09 ; $188FE5 |
  db $06, $96, $69, $6A, $6F, $6A, $6F, $6E ; $188FED |
  db $6F, $73, $75, $76, $6F, $75, $76, $7B ; $188FF5 |
  db $12, $00, $90, $14, $80, $67, $69, $6A ; $188FFD |
  db $67, $6A, $70, $6A, $70, $73, $75, $70 ; $189005 |
  db $73, $75, $7C, $0E, $02, $8F, $E6, $80 ; $18900D |
  db $67, $68, $6A, $68, $6A, $6F, $6A, $6F ; $189015 |
  db $73, $74, $6F, $74, $76, $7B, $80, $64 ; $18901D |
  db $67, $69, $67, $69, $70, $69, $70, $73 ; $189025 |
  db $75, $70, $73, $75, $7C, $13, $00, $90 ; $18902D |
  db $49, $80, $62, $66, $69, $66, $69, $6E ; $189035 |
  db $69, $6E, $70, $72, $6E, $72, $75, $7A ; $18903D |
  db $0F, $01, $8F, $E4, $80, $64, $69, $6D ; $189045 |
  db $69, $6D, $70, $69, $6D, $70, $75, $70 ; $18904D |
  db $73, $75, $18, $C0, $06, $E6, $08, $02 ; $189055 |
  db $67, $60, $67, $80, $67, $02, $60, $09 ; $18905D |
  db $03, $07, $04, $03, $6E, $6C, $69, $87 ; $189065 |
  db $88, $89, $03, $78, $9F, $7D, $03, $88 ; $18906D |
  db $87, $03, $98, $9A, $7D, $98, $40, $09 ; $189075 |
  db $02, $07, $09, $67, $60, $67, $80, $67 ; $18907D |
  db $02, $60, $09, $03, $07, $04, $78, $7A ; $189085 |
  db $7D, $9F, $01, $9D, $00, $01, $5D, $03 ; $18908D |
  db $8A, $88, $06, $64, $89, $84, $83, $82 ; $189095 |
  db $8F, $88, $87, $8D, $86, $06, $E6, $00 ; $18909D |
  db $85, $40, $18, $C0, $07, $09, $09, $02 ; $1890A5 |
  db $03, $67, $60, $67, $80, $67, $40, $09 ; $1890AD |
  db $03, $07, $03, $18, $00, $7F, $03, $73 ; $1890B5 |
  db $73, $60, $72, $66, $66, $60, $65, $70 ; $1890BD |
  db $63, $00, $82, $8E, $82, $81, $03, $98 ; $1890C5 |
  db $03, $8B, $03, $96, $03, $89, $03, $94 ; $1890CD |
  db $00, $03, $68, $63, $62, $03, $53, $18 ; $1890D5 |
  db $C0, $07, $08, $09, $02, $E2, $AE, $95 ; $1890DD |
  db $60, $01, $B8, $08, $10, $B8, $01, $78 ; $1890E5 |
  db $16, $8F, $5E, $17, $04, $00, $06, $E6 ; $1890ED |
  db $08, $00, $09, $03, $67, $67, $67, $02 ; $1890F5 |
  db $80, $A0, $67, $6C, $6E, $6C, $6E, $71 ; $1890FD |
  db $67, $60, $67, $60, $02, $A0, $65, $01 ; $189105 |
  db $4D, $0D, $7F, $02, $01, $6E, $0D, $00 ; $18910D |
  db $6D, $6A, $65, $12, $00, $91, $38, $67 ; $189115 |
  db $67, $67, $02, $80, $A0, $67, $6C, $6E ; $18911D |
  db $6C, $6E, $71, $67, $60, $67, $60, $02 ; $189125 |
  db $A0, $65, $67, $6C, $6E, $71, $76, $0E ; $18912D |
  db $01, $90, $F1, $8C, $A0, $02, $01, $AE ; $189135 |
  db $01, $6E, $08, $15, $79, $74, $70, $04 ; $18913D |
  db $00, $04, $00, $04, $00, $08, $00, $06 ; $189145 |
  db $6E, $87, $85, $06, $FA, $87, $60, $87 ; $18914D |
  db $69, $02, $6A, $40, $06, $6E, $8E, $87 ; $189155 |
  db $0E, $01, $91, $48, $04, $00, $8C, $8A ; $18915D |
  db $06, $FA, $8C, $60, $8C, $70, $02, $71 ; $189165 |
  db $40, $06, $6E, $93, $8C, $0E, $01, $91 ; $18916D |
  db $61, $83, $82, $06, $FA, $83, $60, $83 ; $189175 |
  db $65, $02, $67, $40, $06, $6E, $8A, $8F ; $18917D |
  db $88, $87, $06, $FA, $88, $60, $88, $67 ; $189185 |
  db $02, $68, $40, $06, $6E, $88, $8D, $89 ; $18918D |
  db $87, $06, $FA, $89, $60, $89, $67, $02 ; $189195 |
  db $69, $40, $06, $78, $81, $8D, $06, $E6 ; $18919D |
  db $A2, $02, $84, $86, $69, $8E, $62, $60 ; $1891A5 |
  db $6E, $60, $0F, $01, $91, $46, $04, $00 ; $1891AD |
  db $06, $F5, $04, $00, $A3, $80, $C3, $60 ; $1891B5 |
  db $6F, $12, $00, $91, $D0, $A4, $80, $84 ; $1891BD |
  db $60, $6E, $90, $64, $60, $70, $60, $0E ; $1891C5 |
  db $02, $91, $B7, $A8, $80, $C8, $60, $6F ; $1891CD |
  db $A9, $80, $C9, $60, $6E, $13, $00, $91 ; $1891D5 |
  db $EC, $A2, $80, $82, $60, $6C, $8E, $62 ; $1891DD |
  db $60, $6E, $60, $0F, $01, $91, $B3, $A9 ; $1891E5 |
  db $80, $89, $60, $73, $95, $69, $60, $75 ; $1891ED |
  db $62, $04, $00, $60, $09, $02, $6E, $60 ; $1891F5 |
  db $7A, $6E, $80, $78, $60, $7A, $6E, $60 ; $1891FD |
  db $73, $75, $78, $6E, $60, $6E, $60, $6E ; $189205 |
  db $78, $7A, $6C, $6E, $60, $7A, $6E, $60 ; $18920D |
  db $73, $75, $78, $6E, $0E, $03, $91, $F6 ; $189215 |
  db $09, $03, $16, $91, $44, $17, $04, $00 ; $18921D |
  db $08, $14, $09, $00, $06, $D2, $07, $0A ; $189225 |
  db $63, $63, $02, $83, $07, $08, $6F, $6F ; $18922D |
  db $6F, $6F, $6F, $02, $8F, $6F, $07, $0A ; $189235 |
  db $63, $63, $63, $07, $08, $6F, $63, $8F ; $18923D |
  db $6F, $6F, $6F, $6F, $6F, $AF, $68, $68 ; $189245 |
  db $0E, $01, $92, $23, $68, $04, $00, $07 ; $18924D |
  db $08, $6F, $8F, $07, $0A, $85, $07, $08 ; $189255 |
  db $6F, $8F, $6F, $8F, $07, $0A, $85, $6F ; $18925D |
  db $6F, $12, $00, $92, $6F, $60, $0E, $01 ; $189265 |
  db $92, $52, $02, $83, $68, $88, $A8, $63 ; $18926D |
  db $6F, $6F, $68, $6F, $6F, $04, $00, $04 ; $189275 |
  db $00, $63, $07, $08, $6F, $6F, $6F, $07 ; $18927D |
  db $0B, $87, $07, $09, $63, $83, $63, $07 ; $189285 |
  db $08, $6F, $6F, $07, $0B, $67, $07, $08 ; $18928D |
  db $6F, $6F, $6F, $07, $09, $0E, $0F, $92 ; $189295 |
  db $7C, $04, $00, $63, $07, $08, $6F, $6F ; $18929D |
  db $6F, $07, $0B, $68, $6F, $07, $09, $83 ; $1892A5 |
  db $6F, $6F, $6F, $6F, $68, $6F, $6F, $6F ; $1892AD |
  db $0E, $0F, $92, $9E, $04, $00, $07, $08 ; $1892B5 |
  db $6F, $07, $0B, $68, $6F, $63, $68, $6F ; $1892BD |
  db $6F, $07, $09, $63, $6F, $63, $6F, $6F ; $1892C5 |
  db $07, $0B, $68, $07, $08, $6F, $6F, $6F ; $1892CD |
  db $07, $09, $63, $07, $08, $8F, $6F, $07 ; $1892D5 |
  db $0B, $68, $6F, $6F, $07, $09, $63, $6F ; $1892DD |
  db $63, $12, $00, $92, $F6, $6F, $63, $07 ; $1892E5 |
  db $0B, $68, $6F, $6F, $68, $0E, $03, $92 ; $1892ED |
  db $B9, $68, $07, $0C, $68, $68, $68, $68 ; $1892F5 |
  db $68, $16, $92, $7A, $17, $00, $93, $0B ; $1892FD |
  db $94, $54, $95, $8F, $96, $9D, $05, $01 ; $189305 |
  db $B6, $06, $D2, $07, $08, $08, $00, $09 ; $18930D |
  db $02, $5C, $40, $9C, $7C, $18, $80, $06 ; $189315 |
  db $3C, $08, $0A, $7C, $03, $70, $69, $64 ; $18931D |
  db $61, $03, $75, $7C, $03, $69, $6D, $6C ; $189325 |
  db $6B, $69, $18, $00, $08, $00, $06, $D2 ; $18932D |
  db $41, $40, $81, $61, $18, $80, $08, $0A ; $189335 |
  db $61, $6D, $6A, $66, $03, $76, $72, $76 ; $18933D |
  db $7E, $03, $6A, $69, $68, $66, $18, $00 ; $189345 |
  db $06, $C8, $08, $00, $42, $40, $82, $82 ; $18934D |
  db $82, $62, $62, $A0, $84, $64, $04, $00 ; $189355 |
  db $04, $00, $80, $18, $40, $08, $01, $09 ; $18935D |
  db $01, $9C, $7A, $5C, $40, $60, $06, $96 ; $189365 |
  db $9F, $60, $06, $C8, $03, $89, $67, $66 ; $18936D |
  db $62, $67, $80, $06, $F0, $02, $86, $02 ; $189375 |
  db $82, $06, $DC, $01, $A6, $01, $66, $67 ; $18937D |
  db $69, $67, $12, $08, $93, $A4, $60, $66 ; $189385 |
  db $01, $A4, $08, $0B, $C4, $01, $84, $02 ; $18938D |
  db $A0, $08, $01, $81, $64, $60, $61, $60 ; $189395 |
  db $63, $02, $86, $0E, $01, $93, $5D, $02 ; $18939D |
  db $AB, $01, $2D, $0D, $7F, $02, $6E, $01 ; $1893A5 |
  db $2E, $0D, $00, $8D, $8B, $89, $01, $8B ; $1893AD |
  db $AB, $08, $0B, $02, $01, $CB, $04, $00 ; $1893B5 |
  db $08, $01, $06, $B8, $7F, $7F, $7E, $7F ; $1893BD |
  db $60, $06, $DC, $02, $9E, $9F, $80, $7F ; $1893C5 |
  db $7E, $7F, $03, $69, $12, $08, $94, $04 ; $1893CD |
  db $8B, $80, $08, $16, $06, $FF, $07, $09 ; $1893D5 |
  db $A8, $A4, $03, $B7, $08, $01, $06, $A0 ; $1893DD |
  db $07, $08, $7C, $7C, $06, $DC, $7A, $7C ; $1893E5 |
  db $60, $02, $9A, $9C, $80, $75, $78, $7D ; $1893ED |
  db $7F, $03, $A9, $65, $67, $69, $02, $A7 ; $1893F5 |
  db $69, $60, $6B, $0E, $01, $93, $BB, $02 ; $1893FD |
  db $AB, $06, $FF, $87, $A2, $03, $B7, $06 ; $189405 |
  db $D2, $75, $78, $60, $7D, $60, $02, $9F ; $18940D |
  db $03, $A9, $65, $67, $69, $01, $67, $02 ; $189415 |
  db $C7, $01, $67, $06, $FF, $69, $6B, $67 ; $18941D |
  db $06, $B4, $6E, $6E, $67, $06, $64, $8E ; $189425 |
  db $87, $8E, $8E, $72, $01, $F0, $01, $B0 ; $18942D |
  db $06, $D2, $70, $70, $69, $06, $64, $90 ; $189435 |
  db $89, $90, $90, $06, $DC, $73, $B2, $80 ; $18943D |
  db $AC, $06, $64, $8B, $89, $87, $06, $F0 ; $189445 |
  db $66, $02, $8F, $16, $93, $5B, $17, $06 ; $18944D |
  db $D2, $07, $08, $08, $00, $09, $02, $59 ; $189455 |
  db $40, $99, $79, $02, $C0, $56, $40, $96 ; $18945D |
  db $76, $02, $C0, $06, $C8, $57, $40, $97 ; $189465 |
  db $97, $97, $77, $77, $A0, $99, $79, $04 ; $18946D |
  db $08, $04, $08, $08, $0C, $06, $C8, $07 ; $189475 |
  db $06, $09, $02, $6B, $6B, $6B, $6B, $12 ; $18947D |
  db $08, $94, $98, $60, $6B, $77, $6B, $6B ; $189485 |
  db $75, $77, $6B, $6B, $70, $6B, $75, $0E ; $18948D |
  db $03, $94, $76, $80, $18, $40, $08, $01 ; $189495 |
  db $06, $DC, $03, $89, $6D, $60, $69, $60 ; $18949D |
  db $6B, $02, $8F, $04, $08, $18, $00, $08 ; $1894A5 |
  db $0C, $06, $C8, $6B, $6B, $6B, $6B, $60 ; $1894AD |
  db $6B, $77, $6B, $6B, $75, $77, $6B, $6B ; $1894B5 |
  db $70, $6B, $75, $0E, $01, $94, $A8, $18 ; $1894BD |
  db $C0, $08, $06, $06, $E1, $07, $05, $01 ; $1894C5 |
  db $62, $07, $06, $62, $07, $07, $02, $01 ; $1894CD |
  db $A2, $07, $05, $01, $64, $07, $06, $64 ; $1894D5 |
  db $07, $07, $02, $01, $A4, $07, $05, $01 ; $1894DD |
  db $69, $07, $06, $69, $07, $07, $01, $89 ; $1894E5 |
  db $AD, $B0, $AF, $04, $00, $08, $02, $06 ; $1894ED |
  db $B8, $09, $01, $7C, $7C, $7A, $7C, $60 ; $1894F5 |
  db $06, $DC, $02, $9A, $9C, $80, $A0, $12 ; $1894FD |
  db $00, $95, $34, $03, $88, $80, $08, $16 ; $189505 |
  db $06, $FF, $07, $09, $A4, $03, $B7, $B4 ; $18950D |
  db $08, $01, $07, $07, $06, $A0, $73, $73 ; $189515 |
  db $06, $DC, $72, $73, $60, $02, $92, $93 ; $18951D |
  db $02, $A0, $B8, $75, $77, $78, $02, $B7 ; $189525 |
  db $78, $60, $7A, $0E, $01, $94, $F0, $02 ; $18952D |
  db $BF, $9A, $B7, $B3, $D1, $CC, $06, $D2 ; $189535 |
  db $6B, $6E, $60, $73, $60, $02, $95, $01 ; $18953D |
  db $B7, $01, $77, $06, $FF, $78, $7A, $77 ; $189545 |
  db $06, $B4, $03, $6B, $6B, $64, $06, $64 ; $18954D |
  db $8B, $84, $8B, $8B, $06, $F5, $6E, $AD ; $189555 |
  db $AC, $AB, $02, $89, $02, $8B, $8C, $06 ; $18955D |
  db $D2, $6D, $6D, $64, $06, $64, $8D, $84 ; $189565 |
  db $8D, $8D, $06, $F0, $70, $AF, $80, $01 ; $18956D |
  db $28, $0D, $7F, $89, $02, $69, $01, $29 ; $189575 |
  db $0D, $00, $06, $64, $87, $86, $84, $06 ; $18957D |
  db $F0, $63, $02, $8C, $18, $00, $16, $94 ; $189585 |
  db $74, $17, $06, $D2, $08, $0D, $09, $02 ; $18958D |
  db $6B, $8B, $6B, $02, $C0, $68, $88, $68 ; $189595 |
  db $02, $C0, $69, $89, $89, $89, $69, $89 ; $18959D |
  db $73, $75, $60, $8B, $6B, $04, $00, $04 ; $1895A5 |
  db $00, $09, $02, $02, $90, $70, $60, $70 ; $1895AD |
  db $7C, $6E, $90, $6E, $73, $60, $70, $6B ; $1895B5 |
  db $70, $02, $8E, $6E, $60, $73, $75, $6C ; $1895BD |
  db $8E, $6C, $72, $60, $8C, $6E, $12, $00 ; $1895C5 |
  db $95, $EE, $02, $8C, $6C, $60, $73, $78 ; $1895CD |
  db $6C, $02, $8C, $6C, $60, $8D, $6D, $02 ; $1895D5 |
  db $8B, $6B, $60, $75, $77, $69, $02, $8B ; $1895DD |
  db $70, $60, $6D, $69, $6B, $0E, $01, $95 ; $1895E5 |
  db $AC, $09, $01, $02, $93, $73, $60, $9D ; $1895ED |
  db $7F, $02, $95, $75, $60, $9C, $03, $69 ; $1895F5 |
  db $02, $03, $97, $77, $60, $9E, $03, $6B ; $1895FD |
  db $03, $97, $75, $9C, $7A, $75, $77, $04 ; $189605 |
  db $00, $02, $98, $78, $60, $98, $78, $78 ; $18960D |
  db $02, $80, $7A, $7C, $7F, $03, $69, $12 ; $189615 |
  db $08, $96, $49, $02, $84, $64, $60, $84 ; $18961D |
  db $64, $64, $02, $80, $03, $70, $6E, $70 ; $189625 |
  db $77, $02, $98, $78, $60, $98, $78, $78 ; $18962D |
  db $02, $80, $A0, $02, $9D, $7D, $60, $9D ; $189635 |
  db $7D, $02, $9F, $7F, $60, $73, $7A, $7F ; $18963D |
  db $0E, $01, $96, $0C, $02, $87, $67, $60 ; $189645 |
  db $87, $67, $67, $02, $80, $67, $03, $6E ; $18964D |
  db $71, $73, $71, $71, $78, $71, $60, $91 ; $189655 |
  db $78, $02, $91, $71, $60, $9D, $7D, $73 ; $18965D |
  db $73, $7A, $73, $60, $93, $7A, $B3, $73 ; $189665 |
  db $7F, $60, $7F, $95, $75, $75, $60, $9C ; $18966D |
  db $75, $60, $95, $7C, $95, $70, $75, $92 ; $189675 |
  db $72, $72, $60, $99, $7E, $60, $02, $9E ; $18967D |
  db $9E, $79, $7E, $97, $77, $77, $60, $9E ; $189685 |
  db $77, $60, $97, $7E, $97, $72, $72, $77 ; $18968D |
  db $02, $C0, $02, $80, $16, $95, $AA, $17 ; $189695 |
  db $08, $14, $09, $00, $04, $00, $06, $BE ; $18969D |
  db $07, $0B, $64, $07, $08, $8F, $8F, $6F ; $1896A5 |
  db $6F, $6F, $6F, $6F, $6F, $6F, $64, $07 ; $1896AD |
  db $0C, $06, $C8, $02, $88, $0E, $01, $96 ; $1896B5 |
  db $A1, $06, $BE, $07, $09, $64, $07, $0B ; $1896BD |
  db $88, $88, $88, $68, $68, $60, $6F, $6F ; $1896C5 |
  db $64, $88, $60, $04, $00, $04, $00, $07 ; $1896CD |
  db $0A, $64, $07, $08, $6F, $6F, $6F, $07 ; $1896D5 |
  db $0B, $88, $6F, $84, $07, $08, $6F, $6F ; $1896DD |
  db $64, $07, $0B, $88, $07, $08, $6F, $6F ; $1896E5 |
  db $0E, $07, $96, $D2, $04, $00, $07, $0A ; $1896ED |
  db $64, $07, $08, $6F, $6F, $07, $0B, $88 ; $1896F5 |
  db $07, $0A, $64, $6F, $64, $64, $07, $08 ; $1896FD |
  db $6F, $6F, $6F, $07, $0D, $A8, $04, $00 ; $189705 |
  db $07, $0A, $64, $07, $08, $6F, $6F, $07 ; $18970D |
  db $0A, $64, $60, $64, $6F, $64, $64, $07 ; $189715 |
  db $08, $6F, $6F, $6F, $07, $0B, $88, $12 ; $18971D |
  db $00, $97, $2E, $6F, $6F, $0E, $01, $97 ; $189725 |
  db $0B, $80, $04, $00, $64, $07, $08, $6F ; $18972D |
  db $6F, $6F, $07, $0B, $02, $88, $6F, $0E ; $189735 |
  db $01, $97, $2F, $0F, $01, $96, $F1, $04 ; $18973D |
  db $00, $07, $0A, $64, $60, $64, $68, $6F ; $189745 |
  db $64, $60, $88, $64, $6F, $6F, $68, $6F ; $18974D |
  db $6F, $6F, $04, $00, $64, $07, $08, $6F ; $189755 |
  db $6F, $64, $07, $0B, $88, $6F, $6F, $13 ; $18975D |
  db $00, $97, $70, $0E, $01, $97, $57, $0F ; $189765 |
  db $01, $97, $44, $64, $60, $68, $64, $68 ; $18976D |
  db $07, $0B, $68, $68, $68, $16, $96, $D0 ; $189775 |
  db $17, $00, $97, $87, $98, $8C, $99, $F7 ; $18977D |
  db $9B, $16, $05, $01, $C7, $04, $08, $06 ; $189785 |
  db $F0, $07, $09, $08, $05, $09, $00, $02 ; $18978D |
  db $92, $B1, $60, $02, $91, $AF, $60, $02 ; $189795 |
  db $91, $AF, $60, $06, $F5, $02, $8F, $02 ; $18979D |
  db $91, $92, $06, $C8, $02, $8F, $02, $01 ; $1897A5 |
  db $CD, $6D, $01, $CD, $18, $C0, $08, $02 ; $1897AD |
  db $02, $92, $72, $60, $06, $FF, $02, $93 ; $1897B5 |
  db $18, $00, $0E, $01, $97, $8A, $04, $08 ; $1897BD |
  db $06, $F0, $07, $09, $09, $01, $18, $80 ; $1897C5 |
  db $04, $08, $88, $6B, $6F, $60, $68, $8B ; $1897CD |
  db $91, $60, $01, $B2, $72, $02, $01, $D2 ; $1897D5 |
  db $B4, $91, $72, $91, $02, $8F, $8D, $12 ; $1897DD |
  db $08, $97, $F2, $6F, $01, $AD, $6D, $01 ; $1897E5 |
  db $ED, $0E, $01, $97, $CD, $80, $96, $01 ; $1897ED |
  db $94, $01, $F4, $08, $05, $04, $08, $02 ; $1897F5 |
  db $92, $B1, $60, $04, $08, $30, $01, $91 ; $1897FD |
  db $02, $01, $51, $AF, $60, $0E, $01, $98 ; $189805 |
  db $00, $02, $8F, $02, $91, $92, $13, $08 ; $18980D |
  db $98, $23, $02, $8F, $01, $6D, $02, $CD ; $189815 |
  db $01, $ED, $0F, $01, $97, $FA, $EF, $80 ; $18981D |
  db $74, $80, $74, $80, $74, $02, $80, $A0 ; $189825 |
  db $04, $08, $F3, $02, $93, $02, $91, $93 ; $18982D |
  db $02, $94, $02, $96, $98, $31, $01, $93 ; $189835 |
  db $02, $01, $53, $01, $71, $12, $48, $98 ; $18983D |
  db $4E, $02, $D1, $01, $F1, $0E, $01, $98 ; $189845 |
  db $2D, $01, $D1, $09, $02, $8E, $6C, $EA ; $18984D |
  db $60, $02, $A8, $A8, $87, $88, $8A, $02 ; $189855 |
  db $87, $02, $83, $65, $01, $C3, $01, $63 ; $18985D |
  db $02, $A6, $A6, $85, $86, $88, $65, $60 ; $189865 |
  db $65, $80, $65, $80, $65, $02, $80, $02 ; $18986D |
  db $01, $6A, $01, $2A, $0D, $7F, $07, $06 ; $189875 |
  db $28, $27, $25, $23, $21, $03, $38, $36 ; $18987D |
  db $40, $0D, $00, $16, $97, $C3, $17, $04 ; $189885 |
  db $08, $06, $F0, $07, $08, $08, $05, $09 ; $18988D |
  db $00, $02, $8F, $AD, $60, $02, $8D, $AB ; $189895 |
  db $60, $02, $8D, $AB, $60, $06, $F5, $02 ; $18989D |
  db $8B, $02, $8D, $8F, $06, $C8, $02, $8B ; $1898A5 |
  db $88, $18, $40, $68, $8A, $02, $88, $02 ; $1898AD |
  db $85, $86, $02, $88, $02, $81, $81, $08 ; $1898B5 |
  db $02, $09, $00, $18, $C0, $8D, $6A, $6D ; $1898BD |
  db $60, $06, $FF, $02, $8E, $18, $00, $0E ; $1898C5 |
  db $01, $98, $8C, $04, $00, $04, $00, $08 ; $1898CD |
  db $02, $06, $BE, $07, $08, $09, $01, $18 ; $1898D5 |
  db $C0, $97, $74, $74, $60, $02, $97, $99 ; $1898DD |
  db $74, $02, $9B, $94, $08, $12, $03, $68 ; $1898E5 |
  db $63, $66, $6B, $63, $66, $6D, $63, $66 ; $1898ED |
  db $6B, $63, $66, $6F, $63, $68, $63, $08 ; $1898F5 |
  db $02, $12, $08, $99, $2A, $03, $96, $72 ; $1898FD |
  db $72, $60, $02, $94, $96, $6D, $01, $AD ; $189905 |
  db $01, $6D, $08, $12, $7E, $79, $7E, $03 ; $18990D |
  db $68, $61, $66, $6A, $61, $08, $02, $09 ; $189915 |
  db $01, $18, $00, $86, $61, $66, $60, $02 ; $18991D |
  db $87, $0E, $01, $98, $D2, $81, $03, $74 ; $189925 |
  db $74, $60, $02, $9B, $99, $74, $01, $B4 ; $18992D |
  db $01, $74, $99, $03, $68, $6D, $60, $6D ; $189935 |
  db $80, $6D, $80, $06, $FA, $85, $64, $83 ; $18993D |
  db $04, $08, $06, $F0, $08, $05, $02, $8F ; $189945 |
  db $AD, $60, $2C, $01, $8D, $02, $01, $4D ; $18994D |
  db $AB, $60, $2C, $01, $8D, $02, $01, $4D ; $189955 |
  db $02, $8B, $06, $FF, $03, $96, $B7, $BE ; $18995D |
  db $12, $00, $99, $78, $03, $AA, $03, $B6 ; $189965 |
  db $B9, $BD, $03, $A8, $AA, $AB, $AA, $0E ; $18996D |
  db $01, $99, $45, $03, $AD, $A3, $A7, $AA ; $189975 |
  db $68, $60, $6F, $80, $6F, $80, $02, $01 ; $18997D |
  db $6F, $01, $2F, $0D, $7F, $07, $06, $2D ; $189985 |
  db $2B, $2A, $28, $26, $25, $23, $A0, $40 ; $18998D |
  db $0D, $00, $08, $12, $07, $09, $04, $08 ; $189995 |
  db $04, $08, $8C, $65, $88, $65, $8F, $8C ; $18999D |
  db $85, $88, $8F, $0E, $01, $99, $9D, $04 ; $1899A5 |
  db $08, $8E, $65, $88, $65, $8F, $8E, $85 ; $1899AD |
  db $8A, $85, $0E, $01, $99, $AC, $0F, $01 ; $1899B5 |
  db $99, $9B, $08, $05, $18, $40, $06, $D2 ; $1899BD |
  db $68, $03, $94, $96, $02, $99, $02, $9D ; $1899C5 |
  db $02, $03, $88, $8D, $6C, $03, $98, $9B ; $1899CD |
  db $02, $9D, $02, $9F, $02, $03, $8A, $8C ; $1899D5 |
  db $6B, $03, $97, $9B, $02, $9E, $02, $03 ; $1899DD |
  db $88, $02, $8A, $8B, $6A, $60, $6A, $80 ; $1899E5 |
  db $6A, $80, $6A, $02, $80, $A7, $16, $98 ; $1899ED |
  db $D0, $17, $04, $00, $06, $F0, $08, $00 ; $1899F5 |
  db $09, $03, $04, $00, $02, $88, $6F, $60 ; $1899FD |
  db $6F, $83, $0E, $03, $99, $FF, $04, $00 ; $189A05 |
  db $02, $86, $6D, $60, $6D, $81, $0E, $02 ; $189A0D |
  db $9A, $0B, $02, $86, $66, $60, $67, $93 ; $189A15 |
  db $0F, $01, $99, $F7, $04, $00, $04, $00 ; $189A1D |
  db $04, $00, $02, $88, $6F, $60, $6F, $83 ; $189A25 |
  db $0E, $03, $9A, $25, $13, $00, $9A, $4B ; $189A2D |
  db $04, $00, $02, $86, $6D, $60, $6D, $81 ; $189A35 |
  db $0E, $02, $9A, $35, $02, $86, $66, $60 ; $189A3D |
  db $67, $93, $0F, $01, $9A, $23, $02, $8D ; $189A45 |
  db $74, $60, $74, $88, $02, $8D, $74, $60 ; $189A4D |
  db $74, $88, $8D, $6D, $6D, $60, $6D, $80 ; $189A55 |
  db $6D, $80, $8D, $6C, $8B, $04, $00, $04 ; $189A5D |
  db $00, $02, $8B, $72, $60, $72, $86, $0E ; $189A65 |
  db $03, $9A, $64, $13, $00, $9A, $8A, $04 ; $189A6D |
  db $00, $02, $8A, $71, $60, $71, $85, $0E ; $189A75 |
  db $02, $9A, $74, $02, $8A, $6A, $60, $6A ; $189A7D |
  db $96, $0F, $01, $9A, $62, $09, $02, $02 ; $189A85 |
  db $8F, $76, $60, $76, $8A, $02, $8F, $76 ; $189A8D |
  db $60, $76, $8A, $09, $03, $88, $60, $68 ; $189A95 |
  db $60, $68, $80, $68, $02, $80, $09, $02 ; $189A9D |
  db $06, $FF, $01, $48, $0D, $7F, $01, $4A ; $189AA5 |
  db $4B, $4C, $4D, $4E, $4F, $50, $0D, $00 ; $189AAD |
  db $04, $00, $04, $00, $06, $E6, $02, $91 ; $189AB5 |
  db $02, $71, $02, $60, $98, $0E, $03, $9A ; $189ABD |
  db $B7, $04, $00, $02, $96, $02, $76, $02 ; $189AC5 |
  db $60, $9D, $0E, $02, $9A, $C6, $02, $96 ; $189ACD |
  db $02, $95, $94, $0F, $01, $9A, $B5, $02 ; $189AD5 |
  db $8F, $02, $6F, $02, $60, $96, $02, $8F ; $189ADD |
  db $02, $6F, $02, $60, $96, $02, $94, $02 ; $189AE5 |
  db $74, $02, $60, $9B, $02, $94, $02, $74 ; $189AED |
  db $02, $60, $9B, $02, $8D, $02, $6D, $02 ; $189AF5 |
  db $60, $94, $02, $8D, $02, $6D, $02, $60 ; $189AFD |
  db $94, $76, $60, $76, $80, $76, $80, $76 ; $189B05 |
  db $02, $80, $AF, $09, $03, $16, $9A, $21 ; $189B0D |
  db $17, $08, $14, $09, $01, $0B, $FF, $04 ; $189B15 |
  db $00, $04, $00, $06, $C8, $07, $09, $64 ; $189B1D |
  db $07, $08, $6E, $6E, $07, $09, $64, $06 ; $189B25 |
  db $2E, $69, $06, $C8, $07, $08, $6E, $6E ; $189B2D |
  db $6D, $0E, $06, $9B, $1E, $64, $6F, $6F ; $189B35 |
  db $06, $2E, $69, $6E, $69, $06, $C8, $6F ; $189B3D |
  db $6F, $0F, $03, $9B, $1C, $04, $00, $04 ; $189B45 |
  db $00, $07, $09, $64, $6F, $6F, $64, $06 ; $189B4D |
  db $2E, $69, $06, $C8, $6F, $6F, $6F, $0E ; $189B55 |
  db $0D, $9B, $4C, $64, $6F, $06, $2E, $69 ; $189B5D |
  db $6F, $64, $69, $6F, $6F, $69, $06, $C8 ; $189B65 |
  db $6F, $6F, $06, $2E, $69, $64, $69, $69 ; $189B6D |
  db $69, $04, $00, $06, $C8, $64, $6F, $6F ; $189B75 |
  db $63, $06, $2E, $69, $06, $C8, $6F, $6F ; $189B7D |
  db $6F, $0E, $17, $9B, $76, $04, $00, $04 ; $189B85 |
  db $00, $64, $6F, $6F, $64, $06, $2E, $69 ; $189B8D |
  db $06, $C8, $6F, $6F, $6F, $0E, $06, $9B ; $189B95 |
  db $8C, $64, $6F, $6F, $06, $2E, $69, $6E ; $189B9D |
  db $69, $06, $C8, $6F, $6F, $0F, $01, $9B ; $189BA5 |
  db $8A, $16, $9B, $4A, $17, $00, $9B, $BB ; $189BAD |
  db $9C, $C5, $9E, $05, $9E, $8C, $05, $02 ; $189BB5 |
  db $00, $0A, $07, $04, $08, $06, $E6, $07 ; $189BBD |
  db $09, $09, $01, $18, $C0, $04, $08, $08 ; $189BC5 |
  db $07, $02, $CC, $08, $04, $8C, $80, $08 ; $189BCD |
  db $07, $02, $CD, $08, $04, $8D, $80, $0E ; $189BD5 |
  db $01, $9B, $CA, $18, $00, $08, $01, $02 ; $189BDD |
  db $AC, $D3, $8C, $0D, $7F, $02, $CD, $AF ; $189BE5 |
  db $0D, $00, $02, $CC, $0D, $7F, $8D, $88 ; $189BED |
  db $0D, $00, $E7, $02, $AC, $D3, $8C, $0D ; $189BF5 |
  db $7F, $02, $CD, $AF, $06, $F8, $EC, $0D ; $189BFD |
  db $00, $F1, $08, $07, $18, $C0, $01, $AF ; $189C05 |
  db $08, $01, $CF, $08, $07, $01, $8F, $8A ; $189C0D |
  db $A7, $A8, $AC, $AF, $01, $AD, $08, $01 ; $189C15 |
  db $CD, $08, $07, $02, $01, $8D, $63, $A3 ; $189C1D |
  db $A5, $A6, $AA, $09, $02, $00, $81, $80 ; $189C25 |
  db $03, $98, $80, $97, $98, $9B, $80, $9A ; $189C2D |
  db $80, $99, $9A, $9D, $80, $9C, $80, $9B ; $189C35 |
  db $9C, $9F, $80, $9E, $80, $9D, $9E, $06 ; $189C3D |
  db $FF, $03, $8A, $8C, $8A, $8C, $07, $05 ; $189C45 |
  db $8A, $8C, $8A, $8C, $07, $04, $8A, $8C ; $189C4D |
  db $8A, $8C, $00, $01, $AA, $07, $03, $CA ; $189C55 |
  db $07, $02, $01, $AA, $04, $00, $07, $09 ; $189C5D |
  db $06, $FF, $18, $40, $D9, $97, $8D, $93 ; $189C65 |
  db $8D, $D9, $97, $8D, $93, $8D, $06, $F5 ; $189C6D |
  db $02, $9C, $02, $9A, $99, $12, $00, $9C ; $189C75 |
  db $94, $02, $97, $02, $9A, $99, $02, $97 ; $189C7D |
  db $02, $95, $97, $01, $B5, $08, $01, $01 ; $189C85 |
  db $B5, $08, $07, $0E, $01, $9C, $61, $02 ; $189C8D |
  db $B7, $79, $7A, $02, $9C, $02, $9A, $99 ; $189C95 |
  db $02, $97, $02, $99, $9A, $01, $BB, $08 ; $189C9D |
  db $0B, $02, $01, $DB, $08, $06, $00, $03 ; $189CA5 |
  db $8F, $08, $0A, $18, $00, $06, $50, $07 ; $189CAD |
  db $0B, $8E, $8D, $8C, $8B, $8A, $89, $88 ; $189CB5 |
  db $87, $86, $85, $84, $16, $9B, $C0, $17 ; $189CBD |
  db $04, $00, $06, $46, $07, $0A, $08, $11 ; $189CC5 |
  db $09, $02, $18, $80, $0C, $FF, $04, $00 ; $189CCD |
  db $04, $00, $80, $78, $02, $9D, $98, $9F ; $189CD5 |
  db $98, $7D, $80, $78, $80, $79, $02, $9F ; $189CDD |
  db $99, $03, $89, $81, $67, $80, $61, $13 ; $189CE5 |
  db $08, $9D, $0E, $0E, $02, $9C, $D5, $80 ; $189CED |
  db $03, $78, $02, $9D, $98, $9F, $98, $7D ; $189CF5 |
  db $80, $79, $80, $79, $02, $9F, $99, $03 ; $189CFD |
  db $89, $81, $67, $80, $61, $0F, $01, $9C ; $189D05 |
  db $D3, $80, $03, $78, $02, $9D, $98, $9F ; $189D0D |
  db $98, $7D, $80, $78, $80, $7A, $02, $9D ; $189D15 |
  db $9A, $9F, $9A, $7D, $80, $7A, $08, $07 ; $189D1D |
  db $06, $F8, $07, $08, $09, $00, $18, $40 ; $189D25 |
  db $02, $92, $02, $96, $9B, $9E, $7B, $03 ; $189D2D |
  db $8A, $60, $8D, $02, $03, $91, $02, $94 ; $189D35 |
  db $78, $02, $9B, $78, $9F, $60, $03, $8A ; $189D3D |
  db $02, $03, $8F, $02, $92, $99, $9B, $76 ; $189D45 |
  db $9B, $80, $7E, $BE, $03, $A8, $AA, $AD ; $189D4D |
  db $08, $07, $09, $01, $00, $89, $80, $88 ; $189D55 |
  db $80, $87, $88, $8B, $80, $8A, $80, $89 ; $189D5D |
  db $8A, $8D, $80, $8C, $80, $8B, $8C, $8F ; $189D65 |
  db $80, $8E, $80, $8D, $8E, $06, $FF, $92 ; $189D6D |
  db $94, $92, $94, $07, $05, $92, $94, $92 ; $189D75 |
  db $94, $07, $04, $92, $94, $92, $94, $00 ; $189D7D |
  db $01, $B2, $07, $03, $D2, $07, $02, $01 ; $189D85 |
  db $B2, $04, $00, $04, $00, $80, $08, $07 ; $189D8D |
  db $06, $FF, $07, $08, $09, $02, $6D, $02 ; $189D95 |
  db $93, $8D, $80, $18, $80, $08, $0E, $06 ; $189D9D |
  db $5A, $07, $07, $7C, $03, $69, $6B, $64 ; $189DA5 |
  db $69, $70, $18, $40, $0E, $01, $9D, $90 ; $189DAD |
  db $08, $07, $06, $F5, $07, $07, $02, $81 ; $189DB5 |
  db $02, $03, $97, $95, $13, $00, $9D, $D8 ; $189DBD |
  db $02, $93, $02, $97, $95, $02, $93, $02 ; $189DC5 |
  db $90, $93, $02, $92, $02, $90, $8E, $0F ; $189DCD |
  db $01, $9D, $8E, $02, $B3, $75, $77, $02 ; $189DD5 |
  db $99, $02, $97, $96, $02, $94, $02, $96 ; $189DDD |
  db $97, $96, $80, $AF, $B6, $B9, $00, $9B ; $189DE5 |
  db $80, $08, $0A, $18, $00, $06, $50, $07 ; $189DED |
  db $0B, $03, $8F, $8E, $8D, $8C, $8B, $8A ; $189DF5 |
  db $89, $88, $87, $86, $16, $9C, $C5, $17 ; $189DFD |
  db $04, $00, $08, $0E, $09, $02, $04, $00 ; $189E05 |
  db $06, $DC, $02, $88, $6F, $A0, $06, $82 ; $189E0D |
  db $B4, $A8, $06, $DC, $12, $00, $9E, $29 ; $189E15 |
  db $02, $89, $70, $A0, $06, $82, $B5, $A9 ; $189E1D |
  db $0E, $05, $9E, $0B, $02, $87, $6E, $A0 ; $189E25 |
  db $06, $82, $B3, $A7, $06, $DC, $02, $86 ; $189E2D |
  db $6D, $A0, $06, $82, $B2, $A6, $06, $DC ; $189E35 |
  db $02, $85, $6C, $A0, $06, $82, $B1, $A5 ; $189E3D |
  db $04, $00, $06, $DC, $02, $83, $6A, $A0 ; $189E45 |
  db $06, $82, $AF, $A3, $0E, $01, $9E, $45 ; $189E4D |
  db $06, $DC, $C8, $C8, $C8, $C8, $01, $E8 ; $189E55 |
  db $02, $C8, $02, $01, $88, $60, $04, $00 ; $189E5D |
  db $02, $89, $75, $A0, $06, $82, $AE, $B3 ; $189E65 |
  db $06, $DC, $0E, $06, $9E, $63, $02, $8A ; $189E6D |
  db $76, $A0, $06, $82, $B1, $B6, $06, $DC ; $189E75 |
  db $02, $83, $6F, $A0, $06, $82, $AA, $AF ; $189E7D |
  db $06, $F0, $E3, $16, $9E, $05, $17, $04 ; $189E85 |
  db $00, $04, $00, $04, $00, $06, $3C, $08 ; $189E8D |
  db $19, $09, $00, $07, $09, $68, $60, $68 ; $189E95 |
  db $6B, $60, $68, $6C, $60, $6C, $60, $68 ; $189E9D |
  db $02, $80, $12, $00, $9E, $B1, $68, $60 ; $189EA5 |
  db $0E, $01, $9E, $90, $6B, $6B, $0F, $05 ; $189EAD |
  db $9E, $8E, $04, $00, $69, $60, $69, $69 ; $189EB5 |
  db $80, $69, $69, $69, $60, $69, $02, $80 ; $189EBD |
  db $6B, $6B, $0E, $03, $9E, $B7, $08, $14 ; $189EC5 |
  db $06, $C8, $07, $0B, $CC, $CC, $CB, $CB ; $189ECD |
  db $EA, $07, $08, $AF, $AD, $08, $19, $06 ; $189ED5 |
  db $3C, $07, $08, $68, $69, $6A, $6B, $6C ; $189EDD |
  db $6B, $6A, $69, $08, $14, $06, $C8, $04 ; $189EE5 |
  db $00, $02, $85, $06, $01, $02, $8A, $06 ; $189EED |
  db $C8, $6E, $6E, $85, $6E, $6E, $06, $01 ; $189EF5 |
  db $8A, $06, $C8, $6E, $6E, $0E, $08, $9E ; $189EFD |
  db $EC, $07, $0B, $AA, $AA, $AA, $AA, $16 ; $189F05 |
  db $9E, $8C, $17, $00, $9F, $19, $A0, $36 ; $189F0D |
  db $A1, $33, $A2, $3A, $05, $01, $A7, $0A ; $189F15 |
  db $02, $04, $00, $04, $00, $06, $5A, $07 ; $189F1D |
  db $09, $09, $02, $08, $13, $18, $80, $90 ; $189F25 |
  db $60, $02, $01, $DA, $01, $9A, $60, $08 ; $189F2D |
  db $04, $79, $79, $A0, $06, $6E, $08, $03 ; $189F35 |
  db $03, $6D, $80, $07, $0C, $18, $C0, $6D ; $189F3D |
  db $A0, $0E, $01, $9F, $20, $06, $5A, $08 ; $189F45 |
  db $13, $07, $09, $18, $80, $03, $96, $60 ; $189F4D |
  db $02, $01, $DD, $01, $9D, $60, $08, $04 ; $189F55 |
  db $7C, $7C, $A0, $06, $46, $08, $1A, $07 ; $189F5D |
  db $0B, $18, $C0, $03, $6C, $60, $18, $80 ; $189F65 |
  db $64, $07, $0A, $18, $C0, $6C, $60, $07 ; $189F6D |
  db $08, $18, $80, $64, $18, $C0, $6C, $60 ; $189F75 |
  db $06, $F0, $08, $01, $18, $80, $61, $63 ; $189F7D |
  db $65, $02, $C8, $60, $C7, $C5, $04, $00 ; $189F85 |
  db $07, $00, $A0, $07, $09, $08, $05, $18 ; $189F8D |
  db $80, $02, $01, $96, $07, $04, $0D, $08 ; $189F95 |
  db $5B, $5C, $07, $09, $01, $DD, $0D, $00 ; $189F9D |
  db $80, $7B, $80, $03, $68, $80, $02, $03 ; $189FA5 |
  db $94, $01, $55, $07, $08, $0D, $1E, $56 ; $189FAD |
  db $01, $96, $07, $09, $0D, $00, $8F, $01 ; $189FB5 |
  db $B1, $08, $01, $F1, $01, $B1, $60, $08 ; $189FBD |
  db $05, $9D, $54, $02, $60, $01, $9D, $07 ; $189FC5 |
  db $05, $0D, $64, $01, $71, $0D, $00, $07 ; $189FCD |
  db $09, $0E, $01, $9F, $8B, $02, $9D, $9B ; $189FD5 |
  db $60, $99, $02, $9B, $94, $60, $03, $88 ; $189FDD |
  db $02, $86, $85, $60, $83, $60, $41, $02 ; $189FE5 |
  db $60, $AA, $60, $02, $88, $86, $60, $84 ; $189FED |
  db $A3, $03, $B2, $F4, $02, $9F, $9D, $60 ; $189FF5 |
  db $9B, $02, $9D                          ; $189FFD |
