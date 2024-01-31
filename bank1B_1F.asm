; 5 code banks

bank $1B
org $8000

  LDA $30                                   ; $1BA000 |
  CMP #$06                                  ; $1B8002 |
  BCC code_1B800C                           ; $1B8004 |
  LDA #$00                                  ; $1B8006 |
  STA $33                                   ; $1B8008 |
  STA $34                                   ; $1B800A |
code_1B800C:
  LDA $54                                   ; $1B800C |
  BNE code_1B8038                           ; $1B800E |
  LDA $33                                   ; $1B8010 |
  BEQ code_1B8025                           ; $1B8012 |
  DEC $33                                   ; $1B8014 |
  BNE code_1B8025                           ; $1B8016 |
  LDA {animation_index}                     ; $1B8018 |
  SEC                                       ; $1B801B |
  SBC $34                                   ; $1B801C |
  STA {animation_index}                     ; $1B801E |
  LDA #$00                                  ; $1B8021 |
  STA $34                                   ; $1B8023 |
code_1B8025:
  LDX #$00                                  ; $1B8025 |
  STX $37                                   ; $1B8027 |
  LDY $30                                   ; $1B8029 |
  LDA $8045,y                               ; $1B802B |
  STA $00                                   ; $1B802E |
  LDA $8069,y                               ; $1B8030 |
  STA $01                                   ; $1B8033 |
  JMP ($0000)                               ; $1B8035 |

code_1B8038:
  LDA #$00                                  ; $1B8038 |
  STA {animation_timer}                     ; $1B803A |
  DEC $54                                   ; $1B803D |
  BNE code_1B8044                           ; $1B803F |
  JSR code_1FF3BF                           ; $1B8041 |
code_1B8044:
  RTS                                       ; $1B8044 |

  db $8D, $15, $99, $40, $DF, $5E, $5F, $09 ; $1B8045 |
  db $39, $D4, $06, $2E, $95, $96, $E3, $59 ; $1B804D |
  db $07, $64, $98, $CA, $8B, $F3, $39, $5E ; $1B8055 |
  db $E4, $4A, $63, $63, $64, $03, $59, $04 ; $1B805D |
  db $7B, $EE, $96, $D0, $80, $82, $82, $83 ; $1B8065 |
  db $83, $84, $84, $85, $85, $85, $86, $86 ; $1B806D |
  db $86, $86, $86, $87, $88, $88, $88, $88 ; $1B8075 |
  db $89, $89, $8A, $8A, $8A, $8B, $8B, $8B ; $1B807D |
  db $8B, $8C, $8C, $8D, $8D, $8D, $8E, $8E ; $1B8085 |

  JSR code_1B8215                           ; $1B808D |
  BCC code_1B8044                           ; $1B8090 |
  LDA $14                                   ; $1B8092 |
  AND #$80                                  ; $1B8094 |
  BNE code_1B809B                           ; $1B8096 |
  JMP code_1B814A                           ; $1B8098 |

code_1B809B:
  LDA $16                                   ; $1B809B |
  LDY $AF                                   ; $1B809D |
  AND $9067,y                               ; $1B809F |
  BNE code_1B80C2                           ; $1B80A2 |
code_1B80A4:
  LDA $AF                                   ; $1B80A4 |
  BNE code_1B80B5                           ; $1B80A6 |
  LDA #$00                                  ; $1B80A8 |
  STA {y_speed_frac}                        ; $1B80AA |
  LDA #$05                                  ; $1B80AD |
  STA {y_speed}                             ; $1B80AF |
  JMP code_1B8215                           ; $1B80B2 |

code_1B80B5:
  LDA #$00                                  ; $1B80B5 |
  STA {y_speed_frac}                        ; $1B80B7 |
  LDA #$FB                                  ; $1B80BA |
  STA {y_speed}                             ; $1B80BC |
  JMP code_1B8215                           ; $1B80BF |

code_1B80C2:
  LDA #$02                                  ; $1B80C2 |
  STA $08                                   ; $1B80C4 |
  LDA {entity_display_flags}                ; $1B80C6 |
  AND #$20                                  ; $1B80C9 |
  BEQ code_1B80D1                           ; $1B80CB |
  LDA #$01                                  ; $1B80CD |
  STA $08                                   ; $1B80CF |
code_1B80D1:
  LDA $16                                   ; $1B80D1 |
  AND #$03                                  ; $1B80D3 |
  BEQ code_1B80D9                           ; $1B80D5 |
  STA $08                                   ; $1B80D7 |
code_1B80D9:
  LDA $08                                   ; $1B80D9 |
  LSR                                       ; $1B80DB |
  CLC                                       ; $1B80DC |
  ADC #$08                                  ; $1B80DD |
  TAY                                       ; $1B80DF |
  JSR code_1B984F                           ; $1B80E0 |
  LDA $10                                   ; $1B80E3 |
  AND #$10                                  ; $1B80E5 |
  BNE code_1B814A                           ; $1B80E7 |
  LDA $08                                   ; $1B80E9 |
  STA $31                                   ; $1B80EB |
  STA {entity_direction}                    ; $1B80ED |
  LDA #$1A                                  ; $1B80F0 |
  STA $35                                   ; $1B80F2 |
  LDA #$02                                  ; $1B80F4 |
  STA $30                                   ; $1B80F6 |
  LDA #$80                                  ; $1B80F8 |
  STA {x_speed_frac}                        ; $1B80FA |
  LDA #$02                                  ; $1B80FD |
  STA {x_speed}                             ; $1B80FF |
  LDA #$10                                  ; $1B8102 |
  LDY $32                                   ; $1B8104 |
  CPY #$08                                  ; $1B8106 |
  BNE code_1B811C                           ; $1B8108 |
  LDY $B8                                   ; $1B810A |
  CPY #$80                                  ; $1B810C |
  BEQ code_1B811C                           ; $1B810E |
  LDA #$01                                  ; $1B8110 |
  JSR code_1B953D                           ; $1B8112 |
  LDA #$23                                  ; $1B8115 |
  JSR code_1FEC5D                           ; $1B8117 |
  LDA #$B0                                  ; $1B811A |
code_1B811C:
  JSR code_1FEA98                           ; $1B811C |
  LDY $AF                                   ; $1B811F |
  LDA {y_position_low}                      ; $1B8121 |
  CLC                                       ; $1B8124 |
  ADC $8EF1,y                               ; $1B8125 |
  STA {y_position_low}                      ; $1B8128 |
  LDA #$00                                  ; $1B812B |
  STA $34                                   ; $1B812D |
  STA $33                                   ; $1B812F |
  LDA $0305                                 ; $1B8131 |
  BNE code_1B8147                           ; $1B8134 |
  LDA #$17                                  ; $1B8136 |
  LDY #$05                                  ; $1B8138 |
  JSR code_1FEAA4                           ; $1B813A |
  LDA #$01                                  ; $1B813D |
  STA $0305                                 ; $1B813F |
  LDA #$00                                  ; $1B8142 |
  STA $040D                                 ; $1B8144 |
code_1B8147:
  JMP code_1B82C8                           ; $1B8147 |

code_1B814A:
  LDY $AF                                   ; $1B814A |
  LDA $16                                   ; $1B814C |
  AND $8EF7,y                               ; $1B814E |
  BEQ code_1B8186                           ; $1B8151 |
  LDA $49                                   ; $1B8153 |
  CMP #$40                                  ; $1B8155 |
  BNE code_1B8186                           ; $1B8157 |
  LDA $11                                   ; $1B8159 |
  AND #$F0                                  ; $1B815B |
  ORA $8EF9,y                               ; $1B815D |
  STA {y_position_low}                      ; $1B8160 |
  LDA {x_position_low}                      ; $1B8163 |
  AND #$F0                                  ; $1B8166 |
  ORA #$08                                  ; $1B8168 |
  STA {x_position_low}                      ; $1B816A |
  LDA #$4C                                  ; $1B816D |
  STA {y_speed_frac}                        ; $1B816F |
  LDA #$01                                  ; $1B8172 |
  STA {y_speed}                             ; $1B8174 |
  LDA #$03                                  ; $1B8177 |
  STA $30                                   ; $1B8179 |
  LDA #$14                                  ; $1B817B |
  CLC                                       ; $1B817D |
  ADC $34                                   ; $1B817E |
  JSR code_1FEA98                           ; $1B8180 |
  JMP code_1B820E                           ; $1B8183 |

code_1B8186:
  LDA {animation_index}                     ; $1B8186 |
  CMP #$04                                  ; $1B8189 |
  BEQ code_1B81B5                           ; $1B818B |
  CMP #$05                                  ; $1B818D |
  BEQ code_1B81B5                           ; $1B818F |
  CMP #$0D                                  ; $1B8191 |
  BEQ code_1B819D                           ; $1B8193 |
  CMP #$0E                                  ; $1B8195 |
  BEQ code_1B819D                           ; $1B8197 |
  CMP #$0F                                  ; $1B8199 |
  BNE code_1B81BF                           ; $1B819B |
code_1B819D:
  LDA {animation_frame}                     ; $1B819D |
  BEQ code_1B820E                           ; $1B81A0 |
  LDA $16                                   ; $1B81A2 |
  AND #$03                                  ; $1B81A4 |
  BEQ code_1B81E8                           ; $1B81A6 |
  STA $31                                   ; $1B81A8 |
  LDA #$04                                  ; $1B81AA |
  CLC                                       ; $1B81AC |
  ADC $34                                   ; $1B81AD |
  JSR code_1FEA98                           ; $1B81AF |
  JMP code_1B81CF                           ; $1B81B2 |

code_1B81B5:
  LDA $16                                   ; $1B81B5 |
  AND #$03                                  ; $1B81B7 |
  BEQ code_1B81E1                           ; $1B81B9 |
  AND $31                                   ; $1B81BB |
  BNE code_1B81CF                           ; $1B81BD |
code_1B81BF:
  LDA $16                                   ; $1B81BF |
  AND #$03                                  ; $1B81C1 |
  BEQ code_1B81E8                           ; $1B81C3 |
  STA $31                                   ; $1B81C5 |
  LDA #$0D                                  ; $1B81C7 |
  CLC                                       ; $1B81C9 |
  ADC $34                                   ; $1B81CA |
  JSR code_1FEA98                           ; $1B81CC |
code_1B81CF:
  LDA {entity_var_e}                        ; $1B81CF |
  BNE code_1B8201                           ; $1B81D2 |
  LDA $31                                   ; $1B81D4 |
  STA {entity_direction}                    ; $1B81D6 |
  LDY #$00                                  ; $1B81D9 |
  JSR code_1FEA3F                           ; $1B81DB |
  JMP code_1B820E                           ; $1B81DE |

code_1B81E1:
  LDA #$0D                                  ; $1B81E1 |
  CLC                                       ; $1B81E3 |
  ADC $34                                   ; $1B81E4 |
  BNE code_1B820B                           ; $1B81E6 |
code_1B81E8:
  LDY $73                                   ; $1B81E8 |
  BEQ code_1B8201                           ; $1B81EA |
  LDA $34                                   ; $1B81EC |
  BNE code_1B8201                           ; $1B81EE |
  LDA {animation_index},y                   ; $1B81F0 |
  CMP #$52                                  ; $1B81F3 |
  BNE code_1B8201                           ; $1B81F5 |
  LDA #$1B                                  ; $1B81F7 |
  CMP {animation_index}                     ; $1B81F9 |
  BEQ code_1B8214                           ; $1B81FC |
  JMP code_1FEA98                           ; $1B81FE |

code_1B8201:
  LDA #$01                                  ; $1B8201 |
  CLC                                       ; $1B8203 |
  ADC $34                                   ; $1B8204 |
  CMP {animation_index}                     ; $1B8206 |
  BEQ code_1B820E                           ; $1B8209 |
code_1B820B:
  JSR code_1FEA98                           ; $1B820B |
code_1B820E:
  JSR code_1B906B                           ; $1B820E |
  JSR code_1B95F8                           ; $1B8211 |
code_1B8214:
  RTS                                       ; $1B8214 |

code_1B8215:
  LDY #$00                                  ; $1B8215 |
  JSR code_1FE7B7                           ; $1B8217 |
  JSR code_1B97DF                           ; $1B821A |
  JSR code_1B964C                           ; $1B821D |
  PHP                                       ; $1B8220 |
  BCC code_1B823A                           ; $1B8221 |
  LDA $26                                   ; $1B8223 |
  CMP #$0E                                  ; $1B8225 |
  BNE code_1B823A                           ; $1B8227 |
  LDA {x_position_high}                     ; $1B8229 |
  CMP #$04                                  ; $1B822C |
  BNE code_1B823A                           ; $1B822E |
  LDA #$80                                  ; $1B8230 |
  STA {y_speed_frac}                        ; $1B8232 |
  LDA #$FD                                  ; $1B8235 |
  STA {y_speed}                             ; $1B8237 |
code_1B823A:
  PLP                                       ; $1B823A |
  BCS code_1B826E                           ; $1B823B |
  LDA #$07                                  ; $1B823D |
  CMP {animation_index}                     ; $1B823F |
  BEQ code_1B824E                           ; $1B8242 |
  CLC                                       ; $1B8244 |
  ADC $34                                   ; $1B8245 |
  JSR code_1FEA98                           ; $1B8247 |
  LDA #$01                                  ; $1B824A |
  STA $30                                   ; $1B824C |
code_1B824E:
  LDA $AF                                   ; $1B824E |
  BEQ code_1B8259                           ; $1B8250 |
  LDA {y_speed}                             ; $1B8252 |
  BPL code_1B8283                           ; $1B8255 |
  BMI code_1B825E                           ; $1B8257 |
code_1B8259:
  LDA {y_speed}                             ; $1B8259 |
  BMI code_1B8283                           ; $1B825C |
code_1B825E:
  LDA $16                                   ; $1B825E |
  AND #$80                                  ; $1B8260 |
  BNE code_1B8283                           ; $1B8262 |
  LDA #$00                                  ; $1B8264 |
  STA {y_speed_frac}                        ; $1B8266 |
  STA {y_speed}                             ; $1B8269 |
  BEQ code_1B8283                           ; $1B826C |
code_1B826E:
  LDA $30                                   ; $1B826E |
  BEQ code_1B8298                           ; $1B8270 |
  LDA #$00                                  ; $1B8272 |
  STA $30                                   ; $1B8274 |
  LDA #$04                                  ; $1B8276 |
  CLC                                       ; $1B8278 |
  ADC $34                                   ; $1B8279 |
  JSR code_1FEA98                           ; $1B827B |
  LDA #$1B                                  ; $1B827E |
  JSR code_1FEC5D                           ; $1B8280 |
code_1B8283:
  LDA $16                                   ; $1B8283 |
  AND #$03                                  ; $1B8285 |
  STA {entity_direction}                    ; $1B8287 |
  STA $31                                   ; $1B828A |
  LDY #$00                                  ; $1B828C |
  JSR code_1FEA3F                           ; $1B828E |
  JSR code_1B906B                           ; $1B8291 |
  JSR code_1B95F8                           ; $1B8294 |
  CLC                                       ; $1B8297 |
code_1B8298:
  RTS                                       ; $1B8298 |

  LDY #$04                                  ; $1B8299 |
  JSR code_1FE7B7                           ; $1B829B |
  JSR code_1B964C                           ; $1B829E |
  BCC code_1B830C                           ; $1B82A1 |
  LDA $14                                   ; $1B82A3 |
  AND #$80                                  ; $1B82A5 |
  BEQ code_1B82C8                           ; $1B82A7 |
  LDA $16                                   ; $1B82A9 |
  AND #$04                                  ; $1B82AB |
  BNE code_1B82C8                           ; $1B82AD |
  LDA #$02                                  ; $1B82AF |
  ORA $AF                                   ; $1B82B1 |
  TAY                                       ; $1B82B3 |
  JSR code_1B9845                           ; $1B82B4 |
  LDA $10                                   ; $1B82B7 |
  BNE code_1B82C8                           ; $1B82B9 |
  LDA #$4C                                  ; $1B82BB |
  STA {x_speed_frac}                        ; $1B82BD |
  LDA #$01                                  ; $1B82C0 |
  STA {x_speed}                             ; $1B82C2 |
  JMP code_1B80A4                           ; $1B82C5 |

code_1B82C8:
  LDA $16                                   ; $1B82C8 |
  AND #$03                                  ; $1B82CA |
  BEQ code_1B82DF                           ; $1B82CC |
  STA $00                                   ; $1B82CE |
  AND $31                                   ; $1B82D0 |
  BNE code_1B82DF                           ; $1B82D2 |
  LDA $00                                   ; $1B82D4 |
  STA $31                                   ; $1B82D6 |
  STA {entity_direction}                    ; $1B82D8 |
  LDA #$00                                  ; $1B82DB |
  STA $35                                   ; $1B82DD |
code_1B82DF:
  LDA $AF                                   ; $1B82DF |
  ASL                                       ; $1B82E1 |
  ADC #$04                                  ; $1B82E2 |
  TAY                                       ; $1B82E4 |
  JSR code_1FEA3F                           ; $1B82E5 |
  BCS code_1B82F2                           ; $1B82E8 |
  LDA $35                                   ; $1B82EA |
  BEQ code_1B82F2                           ; $1B82EC |
  DEC $35                                   ; $1B82EE |
  BNE code_1B832D                           ; $1B82F0 |
code_1B82F2:
  LDA #$02                                  ; $1B82F2 |
  ORA $AF                                   ; $1B82F4 |
  TAY                                       ; $1B82F6 |
  JSR code_1EC4A1                           ; $1B82F7 |
  LDA $10                                   ; $1B82FA |
  AND #$10                                  ; $1B82FC |
  BNE code_1B832D                           ; $1B82FE |
  LDY $AF                                   ; $1B8300 |
  LDA {y_position_low}                      ; $1B8302 |
  SEC                                       ; $1B8305 |
  SBC $8EF1,y                               ; $1B8306 |
  STA {y_position_low}                      ; $1B8309 |
code_1B830C:
  LDA #$00                                  ; $1B830C |
  STA $30                                   ; $1B830E |
  LDA #$4C                                  ; $1B8310 |
  STA {x_speed_frac}                        ; $1B8312 |
  LDA #$01                                  ; $1B8315 |
  STA {x_speed}                             ; $1B8317 |
  LDA #$04                                  ; $1B831A |
  JSR code_1FEA98                           ; $1B831C |
  LDY $AF                                   ; $1B831F |
  LDA $8EF3,y                               ; $1B8321 |
  STA {y_speed_frac}                        ; $1B8324 |
  LDA $8EF5,y                               ; $1B8327 |
  STA {y_speed}                             ; $1B832A |
code_1B832D:
  LDA $9D                                   ; $1B832D |
  AND #$07                                  ; $1B832F |
  STA $00                                   ; $1B8331 |
  LDA $38                                   ; $1B8333 |
  BEQ code_1B833F                           ; $1B8335 |
  AND #$F8                                  ; $1B8337 |
  CLC                                       ; $1B8339 |
  ADC $00                                   ; $1B833A |
  JSR code_1B914C                           ; $1B833C |
code_1B833F:
  RTS                                       ; $1B833F |

  JSR code_1B906B                           ; $1B8340 |
  LDA $34                                   ; $1B8343 |
  BNE code_1B833F                           ; $1B8345 |
  LDA $16                                   ; $1B8347 |
  AND #$0C                                  ; $1B8349 |
  BNE code_1B8354                           ; $1B834B |
  LDA #$00                                  ; $1B834D |
  STA {animation_timer}                     ; $1B834F |
  BEQ code_1B836C                           ; $1B8352 |
code_1B8354:
  STA {entity_direction}                    ; $1B8354 |
  STA $31                                   ; $1B8357 |
  LDY #$00                                  ; $1B8359 |
  JSR code_1FEA52                           ; $1B835B |
  BCC code_1B836C                           ; $1B835E |
  LDY $AF                                   ; $1B8360 |
  LDA {entity_direction}                    ; $1B8362 |
  AND $8EF7,y                               ; $1B8365 |
  BNE code_1B83C8                           ; $1B8368 |
  BEQ code_1B83B7                           ; $1B836A |
code_1B836C:
  LDA #$02                                  ; $1B836C |
  ORA $AF                                   ; $1B836E |
  TAY                                       ; $1B8370 |
  JSR code_1B984F                           ; $1B8371 |
  LDY #$02                                  ; $1B8374 |
code_1B8376:
  LDA $0048,y                               ; $1B8376 |
  CMP #$20                                  ; $1B8379 |
  BEQ code_1B8386                           ; $1B837B |
  CMP #$40                                  ; $1B837D |
  BEQ code_1B8386                           ; $1B837F |
  DEY                                       ; $1B8381 |
  BPL code_1B8376                           ; $1B8382 |
  BMI code_1B83C8                           ; $1B8384 |
code_1B8386:
  LDA {x_position_low}                      ; $1B8386 |
  AND #$F0                                  ; $1B8389 |
  ORA #$08                                  ; $1B838B |
  STA {x_position_low}                      ; $1B838D |
  LDA {entity_display_flags}                ; $1B8390 |
  AND #$EF                                  ; $1B8393 |
  STA {entity_display_flags}                ; $1B8395 |
  LDX #$0A                                  ; $1B8398 |
  LDA $49                                   ; $1B839A |
  BNE code_1B83A9                           ; $1B839C |
  LDA $AF                                   ; $1B839E |
  ASL                                       ; $1B83A0 |
  TAY                                       ; $1B83A1 |
  LDA $0048,y                               ; $1B83A2 |
  BNE code_1B83A9                           ; $1B83A5 |
  LDX #$14                                  ; $1B83A7 |
code_1B83A9:
  TXA                                       ; $1B83A9 |
  LDX #$00                                  ; $1B83AA |
  CLC                                       ; $1B83AC |
  ADC $34                                   ; $1B83AD |
  CMP {animation_index}                     ; $1B83AF |
  BEQ code_1B83BC                           ; $1B83B2 |
  JMP code_1FEA98                           ; $1B83B4 |

code_1B83B7:
  LDA #$00                                  ; $1B83B7 |
  STA {animation_timer}                     ; $1B83B9 |
code_1B83BC:
  LDA $16                                   ; $1B83BC |
  AND #$0C                                  ; $1B83BE |
  BNE code_1B83DE                           ; $1B83C0 |
  LDA $14                                   ; $1B83C2 |
  AND #$80                                  ; $1B83C4 |
  BEQ code_1B83DE                           ; $1B83C6 |
code_1B83C8:
  LDA #$00                                  ; $1B83C8 |
  STA $30                                   ; $1B83CA |
  JSR reset_vertical_speed                  ; $1B83CC |
  LDA #$02                                  ; $1B83CF |
  STA $31                                   ; $1B83D1 |
  LDA {entity_display_flags}                ; $1B83D3 |
  AND #$20                                  ; $1B83D6 |
  BEQ code_1B83DE                           ; $1B83D8 |
  LDA #$01                                  ; $1B83DA |
  STA $31                                   ; $1B83DC |
code_1B83DE:
  RTS                                       ; $1B83DE |

  LDY #$00                                  ; $1B83DF |
  JSR code_1FE7B7                           ; $1B83E1 |
  PHP                                       ; $1B83E4 |
  LDA #$1E                                  ; $1B83E5 |
  STA $10                                   ; $1B83E7 |
  BCC code_1B83FF                           ; $1B83E9 |
  DEC $10                                   ; $1B83EB |
  LDA $14                                   ; $1B83ED |
  AND #$80                                  ; $1B83EF |
  BEQ code_1B83FF                           ; $1B83F1 |
  LDA #$00                                  ; $1B83F3 |
  STA {y_speed_frac}                        ; $1B83F5 |
  LDA #$05                                  ; $1B83F8 |
  STA {y_speed}                             ; $1B83FA |
  INC $10                                   ; $1B83FD |
code_1B83FF:
  LDA $10                                   ; $1B83FF |
  CMP {animation_index}                     ; $1B8401 |
  BEQ code_1B8409                           ; $1B8404 |
  JSR code_1FEA98                           ; $1B8406 |
code_1B8409:
  LDA {y_speed}                             ; $1B8409 |
  BMI code_1B841C                           ; $1B840C |
  LDA $16                                   ; $1B840E |
  AND #$80                                  ; $1B8410 |
  BNE code_1B841C                           ; $1B8412 |
  LDA #$00                                  ; $1B8414 |
  STA {y_speed_frac}                        ; $1B8416 |
  STA {y_speed}                             ; $1B8419 |
code_1B841C:
  LDA $16                                   ; $1B841C |
  AND #$03                                  ; $1B841E |
  BEQ code_1B8442                           ; $1B8420 |
  STA {entity_direction}                    ; $1B8422 |
  AND #$02                                  ; $1B8425 |
  TAY                                       ; $1B8427 |
  LDA $8F43,y                               ; $1B8428 |
  STA {x_speed_frac}                        ; $1B842B |
  LDA $8F44,y                               ; $1B842E |
  STA {x_speed}                             ; $1B8431 |
  JSR code_1FEA65                           ; $1B8434 |
  LDA {entity_display_flags}                ; $1B8437 |
  ORA #$20                                  ; $1B843A |
  STA {entity_display_flags}                ; $1B843C |
  JSR code_1B9859                           ; $1B843F |
code_1B8442:
  JSR code_1B90E3                           ; $1B8442 |
  PLP                                       ; $1B8445 |
  BCC code_1B845D                           ; $1B8446 |
  LDA {x_position_high}                     ; $1B8448 |
  CMP #$40                                  ; $1B844B |
  BNE code_1B845D                           ; $1B844D |
  LDA #$0E                                  ; $1B844F |
  STA $30                                   ; $1B8451 |
  LDA #$00                                  ; $1B8453 |
  STA {x_speed_frac}                        ; $1B8455 |
  LDA #$01                                  ; $1B8458 |
  STA {x_speed}                             ; $1B845A |
code_1B845D:
  RTS                                       ; $1B845D |

  RTS                                       ; $1B845E |

  LDY {entity_var_d}                        ; $1B845F |
  JSR code_1FE7B7                           ; $1B8462 |
  LDA #$80                                  ; $1B8465 |
  STA {x_speed_frac}                        ; $1B8467 |
  LDA #$00                                  ; $1B846A |
  STA {x_speed}                             ; $1B846C |
  LDA $16                                   ; $1B846F |
  AND #$03                                  ; $1B8471 |
  BEQ code_1B848D                           ; $1B8473 |
  EOR #$03                                  ; $1B8475 |
  ASL                                       ; $1B8477 |
  ASL                                       ; $1B8478 |
  ASL                                       ; $1B8479 |
  ASL                                       ; $1B847A |
  AND #$20                                  ; $1B847B |
  STA $00                                   ; $1B847D |
  LDA {entity_display_flags}                ; $1B847F |
  AND #$20                                  ; $1B8482 |
  CMP $00                                   ; $1B8484 |
  BNE code_1B848D                           ; $1B8486 |
  LDA #$40                                  ; $1B8488 |
  STA {x_speed_frac}                        ; $1B848A |
code_1B848D:
  LDY {entity_var_d}                        ; $1B848D |
  LDA {entity_display_flags}                ; $1B8490 |
  PHA                                       ; $1B8493 |
  AND #$20                                  ; $1B8494 |
  BNE code_1B849E                           ; $1B8496 |
  JSR code_1FE6C7                           ; $1B8498 |
  JMP code_1B84A2                           ; $1B849B |

code_1B849E:
  INY                                       ; $1B849E |
  JSR code_1FE708                           ; $1B849F |
code_1B84A2:
  LDA {entity_var_c}                        ; $1B84A2 |
  CMP #$04                                  ; $1B84A5 |
  BNE code_1B84AC                           ; $1B84A7 |
  JSR code_1B9859                           ; $1B84A9 |
code_1B84AC:
  LDA $055D                                 ; $1B84AC |
  CMP #$12                                  ; $1B84AF |
  BNE code_1B84BF                           ; $1B84B1 |
  LDA {x_position_low}                      ; $1B84B3 |
  STA $0335                                 ; $1B84B6 |
  LDA {x_position_high}                     ; $1B84B9 |
  STA $034D                                 ; $1B84BC |
code_1B84BF:
  PLA                                       ; $1B84BF |
  STA {entity_display_flags}                ; $1B84C0 |
  LDA {animation_frame}                     ; $1B84C3 |
  CMP #$09                                  ; $1B84C6 |
  BNE code_1B8508                           ; $1B84C8 |
  LDA #$3C                                  ; $1B84CA |
  STA {entity_flash_counter}                ; $1B84CC |
  LDA #$4C                                  ; $1B84CF |
  STA {x_speed_frac}                        ; $1B84D1 |
  LDA #$01                                  ; $1B84D4 |
  STA {x_speed}                             ; $1B84D6 |
  LDA {entity_var_c}                        ; $1B84D9 |
  STA $30                                   ; $1B84DC |
  BEQ code_1B8508                           ; $1B84DE |
  CMP #$02                                  ; $1B84E0 |
  BEQ code_1B84E9                           ; $1B84E2 |
  LDA #$1D                                  ; $1B84E4 |
  JMP code_1FEA98                           ; $1B84E6 |

code_1B84E9:
  LDY $AF                                   ; $1B84E9 |
  LDA {y_position_low}                      ; $1B84EB |
  CLC                                       ; $1B84EE |
  ADC $8EF1,y                               ; $1B84EF |
  STA {y_position_low}                      ; $1B84F2 |
  LDA #$80                                  ; $1B84F5 |
  STA {x_speed_frac}                        ; $1B84F7 |
  LDA #$02                                  ; $1B84FA |
  STA {x_speed}                             ; $1B84FC |
  LDA #$10                                  ; $1B84FF |
  JSR code_1FEA98                           ; $1B8501 |
  LDA #$00                                  ; $1B8504 |
  STA $35                                   ; $1B8506 |
code_1B8508:
  RTS                                       ; $1B8508 |

code_1B8509:
  LDA {entity_var_a}                        ; $1B8509 |
  SEC                                       ; $1B850C |
  SBC #$01                                  ; $1B850D |
  STA {entity_var_a}                        ; $1B850F |
  LDA {entity_var_b}                        ; $1B8512 |
  SBC #$00                                  ; $1B8515 |
  STA {entity_var_b}                        ; $1B8517 |
  BCS code_1B8538                           ; $1B851A |
code_1B851C:
  LDA #$DD                                  ; $1B851C |
  STA $94                                   ; $1B851E |
  LDA #$E8                                  ; $1B8520 |
  STA $93                                   ; $1B8522 |
  LDA #$02                                  ; $1B8524 |
  JSR init_subsystem                        ; $1B8526 |
  LDA #$03                                  ; $1B8529 |
  JSR kill_subsystem                        ; $1B852B |
  LDA #$01                                  ; $1B852E |
  JSR kill_subsystem                        ; $1B8530 |
  LDA #$00                                  ; $1B8533 | pointless LDA, gets overwritten
  JMP kill_current_subsystem                ; $1B8535 |

code_1B8538:
  RTS                                       ; $1B8538 |

  LDA #$00                                  ; $1B8539 |
  STA $52                                   ; $1B853B |
  STA $55                                   ; $1B853D |
  STA {entity_flash_counter}                ; $1B853F |
  LDA #$13                                  ; $1B8542 |
  CMP {animation_index}                     ; $1B8544 |
  BEQ code_1B857C                           ; $1B8547 |
  LDY {animation_frame}                     ; $1B8549 |
  CPY #$0F                                  ; $1B854C |
  BNE code_1B85CE                           ; $1B854E |
  JSR code_1FEA98                           ; $1B8550 |
  LDA #$00                                  ; $1B8553 |
  STA {y_speed_frac}                        ; $1B8555 |
  LDA #$08                                  ; $1B8558 |
  STA {y_speed}                             ; $1B855A |
  LDA {entity_display_flags}                ; $1B855D |
  ORA #$20                                  ; $1B8560 |
  STA {entity_display_flags}                ; $1B8562 |
  LDA #$00                                  ; $1B8565 |
  STA {y_position_low}                      ; $1B8567 |
  LDA $26                                   ; $1B856A |
  CMP #$0E                                  ; $1B856C |
  BNE code_1B857C                           ; $1B856E |
  LDA {x_position_high}                     ; $1B8570 |
  CMP #$03                                  ; $1B8573 |
  BNE code_1B857C                           ; $1B8575 |
  LDA #$50                                  ; $1B8577 |
  STA {x_position_low}                      ; $1B8579 |
code_1B857C:
  LDA {y_position_low}                      ; $1B857C |
  CMP #$70                                  ; $1B857F |
  BCC code_1B8592                           ; $1B8581 |
  LDY #$02                                  ; $1B8583 |
  JSR code_1B984F                           ; $1B8585 |
  LDA $49                                   ; $1B8588 |
  STA $53                                   ; $1B858A |
  LDA $10                                   ; $1B858C |
  AND #$10                                  ; $1B858E |
  BEQ code_1B859B                           ; $1B8590 |
code_1B8592:
  JSR apply_teleport_vertical_speedup       ; $1B8592 |
  JSR apply_vertical_speed_down_alt         ; $1B8595 |
  JMP code_1B85C9                           ; $1B8598 |

code_1B859B:
  JSR apply_teleport_vertical_speedup       ; $1B859B |
  LDY #$00                                  ; $1B859E |
  JSR code_1FE747                           ; $1B85A0 |
  BCC code_1B85C9                           ; $1B85A3 |
  LDA {animation_frame}                     ; $1B85A5 |
  BNE code_1B85B6                           ; $1B85A8 |
  LDA {animation_timer}                     ; $1B85AA |
  CMP #$01                                  ; $1B85AD |
  BNE code_1B85B6                           ; $1B85AF |
  LDA #$2D                                  ; $1B85B1 |
  JSR code_1FEC5D                           ; $1B85B3 |
code_1B85B6:
  LDA {animation_frame}                     ; $1B85B6 |
  CMP #$04                                  ; $1B85B9 |
  BNE code_1B85CE                           ; $1B85BB |
  LDA #$01                                  ; $1B85BD |
  JSR code_1FEA98                           ; $1B85BF |
  LDA #$00                                  ; $1B85C2 |
  STA $30                                   ; $1B85C4 |
  JSR reset_vertical_speed                  ; $1B85C6 |
code_1B85C9:
  LDA #$00                                  ; $1B85C9 |
  STA {animation_timer}                     ; $1B85CB |
code_1B85CE:
  LDA {y_position_low}                      ; $1B85CE |
  STA $3E                                   ; $1B85D1 |
  RTS                                       ; $1B85D3 |

  LDA #$07                                  ; $1B85D4 |
  CMP {animation_index}                     ; $1B85D6 |
  BEQ code_1B85E4                           ; $1B85D9 |
  JSR code_1FEA98                           ; $1B85DB |
  LDA #$00                                  ; $1B85DE |
  STA $34                                   ; $1B85E0 |
  STA $33                                   ; $1B85E2 |
code_1B85E4:
  JSR entity_gravity_process                ; $1B85E4 |
  LDA #$E0                                  ; $1B85E7 |
  CMP {y_position_low}                      ; $1B85E9 |
  BCS code_1B8605                           ; $1B85EC |
  LDA #$24                                  ; $1B85EE |
  STA {entity_display_flags}                ; $1B85F0 |
  INC $30                                   ; $1B85F3 |
  LDA #$E8                                  ; $1B85F5 |
  STA {y_position_low}                      ; $1B85F7 |
  LDA #$00                                  ; $1B85FA |
  STA $95                                   ; $1B85FC |
  JSR code_1EC3F1                           ; $1B85FE |
  LDA #$00                                  ; $1B8601 |
  INC $95                                   ; $1B8603 |
code_1B8605:
  RTS                                       ; $1B8605 |

  LDY #$0F                                  ; $1B8606 |
code_1B8608:
  LDA $8EFB,y                               ; $1B8608 |
  STA $0620,y                               ; $1B860B |
  DEY                                       ; $1B860E |
  BPL code_1B8608                           ; $1B860F |
  LDA #$F0                                  ; $1B8611 |
  STA $EB                                   ; $1B8613 |
  LDA #$00                                  ; $1B8615 |
  STA $95                                   ; $1B8617 |
  STA $30                                   ; $1B8619 |
  STA {y_position_low}                      ; $1B861B |
  JSR code_1EC3EB                           ; $1B861E |
  INC $95                                   ; $1B8621 |
  LDA #$20                                  ; $1B8623 |
  STA {entity_display_flags}                ; $1B8625 |
  LDA #$30                                  ; $1B8628 |
  STA {x_position_low}                      ; $1B862A |
  RTS                                       ; $1B862D |

  LDA #$07                                  ; $1B862E |
  CMP {animation_index}                     ; $1B8630 |
  BEQ code_1B863E                           ; $1B8633 |
  JSR code_1FEA98                           ; $1B8635 |
  LDA #$00                                  ; $1B8638 |
  STA $34                                   ; $1B863A |
  STA $33                                   ; $1B863C |
code_1B863E:
  JSR code_1FEA65                           ; $1B863E |
  JSR code_1FEA86                           ; $1B8641 |
  LDY {entity_var_a}                        ; $1B8644 |
  LDA $8F0B,y                               ; $1B8647 |
  CMP {x_position_high}                     ; $1B864A |
  BNE code_1B8694                           ; $1B864D |
  LDA $8F0C,y                               ; $1B864F |
  CMP {x_position_low}                      ; $1B8652 |
  BNE code_1B8694                           ; $1B8655 |
  LDA $8F0D,y                               ; $1B8657 |
  CMP {y_position_low}                      ; $1B865A |
  BNE code_1B8694                           ; $1B865D |
  LDA $8F0E,y                               ; $1B865F |
  BMI code_1B8674                           ; $1B8662 |
  STA {entity_direction}                    ; $1B8664 |
  INY                                       ; $1B8667 |
  INY                                       ; $1B8668 |
  INY                                       ; $1B8669 |
  INY                                       ; $1B866A |
  STY {entity_var_a}                        ; $1B866B |
  LDA #$1F                                  ; $1B866E |
  JSR code_1FEC5D                           ; $1B8670 |
  RTS                                       ; $1B8673 |

code_1B8674:
  LDA {entity_display_flags}                ; $1B8674 |
  AND #$EF                                  ; $1B8677 |
  STA {entity_display_flags}                ; $1B8679 |
  LDA #$00                                  ; $1B867C |
  STA $30                                   ; $1B867E |
  LDA #$4C                                  ; $1B8680 |
  STA {x_speed_frac}                        ; $1B8682 |
  LDA #$01                                  ; $1B8685 |
  STA {x_speed}                             ; $1B8687 |
  LDA #$00                                  ; $1B868A |
  STA {y_speed_frac}                        ; $1B868C |
  LDA #$FC                                  ; $1B868F |
  STA {y_speed}                             ; $1B8691 |
code_1B8694:
  RTS                                       ; $1B8694 |

  RTS                                       ; $1B8695 |

  LDA {animation_index}                     ; $1B8696 |
  CMP #$1D                                  ; $1B8699 |
  BEQ code_1B86CF                           ; $1B869B |
  LDY #$00                                  ; $1B869D |
  JSR code_1FE7B7                           ; $1B869F |
  LDA #$04                                  ; $1B86A2 |
  BCS code_1B86A8                           ; $1B86A4 |
  LDA #$07                                  ; $1B86A6 |
code_1B86A8:
  PHP                                       ; $1B86A8 |
  CMP {animation_index}                     ; $1B86A9 |
  BEQ code_1B86B7                           ; $1B86AC |
  JSR code_1FEA98                           ; $1B86AE |
  LDA #$00                                  ; $1B86B1 |
  STA $34                                   ; $1B86B3 |
  STA $33                                   ; $1B86B5 |
code_1B86B7:
  JSR code_1FE8DE                           ; $1B86B7 |
  PLP                                       ; $1B86BA |
  BCC code_1B86CE                           ; $1B86BB |
  LDA {x_position_low}                      ; $1B86BD |
  CMP #$A0                                  ; $1B86C0 |
  BCC code_1B86CE                           ; $1B86C2 |
  LDA #$00                                  ; $1B86C4 |
  STA {y_speed_frac}                        ; $1B86C6 |
  LDA #$05                                  ; $1B86C9 |
  STA {y_speed}                             ; $1B86CB |
code_1B86CE:
  RTS                                       ; $1B86CE |

code_1B86CF:
  LDA #$00                                  ; $1B86CF |
  STA {animation_timer}                     ; $1B86D1 |
  JSR code_1FE8DE                           ; $1B86D4 |
  LDA {x_position_high}                     ; $1B86D7 |
  CMP #$0E                                  ; $1B86DA |
  BNE code_1B86E2                           ; $1B86DC |
  LDA #$04                                  ; $1B86DE |
  STA $30                                   ; $1B86E0 |
code_1B86E2:
  RTS                                       ; $1B86E2 |

  LDY #$00                                  ; $1B86E3 |
  LDA {animation_index}                     ; $1B86E5 |
  CMP #$1D                                  ; $1B86E8 |
  BNE code_1B86EE                           ; $1B86EA |
  LDY #$17                                  ; $1B86EC |
code_1B86EE:
  JSR code_1FE7B7                           ; $1B86EE |
  ROR $00                                   ; $1B86F1 |
  LDA {animation_index}                     ; $1B86F3 |
  CMP #$1D                                  ; $1B86F6 |
  BEQ code_1B870A                           ; $1B86F8 |
  LDA #$04                                  ; $1B86FA |
  ROL $00                                   ; $1B86FC |
  BCS code_1B8702                           ; $1B86FE |
  LDA #$07                                  ; $1B8700 |
code_1B8702:
  CMP {animation_index}                     ; $1B8702 |
  BEQ code_1B870A                           ; $1B8705 |
  JSR code_1FEA98                           ; $1B8707 |
code_1B870A:
  JSR code_1FE8DE                           ; $1B870A |
  LDA {animation_index}                     ; $1B870D |
  CMP #$1D                                  ; $1B8710 |
  BNE code_1B8743                           ; $1B8712 |
  LDA {x_position_high}                     ; $1B8714 |
  CMP #$40                                  ; $1B8717 |
  BNE code_1B8743                           ; $1B8719 |
  LDA #$4C                                  ; $1B871B |
  CMP {x_position_low}                      ; $1B871D |
  BCS code_1B8743                           ; $1B8720 |
  STA {x_position_low}                      ; $1B8722 |
  JSR code_1FF16F                           ; $1B8725 |
  BCS code_1B8758                           ; $1B8728 |
  LDA #$10                                  ; $1B872A |
  JSR code_1FEAA4                           ; $1B872C |
  LDA #$1E                                  ; $1B872F |
  STA {entity_type},y                       ; $1B8731 |
  LDA #$07                                  ; $1B8734 |
  JSR code_1FEA98                           ; $1B8736 |
  LDA #$00                                  ; $1B8739 |
  STA {y_speed_frac}                        ; $1B873B |
  LDA #$05                                  ; $1B873E |
  STA {y_speed}                             ; $1B8740 |
code_1B8743:
  LDA {x_position_high}                     ; $1B8743 |
  CMP #$41                                  ; $1B8746 |
  BNE code_1B8758                           ; $1B8748 |
  LDA #$00                                  ; $1B874A |
  STA $30                                   ; $1B874C |
  LDA #$4C                                  ; $1B874E |
  STA {x_speed_frac}                        ; $1B8750 |
  LDA #$01                                  ; $1B8753 |
  STA {x_speed}                             ; $1B8755 |
code_1B8758:
  RTS                                       ; $1B8758 |

  LDY #$00                                  ; $1B8759 |
  JSR code_1FE7B7                           ; $1B875B |
  BCC code_1B8794                           ; $1B875E |
  LDY #$00                                  ; $1B8760 |
  JSR code_1FEA3F                           ; $1B8762 |
  LDY #$80                                  ; $1B8765 |
  CPY {x_position_low}                      ; $1B8767 |
  BEQ code_1B8779                           ; $1B876A |
  LDA {entity_direction}                    ; $1B876C |
  AND #$01                                  ; $1B876F |
  BNE code_1B8777                           ; $1B8771 |
  BCS code_1B8779                           ; $1B8773 |
  BCC code_1B8793                           ; $1B8775 |
code_1B8777:
  BCS code_1B8793                           ; $1B8777 |
code_1B8779:
  STY {x_position_low}                      ; $1B8779 |
  LDA #$00                                  ; $1B877C |
  STA {y_speed_frac}                        ; $1B877E |
  LDA #$08                                  ; $1B8781 |
  STA {y_speed}                             ; $1B8783 |
  LDA #$07                                  ; $1B8786 |
  JSR code_1FEA98                           ; $1B8788 |
  LDA #$00                                  ; $1B878B |
  STA {entity_var_a}                        ; $1B878D |
  STA {entity_var_b}                        ; $1B8790 |
code_1B8793:
  RTS                                       ; $1B8793 |

code_1B8794:
  LDA {y_speed}                             ; $1B8794 |
  BPL code_1B8793                           ; $1B8797 |
  LDA #$78                                  ; $1B8799 |
  CMP {y_position_low}                      ; $1B879B |
  BCS code_1B8793                           ; $1B879E |
  STA {y_position_low}                      ; $1B87A0 |
  LDA {entity_var_a}                        ; $1B87A3 |
  BNE code_1B8801                           ; $1B87A6 |
  LDA {entity_var_b}                        ; $1B87A8 |
  CMP #$80                                  ; $1B87AB |
  BNE code_1B87B6                           ; $1B87AD |
  LDA #$10                                  ; $1B87AF |
  STA $30                                   ; $1B87B1 |
  JMP reset_vertical_speed                  ; $1B87B3 |

code_1B87B6:
  JSR code_1FF16F                           ; $1B87B6 |
  BCS code_1B87E4                           ; $1B87B9 |
  LDA #$19                                  ; $1B87BB |
  LDX #$00                                  ; $1B87BD |
  JSR code_1FEAA4                           ; $1B87BF |
  LDA #$4D                                  ; $1B87C2 |
  STA {entity_type},y                       ; $1B87C4 |
  LDA {entity_var_b}                        ; $1B87C7 |
  AND #$1F                                  ; $1B87CA |
  TAX                                       ; $1B87CC |
  LDA $8F5F,x                               ; $1B87CD |
  STA {x_position_low},y                    ; $1B87D0 |
  LDA $8F60,x                               ; $1B87D3 |
  STA {y_position_low},y                    ; $1B87D6 |
  LDA $8F61,x                               ; $1B87D9 |
  STA {entity_var_b},y                      ; $1B87DC |
  LDA #$08                                  ; $1B87DF |
  STA {entity_var_c},y                      ; $1B87E1 |
code_1B87E4:
  INC {entity_var_b}                        ; $1B87E4 |
  INC {entity_var_b}                        ; $1B87E7 |
  INC {entity_var_b}                        ; $1B87EA |
  INC {entity_var_b}                        ; $1B87ED |
  LDA {entity_var_b}                        ; $1B87F0 |
  AND #$0F                                  ; $1B87F3 |
  BNE code_1B87B6                           ; $1B87F5 |
  LDA #$18                                  ; $1B87F7 |
  STA {entity_var_a}                        ; $1B87F9 |
  LDA #$4B                                  ; $1B87FC |
  JSR code_1FEC5D                           ; $1B87FE |
code_1B8801:
  DEC {entity_var_a}                        ; $1B8801 |
  LDX #$00                                  ; $1B8804 |
  RTS                                       ; $1B8806 |

  LDA {y_position_high}                     ; $1B8807 |
  BEQ code_1B880F                           ; $1B880A |
  JMP code_1B8509                           ; $1B880C |

code_1B880F:
  LDA {animation_index}                     ; $1B880F |
  CMP #$13                                  ; $1B8812 |
  BEQ code_1B8846                           ; $1B8814 |
  LDY #$00                                  ; $1B8816 |
  JSR code_1FE7B7                           ; $1B8818 |
  BCC code_1B8863                           ; $1B881B |
  LDA #$00                                  ; $1B881D |
  STA {y_speed_frac}                        ; $1B881F |
  LDA #$08                                  ; $1B8822 |
  STA {y_speed}                             ; $1B8824 |
  LDA #$13                                  ; $1B8827 |
  JSR code_1FEA98                           ; $1B8829 |
  LDA #$04                                  ; $1B882C |
  STA {animation_frame}                     ; $1B882E |
  LDA #$35                                  ; $1B8831 |
  JSR code_1FEC5D                           ; $1B8833 |
  LDA $AF                                   ; $1B8836 |
  BEQ code_1B8846                           ; $1B8838 |
  LDA #$00                                  ; $1B883A |
  STA $AF                                   ; $1B883C |
  LDA {entity_display_flags}                ; $1B883E |
  AND #$BF                                  ; $1B8841 |
  STA {entity_display_flags}                ; $1B8843 |
code_1B8846:
  LDA {animation_frame}                     ; $1B8846 |
  BNE code_1B8863                           ; $1B8849 |
  STA {animation_timer}                     ; $1B884B |
  JSR apply_teleport_vertical_speedup       ; $1B884E |
  JSR apply_vertical_speed_up_alt           ; $1B8851 |
  LDA {y_position_high}                     ; $1B8854 |
  BEQ code_1B8863                           ; $1B8857 |
  LDA #$3C                                  ; $1B8859 |
  STA {entity_var_a}                        ; $1B885B |
  LDA #$00                                  ; $1B885E |
  STA {entity_var_b}                        ; $1B8860 |
code_1B8863:
  RTS                                       ; $1B8863 |

  LDA {entity_var_b}                        ; $1B8864 |
  BEQ code_1B886E                           ; $1B8867 |
  DEC {entity_var_b}                        ; $1B8869 |
  BNE code_1B8897                           ; $1B886C |
code_1B886E:
  LDY #$00                                  ; $1B886E |
  JSR code_1FE7B7                           ; $1B8870 |
  LDA #$04                                  ; $1B8873 |
  BCS code_1B8879                           ; $1B8875 |
  LDA #$07                                  ; $1B8877 |
code_1B8879:
  CMP {animation_index}                     ; $1B8879 |
  BEQ code_1B8881                           ; $1B887C |
  JSR code_1FEA98                           ; $1B887E |
code_1B8881:
  JSR code_1FE8DE                           ; $1B8881 |
  LDA #$84                                  ; $1B8884 |
  CMP {x_position_low}                      ; $1B8886 |
  BCS code_1B8897                           ; $1B8889 |
  STA {x_position_low}                      ; $1B888B |
  LDA #$01                                  ; $1B888E |
  JSR code_1FEA98                           ; $1B8890 |
  LDA #$12                                  ; $1B8893 |
  STA $30                                   ; $1B8895 |
code_1B8897:
  RTS                                       ; $1B8897 |

  LDA {animation_index}                     ; $1B8898 |
  CMP #$11                                  ; $1B889B |
  BEQ code_1B88C2                           ; $1B889D |
  CMP #$0D                                  ; $1B889F |
  BNE code_1B8897                           ; $1B88A1 |
  LDA {animation_frame}                     ; $1B88A3 |
  BNE code_1B8897                           ; $1B88A6 |
  JSR code_1FE904                           ; $1B88A8 |
  LDA {entity_display_flags}                ; $1B88AB |
  ORA #$20                                  ; $1B88AE |
  STA {entity_display_flags}                ; $1B88B0 |
  LDA #$5C                                  ; $1B88B3 |
  CMP {x_position_low}                      ; $1B88B5 |
  BCC code_1B8897                           ; $1B88B8 |
  STA {x_position_low}                      ; $1B88BA |
code_1B88BD:
  LDA #$01                                  ; $1B88BD |
  JMP code_1FEA98                           ; $1B88BF |

code_1B88C2:
  LDA {animation_frame}                     ; $1B88C2 |
  CMP #$09                                  ; $1B88C5 |
  BEQ code_1B88BD                           ; $1B88C7 |
code_1B88C9:
  RTS                                       ; $1B88C9 |

  LDY #$00                                  ; $1B88CA |
  JSR code_1FE7B7                           ; $1B88CC |
  BCS code_1B88E2                           ; $1B88CF |
  LDY #$01                                  ; $1B88D1 |
  JMP code_1FE708                           ; $1B88D3 |

  LDA #$40                                  ; $1B88D6 |
  CMP {x_position_low}                      ; $1B88D8 |
  BCS code_1B88C9                           ; $1B88DB |
  STA {x_position_low}                      ; $1B88DD |
  BCC code_1B88C9                           ; $1B88E0 |
code_1B88E2:
  LDA #$40                                  ; $1B88E2 |
  STA {x_position_low}                      ; $1B88E4 |
  LDA {entity_display_flags}                ; $1B88E7 |
  ORA #$20                                  ; $1B88EA |
  STA {entity_display_flags}                ; $1B88EC |
  LDA #$01                                  ; $1B88EF |
  CMP {animation_index}                     ; $1B88F1 |
  BEQ code_1B88FF                           ; $1B88F4 |
  JSR code_1FEA98                           ; $1B88F6 |
  LDY {entity_var_b}                        ; $1B88F9 |
  JMP code_1FF2FE                           ; $1B88FC |

code_1B88FF:
  LDA $9D                                   ; $1B88FF |
  AND #$03                                  ; $1B8901 |
  BNE code_1B88C9                           ; $1B8903 |
  LDA {entity_var_a}                        ; $1B8905 |
  CMP $B0                                   ; $1B8908 |
  BEQ code_1B8919                           ; $1B890A |
  LDA #$26                                  ; $1B890C |
  JSR code_1FEC5D                           ; $1B890E |
  INC $B0                                   ; $1B8911 |
  LDA #$09                                  ; $1B8913 |
  STA {entity_var_b}                        ; $1B8915 |
  RTS                                       ; $1B8918 |

code_1B8919:
  LDA {entity_var_b}                        ; $1B8919 |
  ASL                                       ; $1B891C |
  STA $00                                   ; $1B891D |
  ASL                                       ; $1B891F |
  ADC $00                                   ; $1B8920 |
  TAY                                       ; $1B8922 |
  LDX $43                                   ; $1B8923 |
  LDA $8F7F,y                               ; $1B8925 |
  STA $06C0,x                               ; $1B8928 |
  LDA $8F80,y                               ; $1B892B |
  STA $06C1,x                               ; $1B892E |
  STA $22                                   ; $1B8931 |
  LDA $8F81,y                               ; $1B8933 |
  STA $06C2,x                               ; $1B8936 |
  STA $10                                   ; $1B8939 |
  LDA $8F82,y                               ; $1B893B |
  STA $06C3,x                               ; $1B893E |
  STA $11                                   ; $1B8941 |
  LDA $8F83,y                               ; $1B8943 |
  STA $02                                   ; $1B8946 |
  LDA $8F84,y                               ; $1B8948 |
  STA $03                                   ; $1B894B |
  INX                                       ; $1B894D |
  INX                                       ; $1B894E |
  INX                                       ; $1B894F |
  INX                                       ; $1B8950 |
  STX $43                                   ; $1B8951 |
  LDX #$00                                  ; $1B8953 |
  JSR code_1FF16F                           ; $1B8955 |
  BCS code_1B898A                           ; $1B8958 |
  LDA #$2B                                  ; $1B895A |
  JSR code_1FEC5D                           ; $1B895C |
  LDA #$42                                  ; $1B895F |
  JSR code_1FEAA4                           ; $1B8961 |
  LDA #$01                                  ; $1B8964 |
  STA {entity_type},y                       ; $1B8966 |
  LDA $02                                   ; $1B8969 |
  STA {y_position_low},y                    ; $1B896B |
  LDA $03                                   ; $1B896E |
  STA {x_position_low},y                    ; $1B8970 |
  LDA #$00                                  ; $1B8973 |
  STA {sprite_flags},y                      ; $1B8975 |
  TYA                                       ; $1B8978 |
  TAX                                       ; $1B8979 |
  LDY $11                                   ; $1B897A |
  JSR code_1ED7DB                           ; $1B897C |
  LDX #$00                                  ; $1B897F |
  DEC {entity_var_b}                        ; $1B8981 |
  BPL code_1B898A                           ; $1B8984 |
  LDA #$00                                  ; $1B8986 |
  STA $30                                   ; $1B8988 |
code_1B898A:
  RTS                                       ; $1B898A |

  LDY #$00                                  ; $1B898B |
  JSR code_1FE7B7                           ; $1B898D |
  LDA #$07                                  ; $1B8990 |
  BCC code_1B89C4                           ; $1B8992 |
  LDA {x_position_low}                      ; $1B8994 |
  CMP #$38                                  ; $1B8997 |
  BCC code_1B89A7                           ; $1B8999 |
  JSR code_1FE904                           ; $1B899B |
  LDA #$38                                  ; $1B899E |
  CMP {x_position_low}                      ; $1B89A0 |
  BCC code_1B89B1                           ; $1B89A3 |
  BCS code_1B89B5                           ; $1B89A5 |
code_1B89A7:
  JSR code_1FE8DE                           ; $1B89A7 |
  LDA #$38                                  ; $1B89AA |
  CMP {x_position_low}                      ; $1B89AC |
  BCC code_1B89B5                           ; $1B89AF |
code_1B89B1:
  LDA #$04                                  ; $1B89B1 |
  BNE code_1B89C4                           ; $1B89B3 |
code_1B89B5:
  STA {x_position_low}                      ; $1B89B5 |
  LDA #$20                                  ; $1B89B8 |
  STA {entity_display_flags}                ; $1B89BA |
  LDA #$01                                  ; $1B89BD |
  CMP {animation_index}                     ; $1B89BF |
  BEQ code_1B89D3                           ; $1B89C2 |
code_1B89C4:
  CMP {animation_index}                     ; $1B89C4 |
  BEQ code_1B89D2                           ; $1B89C7 |
  JSR code_1FEA98                           ; $1B89C9 |
  LDA #$00                                  ; $1B89CC |
  STA $33                                   ; $1B89CE |
  STA $34                                   ; $1B89D0 |
code_1B89D2:
  RTS                                       ; $1B89D2 |

code_1B89D3:
  LDA #$10                                  ; $1B89D3 |
  STA $30                                   ; $1B89D5 |
  LDA #$DD                                  ; $1B89D7 |
  STA $94                                   ; $1B89D9 |
  LDA #$E8                                  ; $1B89DB |
  STA $93                                   ; $1B89DD |
  LDA #$02                                  ; $1B89DF |
  JSR init_subsystem                        ; $1B89E1 |
  LDA #$03                                  ; $1B89E4 |
  JSR kill_subsystem                        ; $1B89E6 |
  LDA #$01                                  ; $1B89E9 |
  JSR kill_subsystem                        ; $1B89EB |
  LDA #$00                                  ; $1B89EE | pointless LDA, gets overwritten
  JMP kill_current_subsystem                ; $1B89F0 |

  LDA {animation_frame}                     ; $1B89F3 |
  BNE code_1B8A38                           ; $1B89F6 |
  LDA #$13                                  ; $1B89F8 |
  JSR code_1FEA98                           ; $1B89FA |
  LDA #$00                                  ; $1B89FD |
  STA {y_speed_frac}                        ; $1B89FF |
  LDA #$08                                  ; $1B8A02 |
  STA {y_speed}                             ; $1B8A04 |
  LDA #$16                                  ; $1B8A07 |
  STA $30                                   ; $1B8A09 |
  LDA {entity_display_flags}                ; $1B8A0B |
  AND #$EF                                  ; $1B8A0E |
  STA {entity_display_flags}                ; $1B8A10 |
  LDY $6A                                   ; $1B8A13 |
  LDA $8FBB,y                               ; $1B8A15 |
  STA $F9                                   ; $1B8A18 |
  LDA $8FBC,y                               ; $1B8A1A |
  STA $29                                   ; $1B8A1D |
  LDA $8FBD,y                               ; $1B8A1F |
  STA {x_position_low}                      ; $1B8A22 |
  LDA $8FBE,y                               ; $1B8A25 |
  STA {entity_var_a}                        ; $1B8A28 |
  LDA #$00                                  ; $1B8A2B |
  STA {y_position_low}                      ; $1B8A2D |
  JSR code_1ED460                           ; $1B8A30 |
code_1B8A33:
  LDX #$00                                  ; $1B8A33 |
  STX {animation_timer}                     ; $1B8A35 |
code_1B8A38:
  RTS                                       ; $1B8A38 |

  JSR apply_teleport_vertical_speedup       ; $1B8A39 |
  JSR apply_vertical_speed_down_alt         ; $1B8A3C |
  LDA {entity_var_a}                        ; $1B8A3F |
  CMP {y_position_low}                      ; $1B8A42 |
  BCS code_1B8A33                           ; $1B8A45 |
  STA {y_position_low}                      ; $1B8A47 |
  LDA {animation_frame}                     ; $1B8A4A |
  CMP #$04                                  ; $1B8A4D |
  BNE code_1B8A38                           ; $1B8A4F |
  LDA #$01                                  ; $1B8A51 |
  JSR code_1FEA98                           ; $1B8A53 |
  LDA #$00                                  ; $1B8A56 |
  STA $30                                   ; $1B8A58 |
  JSR reset_vertical_speed                  ; $1B8A5A |
code_1B8A5D:
  RTS                                       ; $1B8A5D |

  LDA {animation_index}                     ; $1B8A5E |
  CMP #$13                                  ; $1B8A61 |
  BEQ code_1B8A9A                           ; $1B8A63 |
  LDA $B0                                   ; $1B8A65 |
  CMP #$9C                                  ; $1B8A67 |
  BEQ code_1B8A7D                           ; $1B8A69 |
  LDA $9D                                   ; $1B8A6B |
  AND #$03                                  ; $1B8A6D |
  BNE code_1B8A33                           ; $1B8A6F |
  LDA #$26                                  ; $1B8A71 |
  JSR code_1FEC5D                           ; $1B8A73 |
  INC $B0                                   ; $1B8A76 |
  DEC {entity_var_a}                        ; $1B8A78 |
  BNE code_1B8A33                           ; $1B8A7B |
code_1B8A7D:
  LDA #$13                                  ; $1B8A7D |
  JSR code_1FEA98                           ; $1B8A7F |
  LDA #$04                                  ; $1B8A82 |
  STA {animation_frame}                     ; $1B8A84 |
  LDA #$08                                  ; $1B8A87 |
  STA {y_speed}                             ; $1B8A89 |
  LDA #$00                                  ; $1B8A8C |
  STA {y_speed_frac}                        ; $1B8A8E |
  STA $33                                   ; $1B8A91 |
  STA $34                                   ; $1B8A93 |
  LDA #$35                                  ; $1B8A95 |
  JSR code_1FEC5D                           ; $1B8A97 |
code_1B8A9A:
  LDA $F9                                   ; $1B8A9A |
  CMP #$03                                  ; $1B8A9C |
  BEQ code_1B8AD8                           ; $1B8A9E |
  LDA {animation_frame}                     ; $1B8AA0 |
  BNE code_1B8A5D                           ; $1B8AA3 |
  JSR apply_teleport_vertical_speedup       ; $1B8AA5 |
  JSR apply_vertical_speed_up_alt           ; $1B8AA8 |
  LDA {y_position_high}                     ; $1B8AAB |
  BEQ code_1B8A33                           ; $1B8AAE |
  JSR reset_vertical_speed                  ; $1B8AB0 |
  LDA $F9                                   ; $1B8AB3 |
  AND #$07                                  ; $1B8AB5 |
  ASL                                       ; $1B8AB7 |
  TAY                                       ; $1B8AB8 |
  LDA $8FE3,y                               ; $1B8AB9 |
  STA {x_position_low}                      ; $1B8ABC |
  LDA $8FE4,y                               ; $1B8ABF |
  STA {y_position_low}                      ; $1B8AC2 |
  LDA #$00                                  ; $1B8AC5 |
  STA {y_position_high}                     ; $1B8AC7 |
  LDA #$03                                  ; $1B8ACA |
  STA $F9                                   ; $1B8ACC |
  LDA #$01                                  ; $1B8ACE |
  STA $29                                   ; $1B8AD0 |
  JSR code_1ED460                           ; $1B8AD2 |
  LDX #$00                                  ; $1B8AD5 |
  RTS                                       ; $1B8AD7 |

code_1B8AD8:
  LDA {animation_frame}                     ; $1B8AD8 |
  CMP #$04                                  ; $1B8ADB |
  BNE code_1B8AE3                           ; $1B8ADD |
  LDA #$00                                  ; $1B8ADF |
  STA $30                                   ; $1B8AE1 |
code_1B8AE3:
  RTS                                       ; $1B8AE3 |

  LDY #$04                                  ; $1B8AE4 |
code_1B8AE6:
  JSR code_1FF2FE                           ; $1B8AE6 |
  DEY                                       ; $1B8AE9 |
  BNE code_1B8AE6                           ; $1B8AEA |
  LDY #$00                                  ; $1B8AEC |
  JSR code_1FE7B7                           ; $1B8AEE |
  LDA #$07                                  ; $1B8AF1 |
  BCC code_1B8AF7                           ; $1B8AF3 |
  LDA #$01                                  ; $1B8AF5 |
code_1B8AF7:
  CMP {animation_index}                     ; $1B8AF7 |
  BEQ code_1B8AFF                           ; $1B8AFA |
  JSR code_1FEA98                           ; $1B8AFC |
code_1B8AFF:
  LDA {animation_index}                     ; $1B8AFF |
  CMP #$01                                  ; $1B8B02 |
  BNE code_1B8AE3                           ; $1B8B04 |
  LDA #$11                                  ; $1B8B06 |
  CMP $D9                                   ; $1B8B08 |
  BEQ code_1B8B0F                           ; $1B8B0A |
  JSR code_1FEC5B                           ; $1B8B0C |
code_1B8B0F:
  DEC {entity_var_a}                        ; $1B8B0F |
  BNE code_1B8AE3                           ; $1B8B12 |
  LDA $26                                   ; $1B8B14 |
  AND #$07                                  ; $1B8B16 |
  TAY                                       ; $1B8B18 |
  LDA $F2B2,y                               ; $1B8B19 |
  STA $00                                   ; $1B8B1C |
  LDA $26                                   ; $1B8B1E |
  LSR                                       ; $1B8B20 |
  LSR                                       ; $1B8B21 |
  LSR                                       ; $1B8B22 |
  TAY                                       ; $1B8B23 |
  LDA $006E,y                               ; $1B8B24 |
  ORA $00                                   ; $1B8B27 |
  STA $006E,y                               ; $1B8B29 |
  LDA $26                                   ; $1B8B2C |
  CMP #$0B                                  ; $1B8B2E |
  BEQ code_1B8B45                           ; $1B8B30 |
  CMP #$08                                  ; $1B8B32 |
  BCS code_1B8B40                           ; $1B8B34 |
  LDA #$04                                  ; $1B8B36 |
  JSR code_1FEA98                           ; $1B8B38 |
  LDA #$0F                                  ; $1B8B3B |
  STA $30                                   ; $1B8B3D |
  RTS                                       ; $1B8B3F |

code_1B8B40:
  LDA #$10                                  ; $1B8B40 |
  STA $30                                   ; $1B8B42 |
  RTS                                       ; $1B8B44 |

code_1B8B45:
  LDA #$14                                  ; $1B8B45 |
  STA $30                                   ; $1B8B47 |
  RTS                                       ; $1B8B49 |

  LDA #$01                                  ; $1B8B4A |
  CMP {animation_index}                     ; $1B8B4C |
  BEQ code_1B8B5A                           ; $1B8B4F |
  JSR code_1FEA98                           ; $1B8B51 |
  LDA #$00                                  ; $1B8B54 |
  STA $34                                   ; $1B8B56 |
  STA $33                                   ; $1B8B58 |
code_1B8B5A:
  LDA {entity_display_flags}                ; $1B8B5A |
  ORA #$20                                  ; $1B8B5D |
  STA {entity_display_flags}                ; $1B8B5F |
  RTS                                       ; $1B8B62 |

  RTS                                       ; $1B8B63 |

  LDY #$00                                  ; $1B8B64 |
  JSR code_1FE7B7                           ; $1B8B66 |
  LDA #$07                                  ; $1B8B69 |
  BCC code_1B8B6F                           ; $1B8B6B |
  LDA #$04                                  ; $1B8B6D |
code_1B8B6F:
  CMP {animation_index}                     ; $1B8B6F |
  BEQ code_1B8B7D                           ; $1B8B72 |
  JSR code_1FEA98                           ; $1B8B74 |
  LDA #$00                                  ; $1B8B77 |
  STA $33                                   ; $1B8B79 |
  STA $34                                   ; $1B8B7B |
code_1B8B7D:
  LDA {animation_index}                     ; $1B8B7D |
  CMP #$04                                  ; $1B8B80 |
  BNE code_1B8C02                           ; $1B8B82 |
  LDA {x_position_low}                      ; $1B8B84 |
  CMP #$2C                                  ; $1B8B87 |
  BCS code_1B8B97                           ; $1B8B89 |
  JSR code_1FE8DE                           ; $1B8B8B |
  LDA {x_position_low}                      ; $1B8B8E |
  CMP #$2C                                  ; $1B8B91 |
  BCC code_1B8C02                           ; $1B8B93 |
  BCS code_1B8BA3                           ; $1B8B95 |
code_1B8B97:
  JSR code_1FE904                           ; $1B8B97 |
  LDA {x_position_low}                      ; $1B8B9A |
  CMP #$2C                                  ; $1B8B9D |
  BEQ code_1B8BA3                           ; $1B8B9F |
  BCS code_1B8C02                           ; $1B8BA1 |
code_1B8BA3:
  LDA #$2C                                  ; $1B8BA3 |
  STA {x_position_low}                      ; $1B8BA5 |
  LDA {entity_display_flags}                ; $1B8BA8 |
  ORA #$20                                  ; $1B8BAB |
  STA {entity_display_flags}                ; $1B8BAD |
  LDA #$01                                  ; $1B8BB0 |
  CMP {animation_index}                     ; $1B8BB2 |
  BEQ code_1B8BBA                           ; $1B8BB5 |
  JSR code_1FEA98                           ; $1B8BB7 |
code_1B8BBA:
  LDA $99                                   ; $1B8BBA |
  BNE code_1B8C02                           ; $1B8BBC |
  DEC {entity_var_a}                        ; $1B8BBE |
  BNE code_1B8C02                           ; $1B8BC1 |
  LDA #$26                                  ; $1B8BC3 |
  STA $29                                   ; $1B8BC5 |
  LDA #$03                                  ; $1B8BC7 |
  STA $2A                                   ; $1B8BC9 |
  LDA #$00                                  ; $1B8BCB |
  STA $2B                                   ; $1B8BCD |
  STA $55                                   ; $1B8BCF |
  STA $2D                                   ; $1B8BD1 |
  STA $2E                                   ; $1B8BD3 |
  STA $2F                                   ; $1B8BD5 |
  LDY #$0F                                  ; $1B8BD7 |
code_1B8BD9:
  LDA $8FF3,y                               ; $1B8BD9 |
  STA $0600,y                               ; $1B8BDC |
  STA $0620,y                               ; $1B8BDF |
  DEY                                       ; $1B8BE2 |
  BPL code_1B8BD9                           ; $1B8BE3 |
  STY $18                                   ; $1B8BE5 |
  LDA #$9A                                  ; $1B8BE7 |
  STA $05F3                                 ; $1B8BE9 |
  LDA #$00                                  ; $1B8BEC |
  STA $05FB                                 ; $1B8BEE |
  STA $05F7                                 ; $1B8BF1 |
  LDA #$1D                                  ; $1B8BF4 |
  STA $30                                   ; $1B8BF6 |
  LDA #$04                                  ; $1B8BF8 |
  JSR code_1FEA98                           ; $1B8BFA |
  LDA #$4A                                  ; $1B8BFD |
  JSR code_1FEC5B                           ; $1B8BFF |
code_1B8C02:
  RTS                                       ; $1B8C02 |

  LDA {animation_index}                     ; $1B8C03 |
  CMP #$01                                  ; $1B8C06 |
  BEQ code_1B8C2D                           ; $1B8C08 |
  JSR code_1FE8DE                           ; $1B8C0A |
  LDA {x_position_high}                     ; $1B8C0D |
  CMP #$0A                                  ; $1B8C10 |
  BNE code_1B8C02                           ; $1B8C12 |
  LDA #$80                                  ; $1B8C14 |
  CMP {x_position_low}                      ; $1B8C16 |
  BCS code_1B8C02                           ; $1B8C19 |
  STA {x_position_low}                      ; $1B8C1B |
  LDA #$01                                  ; $1B8C1E |
  JSR code_1FEA98                           ; $1B8C20 |
  LDA #$15                                  ; $1B8C23 |
  JSR code_1FEC5B                           ; $1B8C25 |
  LDA #$00                                  ; $1B8C28 |
  STA {entity_var_a}                        ; $1B8C2A |
code_1B8C2D:
  DEC {entity_var_a}                        ; $1B8C2D |
  BNE code_1B8C02                           ; $1B8C30 |
  LDA #$01                                  ; $1B8C32 |
  STA {entity_direction}                    ; $1B8C34 |
  LDA #$A4                                  ; $1B8C37 |
  STA {y_speed_frac}                        ; $1B8C39 |
  LDA #$06                                  ; $1B8C3C |
  STA {y_speed}                             ; $1B8C3E |
  LDA #$6A                                  ; $1B8C41 |
  STA {x_speed_frac}                        ; $1B8C43 |
  LDA #$02                                  ; $1B8C46 |
  STA {x_speed}                             ; $1B8C48 |
  LDA #$1E                                  ; $1B8C4B |
  STA $30                                   ; $1B8C4D |
  LDA #$07                                  ; $1B8C4F |
  JSR code_1FEA98                           ; $1B8C51 |
  LDA #$00                                  ; $1B8C54 |
  STA $05F3                                 ; $1B8C56 |
  LDY #$00                                  ; $1B8C59 |
  JSR code_1FE7B7                           ; $1B8C5B |
  BCS code_1B8C7B                           ; $1B8C5E |
  JSR code_1FEA65                           ; $1B8C60 |
  LDA {x_position_low}                      ; $1B8C63 |
  STA $3C                                   ; $1B8C66 |
  LDA {y_speed}                             ; $1B8C68 |
  BPL code_1B8CAE                           ; $1B8C6B |
  LDA {entity_direction}                    ; $1B8C6D |
  AND #$01                                  ; $1B8C70 |
  BEQ code_1B8CAE                           ; $1B8C72 |
  LDA #$02                                  ; $1B8C74 |
  STA {entity_direction}                    ; $1B8C76 |
  BNE code_1B8CAE                           ; $1B8C79 |
code_1B8C7B:
  LDA #$01                                  ; $1B8C7B |
  CMP {animation_index}                     ; $1B8C7D |
  BEQ code_1B8CAD                           ; $1B8C80 |
  JSR code_1FEA98                           ; $1B8C82 |
  LDA {entity_display_flags}                ; $1B8C85 |
  ORA #$20                                  ; $1B8C88 |
  STA {entity_display_flags}                ; $1B8C8A |
  LDY {entity_var_h}                        ; $1B8C8D |
  LDA {entity_display_flags},y              ; $1B8C90 |
  ORA #$20                                  ; $1B8C93 |
  STA {entity_display_flags},y              ; $1B8C95 |
  LDA #$4A                                  ; $1B8C98 |
  JSR code_1FEC5B                           ; $1B8C9A |
  LDA #$78                                  ; $1B8C9D |
  STA {entity_var_a}                        ; $1B8C9F |
  LDA #$00                                  ; $1B8CA2 |
  STA {entity_var_b}                        ; $1B8CA4 |
  LDA #$1F                                  ; $1B8CA7 |
  STA $30                                   ; $1B8CA9 |
  BNE code_1B8CAE                           ; $1B8CAB |
code_1B8CAD:
  RTS                                       ; $1B8CAD |

code_1B8CAE:
  LDA {entity_direction}                    ; $1B8CAE |
  AND #$01                                  ; $1B8CB1 |
  BNE code_1B8CC7                           ; $1B8CB3 |
  LDY {entity_var_h}                        ; $1B8CB5 |
  LDA {y_position_low}                      ; $1B8CB8 |
  STA {y_position_low},y                    ; $1B8CBB |
  LDA {x_position_low}                      ; $1B8CBE |
  SEC                                       ; $1B8CC1 |
  SBC #$14                                  ; $1B8CC2 |
  STA {x_position_low},y                    ; $1B8CC4 |
code_1B8CC7:
  INC {entity_var_a}                        ; $1B8CC7 |
  LDA {entity_var_a}                        ; $1B8CCA |
  AND #$07                                  ; $1B8CCD |
  BNE code_1B8D03                           ; $1B8CCF |
  LDY #$03                                  ; $1B8CD1 |
code_1B8CD3:
  LDA $0624,y                               ; $1B8CD3 |
  SEC                                       ; $1B8CD6 |
  SBC #$10                                  ; $1B8CD7 |
  BCS code_1B8CDD                           ; $1B8CD9 |
  LDA #$0F                                  ; $1B8CDB |
code_1B8CDD:
  STA $0604,y                               ; $1B8CDD |
  STA $0624,y                               ; $1B8CE0 |
  LDA $062C,y                               ; $1B8CE3 |
  SEC                                       ; $1B8CE6 |
  SBC #$10                                  ; $1B8CE7 |
  BCS code_1B8CED                           ; $1B8CE9 |
  LDA #$0F                                  ; $1B8CEB |
code_1B8CED:
  STA $060C,y                               ; $1B8CED |
  STA $062C,y                               ; $1B8CF0 |
  DEY                                       ; $1B8CF3 |
  BPL code_1B8CD3                           ; $1B8CF4 |
  STY $18                                   ; $1B8CF6 |
  LDY {entity_var_h}                        ; $1B8CF8 |
  LDA {entity_display_flags},y              ; $1B8CFB |
  AND #$EF                                  ; $1B8CFE |
  STA {entity_display_flags},y              ; $1B8D00 |
code_1B8D03:
  RTS                                       ; $1B8D03 |

  LDA #$1F                                  ; $1B8D04 |
  CMP {animation_index}                     ; $1B8D06 |
  BEQ code_1B8D1B                           ; $1B8D09 |
  DEC {entity_var_a}                        ; $1B8D0B |
  BNE code_1B8D03                           ; $1B8D0E |
  JSR code_1FEA98                           ; $1B8D10 |
  LDA #$0B                                  ; $1B8D13 |
  STA $23                                   ; $1B8D15 |
  LDA #$80                                  ; $1B8D17 |
  STA $1E                                   ; $1B8D19 |
code_1B8D1B:
  LDA {entity_var_a}                        ; $1B8D1B |
  INC {entity_var_a}                        ; $1B8D1E |
  AND #$0F                                  ; $1B8D21 |
  BNE code_1B8D03                           ; $1B8D23 |
  JSR code_1FF16F                           ; $1B8D25 |
  BCS code_1B8D03                           ; $1B8D28 |
  LDA #$42                                  ; $1B8D2A |
  JSR code_1FEAA4                           ; $1B8D2C |
  LDA #$2F                                  ; $1B8D2F |
  STA {entity_type},y                       ; $1B8D31 |
  LDA #$00                                  ; $1B8D34 |
  STA {sprite_flags},y                      ; $1B8D36 |
  LDX {entity_var_b}                        ; $1B8D39 |
  LDA $9007,x                               ; $1B8D3C |
  STA {y_position_low},y                    ; $1B8D3F |
  LDA $9008,x                               ; $1B8D42 |
  STA {x_position_low},y                    ; $1B8D45 |
  INC {entity_var_b}                        ; $1B8D48 |
  INC {entity_var_b}                        ; $1B8D4B |
  LDA {entity_var_b}                        ; $1B8D4E |
  CMP #$18                                  ; $1B8D51 |
  BNE code_1B8D78                           ; $1B8D53 |
  LDA #$00                                  ; $1B8D55 |
  STA {entity_var_a}                        ; $1B8D57 |
  STA {entity_var_b}                        ; $1B8D5A |
  STA {entity_var_c}                        ; $1B8D5D |
  STA $78                                   ; $1B8D60 |
  STA $79                                   ; $1B8D62 |
  LDA #$23                                  ; $1B8D64 |
  STA $7A                                   ; $1B8D66 |
  LDA #$00                                  ; $1B8D68 |
  STA $7B                                   ; $1B8D6A |
  LDA #$BF                                  ; $1B8D6C |
  STA $9B                                   ; $1B8D6E |
  LDA #$05                                  ; $1B8D70 |
  STA $99                                   ; $1B8D72 |
  LDA #$20                                  ; $1B8D74 |
  STA $30                                   ; $1B8D76 |
code_1B8D78:
  LDX #$00                                  ; $1B8D78 |
  RTS                                       ; $1B8D7A |

  LDA {entity_var_a}                        ; $1B8D7B |
  CLC                                       ; $1B8D7E |
  ADC #$40                                  ; $1B8D7F |
  STA {entity_var_a}                        ; $1B8D81 |
  LDA {entity_var_b}                        ; $1B8D84 |
  ADC #$00                                  ; $1B8D87 |
  STA {entity_var_b}                        ; $1B8D89 |
  CMP #$08                                  ; $1B8D8C |
  BCC code_1B8D9A                           ; $1B8D8E |
  LDA #$08                                  ; $1B8D90 |
  STA {entity_var_b}                        ; $1B8D92 |
  LDA #$00                                  ; $1B8D95 |
  STA {entity_var_a}                        ; $1B8D97 |
code_1B8D9A:
  LDA {entity_var_c}                        ; $1B8D9A |
  SEC                                       ; $1B8D9D |
  SBC {entity_var_a}                        ; $1B8D9E |
  STA {entity_var_c}                        ; $1B8DA1 |
  LDA $FA                                   ; $1B8DA4 |
  SBC {entity_var_b}                        ; $1B8DA6 |
  STA $FA                                   ; $1B8DA9 |
  BCS code_1B8DB5                           ; $1B8DAB |
  SBC #$0F                                  ; $1B8DAD |
  STA $FA                                   ; $1B8DAF |
  LDA #$02                                  ; $1B8DB1 |
  STA $FD                                   ; $1B8DB3 |
code_1B8DB5:
  LDA $FD                                   ; $1B8DB5 |
  BEQ code_1B8DED                           ; $1B8DB7 |
  LDA #$66                                  ; $1B8DB9 |
  CMP $FA                                   ; $1B8DBB |
  BCC code_1B8DED                           ; $1B8DBD |
  STA $FA                                   ; $1B8DBF |
  LDA $9D                                   ; $1B8DC1 |
  AND #$02                                  ; $1B8DC3 |
  STA $78                                   ; $1B8DC5 |
  LDA #$C4                                  ; $1B8DC7 |
  CMP {animation_index}                     ; $1B8DC9 |
  BEQ code_1B8DD1                           ; $1B8DCC |
  JSR code_1FEA98                           ; $1B8DCE |
code_1B8DD1:
  LDY {entity_var_g}                        ; $1B8DD1 |
  LDA {entity_type},y                       ; $1B8DD4 |
  BNE code_1B8DED                           ; $1B8DD7 |
  STA {entity_var_b}                        ; $1B8DD9 |
  STA {entity_var_c}                        ; $1B8DDC |
  LDA #$01                                  ; $1B8DDF |
  STA {entity_var_a}                        ; $1B8DE1 |
  LDA #$21                                  ; $1B8DE4 |
  STA $30                                   ; $1B8DE6 |
  LDA #$4A                                  ; $1B8DE8 |
  JSR code_1FEC5B                           ; $1B8DEA |
code_1B8DED:
  RTS                                       ; $1B8DED |

  LDA {entity_var_c}                        ; $1B8DEE |
  CLC                                       ; $1B8DF1 |
  ADC #$40                                  ; $1B8DF2 |
  STA {entity_var_c}                        ; $1B8DF4 |
  LDA $FA                                   ; $1B8DF7 |
  ADC #$00                                  ; $1B8DF9 |
  STA $FA                                   ; $1B8DFB |
  LDA #$6E                                  ; $1B8DFD |
  CMP $FA                                   ; $1B8DFF |
  BCS code_1B8E05                           ; $1B8E01 |
  STA $FA                                   ; $1B8E03 |
code_1B8E05:
  DEC {entity_var_a}                        ; $1B8E05 |
  BNE code_1B8DED                           ; $1B8E08 |
  LDA #$08                                  ; $1B8E0A |
  STA {entity_var_a}                        ; $1B8E0C |
  LDY {entity_var_b}                        ; $1B8E0F |
  LDX $43                                   ; $1B8E12 |
  LDA $901F,y                               ; $1B8E14 |
  STA $06C0,x                               ; $1B8E17 |
  LDA $9020,y                               ; $1B8E1A |
  STA $06C1,x                               ; $1B8E1D |
  STA $22                                   ; $1B8E20 |
  LDA $9021,y                               ; $1B8E22 |
  STA $06C2,x                               ; $1B8E25 |
  STA $10                                   ; $1B8E28 |
  LDA $9022,y                               ; $1B8E2A |
  STA $06C3,x                               ; $1B8E2D |
  STA $11                                   ; $1B8E30 |
  LDA $9023,y                               ; $1B8E32 |
  STA $02                                   ; $1B8E35 |
  LDA $9024,y                               ; $1B8E37 |
  STA $03                                   ; $1B8E3A |
  INX                                       ; $1B8E3C |
  INX                                       ; $1B8E3D |
  INX                                       ; $1B8E3E |
  INX                                       ; $1B8E3F |
  STX $43                                   ; $1B8E40 |
  LDX #$00                                  ; $1B8E42 |
  JSR code_1FF16F                           ; $1B8E44 |
  BCS code_1B8E95                           ; $1B8E47 |
  LDA #$2B                                  ; $1B8E49 |
  JSR code_1FEC5D                           ; $1B8E4B |
  LDA #$00                                  ; $1B8E4E |
  JSR code_1FEAA4                           ; $1B8E50 |
  LDA #$C1                                  ; $1B8E53 |
  STA {entity_type},y                       ; $1B8E55 |
  LDA $02                                   ; $1B8E58 |
  STA {y_position_low},y                    ; $1B8E5A |
  LDA $03                                   ; $1B8E5D |
  STA {x_position_low},y                    ; $1B8E5F |
  LDA #$00                                  ; $1B8E62 |
  STA {sprite_flags},y                      ; $1B8E64 |
  TYA                                       ; $1B8E67 |
  TAX                                       ; $1B8E68 |
  LDY $11                                   ; $1B8E69 |
  JSR code_1ED7DB                           ; $1B8E6B |
  LDX #$00                                  ; $1B8E6E |
  LDA {entity_var_b}                        ; $1B8E70 |
  CLC                                       ; $1B8E73 |
  ADC #$06                                  ; $1B8E74 |
  STA {entity_var_b}                        ; $1B8E76 |
  CMP #$48                                  ; $1B8E79 |
  BNE code_1B8E95                           ; $1B8E7B |
  LDA #$04                                  ; $1B8E7D |
  JSR code_1FEA98                           ; $1B8E7F |
  LDA #$22                                  ; $1B8E82 |
  STA $30                                   ; $1B8E84 |
  LDA #$00                                  ; $1B8E86 |
  STA {entity_var_a}                        ; $1B8E88 |
  LDA #$4C                                  ; $1B8E8B |
  STA {x_speed_frac}                        ; $1B8E8D |
  LDA #$01                                  ; $1B8E90 |
  STA {x_speed}                             ; $1B8E92 |
code_1B8E95:
  RTS                                       ; $1B8E95 |

  LDY #$00                                  ; $1B8E96 |
  JSR code_1FE7B7                           ; $1B8E98 |
  LDA #$04                                  ; $1B8E9B |
  BCS code_1B8EA1                           ; $1B8E9D |
  LDA #$07                                  ; $1B8E9F |
code_1B8EA1:
  CMP {animation_index}                     ; $1B8EA1 |
  BEQ code_1B8EA9                           ; $1B8EA4 |
  JSR code_1FEA98                           ; $1B8EA6 |
code_1B8EA9:
  LDA {entity_display_flags}                ; $1B8EA9 |
  ORA #$08                                  ; $1B8EAC |
  STA {entity_display_flags}                ; $1B8EAE |
  LDA {x_position_high}                     ; $1B8EB1 |
  CMP #$0B                                  ; $1B8EB4 |
  BEQ code_1B8EBB                           ; $1B8EB6 |
  JSR code_1FE8DE                           ; $1B8EB8 |
code_1B8EBB:
  LDY {entity_var_h}                        ; $1B8EBB |
  LDA {entity_type},y                       ; $1B8EBE |
  BNE code_1B8ECF                           ; $1B8EC1 |
  LDA #$23                                  ; $1B8EC3 |
  STA $30                                   ; $1B8EC5 |
  LDA #$3C                                  ; $1B8EC7 |
  STA {entity_var_a}                        ; $1B8EC9 |
  STA {entity_var_b}                        ; $1B8ECC |
code_1B8ECF:
  RTS                                       ; $1B8ECF |

  LDA {entity_var_a}                        ; $1B8ED0 |
  BEQ code_1B8EDA                           ; $1B8ED3 |
  DEC {entity_var_a}                        ; $1B8ED5 |
  BNE code_1B8ECF                           ; $1B8ED8 |
code_1B8EDA:
  LDA $FA                                   ; $1B8EDA |
  SEC                                       ; $1B8EDC |
  SBC #$08                                  ; $1B8EDD |
  STA $FA                                   ; $1B8EDF |
  LDA #$50                                  ; $1B8EE1 |
  CMP $FA                                   ; $1B8EE3 |
  BCC code_1B8ECF                           ; $1B8EE5 |
  STA $FA                                   ; $1B8EE7 |
  DEC {entity_var_b}                        ; $1B8EE9 |
  BNE code_1B8ECF                           ; $1B8EEC |
  JMP code_1B851C                           ; $1B8EEE |

  db $02, $FE, $C0, $40, $FF, $00, $04, $08 ; $1B8EF1 |
  db $00, $0F, $0F, $20, $11, $01, $0F, $20 ; $1B8EF9 |
  db $10, $00, $0F, $21, $19, $09, $0F, $20 ; $1B8F01 |
  db $27, $17, $03, $B0, $90, $04, $04, $B0 ; $1B8F09 |
  db $30, $02, $04, $30, $30, $04, $04, $30 ; $1B8F11 |
  db $50, $01, $04, $50, $50, $04, $04, $50 ; $1B8F19 |
  db $70, $01, $04, $70, $70, $04, $04, $70 ; $1B8F21 |
  db $A8, $FF, $03, $D0, $70, $04, $04, $D0 ; $1B8F29 |
  db $70, $02, $04, $B0, $70, $04, $04, $B0 ; $1B8F31 |
  db $B0, $01, $04, $D0, $B0, $04, $05, $D0 ; $1B8F39 |
  db $38, $FF, $4C, $01, $00, $01, $0F, $0F ; $1B8F41 |
  db $05, $15, $25, $0F, $2C, $11, $2C, $2C ; $1B8F49 |
  db $2C, $2C, $2C, $2C, $11, $0F, $11, $11 ; $1B8F51 |
  db $11, $11, $11, $11, $0F, $2C, $80, $08 ; $1B8F59 |
  db $0C, $00, $10, $78, $08, $00, $80, $E8 ; $1B8F61 |
  db $04, $00, $F0, $78, $00, $00, $38, $28 ; $1B8F69 |
  db $0A, $00, $38, $C8, $06, $00, $C8, $C8 ; $1B8F71 |
  db $02, $00, $C8, $28, $FE, $00, $03, $2A ; $1B8F79 |
  db $02, $65, $B8, $48, $03, $29, $03, $65 ; $1B8F81 |
  db $B8, $38, $03, $29, $02, $65, $B8, $28 ; $1B8F89 |
  db $03, $28, $03, $65, $B8, $18, $03, $2A ; $1B8F91 |
  db $00, $82, $A8, $48, $03, $29, $01, $82 ; $1B8F99 |
  db $A8, $38, $03, $29, $00, $82, $A8, $28 ; $1B8FA1 |
  db $03, $28, $01, $82, $A8, $18, $03, $21 ; $1B8FA9 |
  db $02, $65, $98, $28, $03, $20, $03, $65 ; $1B8FB1 |
  db $98, $18, $03, $01, $80, $34, $08, $04 ; $1B8FB9 |
  db $20, $B4, $09, $04, $20, $B4, $0A, $04 ; $1B8FC1 |
  db $20, $B4, $0B, $04, $20, $B4, $0C, $04 ; $1B8FC9 |
  db $20, $B4, $0D, $04, $20, $B4, $0E, $04 ; $1B8FD1 |
  db $20, $B4, $0F, $04, $20, $B4, $04, $02 ; $1B8FD9 |
  db $20, $B4, $20, $34, $20, $74, $20, $B4 ; $1B8FE1 |
  db $80, $74, $80, $B4, $E0, $34, $E0, $74 ; $1B8FE9 |
  db $E0, $B4, $0F, $30, $10, $08, $0F, $2B ; $1B8FF1 |
  db $1B, $0B, $0F, $30, $2C, $00, $0F, $27 ; $1B8FF9 |
  db $26, $06, $00, $00, $00, $9A, $30, $38 ; $1B9001 |
  db $60, $98, $90, $68, $30, $C8, $60, $38 ; $1B9009 |
  db $90, $C8, $30, $68, $60, $C8, $90, $38 ; $1B9011 |
  db $30, $98, $60, $68, $90, $98, $0A, $0D ; $1B9019 |
  db $00, $00, $28, $A8, $0A, $05, $02, $80 ; $1B9021 |
  db $18, $A8, $0A, $0D, $01, $00, $28, $B8 ; $1B9029 |
  db $0A, $05, $03, $81, $18, $B8, $0A, $0E ; $1B9031 |
  db $00, $00, $28, $C8, $0A, $06, $02, $82 ; $1B9039 |
  db $18, $C8, $0A, $0E, $01, $00, $28, $D8 ; $1B9041 |
  db $0A, $06, $03, $83, $18, $D8, $0A, $0F ; $1B9049 |
  db $00, $00, $28, $E8, $0A, $07, $02, $84 ; $1B9051 |
  db $18, $E8, $0A, $0F, $01, $00, $28, $F8 ; $1B9059 |
  db $0A, $07, $03, $80, $18, $F8, $04, $08 ; $1B9061 |
  db $08, $04                               ; $1B9069 |

code_1B906B:
  LDA {y_position_high}                     ; $1B906B |
  BNE code_1B90E2                           ; $1B906E |
  LDY $32                                   ; $1B9070 |
  LDA $00B0,y                               ; $1B9072 |
  CMP $95C5,y                               ; $1B9075 |
  BEQ code_1B90E2                           ; $1B9078 |
  LDA $9571,y                               ; $1B907A |
  STA $00                                   ; $1B907D |
  LDA $9581,y                               ; $1B907F |
  STA $01                                   ; $1B9082 |
  JMP ($0000)                               ; $1B9084 |

  LDA $14                                   ; $1B9087 |
  AND #$40                                  ; $1B9089 |
  BEQ code_1B90E2                           ; $1B908B |
  LDA $0304                                 ; $1B908D |
  BNE code_1B90E3                           ; $1B9090 |
  LDY $32                                   ; $1B9092 |
  LDA $00B0,y                               ; $1B9094 |
  CMP #$80                                  ; $1B9097 |
  BEQ code_1B90E3                           ; $1B9099 |
  LDY #$04                                  ; $1B909B |
  JSR code_1B9554                           ; $1B909D |
  LDA #$36                                  ; $1B90A0 |
  STA $10                                   ; $1B90A2 |
  LDA {entity_display_flags}                ; $1B90A4 |
  AND #$20                                  ; $1B90A7 |
  BEQ code_1B90B2                           ; $1B90A9 |
  INC $10                                   ; $1B90AB |
  LDA #$01                                  ; $1B90AD |
  STA $0424                                 ; $1B90AF |
code_1B90B2:
  LDY #$04                                  ; $1B90B2 |
  LDA #$4E                                  ; $1B90B4 |
  JSR code_1FEAF5                           ; $1B90B6 |
  LDA #$46                                  ; $1B90B9 |
  STA $ED                                   ; $1B90BB |
  LDA {entity_display_flags},y              ; $1B90BD |
  AND #$BF                                  ; $1B90C0 |
  STA {entity_display_flags},y              ; $1B90C2 |
  LDA #$00                                  ; $1B90C5 |
  STA {y_speed_frac},y                      ; $1B90C7 |
  LDA #$08                                  ; $1B90CA |
  STA {y_speed},y                           ; $1B90CC |
  LDA #$00                                  ; $1B90CF |
  STA $037C                                 ; $1B90D1 |
  LDY $32                                   ; $1B90D4 |
  LDA $959C,y                               ; $1B90D6 |
  STA $0304                                 ; $1B90D9 |
  LDA $959E,y                               ; $1B90DC |
  STA $040C                                 ; $1B90DF |
code_1B90E2:
  RTS                                       ; $1B90E2 |

code_1B90E3:
  LDA $14                                   ; $1B90E3 |
  AND #$40                                  ; $1B90E5 |
  BEQ code_1B9110                           ; $1B90E7 |
  LDA $0301                                 ; $1B90E9 |
  CMP #$45                                  ; $1B90EC |
  BEQ code_1B910F                           ; $1B90EE |
code_1B90F0:
  LDY #$03                                  ; $1B90F0 |
code_1B90F2:
  LDA {entity_type},y                       ; $1B90F2 |
  BEQ code_1B9102                           ; $1B90F5 |
  LDA {animation_index},y                   ; $1B90F7 |
  CMP #$A8                                  ; $1B90FA |
  BEQ code_1B910F                           ; $1B90FC |
  CMP #$A9                                  ; $1B90FE |
  BEQ code_1B910F                           ; $1B9100 |
code_1B9102:
  DEY                                       ; $1B9102 |
  BNE code_1B90F2                           ; $1B9103 |
  LDY #$03                                  ; $1B9105 |
code_1B9107:
  LDA {entity_type},y                       ; $1B9107 |
  BEQ code_1B918B                           ; $1B910A |
  DEY                                       ; $1B910C |
  BNE code_1B9107                           ; $1B910D |
code_1B910F:
  RTS                                       ; $1B910F |

code_1B9110:
  LDA $32                                   ; $1B9110 |
  BNE code_1B910F                           ; $1B9112 |
  LDA $30                                   ; $1B9114 |
  CMP #$04                                  ; $1B9116 |
  BEQ code_1B910F                           ; $1B9118 |
  LDA $16                                   ; $1B911A |
  AND #$40                                  ; $1B911C |
  BNE code_1B913D                           ; $1B911E |
  LDA $38                                   ; $1B9120 |
  CMP #$10                                  ; $1B9122 |
  BCC code_1B910F                           ; $1B9124 |
  CMP #$50                                  ; $1B9126 |
  BCC code_1B90F0                           ; $1B9128 |
  LDA $0301                                 ; $1B912A |
  ORA $0302                                 ; $1B912D |
  ORA $0303                                 ; $1B9130 |
  BNE code_1B9139                           ; $1B9133 |
  LDY #$01                                  ; $1B9135 |
  BNE code_1B918B                           ; $1B9137 |
code_1B9139:
  LDA #$00                                  ; $1B9139 |
  STA $38                                   ; $1B913B |
code_1B913D:
  LDA $38                                   ; $1B913D |
  CMP #$20                                  ; $1B913F |
  BNE code_1B9148                           ; $1B9141 |
  LDA #$22                                  ; $1B9143 |
  JSR code_1FEC5D                           ; $1B9145 |
code_1B9148:
  INC $38                                   ; $1B9148 |
  LDA $38                                   ; $1B914A |
code_1B914C:
  CMP #$56                                  ; $1B914C |
  BNE code_1B9154                           ; $1B914E |
  LDA #$50                                  ; $1B9150 |
  STA $38                                   ; $1B9152 |
code_1B9154:
  CMP #$50                                  ; $1B9154 |
  BCC code_1B9160                           ; $1B9156 |
  AND #$0F                                  ; $1B9158 |
  LSR                                       ; $1B915A |
  CLC                                       ; $1B915B |
  ADC #$05                                  ; $1B915C |
  BNE code_1B916A                           ; $1B915E |
code_1B9160:
  LSR                                       ; $1B9160 |
  LSR                                       ; $1B9161 |
  LDY #$00                                  ; $1B9162 |
  BCC code_1B916B                           ; $1B9164 |
  LSR                                       ; $1B9166 |
  LSR                                       ; $1B9167 |
  AND #$07                                  ; $1B9168 |
code_1B916A:
  TAY                                       ; $1B916A |
code_1B916B:
  LDA $8F47,y                               ; $1B916B |
  STA $0611                                 ; $1B916E |
  STA $0631                                 ; $1B9171 |
  LDA $8F4F,y                               ; $1B9174 |
  STA $0612                                 ; $1B9177 |
  STA $0632                                 ; $1B917A |
  LDA $8F57,y                               ; $1B917D |
  STA $0613                                 ; $1B9180 |
  STA $0633                                 ; $1B9183 |
  LDA #$FF                                  ; $1B9186 |
  STA $18                                   ; $1B9188 |
  RTS                                       ; $1B918A |

code_1B918B:
  LDA $30                                   ; $1B918B |
  CMP #$03                                  ; $1B918D |
  BNE code_1B919F                           ; $1B918F |
  LDA $16                                   ; $1B9191 |
  AND #$03                                  ; $1B9193 |
  BEQ code_1B919F                           ; $1B9195 |
  STA {entity_direction}                    ; $1B9197 |
  STA $31                                   ; $1B919A |
  JSR code_1FEC30                           ; $1B919C |
code_1B919F:
  LDA $30                                   ; $1B919F |
  CMP #$04                                  ; $1B91A1 |
  BEQ code_1B91B4                           ; $1B91A3 |
  LDA #$10                                  ; $1B91A5 |
  STA $33                                   ; $1B91A7 |
  LDA $34                                   ; $1B91A9 |
  BNE code_1B91B4                           ; $1B91AB |
  LDA #$01                                  ; $1B91AD |
  STA $34                                   ; $1B91AF |
  INC {animation_index}                     ; $1B91B1 |
code_1B91B4:
  LDA #$02                                  ; $1B91B4 |
  STA {entity_direction},y                  ; $1B91B6 |
  LDA {entity_display_flags}                ; $1B91B9 |
  AND #$20                                  ; $1B91BC |
  BEQ code_1B91C5                           ; $1B91BE |
  LDA #$01                                  ; $1B91C0 |
  STA {entity_direction},y                  ; $1B91C2 |
code_1B91C5:
  LDA $38                                   ; $1B91C5 |
  CMP $9591,x                               ; $1B91C7 |
  BCC code_1B91D1                           ; $1B91CA |
  INX                                       ; $1B91CC |
  CPX #$02                                  ; $1B91CD |
  BNE code_1B91C5                           ; $1B91CF |
code_1B91D1:
  LDA {entity_direction},y                  ; $1B91D1 |
  AND #$01                                  ; $1B91D4 |
  ORA $9597,x                               ; $1B91D6 |
  STA $10                                   ; $1B91D9 |
  LDA $959A,x                               ; $1B91DB |
  STA {x_speed_frac},y                      ; $1B91DE |
  LDA $959D,x                               ; $1B91E1 |
  STA {x_speed},y                           ; $1B91E4 |
  LDA $32                                   ; $1B91E7 |
  CMP #$01                                  ; $1B91E9 |
  BEQ code_1B91F2                           ; $1B91EB |
  LDA $95A0,x                               ; $1B91ED |
  STA $5B                                   ; $1B91F0 |
code_1B91F2:
  LDA $95A3,x                               ; $1B91F2 |
  JSR code_1FEC5D                           ; $1B91F5 |
  LDA #$00                                  ; $1B91F8 |
  STA {sprite_flags},y                      ; $1B91FA |
  LDA $9594,x                               ; $1B91FD |
  LDX #$00                                  ; $1B9200 |
  JSR code_1FEAF5                           ; $1B9202 |
  LDA #$00                                  ; $1B9205 |
  STA {sprite_flags},y                      ; $1B9207 |
  LDA #$70                                  ; $1B920A |
  STA {entity_type},y                       ; $1B920C |
  LDA $38                                   ; $1B920F |
  STA {entity_var_a},y                      ; $1B9211 |
  LDA $30                                   ; $1B9214 |
  CMP #$04                                  ; $1B9216 |
  BNE code_1B922D                           ; $1B9218 |
  LDA #$33                                  ; $1B921A |
  STA {x_speed_frac},y                      ; $1B921C |
  LDA #$07                                  ; $1B921F |
  STA {x_speed},y                           ; $1B9221 |
  LDA {y_position_low},y                    ; $1B9224 |
  CLC                                       ; $1B9227 |
  ADC #$06                                  ; $1B9228 |
  STA {y_position_low},y                    ; $1B922A |
code_1B922D:
  LDA $38                                   ; $1B922D |
  BEQ code_1B9236                           ; $1B922F |
  LDY #$00                                  ; $1B9231 |
  JSR code_1B916B                           ; $1B9233 |
code_1B9236:
  LDA #$00                                  ; $1B9236 |
  STA $38                                   ; $1B9238 |
  RTS                                       ; $1B923A |

  LDA $14                                   ; $1B923B |
  AND #$40                                  ; $1B923D |
  BEQ code_1B92AE                           ; $1B923F |
  LDA $0301                                 ; $1B9241 |
  ORA $0302                                 ; $1B9244 |
  ORA $0303                                 ; $1B9247 |
  BNE code_1B92AE                           ; $1B924A |
  LDY #$01                                  ; $1B924C |
  JSR code_1B9554                           ; $1B924E |
  LDA #$36                                  ; $1B9251 |
  STA $10                                   ; $1B9253 |
  LDA {entity_display_flags}                ; $1B9255 |
  AND #$20                                  ; $1B9258 |
  BEQ code_1B9263                           ; $1B925A |
  INC $10                                   ; $1B925C |
  LDA #$01                                  ; $1B925E |
  STA $0421                                 ; $1B9260 |
code_1B9263:
  LDY $32                                   ; $1B9263 |
  LDA $95A8,y                               ; $1B9265 |
  STA $0301                                 ; $1B9268 |
  LDA #$00                                  ; $1B926B |
  STA $03A9                                 ; $1B926D |
  STA $03D9                                 ; $1B9270 |
  STA $0409                                 ; $1B9273 |
  LDA $95AE,y                               ; $1B9276 |
  STA $03C1                                 ; $1B9279 |
  STA $03F1                                 ; $1B927C |
  LDA $95B1,y                               ; $1B927F |
  JSR code_1FEC5D                           ; $1B9282 |
  LDA $95AB,y                               ; $1B9285 |
  LDY #$01                                  ; $1B9288 |
  JSR code_1FEAF5                           ; $1B928A |
  LDA #$01                                  ; $1B928D |
  JSR code_1B953D                           ; $1B928F |
  LDA $32                                   ; $1B9292 |
  STA $5B                                   ; $1B9294 |
  CMP #$03                                  ; $1B9296 |
  BNE code_1B929F                           ; $1B9298 |
  LDY #$01                                  ; $1B929A |
  JSR code_1B951C                           ; $1B929C |
code_1B929F:
  LDA #$10                                  ; $1B929F |
  STA $33                                   ; $1B92A1 |
  LDA $34                                   ; $1B92A3 |
  BNE code_1B92AE                           ; $1B92A5 |
  LDA #$01                                  ; $1B92A7 |
  STA $34                                   ; $1B92A9 |
  INC {animation_index}                     ; $1B92AB |
code_1B92AE:
  RTS                                       ; $1B92AE |

  LDA $14                                   ; $1B92AF |
  AND #$40                                  ; $1B92B1 |
  BEQ code_1B92AE                           ; $1B92B3 |
  LDA $0301                                 ; $1B92B5 |
  ORA $0302                                 ; $1B92B8 |
  ORA $0303                                 ; $1B92BB |
  BNE code_1B92AE                           ; $1B92BE |
  LDY #$01                                  ; $1B92C0 |
  JSR code_1B9554                           ; $1B92C2 |
  LDA $0421                                 ; $1B92C5 |
  LSR                                       ; $1B92C8 |
  ORA #$20                                  ; $1B92C9 |
  TAY                                       ; $1B92CB |
  JSR code_1B984F                           ; $1B92CC |
  LDA $48                                   ; $1B92CF |
  AND #$10                                  ; $1B92D1 |
  BNE code_1B92AE                           ; $1B92D3 |
  LDA $49                                   ; $1B92D5 |
  AND #$10                                  ; $1B92D7 |
  BNE code_1B92E9                           ; $1B92D9 |
  LDA $46                                   ; $1B92DB |
  BEQ code_1B92AE                           ; $1B92DD |
  LDY $26                                   ; $1B92DF |
  LDA $95E8,y                               ; $1B92E1 |
  CMP {y_position_low}                      ; $1B92E4 |
  BNE code_1B92AE                           ; $1B92E7 |
code_1B92E9:
  LDY #$03                                  ; $1B92E9 |
code_1B92EB:
  LDA $0421                                 ; $1B92EB |
  AND #$01                                  ; $1B92EE |
  ORA #$3E                                  ; $1B92F0 |
  STA $10                                   ; $1B92F2 |
  LDA #$B2                                  ; $1B92F4 |
  JSR code_1FEAF5                           ; $1B92F6 |
  LDA #$75                                  ; $1B92F9 |
  STA {entity_type},y                       ; $1B92FB |
  LDA #$00                                  ; $1B92FE |
  STA {sprite_flags},y                      ; $1B9300 |
  STA {x_speed_frac},y                      ; $1B9303 |
  LDA #$03                                  ; $1B9306 |
  STA {x_speed},y                           ; $1B9308 |
  LDA #$13                                  ; $1B930B |
  STA {entity_var_a},y                      ; $1B930D |
  LDA $95E1,y                               ; $1B9310 |
  STA {entity_var_c},y                      ; $1B9313 |
  LDA $95E4,y                               ; $1B9316 |
  ORA {entity_display_flags},y              ; $1B9319 |
  AND #$DF                                  ; $1B931C |
  STA {entity_display_flags},y              ; $1B931E |
  LDA $0421                                 ; $1B9321 |
  STA {entity_direction},y                  ; $1B9324 |
  JSR code_1FEA34                           ; $1B9327 |
  DEY                                       ; $1B932A |
  BNE code_1B92EB                           ; $1B932B |
  LDA $32                                   ; $1B932D |
  STA $5B                                   ; $1B932F |
  LDA #$02                                  ; $1B9331 |
  JSR code_1B953D                           ; $1B9333 |
  LDA #$40                                  ; $1B9336 |
  JSR code_1FEC5D                           ; $1B9338 |
  JMP code_1B929F                           ; $1B933B |

code_1B933E:
  RTS                                       ; $1B933E |

  LDA $14                                   ; $1B933F |
  AND #$40                                  ; $1B9341 |
  BEQ code_1B933E                           ; $1B9343 |
  LDY #$03                                  ; $1B9345 |
code_1B9347:
  LDA {entity_type},y                       ; $1B9347 |
  BEQ code_1B9350                           ; $1B934A |
  DEY                                       ; $1B934C |
  BNE code_1B9347                           ; $1B934D |
  RTS                                       ; $1B934F |

code_1B9350:
  JSR code_1B9554                           ; $1B9350 |
  LDA {entity_direction},y                  ; $1B9353 |
  AND #$01                                  ; $1B9356 |
  ORA #$36                                  ; $1B9358 |
  STA $10                                   ; $1B935A |
  LDA #$20                                  ; $1B935C |
  JSR code_1FEAF5                           ; $1B935E |
  LDA {entity_display_flags},y              ; $1B9361 |
  ORA #$01                                  ; $1B9364 |
  STA {entity_display_flags},y              ; $1B9366 |
  LDA #$76                                  ; $1B9369 |
  STA {entity_type},y                       ; $1B936B |
  LDA #$00                                  ; $1B936E |
  STA {x_speed_frac},y                      ; $1B9370 |
  STA {x_speed},y                           ; $1B9373 |
  LDA #$1A                                  ; $1B9376 |
  STA {sprite_flags},y                      ; $1B9378 |
  LDA $32                                   ; $1B937B |
  STA $5B                                   ; $1B937D |
  LDA #$1E                                  ; $1B937F |
  STA {entity_var_a},y                      ; $1B9381 |
  JSR code_1B951C                           ; $1B9384 |
  LDA #$02                                  ; $1B9387 |
  JSR code_1B953D                           ; $1B9389 |
  LDA #$1A                                  ; $1B938C |
  JSR code_1FEC5D                           ; $1B938E |
  JMP code_1B929F                           ; $1B9391 |

  LDA $14                                   ; $1B9394 |
  AND #$40                                  ; $1B9396 |
  BEQ code_1B93E6                           ; $1B9398 |
  LDY #$03                                  ; $1B939A |
code_1B939C:
  LDA {entity_type},y                       ; $1B939C |
  BEQ code_1B93A5                           ; $1B939F |
  DEY                                       ; $1B93A1 |
  BNE code_1B939C                           ; $1B93A2 |
  RTS                                       ; $1B93A4 |

code_1B93A5:
  JSR code_1B9554                           ; $1B93A5 |
  LDA {entity_direction},y                  ; $1B93A8 |
  AND #$01                                  ; $1B93AB |
  ORA #$36                                  ; $1B93AD |
  STA $10                                   ; $1B93AF |
  LDA #$B1                                  ; $1B93B1 |
  JSR code_1FEAF5                           ; $1B93B3 |
  LDA #$00                                  ; $1B93B6 |
  STA {sprite_flags},y                      ; $1B93B8 |
  LDA #$72                                  ; $1B93BB |
  STA {entity_type},y                       ; $1B93BD |
  JSR code_1FEA34                           ; $1B93C0 |
  LDA $32                                   ; $1B93C3 |
  STA $5B                                   ; $1B93C5 |
  LDA #$78                                  ; $1B93C7 |
  STA {entity_var_a},y                      ; $1B93C9 |
  LDA #$00                                  ; $1B93CC |
  STA {x_speed_frac},y                      ; $1B93CE |
  LDA #$01                                  ; $1B93D1 |
  STA {x_speed},y                           ; $1B93D3 |
  JSR code_1B951C                           ; $1B93D6 |
  LDA #$01                                  ; $1B93D9 |
  JSR code_1B953D                           ; $1B93DB |
  LDA #$1A                                  ; $1B93DE |
  JSR code_1FEC5D                           ; $1B93E0 |
  JMP code_1B929F                           ; $1B93E3 |

code_1B93E6:
  RTS                                       ; $1B93E6 |

  LDA $14                                   ; $1B93E7 |
  AND #$40                                  ; $1B93E9 |
  BEQ code_1B93E6                           ; $1B93EB |
  LDA $0301                                 ; $1B93ED |
  BNE code_1B93E6                           ; $1B93F0 |
  LDY #$01                                  ; $1B93F2 |
  LDA #$B3                                  ; $1B93F4 |
  JSR code_1FEAA4                           ; $1B93F6 |
  LDA $0529                                 ; $1B93F9 |
  AND #$DF                                  ; $1B93FC |
  STA $0529                                 ; $1B93FE |
  LDA #$77                                  ; $1B9401 |
  STA $0301                                 ; $1B9403 |
  LDA #$00                                  ; $1B9406 |
  STA $0409                                 ; $1B9408 |
  STA $03A9                                 ; $1B940B |
  STA $03C1                                 ; $1B940E |
  LDA $32                                   ; $1B9411 |
  STA $5B                                   ; $1B9413 |
code_1B9415:
  RTS                                       ; $1B9415 |

  LDA $14                                   ; $1B9416 |
  AND #$40                                  ; $1B9418 |
  BEQ code_1B9415                           ; $1B941A |
  LDA $0301                                 ; $1B941C |
  ORA $0302                                 ; $1B941F |
  ORA $0303                                 ; $1B9422 |
  BNE code_1B9415                           ; $1B9425 |
  LDA #$43                                  ; $1B9427 |
  JSR code_1FEC5D                           ; $1B9429 |
  LDY #$03                                  ; $1B942C |
code_1B942E:
  LDA #$AF                                  ; $1B942E |
  JSR code_1FEAA4                           ; $1B9430 |
  LDA #$00                                  ; $1B9433 |
  STA {sprite_flags},y                      ; $1B9435 |
  LDA {x_position_low},y                    ; $1B9438 |
  CLC                                       ; $1B943B |
  ADC $95B5,y                               ; $1B943C |
  STA {x_position_low},y                    ; $1B943F |
  LDA {x_position_high},y                   ; $1B9442 |
  ADC $95B8,y                               ; $1B9445 |
  STA {x_position_high},y                   ; $1B9448 |
  LDA {y_position_low},y                    ; $1B944B |
  CLC                                       ; $1B944E |
  ADC $95BB,y                               ; $1B944F |
  STA {y_position_low},y                    ; $1B9452 |
  LDA {y_position_high},y                   ; $1B9455 |
  ADC $95BE,y                               ; $1B9458 |
  STA {y_position_high},y                   ; $1B945B |
  LDA $95C1,y                               ; $1B945E |
  STA {entity_var_a},y                      ; $1B9461 |
  LDA #$01                                  ; $1B9464 |
  STA {entity_var_c},y                      ; $1B9466 |
  LDA #$78                                  ; $1B9469 |
  STA {entity_type},y                       ; $1B946B |
  LDA $32                                   ; $1B946E |
  STA $5B                                   ; $1B9470 |
  DEY                                       ; $1B9472 |
  BNE code_1B942E                           ; $1B9473 |
  LDA #$01                                  ; $1B9475 |
  JSR code_1B953D                           ; $1B9477 |
  RTS                                       ; $1B947A |

  LDA $14                                   ; $1B947B |
  AND #$40                                  ; $1B947D |
  BEQ code_1B94CF                           ; $1B947F |
  LDA $0301                                 ; $1B9481 |
  BNE code_1B94CF                           ; $1B9484 |
  LDA #$44                                  ; $1B9486 |
  JSR code_1FEC5D                           ; $1B9488 |
  LDY #$01                                  ; $1B948B |
  LDA #$62                                  ; $1B948D |
  JSR code_1FEAA4                           ; $1B948F |
  LDA $0529                                 ; $1B9492 |
  ORA #$80                                  ; $1B9495 |
  STA $0529                                 ; $1B9497 |
  LDA #$C5                                  ; $1B949A |
  STA $0301                                 ; $1B949C |
  LDA #$06                                  ; $1B949F |
  STA $0469                                 ; $1B94A1 |
  LDA #$00                                  ; $1B94A4 |
  STA $0391                                 ; $1B94A6 |
  LDA #$80                                  ; $1B94A9 |
  STA $0379                                 ; $1B94AB |
  LDA $FC                                   ; $1B94AE |
  CLC                                       ; $1B94B0 |
  ADC #$80                                  ; $1B94B1 |
  STA $0331                                 ; $1B94B3 |
  LDA $F9                                   ; $1B94B6 |
  ADC #$00                                  ; $1B94B8 |
  STA $0349                                 ; $1B94BA |
  LDA #$20                                  ; $1B94BD |
  STA $0610                                 ; $1B94BF |
  LDA #$FF                                  ; $1B94C2 |
  STA $18                                   ; $1B94C4 |
  LDA $32                                   ; $1B94C6 |
  STA $5B                                   ; $1B94C8 |
  LDA #$04                                  ; $1B94CA |
  JSR code_1B953D                           ; $1B94CC |
code_1B94CF:
  RTS                                       ; $1B94CF |

  LDA $14                                   ; $1B94D0 |
  AND #$40                                  ; $1B94D2 |
  BEQ code_1B9553                           ; $1B94D4 |
  LDA $BC                                   ; $1B94D6 |
  CMP #$80                                  ; $1B94D8 |
  BEQ code_1B94E1                           ; $1B94DA |
  LDA $0301                                 ; $1B94DC |
  BEQ code_1B94E4                           ; $1B94DF |
code_1B94E1:
  JMP code_1B90E3                           ; $1B94E1 |

code_1B94E4:
  LDA #$3E                                  ; $1B94E4 |
  JSR code_1FEC5D                           ; $1B94E6 |
  LDY #$01                                  ; $1B94E9 |
  LDA #$9B                                  ; $1B94EB |
  JSR code_1FEAA4                           ; $1B94ED |
  LDA #$79                                  ; $1B94F0 |
  STA {entity_type},y                       ; $1B94F2 |
  LDA $32                                   ; $1B94F5 |
  STA $5B                                   ; $1B94F7 |
  LDA #$00                                  ; $1B94F9 |
  STA {sprite_flags},y                      ; $1B94FB |
  STA {y_position_low},y                    ; $1B94FE |
  STA {x_speed_frac},y                      ; $1B9501 |
  STA {x_speed},y                           ; $1B9504 |
  LDA #$80                                  ; $1B9507 |
  STA {y_speed_frac},y                      ; $1B9509 |
  LDA #$02                                  ; $1B950C |
  STA {y_speed},y                           ; $1B950E |
  LDA #$08                                  ; $1B9511 |
  STA {entity_var_d},y                      ; $1B9513 |
  LDA #$04                                  ; $1B9516 |
  STA {entity_direction},y                  ; $1B9518 |
  RTS                                       ; $1B951B |

code_1B951C:
  STY $0F                                   ; $1B951C |
  LDA {entity_direction},y                  ; $1B951E |
  LSR                                       ; $1B9521 |
  ORA #$22                                  ; $1B9522 |
  TAY                                       ; $1B9524 |
  JSR code_1B984F                           ; $1B9525 |
  LDY $0F                                   ; $1B9528 |
  LDA $10                                   ; $1B952A |
  AND #$10                                  ; $1B952C |
  BEQ code_1B9553                           ; $1B952E |
  LDA {x_position_low}                      ; $1B9530 |
  STA {x_position_low},y                    ; $1B9533 |
  LDA {x_position_high}                     ; $1B9536 |
  STA {x_position_high},y                   ; $1B9539 |
  RTS                                       ; $1B953C |

code_1B953D:
  STA $00                                   ; $1B953D |
  LDY $32                                   ; $1B953F |
  LDA $00B0,y                               ; $1B9541 |
  AND #$7F                                  ; $1B9544 |
  SEC                                       ; $1B9546 |
  SBC $00                                   ; $1B9547 |
  BCS code_1B954D                           ; $1B9549 |
  LDA #$00                                  ; $1B954B |
code_1B954D:
  ORA #$80                                  ; $1B954D |
  STA $00B0,y                               ; $1B954F |
  RTS                                       ; $1B9552 |

code_1B9553:
  RTS                                       ; $1B9553 |

code_1B9554:
  LDA $16                                   ; $1B9554 |
  AND #$03                                  ; $1B9556 |
  BNE code_1B9568                           ; $1B9558 |
  LDA #$02                                  ; $1B955A |
  STA {entity_direction},y                  ; $1B955C |
  LDA {entity_display_flags}                ; $1B955F |
  AND #$20                                  ; $1B9562 |
  BEQ code_1B956E                           ; $1B9564 |
  LDA #$01                                  ; $1B9566 |
code_1B9568:
  STA {entity_direction},y                  ; $1B9568 |
  STA {entity_direction}                    ; $1B956B |
code_1B956E:
  JMP code_1FEC30                           ; $1B956E |

  db $E3, $AF, $3B, $3B, $94, $3F, $16, $7B ; $1B9571 |
  db $53, $E7, $87, $87, $D0, $E3, $E3, $E3 ; $1B9579 |
  db $90, $92, $92, $92, $93, $93, $94, $94 ; $1B9581 |
  db $95, $93, $90, $90, $94, $90, $90, $90 ; $1B9589 |
  db $28, $50, $FF, $18, $A8, $A9, $00, $36 ; $1B9591 |
  db $36, $33, $00, $00, $04, $05, $05, $00 ; $1B9599 |
  db $0D, $0E, $1A, $20, $21, $02, $45, $05 ; $1B95A1 |
  db $1A, $74, $73, $72, $AA, $AC, $B1, $03 ; $1B95A9 |
  db $04, $01, $41, $1A, $1A, $14, $EC, $00 ; $1B95B1 |
  db $00, $FF, $00, $10, $10, $E8, $00, $00 ; $1B95B9 |
  db $FF, $02, $06, $0C, $00, $80, $80, $80 ; $1B95C1 |
  db $80, $80, $80, $80, $00, $80, $00, $00 ; $1B95C9 |
  db $00, $00, $00, $00, $BC, $00, $00, $00 ; $1B95D1 |
  db $00, $00, $00, $00, $BC, $CC, $00, $BC ; $1B95D9 |
  db $00, $00, $03, $06, $00, $04, $04, $00 ; $1B95E1 |
  db $00, $00, $B4, $00, $00, $00, $00, $00 ; $1B95E9 |
  db $00, $00, $B4, $C4, $00, $00, $00      ; $1B95F1 |

code_1B95F8:
  LDA $16                                   ; $1B95F8 |
  LDY $AF                                   ; $1B95FA |
  AND $9069,y                               ; $1B95FC |
  BEQ code_1B964B                           ; $1B95FF |
  LDA {entity_display_flags}                ; $1B9601 |
  BPL code_1B964B                           ; $1B9604 |
  LDA #$02                                  ; $1B9606 |
  ORA $AF                                   ; $1B9608 |
  TAY                                       ; $1B960A |
  JSR code_1B984F                           ; $1B960B |
  LDA {y_position_high}                     ; $1B960E |
  BNE code_1B964B                           ; $1B9611 |
  LDA $AF                                   ; $1B9613 |
  BEQ code_1B961F                           ; $1B9615 |
  LDA $4A                                   ; $1B9617 |
  CMP #$20                                  ; $1B9619 |
  BEQ code_1B962B                           ; $1B961B |
  BNE code_1B9625                           ; $1B961D |
code_1B961F:
  LDA $48                                   ; $1B961F |
  CMP #$20                                  ; $1B9621 |
  BEQ code_1B962B                           ; $1B9623 |
code_1B9625:
  LDA $49                                   ; $1B9625 |
  CMP #$20                                  ; $1B9627 |
  BNE code_1B964B                           ; $1B9629 |
code_1B962B:
  LDA #$03                                  ; $1B962B |
  STA $30                                   ; $1B962D |
  LDA {x_position_low}                      ; $1B962F |
  AND #$F0                                  ; $1B9632 |
  ORA #$08                                  ; $1B9634 |
  STA {x_position_low}                      ; $1B9636 |
  LDA #$4C                                  ; $1B9639 |
  STA {y_speed_frac}                        ; $1B963B |
  LDA #$01                                  ; $1B963E |
  STA {y_speed}                             ; $1B9640 |
  LDA #$0A                                  ; $1B9643 |
  CLC                                       ; $1B9645 |
  ADC $34                                   ; $1B9646 |
  JSR code_1FEA98                           ; $1B9648 |
code_1B964B:
  RTS                                       ; $1B964B |

code_1B964C:
  PHP                                       ; $1B964C |
  LDA $49                                   ; $1B964D |
  PHA                                       ; $1B964F |
  LDA $11                                   ; $1B9650 |
  PHA                                       ; $1B9652 |
  LDA $39                                   ; $1B9653 |
  BNE code_1B9684                           ; $1B9655 |
  BCS code_1B965C                           ; $1B9657 |
  JMP code_1B96E5                           ; $1B9659 |

code_1B965C:
  LDA #$01                                  ; $1B965C |
  STA $39                                   ; $1B965E |
  LDA $49                                   ; $1B9660 |
  CMP #$50                                  ; $1B9662 |
  BEQ code_1B967C                           ; $1B9664 |
  CMP #$70                                  ; $1B9666 |
  BEQ code_1B967A                           ; $1B9668 |
  LDA $48                                   ; $1B966A |
  CMP $49                                   ; $1B966C |
  BNE code_1B9672                           ; $1B966E |
  LDA $4A                                   ; $1B9670 |
code_1B9672:
  CMP #$50                                  ; $1B9672 |
  BEQ code_1B967C                           ; $1B9674 |
  CMP #$70                                  ; $1B9676 |
  BNE code_1B96C0                           ; $1B9678 |
code_1B967A:
  INC $39                                   ; $1B967A |
code_1B967C:
  LDA #$80                                  ; $1B967C |
  STA $3A                                   ; $1B967E |
  LDA #$00                                  ; $1B9680 |
  STA $3B                                   ; $1B9682 |
code_1B9684:
  LDA {entity_display_flags}                ; $1B9684 |
  PHA                                       ; $1B9687 |
  LDA {x_speed_frac}                        ; $1B9688 |
  PHA                                       ; $1B968B |
  LDA {x_speed}                             ; $1B968C |
  PHA                                       ; $1B968F |
  LDA {entity_direction}                    ; $1B9690 |
  PHA                                       ; $1B9693 |
  LDA $3A                                   ; $1B9694 |
  STA {x_speed_frac}                        ; $1B9696 |
  LDA $3B                                   ; $1B9699 |
  STA {x_speed}                             ; $1B969B |
  LDA $39                                   ; $1B969E |
  STA {entity_direction}                    ; $1B96A0 |
  LDY #$00                                  ; $1B96A3 |
  LDA $30                                   ; $1B96A5 |
  CMP #$02                                  ; $1B96A7 |
  BNE code_1B96AD                           ; $1B96A9 |
  LDY #$04                                  ; $1B96AB |
code_1B96AD:
  JSR code_1FEA3F                           ; $1B96AD |
  PLA                                       ; $1B96B0 |
  STA {entity_direction}                    ; $1B96B1 |
  PLA                                       ; $1B96B4 |
  STA {x_speed}                             ; $1B96B5 |
  PLA                                       ; $1B96B8 |
  STA {x_speed_frac}                        ; $1B96B9 |
  PLA                                       ; $1B96BC |
  STA {entity_display_flags}                ; $1B96BD |
code_1B96C0:
  LDA #$00                                  ; $1B96C0 |
  STA $39                                   ; $1B96C2 |
  LDA $46                                   ; $1B96C4 |
  BEQ code_1B96E5                           ; $1B96C6 |
  LDY $26                                   ; $1B96C8 |
  LDA $97CF,y                               ; $1B96CA |
  BEQ code_1B96E5                           ; $1B96CD |
  LDY #$25                                  ; $1B96CF |
  LDA $30                                   ; $1B96D1 |
  CMP #$02                                  ; $1B96D3 |
  BNE code_1B96D8                           ; $1B96D5 |
  INY                                       ; $1B96D7 |
code_1B96D8:
  JSR code_1EC4A1                           ; $1B96D8 |
  LDA $10                                   ; $1B96DB |
  AND #$10                                  ; $1B96DD |
  BEQ code_1B96E5                           ; $1B96DF |
  LDA #$F0                                  ; $1B96E1 |
  STA $36                                   ; $1B96E3 |
code_1B96E5:
  LDA $27                                   ; $1B96E5 |
  CMP #$04                                  ; $1B96E7 |
  BNE code_1B96F3                           ; $1B96E9 |
  LDA #$80                                  ; $1B96EB |
  STA $10                                   ; $1B96ED |
  STA $53                                   ; $1B96EF |
  BNE code_1B9728                           ; $1B96F1 |
code_1B96F3:
  LDA $26                                   ; $1B96F3 |
  CMP #$0D                                  ; $1B96F5 |
  BEQ code_1B96FF                           ; $1B96F7 |
  LDA #$00                                  ; $1B96F9 |
  STA $52                                   ; $1B96FB |
  BEQ code_1B9766                           ; $1B96FD |
code_1B96FF:
  LDA {y_position_low}                      ; $1B96FF |
  CMP #$E0                                  ; $1B9702 |
  BCS code_1B9724                           ; $1B9704 |
  LDA {y_position_high}                     ; $1B9706 |
  BNE code_1B9724                           ; $1B9709 |
  LDY #$06                                  ; $1B970B |
  JSR code_1B9845                           ; $1B970D |
  LDA $10                                   ; $1B9710 |
  CMP #$80                                  ; $1B9712 |
  BEQ code_1B9728                           ; $1B9714 |
  CMP #$20                                  ; $1B9716 |
  BEQ code_1B9724                           ; $1B9718 |
  CMP #$40                                  ; $1B971A |
  BEQ code_1B9724                           ; $1B971C |
  LDA #$00                                  ; $1B971E |
  STA $10                                   ; $1B9720 |
  BEQ code_1B9728                           ; $1B9722 |
code_1B9724:
  LDA $53                                   ; $1B9724 |
  STA $10                                   ; $1B9726 |
code_1B9728:
  LDA $52                                   ; $1B9728 |
  BNE code_1B9734                           ; $1B972A |
  LDA $10                                   ; $1B972C |
  BEQ code_1B9736                           ; $1B972E |
  LDA #$03                                  ; $1B9730 |
  STA $52                                   ; $1B9732 |
code_1B9734:
  DEC $52                                   ; $1B9734 |
code_1B9736:
  LDA $10                                   ; $1B9736 |
  CMP $53                                   ; $1B9738 |
  BEQ code_1B9766                           ; $1B973A |
  STA $53                                   ; $1B973C |
  LDA $10                                   ; $1B973E |
  BNE code_1B9749                           ; $1B9740 |
  LDA $11                                   ; $1B9742 |
  CLC                                       ; $1B9744 |
  ADC #$10                                  ; $1B9745 |
  STA $11                                   ; $1B9747 |
code_1B9749:
  LDA $0305                                 ; $1B9749 |
  BNE code_1B9766                           ; $1B974C |
  LDY #$05                                  ; $1B974E |
  LDA #$8B                                  ; $1B9750 |
  JSR code_1FEAA4                           ; $1B9752 |
  LDA #$01                                  ; $1B9755 |
  STA {entity_type},y                       ; $1B9757 |
  LDA $11                                   ; $1B975A |
  AND #$F0                                  ; $1B975C |
  STA {y_position_low},y                    ; $1B975E |
  LDA #$3A                                  ; $1B9761 |
  JSR code_1FEC5D                           ; $1B9763 |
code_1B9766:
  LDA $26                                   ; $1B9766 |
  CMP #$05                                  ; $1B9768 |
  BNE code_1B9795                           ; $1B976A |
  LDA $F9                                   ; $1B976C |
  CMP #$13                                  ; $1B976E |
  BEQ code_1B9795                           ; $1B9770 |
  CMP #$05                                  ; $1B9772 |
  BCC code_1B9795                           ; $1B9774 |
  DEC $57                                   ; $1B9776 |
  BNE code_1B9795                           ; $1B9778 |
  LDA $58                                   ; $1B977A |
  INC $58                                   ; $1B977C |
  AND #$01                                  ; $1B977E |
  TAY                                       ; $1B9780 |
  LDA $97C9,y                               ; $1B9781 |
  STA $57                                   ; $1B9784 |
  LDA $97CB,y                               ; $1B9786 |
  JSR code_1FEC5D                           ; $1B9789 |
  LDA $99                                   ; $1B978C |
  BNE code_1B9795                           ; $1B978E |
  LDA $97CD,y                               ; $1B9790 |
  STA $FA                                   ; $1B9793 |
code_1B9795:
  LDA $9D                                   ; $1B9795 |
  LSR                                       ; $1B9797 |
  LSR                                       ; $1B9798 |
  BCS code_1B97C1                           ; $1B9799 |
  LDA {entity_display_flags}                ; $1B979B |
  AND #$EF                                  ; $1B979E |
  STA {entity_display_flags}                ; $1B97A0 |
  LDY #$18                                  ; $1B97A3 |
  JSR code_1B984F                           ; $1B97A5 |
  LDA $42                                   ; $1B97A8 |
  CMP #$60                                  ; $1B97AA |
  BEQ code_1B97B9                           ; $1B97AC |
  LDY #$19                                  ; $1B97AE |
  JSR code_1B984F                           ; $1B97B0 |
  LDA $42                                   ; $1B97B3 |
  CMP #$60                                  ; $1B97B5 |
  BNE code_1B97C1                           ; $1B97B7 |
code_1B97B9:
  LDA {entity_display_flags}                ; $1B97B9 |
  ORA #$10                                  ; $1B97BC |
  STA {entity_display_flags}                ; $1B97BE |
code_1B97C1:
  PLA                                       ; $1B97C1 |
  STA $11                                   ; $1B97C2 |
  PLA                                       ; $1B97C4 |
  STA $49                                   ; $1B97C5 |
  PLP                                       ; $1B97C7 |
  RTS                                       ; $1B97C8 |

  db $14, $50, $33, $34, $01, $00, $00, $00 ; $1B97C9 |
  db $00, $FF, $00, $00, $00, $00, $00, $00 ; $1B97D1 |
  db $00, $FF, $FF, $00, $00, $00           ; $1B97D9 |

code_1B97DF:
  BCC code_1B9844                           ; $1B97DF |
  PHP                                       ; $1B97E1 |
  LDA $27                                   ; $1B97E2 |
  CMP #$03                                  ; $1B97E4 |
  BNE code_1B9843                           ; $1B97E6 |
  LDA #$1E                                  ; $1B97E8 |
  STA $10                                   ; $1B97EA |
  LDA $48                                   ; $1B97EC |
  CMP #$30                                  ; $1B97EE |
  BEQ code_1B97FA                           ; $1B97F0 |
  LDA $4A                                   ; $1B97F2 |
  CMP #$30                                  ; $1B97F4 |
  BNE code_1B9843                           ; $1B97F6 |
  INC $10                                   ; $1B97F8 |
code_1B97FA:
  JSR code_1FF16F                           ; $1B97FA |
  BCS code_1B9843                           ; $1B97FD |
  LDA #$62                                  ; $1B97FF |
  JSR code_1FEAF5                           ; $1B9801 |
  LDA #$00                                  ; $1B9804 |
  STA {sprite_flags},y                      ; $1B9806 |
  LDA {entity_display_flags},y              ; $1B9809 |
  AND #$DF                                  ; $1B980C |
  ORA #$0A                                  ; $1B980E |
  STA {entity_display_flags},y              ; $1B9810 |
  LDA {x_position_low},y                    ; $1B9813 |
  AND #$F0                                  ; $1B9816 |
  ORA #$08                                  ; $1B9818 |
  STA {x_position_low},y                    ; $1B981A |
  LDA #$C8                                  ; $1B981D |
  STA {y_position_low},y                    ; $1B981F |
  LDA #$0C                                  ; $1B9822 |
  STA {entity_type},y                       ; $1B9824 |
  LDA #$2A                                  ; $1B9827 |
  STA {entity_var_a},y                      ; $1B9829 |
  JSR code_1FEA34                           ; $1B982C |
  TYA                                       ; $1B982F |
  TAX                                       ; $1B9830 |
  JSR code_1ED8A2                           ; $1B9831 |
  JSR code_1ED8C7                           ; $1B9834 |
  LDA $22                                   ; $1B9837 |
  STA {entity_var_b},x                      ; $1B9839 |
  LDA $10                                   ; $1B983C |
  STA {entity_var_c},x                      ; $1B983E |
  LDX #$00                                  ; $1B9841 |
code_1B9843:
  PLP                                       ; $1B9843 |
code_1B9844:
  RTS                                       ; $1B9844 |

code_1B9845:
  LDA $36                                   ; $1B9845 |
  PHA                                       ; $1B9847 |
  JSR code_1EC4A1                           ; $1B9848 |
  PLA                                       ; $1B984B |
  STA $36                                   ; $1B984C |
  RTS                                       ; $1B984E |

code_1B984F:
  LDA $36                                   ; $1B984F |
  PHA                                       ; $1B9851 |
  JSR code_1EC5AA                           ; $1B9852 |
  PLA                                       ; $1B9855 |
  STA $36                                   ; $1B9856 |
  RTS                                       ; $1B9858 |

code_1B9859:
  LDA #$FF                                  ; $1B9859 |
  STA $03                                   ; $1B985B |
  LDA {x_position_low}                      ; $1B985D |
  SEC                                       ; $1B9860 |
  SBC $FC                                   ; $1B9861 |
  STA $00                                   ; $1B9863 |
  SEC                                       ; $1B9865 |
  SBC #$10                                  ; $1B9866 |
  STA $02                                   ; $1B9868 |
  BCC code_1B9878                           ; $1B986A |
  INC $03                                   ; $1B986C |
  LDA $00                                   ; $1B986E |
  SBC #$F2                                  ; $1B9870 |
  STA $02                                   ; $1B9872 |
  BCC code_1B9889                           ; $1B9874 |
  BEQ code_1B9889                           ; $1B9876 |
code_1B9878:
  LDA {x_position_low}                      ; $1B9878 |
  SEC                                       ; $1B987B |
  SBC $02                                   ; $1B987C |
  STA {x_position_low}                      ; $1B987E |
  LDA {x_position_high}                     ; $1B9881 |
  SBC $03                                   ; $1B9884 |
  STA {x_position_high}                     ; $1B9886 |
code_1B9889:
  RTS                                       ; $1B9889 |

  CLC                                       ; $1B988A |
  LDA $FC                                   ; $1B988B |
  STA $02                                   ; $1B988D |
  ADC #$FF                                  ; $1B988F |
  STA $04                                   ; $1B9891 |
  LDA $F9                                   ; $1B9893 |
  STA $03                                   ; $1B9895 |
  ADC #$00                                  ; $1B9897 |
  STA $05                                   ; $1B9899 |
  LDA $AC                                   ; $1B989B |
  AND #$01                                  ; $1B989D |
  BNE code_1B98D9                           ; $1B989F |
code_1B98A1:
  LDY $AE                                   ; $1B98A1 |
  BEQ code_1B98BD                           ; $1B98A3 |
  LDA $A9FF,y                               ; $1B98A5 |
  CMP $03                                   ; $1B98A8 |
  BCC code_1B98BD                           ; $1B98AA |
  BNE code_1B98B5                           ; $1B98AC |
  LDA $AA7F,y                               ; $1B98AE |
  CMP $02                                   ; $1B98B1 |
  BCC code_1B98BD                           ; $1B98B3 |
code_1B98B5:
  DEY                                       ; $1B98B5 |
  JSR code_1B990A                           ; $1B98B6 |
  DEC $AE                                   ; $1B98B9 |
  BNE code_1B98A1                           ; $1B98BB |
code_1B98BD:
  LDY $AD                                   ; $1B98BD |
  BEQ code_1B98D4                           ; $1B98BF |
code_1B98C1:
  LDA $A9FF,y                               ; $1B98C1 |
  CMP $05                                   ; $1B98C4 |
  BCC code_1B98D4                           ; $1B98C6 |
  BNE code_1B98D1                           ; $1B98C8 |
  LDA $AA7F,y                               ; $1B98CA |
  CMP $04                                   ; $1B98CD |
  BCC code_1B98D4                           ; $1B98CF |
code_1B98D1:
  DEY                                       ; $1B98D1 |
  BNE code_1B98C1                           ; $1B98D2 |
code_1B98D4:
  STY $AD                                   ; $1B98D4 |
  JMP code_1B9909                           ; $1B98D6 |

code_1B98D9:
  LDY $AD                                   ; $1B98D9 |
  LDA $05                                   ; $1B98DB |
  CMP $AA00,y                               ; $1B98DD |
  BCC code_1B98F2                           ; $1B98E0 |
  BNE code_1B98EB                           ; $1B98E2 |
  LDA $04                                   ; $1B98E4 |
  CMP $AA80,y                               ; $1B98E6 |
  BCC code_1B98F2                           ; $1B98E9 |
code_1B98EB:
  JSR code_1B990A                           ; $1B98EB |
  INC $AD                                   ; $1B98EE |
  BNE code_1B98D9                           ; $1B98F0 |
code_1B98F2:
  LDY $AE                                   ; $1B98F2 |
code_1B98F4:
  LDA $03                                   ; $1B98F4 |
  CMP $AA00,y                               ; $1B98F6 |
  BCC code_1B9907                           ; $1B98F9 |
  BNE code_1B9904                           ; $1B98FB |
  LDA $02                                   ; $1B98FD |
  CMP $AA80,y                               ; $1B98FF |
  BCC code_1B9907                           ; $1B9902 |
code_1B9904:
  INY                                       ; $1B9904 |
  BNE code_1B98F4                           ; $1B9905 |
code_1B9907:
  STY $AE                                   ; $1B9907 |
code_1B9909:
  RTS                                       ; $1B9909 |

code_1B990A:
  STY $06                                   ; $1B990A |
  LDA $AB80,y                               ; $1B990C |
  CMP #$C0                                  ; $1B990F |
  BCS code_1B9916                           ; $1B9911 |
  JMP code_1B9995                           ; $1B9913 |

code_1B9916:
  AND #$3F                                  ; $1B9916 |
  TAY                                       ; $1B9918 |
  LDX $9DB2,y                               ; $1B9919 |
  BMI code_1B9933                           ; $1B991C |
  CPX #$10                                  ; $1B991E |
  BCS code_1B9985                           ; $1B9920 |
  LDA $9DE2,y                               ; $1B9922 |
  BPL code_1B993F                           ; $1B9925 |
  STA $05F0,x                               ; $1B9927 |
  LDA #$00                                  ; $1B992A |
  STA $05F4,x                               ; $1B992C |
  STA $05F8,x                               ; $1B992F |
  RTS                                       ; $1B9932 |

code_1B9933:
  STX $05D0                                 ; $1B9933 |
  LDA #$00                                  ; $1B9936 |
  STA $05D2                                 ; $1B9938 |
  STA $05D1                                 ; $1B993B |
  RTS                                       ; $1B993E |

code_1B993F:
  ASL                                       ; $1B993F |
  ASL                                       ; $1B9940 |
  TAY                                       ; $1B9941 |
  LDA $9E13,y                               ; $1B9942 |
  STA $0601,x                               ; $1B9945 |
  STA $0621,x                               ; $1B9948 |
  LDA $9E14,y                               ; $1B994B |
  STA $0602,x                               ; $1B994E |
  STA $0622,x                               ; $1B9951 |
  LDA $9E15,y                               ; $1B9954 |
  STA $0603,x                               ; $1B9957 |
  STA $0623,x                               ; $1B995A |
  TXA                                       ; $1B995D |
  LSR                                       ; $1B995E |
  LSR                                       ; $1B995F |
  TAX                                       ; $1B9960 |
  LDA #$00                                  ; $1B9961 |
  STA $05F0,x                               ; $1B9963 |
  LDA #$FF                                  ; $1B9966 |
  STA $18                                   ; $1B9968 |
  LDX $9E12,y                               ; $1B996A |
  BEQ code_1B9909                           ; $1B996D |
  BPL code_1B9985                           ; $1B996F |
  TXA                                       ; $1B9971 |
  AND #$3F                                  ; $1B9972 |
  STA $0600                                 ; $1B9974 |
  STA $0620                                 ; $1B9977 |
  STA $0610                                 ; $1B997A |
  STA $0630                                 ; $1B997D |
  LDA #$FF                                  ; $1B9980 |
  STA $18                                   ; $1B9982 |
  RTS                                       ; $1B9984 |

code_1B9985:
  LDA $9E56,x                               ; $1B9985 |
  STA $EA                                   ; $1B9988 |
  LDA $9E57,x                               ; $1B998A |
  STA $EB                                   ; $1B998D |
  LDA #$00                                  ; $1B998F |
  STA $05D0                                 ; $1B9991 |
code_1B9994:
  RTS                                       ; $1B9994 |

code_1B9995:
  LDX #$17                                  ; $1B9995 |
  LDA $06                                   ; $1B9997 |
code_1B9999:
  CMP $0438,x                               ; $1B9999 |
  BEQ code_1B9994                           ; $1B999C |
  DEX                                       ; $1B999E |
  CPX #$07                                  ; $1B999F |
  BNE code_1B9999                           ; $1B99A1 |
  JSR code_1FF15F                           ; $1B99A3 |
  BCS code_1B9994                           ; $1B99A6 |
  LDA $06                                   ; $1B99A8 |
  AND #$07                                  ; $1B99AA |
  TAY                                       ; $1B99AC |
  LDA $F2B2,y                               ; $1B99AD |
  STA $07                                   ; $1B99B0 |
  LDA $06                                   ; $1B99B2 |
  LSR                                       ; $1B99B4 |
  LSR                                       ; $1B99B5 |
  LSR                                       ; $1B99B6 |
  TAY                                       ; $1B99B7 |
  LDA $0100,y                               ; $1B99B8 |
  AND $07                                   ; $1B99BB |
  BNE code_1B9994                           ; $1B99BD |
  LDA $06                                   ; $1B99BF |
  STA $0438,x                               ; $1B99C1 |
  TAY                                       ; $1B99C4 |
  LDA $AA00,y                               ; $1B99C5 |
  STA {x_position_high},x                   ; $1B99C8 |
  LDA $AA80,y                               ; $1B99CB |
  STA {x_position_low},x                    ; $1B99CE |
  LDA $AB00,y                               ; $1B99D1 |
  STA {y_position_low},x                    ; $1B99D4 |
  LDA $AB80,y                               ; $1B99D7 |
  STA {entity_var_h},x                      ; $1B99DA |
  TAY                                       ; $1B99DD |
  LDA $9A42,y                               ; $1B99DE |
  PHA                                       ; $1B99E1 |
  AND #$7F                                  ; $1B99E2 |
  STA {entity_display_flags},x              ; $1B99E4 |
  LDA $9AD2,y                               ; $1B99E7 |
  STA {entity_type},x                       ; $1B99EA |
  LDA $9B62,y                               ; $1B99ED |
  STA {sprite_flags},x                      ; $1B99F0 |
  LDA $9BF2,y                               ; $1B99F3 |
  JSR code_1FEA98                           ; $1B99F6 |
  JSR face_player                           ; $1B99F9 |
  LDA $9C82,y                               ; $1B99FC |
  STA {entity_life},x                       ; $1B99FF |
  LDA $9D12,y                               ; $1B9A02 |
  TAY                                       ; $1B9A05 |
  LDA $9DA2,y                               ; $1B9A06 |
  STA {x_speed_frac},x                      ; $1B9A09 |
  LDA $9DAA,y                               ; $1B9A0C |
  STA {x_speed},x                           ; $1B9A0F |
  JSR reset_vertical_speed                  ; $1B9A12 |
  LDA #$00                                  ; $1B9A15 |
  STA {y_position_high},x                   ; $1B9A17 |
  STA {x_position_frac},x                   ; $1B9A1A |
  STA {y_position_frac},x                   ; $1B9A1D |
  STA {entity_handler_low},x                ; $1B9A20 |
  STA {entity_handler_high},x               ; $1B9A23 |
  STA {entity_var_a},x                      ; $1B9A26 |
  STA {entity_var_b},x                      ; $1B9A29 |
  STA {entity_var_c},x                      ; $1B9A2C |
  STA {entity_var_d},x                      ; $1B9A2F |
  STA {entity_var_e},x                      ; $1B9A32 |
  STA {entity_var_f},x                      ; $1B9A35 |
  STA {entity_var_g},x                      ; $1B9A38 |
  PLA                                       ; $1B9A3B |
  BMI code_1B9A41                           ; $1B9A3C |
  JSR code_1FEC30                           ; $1B9A3E |
code_1B9A41:
  RTS                                       ; $1B9A41 |

  db $08, $00, $00, $00, $00, $00, $00, $00 ; $1B9A42 |
  db $00, $00, $84, $00, $08, $00, $88, $C8 ; $1B9A4A |
  db $84, $04, $80, $80, $00, $00, $00, $00 ; $1B9A52 |
  db $00, $00, $40, $00, $40, $00, $08, $08 ; $1B9A5A |
  db $89, $89, $89, $89, $89, $89, $89, $89 ; $1B9A62 |
  db $A4, $00, $00, $00, $04, $A8, $88, $A8 ; $1B9A6A |
  db $88, $00, $80, $80, $80, $00, $00, $00 ; $1B9A72 |
  db $00, $00, $00, $00, $88, $A8, $88, $00 ; $1B9A7A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9A82 |
  db $00, $00, $00, $02, $88, $00, $A0, $08 ; $1B9A8A |
  db $00, $00, $02, $02, $02, $02, $00, $00 ; $1B9A92 |
  db $00, $04, $04, $06, $04, $04, $04, $04 ; $1B9A9A |
  db $00, $00, $04, $04, $14, $04, $04, $04 ; $1B9AA2 |
  db $04, $04, $04, $04, $04, $00, $00, $00 ; $1B9AAA |
  db $00, $00, $10, $00, $00, $00, $00, $00 ; $1B9AB2 |
  db $00, $00, $00, $00, $00, $00, $00, $A8 ; $1B9ABA |
  db $84, $80, $84, $80, $80, $80, $80, $80 ; $1B9AC2 |
  db $80, $80, $80, $80, $80, $80, $80, $80 ; $1B9ACA |
  db $10, $12, $13, $15, $16, $17, $18, $19 ; $1B9AD2 |
  db $1B, $1D, $26, $1F, $20, $21, $23, $23 ; $1B9ADA |
  db $24, $38, $28, $27, $2B, $31, $33, $35 ; $1B9AE2 |
  db $2A, $36, $36, $59, $63, $64, $9C, $9C ; $1B9AEA |
  db $2E, $2E, $2E, $2E, $2E, $2E, $2E, $2E ; $1B9AF2 |
  db $35, $9E, $3A, $3B, $3E, $3D, $3D, $3D ; $1B9AFA |
  db $3D, $50, $53, $54, $56, $BD, $66, $5A ; $1B9B02 |
  db $5C, $5D, $5F, $60, $3D, $3D, $3D, $66 ; $1B9B0A |
  db $04, $05, $06, $07, $06, $07, $08, $09 ; $1B9B12 |
  db $0A, $0B, $0E, $0F, $40, $41, $42, $43 ; $1B9B1A |
  db $44, $47, $48, $48, $48, $49, $4A, $4B ; $1B9B22 |
  db $4C, $4F, $71, $7A, $7C, $A0, $A2, $A5 ; $1B9B2A |
  db $67, $68, $B3, $B3, $B3, $B3, $B3, $B3 ; $1B9B32 |
  db $B3, $B3, $B3, $B3, $B3, $00, $00, $00 ; $1B9B3A |
  db $AF, $B0, $B9, $00, $00, $00, $00, $00 ; $1B9B42 |
  db $00, $00, $00, $00, $00, $00, $00, $3D ; $1B9B4A |
  db $22, $B6, $B6, $B6, $B6, $B6, $B6, $B6 ; $1B9B52 |
  db $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6 ; $1B9B5A |
  db $80, $C0, $C0, $C0, $CB, $D1, $92, $D2 ; $1B9B62 |
  db $93, $89, $96, $C0, $EE, $D7, $01, $01 ; $1B9B6A |
  db $00, $00, $D0, $00, $CC, $C8, $CC, $CD ; $1B9B72 |
  db $88, $F0, $F0, $A4, $C1, $C8, $AF, $AF ; $1B9B7A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9B82 |
  db $CD, $91, $C0, $C8, $CD, $C1, $C1, $C1 ; $1B9B8A |
  db $C1, $81, $C0, $CC, $90, $CC, $D1, $A2 ; $1B9B92 |
  db $C1, $D7, $CE, $CA, $C1, $C1, $C1, $D1 ; $1B9B9A |
  db $00, $00, $04, $04, $02, $02, $03, $00 ; $1B9BA2 |
  db $02, $02, $00, $03, $A8, $00, $00, $D9 ; $1B9BAA |
  db $A7, $00, $1D, $1E, $1F, $03, $00, $00 ; $1B9BB2 |
  db $00, $89, $E1, $A1, $A9, $89, $00, $AB ; $1B9BBA |
  db $C0, $C1, $00, $00, $00, $00, $00, $00 ; $1B9BC2 |
  db $00, $00, $00, $00, $00, $C0, $00, $00 ; $1B9BCA |
  db $06, $06, $00, $00, $00, $00, $00, $00 ; $1B9BD2 |
  db $00, $00, $00, $00, $00, $00, $00, $C1 ; $1B9BDA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9BE2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9BEA |
  db $48, $2F, $27, $90, $49, $2E, $23, $31 ; $1B9BF2 |
  db $43, $26, $22, $35, $39, $3C, $4C, $4C ; $1B9BFA |
  db $4F, $4B, $53, $59, $56, $01, $60, $50 ; $1B9C02 |
  db $4D, $0A, $0A, $61, $1D, $96, $89, $89 ; $1B9C0A |
  db $52, $52, $52, $52, $52, $52, $52, $52 ; $1B9C12 |
  db $50, $99, $67, $6C, $6F, $06, $06, $06 ; $1B9C1A |
  db $06, $72, $74, $77, $79, $90, $1C, $7E ; $1B9C22 |
  db $6B, $AE, $93, $89, $05, $05, $05, $86 ; $1B9C2A |
  db $00, $00, $00, $00, $62, $00, $00, $00 ; $1B9C32 |
  db $00, $62, $00, $00, $83, $00, $10, $62 ; $1B9C3A |
  db $62, $00, $62, $62, $62, $62, $B6, $00 ; $1B9C42 |
  db $00, $C3, $BF, $62, $BA, $55, $9E, $85 ; $1B9C4A |
  db $8F, $92, $10, $20, $0D, $03, $1F, $30 ; $1B9C52 |
  db $3A, $3E, $41, $4B, $52, $00, $00, $00 ; $1B9C5A |
  db $6A, $74, $65, $00, $00, $00, $00, $00 ; $1B9C62 |
  db $00, $00, $00, $00, $00, $00, $00, $05 ; $1B9C6A |
  db $07, $72, $73, $78, $74, $75, $76, $77 ; $1B9C72 |
  db $79, $7A, $7B, $7C, $7D, $7E, $7F, $80 ; $1B9C7A |
  db $02, $01, $01, $01, $03, $02, $06, $01 ; $1B9C82 |
  db $04, $01, $00, $03, $0D, $04, $00, $00 ; $1B9C8A |
  db $00, $00, $03, $00, $02, $03, $03, $02 ; $1B9C92 |
  db $03, $03, $03, $05, $01, $02, $05, $05 ; $1B9C9A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9CA2 |
  db $02, $01, $04, $03, $03, $01, $01, $01 ; $1B9CAA |
  db $01, $01, $01, $01, $01, $03, $02, $01 ; $1B9CB2 |
  db $05, $06, $01, $02, $01, $01, $01, $02 ; $1B9CBA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9CC2 |
  db $00, $00, $00, $00, $03, $00, $00, $00 ; $1B9CCA |
  db $14, $00, $00, $00, $00, $00, $00, $00 ; $1B9CD2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9CDA |
  db $01, $01, $00, $00, $00, $00, $00, $00 ; $1B9CE2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9CEA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9CF2 |
  db $00, $00, $00, $00, $00, $00, $00, $01 ; $1B9CFA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9D02 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9D0A |
  db $01, $02, $04, $00, $03, $03, $03, $02 ; $1B9D12 |
  db $00, $05, $04, $00, $00, $00, $00, $00 ; $1B9D1A |
  db $00, $05, $00, $00, $00, $05, $00, $00 ; $1B9D22 |
  db $00, $00, $00, $00, $03, $00, $05, $05 ; $1B9D2A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9D32 |
  db $06, $00, $05, $00, $00, $05, $00, $00 ; $1B9D3A |
  db $05, $05, $03, $05, $00, $00, $00, $03 ; $1B9D42 |
  db $00, $00, $00, $00, $00, $05, $00, $00 ; $1B9D4A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9D52 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9D5A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9D62 |
  db $00, $00, $00, $00, $00, $07, $00, $00 ; $1B9D6A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9D72 |
  db $00, $00, $00, $00, $05, $00, $00, $00 ; $1B9D7A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9D82 |
  db $00, $00, $00, $00, $00, $00, $00, $05 ; $1B9D8A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9D92 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9D9A |
  db $00, $CC, $33, $00, $80, $80, $00, $00 ; $1B9DA2 |
  db $01, $00, $01, $02, $01, $00, $04, $03 ; $1B9DAA |
  db $82, $83, $12, $14, $0C, $08, $04, $04 ; $1B9DB2 |
  db $02, $02, $0C, $03, $84, $16, $04, $04 ; $1B9DBA |
  db $80, $81, $08, $85, $18, $0C, $08, $00 ; $1B9DC2 |
  db $00, $00, $00, $00, $0C, $00, $00, $0C ; $1B9DCA |
  db $08, $0C, $01, $00, $00, $00, $00, $00 ; $1B9DD2 |
  db $00, $08, $0C, $03, $00, $04, $00, $10 ; $1B9DDA |
  db $00, $00, $00, $00, $00, $01, $02, $03 ; $1B9DE2 |
  db $89, $90, $04, $83, $00, $00, $06, $07 ; $1B9DEA |
  db $00, $00, $05, $00, $00, $08, $10, $00 ; $1B9DF2 |
  db $00, $00, $00, $00, $0E, $00, $00, $08 ; $1B9DFA |
  db $09, $0C, $9D, $0F, $00, $00, $00, $00 ; $1B9E02 |
  db $00, $0A, $0B, $91, $00, $00, $00, $00 ; $1B9E0A |
  db $00, $30, $23, $03, $00, $30, $2A, $0A ; $1B9E12 |
  db $00, $19, $09, $06, $00, $1C, $0C, $05 ; $1B9E1A |
  db $00, $30, $23, $03, $00, $39, $27, $18 ; $1B9E22 |
  db $06, $20, $27, $18, $08, $20, $1C, $21 ; $1B9E2A |
  db $00, $24, $14, $03, $00, $08, $08, $09 ; $1B9E32 |
  db $00, $10, $1C, $0C, $00, $10, $00, $08 ; $1B9E3A |
  db $00, $3C, $2C, $1C, $00, $24, $14, $03 ; $1B9E42 |
  db $00, $31, $21, $11, $00, $30, $27, $17 ; $1B9E4A |
  db $00, $20, $26, $16, $00, $00, $90, $92 ; $1B9E52 |
  db $90, $F0, $84, $86, $84, $7A, $00, $00 ; $1B9E5A |
  db $00, $00, $00, $00, $88, $8A, $A4, $A6 ; $1B9E62 |
  db $B0, $B2, $B4, $B6, $90, $F8, $00, $00 ; $1B9E6A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9E72 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9E7A |
  db $00, $00, $00, $00, $00, $00, $00, $40 ; $1B9E82 |
  db $80, $00, $00, $00, $00, $10, $00, $00 ; $1B9E8A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9E92 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9E9A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9EA2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9EAA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9EB2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9EBA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9EC2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9ECA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9ED2 |
  db $00, $00, $08, $00, $00, $00, $00, $00 ; $1B9EDA |
  db $00, $00, $08, $00, $00, $00, $00, $00 ; $1B9EE2 |
  db $00, $00, $01, $00, $00, $00, $20, $00 ; $1B9EEA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9EF2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9EFA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F02 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F0A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F12 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F1A |
  db $00, $00, $00, $10, $00, $00, $00, $00 ; $1B9F22 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F2A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F32 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F3A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F42 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F4A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F52 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F5A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F62 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F6A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F72 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F7A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F82 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F8A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F92 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9F9A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9FA2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9FAA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9FB2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9FBA |
  db $00, $00, $00, $00, $80, $00, $00, $00 ; $1B9FC2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9FCA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9FD2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9FDA |
  db $00, $00, $00, $00, $80, $00, $00, $00 ; $1B9FE2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9FEA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1B9FF2 |
  db $00, $00, $00, $00, $05, $FF           ; $1B9FFA |

bank $1C
org $8000


  LDX #$01                                  ; $1C8000 |
  STX $A6                                   ; $1C8002 |
code_1C8004:
  LDY {entity_type},x                       ; $1C8004 |
  BEQ code_1C8039                           ; $1C8007 |
  LDA {entity_handler_high},x               ; $1C8009 |
  BMI code_1C801A                           ; $1C800C |
  LDA $88C3,y                               ; $1C800E |
  STA {entity_handler_low},x                ; $1C8011 |
  LDA $8993,y                               ; $1C8014 |
  STA {entity_handler_high},x               ; $1C8017 |
code_1C801A:
  LDA $86C3,y                               ; $1C801A |
  CMP $F6                                   ; $1C801D |
  BEQ code_1C8026                           ; $1C801F |
  STA $F6                                   ; $1C8021 |
  JSR select_PRG_banks                      ; $1C8023 |
code_1C8026:
  LDA {entity_handler_low},x                ; $1C8026 |
  STA $00                                   ; $1C8029 |
  LDA {entity_handler_high},x               ; $1C802B |
  STA $01                                   ; $1C802E |
  LDA #$80                                  ; $1C8030 |
  PHA                                       ; $1C8032 |
  LDA #$5A                                  ; $1C8033 |
  PHA                                       ; $1C8035 |
  JMP ($0000)                               ; $1C8036 |

code_1C8039:
  INC $A6                                   ; $1C8039 |
  LDX $A6                                   ; $1C803B |
  CPX #$18                                  ; $1C803D |
  BEQ code_1C8044                           ; $1C803F |
  JMP code_1C8004                           ; $1C8041 |

code_1C8044:
  LDA $36                                   ; $1C8044 |
  BEQ code_1C8056                           ; $1C8046 |
  LDA {entity_flash_counter}                ; $1C8048 |
  BNE code_1C8056                           ; $1C804B |
  LDA $30                                   ; $1C804D |
  CMP #$06                                  ; $1C804F |
  BCS code_1C8056                           ; $1C8051 |
  JSR code_1C82A5                           ; $1C8053 |
code_1C8056:
  LDA #$00                                  ; $1C8056 |
  STA $36                                   ; $1C8058 |
  RTS                                       ; $1C805A |

  CPX #$05                                  ; $1C805B |
  BCC code_1C8082                           ; $1C805D |
  LDA $30                                   ; $1C805F |
  CMP #$06                                  ; $1C8061 |
  BCS code_1C8073                           ; $1C8063 |
  LDA {animation_index}                     ; $1C8065 |
  CMP #$B0                                  ; $1C8068 |
  BNE code_1C8073                           ; $1C806A |
  JSR code_1FEF87                           ; $1C806C |
  BCS code_1C8082                           ; $1C806F |
  BCC code_1C8078                           ; $1C8071 |
code_1C8073:
  JSR code_1FEFF8                           ; $1C8073 |
  BCS code_1C8082                           ; $1C8076 |
code_1C8078:
  LDA {sprite_flags},x                      ; $1C8078 |
  AND #$40                                  ; $1C807B |
  STA $00                                   ; $1C807D |
  JSR code_1C809D                           ; $1C807F |
code_1C8082:
  LDA {sprite_flags},x                      ; $1C8082 |
  BPL code_1C809A                           ; $1C8085 |
  LDA {entity_flash_counter}                ; $1C8087 |
  BNE code_1C809A                           ; $1C808A |
  LDA $30                                   ; $1C808C |
  CMP #$06                                  ; $1C808E |
  BCS code_1C809A                           ; $1C8090 |
  JSR code_1FEF87                           ; $1C8092 |
  BCS code_1C809A                           ; $1C8095 |
  JSR code_1C82C3                           ; $1C8097 |
code_1C809A:
  JMP code_1C8039                           ; $1C809A |

code_1C809D:
  LDA $F6                                   ; $1C809D |
  PHA                                       ; $1C809F |
  LDA $32                                   ; $1C80A0 |
  STA $F6                                   ; $1C80A2 |
  CMP #$0C                                  ; $1C80A4 |
  BNE code_1C80B2                           ; $1C80A6 |
  LDA $10                                   ; $1C80A8 |
  CMP #$01                                  ; $1C80AA |
  BEQ code_1C80B2                           ; $1C80AC |
  LDA #$00                                  ; $1C80AE |
  STA $F6                                   ; $1C80B0 |
code_1C80B2:
  JSR select_PRG_banks                      ; $1C80B2 |
  LDA $32                                   ; $1C80B5 |
  CMP #$01                                  ; $1C80B7 |
  BEQ code_1C80BF                           ; $1C80B9 |
  CMP #$09                                  ; $1C80BB |
  BNE code_1C80DB                           ; $1C80BD |
code_1C80BF:
  LDY {entity_type},x                       ; $1C80BF |
  LDA $A800,y                               ; $1C80C2 |
  BPL code_1C80DB                           ; $1C80C5 |
  JSR code_1FF2C4                           ; $1C80C7 |
  LDA $32                                   ; $1C80CA |
  CMP #$09                                  ; $1C80CC |
  BNE code_1C80D8                           ; $1C80CE |
  JSR code_1C8244                           ; $1C80D0 |
  LDY $10                                   ; $1C80D3 |
  JSR code_1FF2FE                           ; $1C80D5 |
code_1C80D8:
  JMP code_1C8225                           ; $1C80D8 |

code_1C80DB:
  LDY {entity_type},x                       ; $1C80DB |
  LDA $A800,y                               ; $1C80DE |
  AND #$7F                                  ; $1C80E1 |
  ORA $00                                   ; $1C80E3 |
  BEQ code_1C80D8                           ; $1C80E5 |
  LDA $32                                   ; $1C80E7 |
  CMP #$09                                  ; $1C80E9 |
  BNE code_1C80F3                           ; $1C80EB |
  JSR code_1C8244                           ; $1C80ED |
  LDY {entity_type},x                       ; $1C80F0 |
code_1C80F3:
  LDA $00                                   ; $1C80F3 |
  BEQ code_1C8113                           ; $1C80F5 |
  LDA $32                                   ; $1C80F7 |
  BNE code_1C810C                           ; $1C80F9 |
  LDA $A800,y                               ; $1C80FB |
  BEQ code_1C8113                           ; $1C80FE |
  LDA $5B                                   ; $1C8100 |
  CMP #$0E                                  ; $1C8102 |
  LDA #$01                                  ; $1C8104 |
  BCC code_1C8176                           ; $1C8106 |
  LDA #$03                                  ; $1C8108 |
  BNE code_1C8176                           ; $1C810A |
code_1C810C:
  LDA $A800,y                               ; $1C810C |
  AND #$7F                                  ; $1C810F |
  BNE code_1C8176                           ; $1C8111 |
code_1C8113:
  LDY $10                                   ; $1C8113 |
  LDA $32                                   ; $1C8115 |
  CMP #$01                                  ; $1C8117 |
  BEQ code_1C8164                           ; $1C8119 |
  CMP #$07                                  ; $1C811B |
  BEQ code_1C8161                           ; $1C811D |
  CMP #$08                                  ; $1C811F |
  BEQ code_1C8161                           ; $1C8121 |
  CMP #$04                                  ; $1C8123 |
  BEQ code_1C816A                           ; $1C8125 |
  LDA {entity_type},y                       ; $1C8127 |
  CMP #$79                                  ; $1C812A |
  BEQ code_1C8167                           ; $1C812C |
  LDA #$1E                                  ; $1C812E |
  JSR code_1FEC5D                           ; $1C8130 |
  JSR code_1FF2FE                           ; $1C8133 |
  LDA #$46                                  ; $1C8136 |
  STA {entity_type},y                       ; $1C8138 |
  LDA {entity_direction},y                  ; $1C813B |
  EOR #$03                                  ; $1C813E |
  ORA #$08                                  ; $1C8140 |
  STA {entity_direction},y                  ; $1C8142 |
  LDA #$00                                  ; $1C8145 |
  STA {x_speed_frac},y                      ; $1C8147 |
  STA {y_speed_frac},y                      ; $1C814A |
  LDA #$04                                  ; $1C814D |
  STA {x_speed},y                           ; $1C814F |
  STA {y_speed},y                           ; $1C8152 |
  LDA {animation_index},y                   ; $1C8155 |
  CMP #$A9                                  ; $1C8158 |
  BNE code_1C8161                           ; $1C815A |
  LDA #$A8                                  ; $1C815C |
  JSR code_1FEAE9                           ; $1C815E |
code_1C8161:
  JMP code_1C8225                           ; $1C8161 |

code_1C8164:
  JMP code_1C81FF                           ; $1C8164 |

code_1C8167:
  JMP code_1C821B                           ; $1C8167 |

code_1C816A:
  LDY $10                                   ; $1C816A |
  LDA {entity_type},y                       ; $1C816C |
  CMP #$72                                  ; $1C816F |
  BNE code_1C8161                           ; $1C8171 |
  JMP code_1C81FF                           ; $1C8173 |

code_1C8176:
  AND #$7F                                  ; $1C8176 |
  STA $11                                   ; $1C8178 |
  LDA {entity_flash_counter},x              ; $1C817A |
  BPL code_1C8181                           ; $1C817D |
  AND #$7F                                  ; $1C817F |
code_1C8181:
  BNE code_1C81E0                           ; $1C8181 |
  LDA {entity_flash_counter},x              ; $1C8183 |
  AND #$80                                  ; $1C8186 |
  LDA #$08                                  ; $1C8188 |
  STA {entity_flash_counter},x              ; $1C818A |
  CPX $56                                   ; $1C818D |
  BNE code_1C819F                           ; $1C818F |
  LDA $2F                                   ; $1C8191 |
  BPL code_1C819F                           ; $1C8193 |
  LDA {entity_flash_counter},x              ; $1C8195 |
  AND #$80                                  ; $1C8198 |
  ORA #$30                                  ; $1C819A |
  STA {entity_flash_counter},x              ; $1C819C |
code_1C819F:
  LDA #$2A                                  ; $1C819F |
  JSR code_1FEC5D                           ; $1C81A1 |
  LDA {entity_life},x                       ; $1C81A4 |
  STA $12                                   ; $1C81A7 |
  SEC                                       ; $1C81A9 |
  SBC $11                                   ; $1C81AA |
  STA {entity_life},x                       ; $1C81AC |
  BEQ code_1C81B3                           ; $1C81AF |
  BCS code_1C81E0                           ; $1C81B1 |
code_1C81B3:
  LDA #$00                                  ; $1C81B3 |
  STA {entity_life},x                       ; $1C81B5 |
  LDA $87C3,y                               ; $1C81B8 |
  BNE code_1C822C                           ; $1C81BB |
  LDA $32                                   ; $1C81BD |
  CMP #$07                                  ; $1C81BF |
  BNE code_1C81C6                           ; $1C81C1 |
  JMP code_1C8257                           ; $1C81C3 |

code_1C81C6:
  JSR code_1FF2C4                           ; $1C81C6 |
  LDA #$2B                                  ; $1C81C9 |
  JSR code_1FEC5D                           ; $1C81CB |
  LDA #$B8                                  ; $1C81CE |
  STA {entity_type},x                       ; $1C81D0 |
  LDA #$42                                  ; $1C81D3 |
  JSR code_1FEA98                           ; $1C81D5 |
  JSR reset_vertical_speed                  ; $1C81D8 |
  LDA #$00                                  ; $1C81DB |
  STA {entity_display_flags},x              ; $1C81DD |
code_1C81E0:
  LDY $10                                   ; $1C81E0 |
  LDA $32                                   ; $1C81E2 |
  CMP #$07                                  ; $1C81E4 |
  BEQ code_1C8225                           ; $1C81E6 |
  CMP #$08                                  ; $1C81E8 |
  BEQ code_1C8225                           ; $1C81EA |
  LDA {entity_type},y                       ; $1C81EC |
  CMP #$79                                  ; $1C81EF |
  BEQ code_1C8218                           ; $1C81F1 |
  LDA $5B                                   ; $1C81F3 |
  CMP #$0E                                  ; $1C81F5 |
  BNE code_1C81FF                           ; $1C81F7 |
  LDA $12                                   ; $1C81F9 |
  CMP #$04                                  ; $1C81FB |
  BCC code_1C8225                           ; $1C81FD |
code_1C81FF:
  LDA {entity_type},y                       ; $1C81FF |
  PHA                                       ; $1C8202 |
  JSR code_1FF2FE                           ; $1C8203 |
  PLA                                       ; $1C8206 |
  CMP #$72                                  ; $1C8207 |
  BNE code_1C8215                           ; $1C8209 |
  LDA #$C2                                  ; $1C820B |
  STA {entity_type},y                       ; $1C820D |
  LDA #$42                                  ; $1C8210 |
  JSR code_1FEAE9                           ; $1C8212 |
code_1C8215:
  JMP code_1C8225                           ; $1C8215 |

code_1C8218:
  JSR code_1C8288                           ; $1C8218 |
code_1C821B:
  LDA #$C8                                  ; $1C821B |
  STA {entity_handler_low},y                ; $1C821D |
  LDA #$B6                                  ; $1C8220 |
  STA {entity_handler_high},y               ; $1C8222 |
code_1C8225:
  PLA                                       ; $1C8225 |
  STA $F6                                   ; $1C8226 |
  JSR select_PRG_banks                      ; $1C8228 |
  RTS                                       ; $1C822B |

code_1C822C:
  PHA                                       ; $1C822C |
  LDA {entity_life},x                       ; $1C822D |
  PHA                                       ; $1C8230 |
  JSR code_1FF2C4                           ; $1C8231 |
  PLA                                       ; $1C8234 |
  STA {entity_life},x                       ; $1C8235 |
  PLA                                       ; $1C8238 |
  STA {entity_type},x                       ; $1C8239 |
  LDA #$00                                  ; $1C823C |
  STA {sprite_flags},x                      ; $1C823E |
  JMP code_1C81E0                           ; $1C8241 |

code_1C8244:
  LDY $10                                   ; $1C8244 |
  LDA {x_speed},y                           ; $1C8246 |
  BNE code_1C8256                           ; $1C8249 |
  LDA $B9                                   ; $1C824B |
  SEC                                       ; $1C824D |
  SBC #$03                                  ; $1C824E |
  BMI code_1C8254                           ; $1C8250 |
  LDA #$80                                  ; $1C8252 |
code_1C8254:
  STA $B9                                   ; $1C8254 |
code_1C8256:
  RTS                                       ; $1C8256 |

code_1C8257:
  LDA {entity_type},x                       ; $1C8257 |
  PHA                                       ; $1C825A |
  LDA $0438,x                               ; $1C825B |
  PHA                                       ; $1C825E |
  JSR code_1FF2C4                           ; $1C825F |
  PLA                                       ; $1C8262 |
  STA $0438,x                               ; $1C8263 |
  PLA                                       ; $1C8266 |
  TAY                                       ; $1C8267 |
  LDA #$14                                  ; $1C8268 |
  STA {entity_var_a},x                      ; $1C826A |
  LDA #$00                                  ; $1C826D |
  STA $EA1E,x                               ; $1C826F |
  STA {y_speed},x                           ; $1C8272 |
  STA {sprite_flags},x                      ; $1C8275 |
  LDA $E33B,y                               ; $1C8278 |
  SEC                                       ; $1C827B |
  SBC #$12                                  ; $1C827C |
  LSR                                       ; $1C827E |
  CLC                                       ; $1C827F |
  ADC #$C6                                  ; $1C8280 |
  STA {entity_type},x                       ; $1C8282 |
  JMP code_1C8225                           ; $1C8285 |

code_1C8288:
  LDA {entity_flash_counter},x              ; $1C8288 |
  BEQ code_1C8295                           ; $1C828B |
  CMP #$08                                  ; $1C828D |
  BEQ code_1C8295                           ; $1C828F |
  CMP #$30                                  ; $1C8291 |
  BNE code_1C82A4                           ; $1C8293 |
code_1C8295:
  LDA $BC                                   ; $1C8295 |
  AND #$7F                                  ; $1C8297 |
  SEC                                       ; $1C8299 |
  SBC #$02                                  ; $1C829A |
  BCS code_1C82A0                           ; $1C829C |
  LDA #$00                                  ; $1C829E |
code_1C82A0:
  ORA #$80                                  ; $1C82A0 |
  STA $BC                                   ; $1C82A2 |
code_1C82A4:
  RTS                                       ; $1C82A4 |

code_1C82A5:
  LDA $17                                   ; $1C82A5 |
  AND #$40                                  ; $1C82A7 |
  BNE code_1C82A4                           ; $1C82A9 |
  LDA $36                                   ; $1C82AB |
  CMP #$F0                                  ; $1C82AD |
  BEQ code_1C82B5                           ; $1C82AF |
  DEC $B0                                   ; $1C82B1 |
  BMI code_1C82E1                           ; $1C82B3 |
code_1C82B5:
  JMP code_1C8332                           ; $1C82B5 |

code_1C82B8:
  LDA {entity_flash_counter}                ; $1C82B8 |
  BNE code_1C8331                           ; $1C82BB |
  LDA $30                                   ; $1C82BD |
  CMP #$06                                  ; $1C82BF |
  BCS code_1C8331                           ; $1C82C1 |
code_1C82C3:
  JSR code_1C83FC                           ; $1C82C3 |
  BEQ code_1C8331                           ; $1C82C6 |
  LDA $17                                   ; $1C82C8 |
  AND #$40                                  ; $1C82CA |
  BNE code_1C8331                           ; $1C82CC |
  LDY {entity_type},x                       ; $1C82CE |
  LDA $B0                                   ; $1C82D1 |
  AND #$1F                                  ; $1C82D3 |
  SEC                                       ; $1C82D5 |
  SBC $85C3,y                               ; $1C82D6 |
  BEQ code_1C8332                           ; $1C82D9 |
  BCC code_1C8332                           ; $1C82DB |
  ORA #$80                                  ; $1C82DD |
  STA $B0                                   ; $1C82DF |
code_1C82E1:
  LDA #$04                                  ; $1C82E1 |
  LDY $30                                   ; $1C82E3 |
  CPY #$02                                  ; $1C82E5 |
  BEQ code_1C82F1                           ; $1C82E7 |
  LDA #$00                                  ; $1C82E9 |
  CPY #$04                                  ; $1C82EB |
  BEQ code_1C82F1                           ; $1C82ED |
  LDY #$00                                  ; $1C82EF |
code_1C82F1:
  STY {entity_var_c}                        ; $1C82F1 |
  STA {entity_var_d}                        ; $1C82F4 |
  LDX #$00                                  ; $1C82F7 |
  STX $54                                   ; $1C82F9 |
  STX $33                                   ; $1C82FB |
  STX $34                                   ; $1C82FD |
  STX $38                                   ; $1C82FF |
  LDA #$06                                  ; $1C8301 |
  STA $30                                   ; $1C8303 |
  LDA #$11                                  ; $1C8305 |
  CPY #$04                                  ; $1C8307 |
  BNE code_1C830D                           ; $1C8309 |
  LDA #$21                                  ; $1C830B |
code_1C830D:
  JSR code_1FEA98                           ; $1C830D |
  JSR reset_vertical_speed                  ; $1C8310 |
  JSR code_1FF3BF                           ; $1C8313 |
  LDA $0305                                 ; $1C8316 |
  BNE code_1C832A                           ; $1C8319 |
  LDA #$12                                  ; $1C831B |
  LDY #$05                                  ; $1C831D |
  JSR code_1FEAA4                           ; $1C831F |
  STX $040D                                 ; $1C8322 |
  LDA #$01                                  ; $1C8325 |
  STA $0305                                 ; $1C8327 |
code_1C832A:
  LDX $A6                                   ; $1C832A |
  LDA #$1C                                  ; $1C832C |
  JSR code_1FEC5D                           ; $1C832E |
code_1C8331:
  RTS                                       ; $1C8331 |

code_1C8332:
  LDA #$F0                                  ; $1C8332 |
  JSR code_1FEC5B                           ; $1C8334 |
  LDA #$1D                                  ; $1C8337 |
  JSR code_1FEC5D                           ; $1C8339 |
  LDA #$80                                  ; $1C833C |
  STA $B0                                   ; $1C833E |
  LDA #$00                                  ; $1C8340 |
  STA $54                                   ; $1C8342 |
  JSR code_1FF3BF                           ; $1C8344 |
  LDA {entity_display_flags}                ; $1C8347 |
  AND #$DF                                  ; $1C834A |
  ORA #$04                                  ; $1C834C |
  STA {entity_display_flags}                ; $1C834E |
  LDA #$07                                  ; $1C8351 |
  STA $30                                   ; $1C8353 |
  LDA #$2C                                  ; $1C8355 |
  STA {entity_var_a}                        ; $1C8357 |
  LDA #$01                                  ; $1C835A |
  STA {entity_var_b}                        ; $1C835C |
  LDA #$0F                                  ; $1C835F |
  STA $11                                   ; $1C8361 |
code_1C8363:
  LDY #$17                                  ; $1C8363 |
code_1C8365:
  LDA {entity_type},y                       ; $1C8365 |
  BEQ code_1C8371                           ; $1C8368 |
  DEY                                       ; $1C836A |
  CPY #$04                                  ; $1C836B |
  BNE code_1C8365                           ; $1C836D |
  BEQ code_1C83B9                           ; $1C836F |
code_1C8371:
  LDX #$00                                  ; $1C8371 |
  LDA #$19                                  ; $1C8373 |
  JSR code_1FEAA4                           ; $1C8375 |
  LDA #$80                                  ; $1C8378 |
  STA {entity_display_flags},y              ; $1C837A |
  LDA #$03                                  ; $1C837D |
  STA {entity_type},y                       ; $1C837F |
  LDA #$00                                  ; $1C8382 |
  STA {sprite_flags},y                      ; $1C8384 |
  STA {entity_var_a},y                      ; $1C8387 |
  STA {entity_var_b},y                      ; $1C838A |
  LDX $11                                   ; $1C838D |
  LDA $83BC,x                               ; $1C838F |
  STA {x_speed_frac},y                      ; $1C8392 |
  LDA $83CC,x                               ; $1C8395 |
  STA {x_speed},y                           ; $1C8398 |
  BPL code_1C83A2                           ; $1C839B |
  LDA #$FF                                  ; $1C839D |
  STA {entity_var_a},y                      ; $1C839F |
code_1C83A2:
  LDA $83DC,x                               ; $1C83A2 |
  STA {y_speed_frac},y                      ; $1C83A5 |
  LDA $83EC,x                               ; $1C83A8 |
  STA {y_speed},y                           ; $1C83AB |
  BPL code_1C83B5                           ; $1C83AE |
  LDA #$FF                                  ; $1C83B0 |
  STA {entity_var_b},y                      ; $1C83B2 |
code_1C83B5:
  DEC $11                                   ; $1C83B5 |
  BPL code_1C8363                           ; $1C83B7 |
code_1C83B9:
  LDX $A6                                   ; $1C83B9 |
  RTS                                       ; $1C83BB |

  db $00, $0F, $80, $0F, $00, $F1, $80, $F1 ; $1C83BC |
  db $00, $87, $C0, $87, $00, $79, $40, $79 ; $1C83C4 |
  db $00, $01, $01, $01, $00, $FE, $FE, $FE ; $1C83CC |
  db $00, $00, $00, $00, $00, $FF, $FF, $FF ; $1C83D4 |
  db $80, $F1, $00, $0F, $80, $0F, $00, $F1 ; $1C83DC |
  db $40, $79, $00, $87, $C0, $87, $00, $79 ; $1C83E4 |
  db $FE, $FE, $00, $01, $01, $01, $00, $FE ; $1C83EC |
  db $FF, $FF, $00, $00, $00, $00, $00, $FF ; $1C83F4 |

code_1C83FC:
  LDA {animation_index}                     ; $1C83FC |
  CMP #$B0                                  ; $1C83FF |
  BNE code_1C841F                           ; $1C8401 |
  LDA $F6                                   ; $1C8403 |
  PHA                                       ; $1C8405 |
  LDA $32                                   ; $1C8406 |
  STA $F6                                   ; $1C8408 |
  JSR select_PRG_banks                      ; $1C840A |
  LDY {entity_type},x                       ; $1C840D |
  LDA $A800,y                               ; $1C8410 |
  STA $10                                   ; $1C8413 |
  PLA                                       ; $1C8415 |
  STA $F6                                   ; $1C8416 |
  JSR select_PRG_banks                      ; $1C8418 |
  LDA $10                                   ; $1C841B |
  AND #$80                                  ; $1C841D |
code_1C841F:
  RTS                                       ; $1C841F |

  SEC                                       ; $1C8420 |
  LDA {entity_var_a},x                      ; $1C8421 |
  BMI code_1C8477                           ; $1C8424 |
  LDA $9D                                   ; $1C8426 |
  AND #$03                                  ; $1C8428 |
  BNE code_1C8476                           ; $1C842A |
  LDY #$13                                  ; $1C842C |
code_1C842E:
  CPY #$0C                                  ; $1C842E |
  BCC code_1C8445                           ; $1C8430 |
  LDA ($00),y                               ; $1C8432 |
  SEC                                       ; $1C8434 |
  SBC {entity_var_a},x                      ; $1C8435 |
  BCS code_1C843C                           ; $1C8438 |
  LDA #$0F                                  ; $1C843A |
code_1C843C:
  STA $060C,y                               ; $1C843C |
  STA $062C,y                               ; $1C843F |
  JMP code_1C8455                           ; $1C8442 |

code_1C8445:
  LDA ($00),y                               ; $1C8445 |
  SEC                                       ; $1C8447 |
  SBC {entity_var_a},x                      ; $1C8448 |
  BCS code_1C844F                           ; $1C844B |
  LDA #$0F                                  ; $1C844D |
code_1C844F:
  STA $0604,y                               ; $1C844F |
  STA $0624,y                               ; $1C8452 |
code_1C8455:
  DEY                                       ; $1C8455 |
  BPL code_1C842E                           ; $1C8456 |
  STY $18                                   ; $1C8458 |
  LDA {entity_var_a},x                      ; $1C845A |
  SEC                                       ; $1C845D |
  SBC #$10                                  ; $1C845E |
  STA {entity_var_a},x                      ; $1C8460 |
  BCS code_1C8476                           ; $1C8463 |
  LDY #$17                                  ; $1C8465 |
code_1C8467:
  LDA {entity_display_flags},y              ; $1C8467 |
  AND #$FB                                  ; $1C846A |
  STA {entity_display_flags},y              ; $1C846C |
  DEY                                       ; $1C846F |
  CPY #$07                                  ; $1C8470 |
  BNE code_1C8467                           ; $1C8472 |
  BEQ code_1C8477                           ; $1C8474 |
code_1C8476:
  RTS                                       ; $1C8476 |

code_1C8477:
  LDA #$00                                  ; $1C8477 |
  STA {animation_timer},x                   ; $1C8479 |
  LDA $2F                                   ; $1C847C |
  BNE code_1C8489                           ; $1C847E |
  STA {entity_life},x                       ; $1C8480 |
  LDA #$80                                  ; $1C8483 |
  STA $2F                                   ; $1C8485 |
  STX $56                                   ; $1C8487 |
code_1C8489:
  LDA $9D                                   ; $1C8489 |
  AND #$03                                  ; $1C848B |
  BNE code_1C84A4                           ; $1C848D |
  LDA #$26                                  ; $1C848F |
  JSR code_1FEC5D                           ; $1C8491 |
  INC {entity_life},x                       ; $1C8494 |
  LDA {entity_life},x                       ; $1C8497 |
  CMP #$1C                                  ; $1C849A |
  BNE code_1C84A4                           ; $1C849C |
  LDA #$00                                  ; $1C849E |
  STA $30                                   ; $1C84A0 |
  CLC                                       ; $1C84A2 |
  RTS                                       ; $1C84A3 |

code_1C84A4:
  SEC                                       ; $1C84A4 |
  RTS                                       ; $1C84A5 |

  SEC                                       ; $1C84A6 |
  LDA $30                                   ; $1C84A7 |
  BNE code_1C84BE                           ; $1C84A9 |
  LDA #$19                                  ; $1C84AB |
  STA $30                                   ; $1C84AD |
  LDA #$0A                                  ; $1C84AF |
  LDY {entity_type},x                       ; $1C84B1 |
  CPY #$AA                                  ; $1C84B4 |
  BNE code_1C84BA                           ; $1C84B6 |
  LDA #$16                                  ; $1C84B8 |
code_1C84BA:
  JSR code_1FEC5B                           ; $1C84BA |
  CLC                                       ; $1C84BD |
code_1C84BE:
  RTS                                       ; $1C84BE |

  LDA #$F0                                  ; $1C84BF |
  JSR code_1FEC5B                           ; $1C84C1 |
  STX $00                                   ; $1C84C4 |
  LDY #$17                                  ; $1C84C6 |
code_1C84C8:
  CPY $00                                   ; $1C84C8 |
  BEQ code_1C84CF                           ; $1C84CA |
  JSR code_1FF2FE                           ; $1C84CC |
code_1C84CF:
  DEY                                       ; $1C84CF |
  CPY #$07                                  ; $1C84D0 |
  BNE code_1C84C8                           ; $1C84D2 |
  RTS                                       ; $1C84D4 |

  STA $9D                                   ; $1C84D5 |
  STA $78                                   ; $1C84D7 |
  STA $79                                   ; $1C84D9 |
  STA $05F3                                 ; $1C84DB |
  STA $05D1                                 ; $1C84DE |
  STA $05D2                                 ; $1C84E1 |
  STA $05D0                                 ; $1C84E4 |
  LDA #$23                                  ; $1C84E7 |
  STA $7A                                   ; $1C84E9 |
  LDA #$00                                  ; $1C84EB |
  STA $7B                                   ; $1C84ED |
  LDA #$BF                                  ; $1C84EF |
  STA $9B                                   ; $1C84F1 |
  LDA #$05                                  ; $1C84F3 |
  STA $99                                   ; $1C84F5 |
  LDA #$02                                  ; $1C84F7 |
  STA $FD                                   ; $1C84F9 |
  RTS                                       ; $1C84FB |

code_1C84FC:
  LDA {entity_display_flags},x              ; $1C84FC |
  PHA                                       ; $1C84FF |
  JSR code_1FEA65                           ; $1C8500 |
  JSR code_1FEA86                           ; $1C8503 |
  PLA                                       ; $1C8506 |
  STA {entity_display_flags},x              ; $1C8507 |
  RTS                                       ; $1C850A |

code_1C850B:
  LDA {entity_direction},x                  ; $1C850B |
  PHA                                       ; $1C850E |
  JSR face_player                           ; $1C850F |
  JSR code_1FEC30                           ; $1C8512 |
  PLA                                       ; $1C8515 |
  STA {entity_direction},x                  ; $1C8516 |
  RTS                                       ; $1C8519 |

code_1C851A:
  LDA {entity_display_flags},x              ; $1C851A |
  PHA                                       ; $1C851D |
  JSR code_1FEA3F                           ; $1C851E |
  PLA                                       ; $1C8521 |
  STA {entity_display_flags},x              ; $1C8522 |
  RTS                                       ; $1C8525 |

code_1C8526:
  LDA {entity_display_flags},x              ; $1C8526 |
  AND #$DF                                  ; $1C8529 |
  STA {entity_display_flags},x              ; $1C852B |
  RTS                                       ; $1C852E |

code_1C852F:
  LDA {entity_direction},x                  ; $1C852F |
  EOR #$03                                  ; $1C8532 |
  STA {entity_direction},x                  ; $1C8534 |
  RTS                                       ; $1C8537 |

code_1C8538:
  LDA {entity_direction},x                  ; $1C8538 |
  EOR #$0C                                  ; $1C853B |
  STA {entity_direction},x                  ; $1C853D |
  RTS                                       ; $1C8540 |

  LDA {entity_display_flags},x              ; $1C8541 |
  PHA                                       ; $1C8544 |
  JSR code_1FEA65                           ; $1C8545 |
  PLA                                       ; $1C8548 |
  STA {entity_display_flags},x              ; $1C8549 |
  RTS                                       ; $1C854C |

; Sets speed values for the current entity such that it catapults into the air,
; roughly aiming at the target. It does this by picking a value from a table, depending on distance thresholds.
; Example usage: Bomb Thrown's bombs, Toss Machine's projectiles, Wave Man's jumps.
; Parameters:
; A - distance to target
; X - entity index
; Y - arc variant (0 - low, 1 - high)
catapult_aim_func:
  JSR distance_to_player                    ; $1C854D | Get distance to player. Some calls (i.e. Napalm Man's bombs) jump to after this instruction in order to provide their own distance value
catapult_aim_func_after_dist:
  PHA                                       ; $1C8550 | 
  LDA catapult_aim_func_yspeed_frac,y       ; $1C8551 | \
  STA {y_speed_frac},x                      ; $1C8554 | | Set entity's vertical speed according to the arc variant chosen.
  LDA catapult_aim_func_yspeed,y            ; $1C8557 | |
  STA {y_speed},x                           ; $1C855A | /
  TYA                                       ; $1C855D | \ 
  ASL                                       ; $1C855E | | Table has 4 horizontal speed values per arc variant, so multiply offset by 4
  ASL                                       ; $1C855F | |
  TAY                                       ; $1C8560 | /
  PLA                                       ; $1C8561 | \
  CMP #$80                                  ; $1C8562 | |
  BCS code_1C8571                           ; $1C8564 | |
  INY                                       ; $1C8566 | |
  CMP #$50                                  ; $1C8567 | | Sequence of distance checks. 
  BCS code_1C8571                           ; $1C8569 | | Increases offset into table for each distance greater than the given one.
  INY                                       ; $1C856B | |
  CMP #$20                                  ; $1C856C | |
  BCS code_1C8571                           ; $1C856E | |
  INY                                       ; $1C8570 | /
code_1C8571:
  LDA catapult_aim_func_xspeed_frac,y       ; $1C8571 | \
  STA {x_speed_frac},x                      ; $1C8574 | |
  LDA catapult_aim_func_xspeed,y            ; $1C8577 | | Set entity's horizontal speed according to the offset.
  STA {x_speed},x                           ; $1C857A | |
  RTS                                       ; $1C857D | /
  
catapult_aim_func_yspeed_frac:
  db $AB, $12                               ; $1C857E |
catapult_aim_func_yspeed:
  db $05, $07                               ; $1C8580 |
catapult_aim_func_xspeed_frac:
  db $50, $35, $53, $B5, $A6, $C4, $0F, $90 ; $1C8582 |
catapult_aim_func_xspeed:
  db $03, $02, $01, $00, $02, $01, $01, $00 ; $1C858A |

  LDA $85B7,y                               ; $1C8592 |
  STA {y_speed_frac},x                      ; $1C8595 |
  LDA $85BB,y                               ; $1C8598 |
  STA {y_speed},x                           ; $1C859B |
  LDA $85BF,y                               ; $1C859E |
  STA $03                                   ; $1C85A1 |
  LDA #$00                                  ; $1C85A3 |
  STA $00                                   ; $1C85A5 |
  STA $02                                   ; $1C85A7 |
  JSR code_1FF22D                           ; $1C85A9 |
  LDA $04                                   ; $1C85AC |
  STA {x_speed_frac},x                      ; $1C85AE |
  LDA $05                                   ; $1C85B1 |
  STA {x_speed},x                           ; $1C85B3 |
  RTS                                       ; $1C85B6 |

  db $AB, $7B, $E6, $12, $05, $07, $04, $07 ; $1C85B7 |
  db $2D, $3B, $27, $38, $00, $00, $00, $00 ; $1C85BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C85C7 |
  db $00, $00, $00, $00, $03, $03, $04, $05 ; $1C85CF |
  db $06, $03, $06, $03, $06, $05, $06, $04 ; $1C85D7 |
  db $04, $04, $00, $04, $08, $04, $00, $04 ; $1C85DF |
  db $00, $01, $04, $04, $04, $03, $06, $05 ; $1C85E7 |
  db $04, $08, $00, $00, $00, $07, $03, $06 ; $1C85EF |
  db $06, $04, $04, $02, $00, $03, $04, $04 ; $1C85F7 |
  db $03, $06, $05, $04, $1C, $00, $00, $04 ; $1C85FF |
  db $04, $00, $00, $06, $00, $00, $00, $00 ; $1C8607 |
  db $00, $00, $03, $0A, $04, $03, $03, $03 ; $1C860F |
  db $04, $03, $04, $00, $02, $08, $06, $03 ; $1C8617 |
  db $05, $07, $05, $04, $04, $04, $04, $05 ; $1C861F |
  db $02, $02, $03, $03, $02, $06, $04, $05 ; $1C8627 |
  db $04, $00, $05, $06, $01, $05, $00, $00 ; $1C862F |
  db $00, $00, $00, $00, $00, $00, $05, $02 ; $1C8637 |
  db $05, $00, $05, $05, $06, $05, $04, $05 ; $1C863F |
  db $03, $04, $05, $04, $03, $05, $05, $05 ; $1C8647 |
  db $05, $05, $04, $04, $05, $05, $05, $05 ; $1C864F |
  db $04, $00, $05, $04, $05, $06, $06, $02 ; $1C8657 |
  db $08, $06, $05, $02, $06, $06, $00, $00 ; $1C865F |
  db $00, $06, $00, $05, $03, $00, $03, $06 ; $1C8667 |
  db $00, $00, $00, $00, $00, $05, $06, $00 ; $1C866F |
  db $00, $00, $00, $00, $00, $00, $00, $06 ; $1C8677 |
  db $04, $06, $06, $00, $00, $00, $00, $00 ; $1C867F |
  db $03, $00, $00, $00, $00, $00, $00, $00 ; $1C8687 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C868F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C8697 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C869F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C86A7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C86AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C86B7 |
  db $00, $00, $00, $00, $1D, $1D, $1D, $1D ; $1C86BF |
  db $0A, $0A, $05, $05, $05, $05, $0A, $05 ; $1C86C7 |
  db $05, $05, $05, $05, $1D, $1D, $1D, $1D ; $1C86CF |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C86D7 |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C86DF |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C86E7 |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C86EF |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C86F7 |
  db $1D, $1D, $1D, $1D, $0A, $05, $05, $03 ; $1C86FF |
  db $03, $1D, $1D, $04, $05, $1D, $05, $05 ; $1C8707 |
  db $1D, $1D, $1D, $02, $1D, $1D, $1D, $1D ; $1C870F |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C8717 |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C871F |
  db $1D, $1D, $1D, $1D, $1D, $06, $06, $06 ; $1C8727 |
  db $06, $1D, $06, $06, $1D, $1D, $1D, $1D ; $1C872F |
  db $1D, $1D, $1D, $1D, $1D, $1D, $02, $02 ; $1C8737 |
  db $02, $02, $02, $1D, $06, $07, $07, $07 ; $1C873F |
  db $07, $07, $07, $07, $07, $08, $08, $08 ; $1C8747 |
  db $1D, $08, $08, $08, $08, $09, $09, $09 ; $1C874F |
  db $09, $09, $09, $09, $09, $09, $09, $1D ; $1C8757 |
  db $1D, $1D, $1D, $1D, $02, $02, $03, $03 ; $1C875F |
  db $03, $04, $04, $04, $04, $04, $04, $04 ; $1C8767 |
  db $0A, $0A, $0A, $03, $03, $1D, $04, $0A ; $1C876F |
  db $0A, $03, $1D, $1D, $1D, $0D, $0D, $07 ; $1C8777 |
  db $1D, $1D, $1D, $1D, $0A, $0D, $1D, $1D ; $1C877F |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C8787 |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C878F |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C8797 |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C879F |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C87A7 |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C87AF |
  db $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D ; $1C87B7 |
  db $1D, $1D, $1D, $1D, $00, $00, $00, $00 ; $1C87BF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C87C7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C87CF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C87D7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C87DF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C87E7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C87EF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C87F7 |
  db $00, $00, $00, $00, $01, $00, $00, $00 ; $1C87FF |
  db $AE, $00, $00, $00, $00, $00, $00, $00 ; $1C8807 |
  db $00, $00, $00, $AD, $00, $00, $00, $00 ; $1C880F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C8817 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C881F |
  db $00, $00, $00, $00, $00, $B4, $00, $B4 ; $1C8827 |
  db $00, $00, $B4, $00, $00, $00, $00, $00 ; $1C882F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C8837 |
  db $AD, $00, $00, $00, $00, $B4, $00, $B4 ; $1C883F |
  db $00, $00, $B4, $00, $00, $B4, $00, $00 ; $1C8847 |
  db $00, $B4, $00, $00, $00, $B4, $00, $B4 ; $1C884F |
  db $00, $00, $B4, $00, $B4, $00, $00, $00 ; $1C8857 |
  db $00, $00, $00, $00, $AC, $00, $00, $00 ; $1C885F |
  db $00, $A9, $00, $00, $00, $00, $C0, $00 ; $1C8867 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C886F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C8877 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C887F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C8887 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C888F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C8897 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C889F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C88A7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C88AF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C88B7 |
  db $00, $00, $00, $00, $63, $63, $3F, $33 ; $1C88BF |
  db $76, $9F, $00, $00, $35, $70, $08, $E3 ; $1C88C7 |
  db $90, $16, $EA, $7C, $65, $12, $1B, $E5 ; $1C88CF |
  db $57, $FB, $D6, $5D, $3D, $A0, $11, $61 ; $1C88D7 |
  db $BC, $32, $63, $FA, $64, $3E, $C2, $A8 ; $1C88DF |
  db $7D, $BB, $BE, $3F, $75, $F9, $61, $50 ; $1C88E7 |
  db $E2, $13, $49, $66, $BA, $08, $80, $DB ; $1C88EF |
  db $D0, $59, $C2, $E2, $9E, $3F, $F6, $00 ; $1C88F7 |
  db $BC, $E6, $DB, $B2, $E4, $14, $AC, $49 ; $1C88FF |
  db $CF, $39, $72, $38, $1F, $76, $3D, $FE ; $1C8907 |
  db $7D, $3B, $72, $00, $B8, $BC, $4A, $B9 ; $1C890F |
  db $1F, $BC, $7A, $CC, $E2, $E0, $98, $4A ; $1C8917 |
  db $8A, $79, $0A, $8C, $DA, $BC, $BD, $0A ; $1C891F |
  db $0F, $E2, $65, $13, $25, $00, $92, $F8 ; $1C8927 |
  db $C5, $63, $55, $D3, $66, $63, $5F, $B4 ; $1C892F |
  db $4B, $81, $E8, $0E, $79, $C8, $16, $14 ; $1C8937 |
  db $91, $39, $33, $72, $20, $00, $8A, $90 ; $1C893F |
  db $34, $8A, $5B, $95, $98, $00, $8D, $AA ; $1C8947 |
  db $66, $CE, $5F, $AE, $AF, $5C, $ED, $2F ; $1C894F |
  db $CE, $D4, $EB, $CE, $05, $45, $5F, $E2 ; $1C8957 |
  db $7F, $BC, $FE, $BC, $1A, $AA, $00, $6C ; $1C895F |
  db $DF, $00, $6A, $AA, $D9, $3A, $25, $FA ; $1C8967 |
  db $00, $53, $F4, $1D, $A3, $3B, $84, $B3 ; $1C896F |
  db $29, $00, $ED, $59, $59, $00, $9C, $98 ; $1C8977 |
  db $66, $DB, $D0, $F3, $F8, $5D, $66, $ED ; $1C897F |
  db $A4, $F7, $19, $19, $19, $64, $64, $64 ; $1C8987 |
  db $64, $64, $64, $64, $8A, $8A, $B1, $B8 ; $1C898F |
  db $A6, $A6, $A0, $A0, $A0, $A0, $A4, $A0 ; $1C8997 |
  db $A1, $A2, $A2, $A3, $8A, $8B, $90, $8D ; $1C899F |
  db $8E, $90, $96, $8F, $A4, $8F, $90, $8B ; $1C89A7 |
  db $8C, $A8, $8A, $90, $92, $93, $AC, $95 ; $1C89AF |
  db $97, $97, $A7, $AB, $98, $98, $8E, $99 ; $1C89B7 |
  db $8D, $8F, $96, $90, $90, $9C, $9C, $9D ; $1C89BF |
  db $9E, $9D, $8C, $8D, $91, $92, $97, $A0 ; $1C89C7 |
  db $8C, $A1, $9D, $A0, $A4, $A4, $A4, $A6 ; $1C89CF |
  db $A4, $B2, $B4, $A5, $A5, $B8, $A5, $A5 ; $1C89D7 |
  db $BA, $BA, $B4, $A0, $A0, $8C, $A6, $A2 ; $1C89DF |
  db $A3, $8C, $A3, $AD, $8D, $A9, $A4, $A5 ; $1C89E7 |
  db $9C, $A5, $9F, $A6, $A6, $8C, $AA, $A9 ; $1C89EF |
  db $AC, $8D, $A9, $AB, $AB, $A0, $A1, $A1 ; $1C89F7 |
  db $A3, $8A, $A4, $A5, $AF, $8A, $B3, $B3 ; $1C89FF |
  db $B4, $B4, $B4, $B6, $B6, $B6, $A1, $A2 ; $1C8A07 |
  db $A2, $A5, $A5, $B4, $A6, $A0, $A2, $A2 ; $1C8A0F |
  db $A4, $A2, $A4, $A5, $A5, $A0, $A1, $A1 ; $1C8A17 |
  db $90, $A1, $A3, $A3, $A3, $A0, $A0, $A1 ; $1C8A1F |
  db $A2, $A2, $A2, $A2, $A4, $A5, $A6, $8D ; $1C8A27 |
  db $94, $8C, $99, $8C, $A6, $A7, $A0, $A2 ; $1C8A2F |
  db $A2, $A0, $A1, $A1, $A1, $A2, $A3, $A4 ; $1C8A37 |
  db $A0, $A0, $A0, $A4, $A4, $BB, $A5, $A2 ; $1C8A3F |
  db $A1, $A0, $AD, $AE, $AE, $A0, $A0, $A5 ; $1C8A47 |
  db $90, $9D, $9E, $9B, $A1, $A2, $90, $AD ; $1C8A4F |
  db $A1, $B0, $B1, $B1, $B1, $8A, $8A, $8A ; $1C8A57 |
  db $8A, $8A, $8A, $8A                     ; $1C8A5F |

  RTS                                       ; $1C8A63 |

  RTS                                       ; $1C8A64 |

  JSR code_1FF16F                           ; $1C8A65 |
  LDA #$11                                  ; $1C8A68 |
  STA {entity_type},y                       ; $1C8A6A |
  LDA #$C1                                  ; $1C8A6D |
  STA {sprite_flags},y                      ; $1C8A6F |
  LDA #$03                                  ; $1C8A72 |
  STA {entity_life},y                       ; $1C8A74 |
  LDA #$47                                  ; $1C8A77 |
  JSR code_1FEAA4                           ; $1C8A79 |
  LDA {entity_display_flags},y              ; $1C8A7C |
  ORA #$08                                  ; $1C8A7F |
  STA {entity_display_flags},y              ; $1C8A81 |
  LDA {y_position_low},y                    ; $1C8A84 |
  SEC                                       ; $1C8A87 |
  SBC #$18                                  ; $1C8A88 |
  STA {y_position_low},y                    ; $1C8A8A |
  LDA #$00                                  ; $1C8A8D |
  STA {y_speed_frac},y                      ; $1C8A8F |
  LDA #$02                                  ; $1C8A92 |
  STA {y_speed},y                           ; $1C8A94 |
  LDA #$6A                                  ; $1C8A97 |
  STA {x_speed_frac},y                      ; $1C8A99 |
  LDA #$01                                  ; $1C8A9C |
  STA {x_speed},y                           ; $1C8A9E |
  TXA                                       ; $1C8AA1 |
  STA {entity_var_a},y                      ; $1C8AA2 |
  TYA                                       ; $1C8AA5 |
  STA {entity_var_a},x                      ; $1C8AA6 |
  LDA #$08                                  ; $1C8AA9 |
  STA {entity_direction},y                  ; $1C8AAB |
  LDA #$14                                  ; $1C8AAE |
  STA {entity_var_b},y                      ; $1C8AB0 |
  LDA #$C2                                  ; $1C8AB3 |
  STA {entity_handler_low},x                ; $1C8AB5 |
  LDA #$8A                                  ; $1C8AB8 |
  STA {entity_handler_high},x               ; $1C8ABA |
  LDA #$3C                                  ; $1C8ABD |
  STA {entity_var_b},x                      ; $1C8ABF |
  LDY {entity_var_a},x                      ; $1C8AC2 |
  LDA {entity_type},y                       ; $1C8AC5 |
  CMP #$11                                  ; $1C8AC8 |
  BEQ code_1C8ACF                           ; $1C8ACA |
  JMP $A54D                                 ; $1C8ACC |

code_1C8ACF:
  JSR code_1FEA65                           ; $1C8ACF |
  DEC {entity_var_b},x                      ; $1C8AD2 |
  BNE code_1C8ADF                           ; $1C8AD5 |
  LDA #$3C                                  ; $1C8AD7 |
  STA {entity_var_b},x                      ; $1C8AD9 |
  JSR code_1FEC4A                           ; $1C8ADC |
code_1C8ADF:
  JSR code_1FEFF8                           ; $1C8ADF |
  BCS code_1C8B11                           ; $1C8AE2 |
  LDA #$40                                  ; $1C8AE4 |
  STA $00                                   ; $1C8AE6 |
  LDA {entity_direction},x                  ; $1C8AE8 |
  PHA                                       ; $1C8AEB |
  LDA {entity_var_a},x                      ; $1C8AEC |
  PHA                                       ; $1C8AEF |
  JSR code_1C809D                           ; $1C8AF0 |
  PLA                                       ; $1C8AF3 |
  TAY                                       ; $1C8AF4 |
  PLA                                       ; $1C8AF5 |
  STA $00                                   ; $1C8AF6 |
  LDA {entity_type},x                       ; $1C8AF8 |
  CMP #$10                                  ; $1C8AFB |
  BEQ code_1C8B11                           ; $1C8AFD |
  LDA $00                                   ; $1C8AFF |
  STA {entity_direction},y                  ; $1C8B01 |
  LDA #$42                                  ; $1C8B04 |
  STA {entity_handler_low},y                ; $1C8B06 |
  LDA #$8B                                  ; $1C8B09 |
  STA {entity_handler_high},y               ; $1C8B0B |
  JSR code_1FEA34                           ; $1C8B0E |
code_1C8B11:
  RTS                                       ; $1C8B11 |

  LDY {entity_var_a},x                      ; $1C8B12 |
  LDA {entity_display_flags},y              ; $1C8B15 |
  AND #$20                                  ; $1C8B18 |
  STA $00                                   ; $1C8B1A |
  LDA {entity_display_flags},x              ; $1C8B1C |
  AND #$DF                                  ; $1C8B1F |
  ORA $00                                   ; $1C8B21 |
  STA {entity_display_flags},x              ; $1C8B23 |
  LDA {x_position_low},y                    ; $1C8B26 |
  STA {x_position_low},x                    ; $1C8B29 |
  LDA {x_position_high},y                   ; $1C8B2C |
  STA {x_position_high},x                   ; $1C8B2F |
  DEC {entity_var_b},x                      ; $1C8B32 |
  BNE code_1C8B3F                           ; $1C8B35 |
  LDA #$14                                  ; $1C8B37 |
  STA {entity_var_b},x                      ; $1C8B39 |
  JSR code_1C8538                           ; $1C8B3C |
code_1C8B3F:
  JMP code_1FEA86                           ; $1C8B3F |

  LDY #$07                                  ; $1C8B42 |
  JSR code_1FE7B7                           ; $1C8B44 |
  BCC code_1C8B53                           ; $1C8B47 |
  LDA #$A8                                  ; $1C8B49 |
  STA {y_speed_frac},x                      ; $1C8B4B |
  LDA #$05                                  ; $1C8B4E |
  STA {y_speed},x                           ; $1C8B50 |
code_1C8B53:
  LDY #$0E                                  ; $1C8B53 |
  JSR code_1FEA3F                           ; $1C8B55 |
  BCC code_1C8B60                           ; $1C8B58 |
  JSR code_1FEC4A                           ; $1C8B5A |
  JSR reset_vertical_speed                  ; $1C8B5D |
code_1C8B60:
  RTS                                       ; $1C8B60 |

  LDA #$00                                  ; $1C8B61 |
  STA {animation_timer},x                   ; $1C8B63 |
  LDA {entity_var_a},x                      ; $1C8B66 |
  BEQ code_1C8B70                           ; $1C8B69 |
  DEC {entity_var_a},x                      ; $1C8B6B |
  BNE code_1C8B60                           ; $1C8B6E |
code_1C8B70:
  JSR distance_to_player                    ; $1C8B70 |
  CMP #$50                                  ; $1C8B73 |
  BCS code_1C8B60                           ; $1C8B75 |
  JSR vertical_distance_to_player           ; $1C8B77 |
  CMP #$20                                  ; $1C8B7A |
  BCS code_1C8B60                           ; $1C8B7C |
  LDA #$8D                                  ; $1C8B7E |
  STA {entity_handler_low},x                ; $1C8B80 |
  LDA #$8B                                  ; $1C8B83 |
  STA {entity_handler_high},x               ; $1C8B85 |
  LDA #$D3                                  ; $1C8B88 |
  STA {sprite_flags},x                      ; $1C8B8A |
  LDA {animation_timer},x                   ; $1C8B8D |
  CMP #$08                                  ; $1C8B90 |
  BNE code_1C8C0C                           ; $1C8B92 |
  LDA {animation_frame},x                   ; $1C8B94 |
  CMP #$02                                  ; $1C8B97 |
  BEQ code_1C8BA8                           ; $1C8B99 |
  INC {sprite_flags},x                      ; $1C8B9B |
  LDA {y_position_low},x                    ; $1C8B9E |
  SEC                                       ; $1C8BA1 |
  SBC #$04                                  ; $1C8BA2 |
  STA {y_position_low},x                    ; $1C8BA4 |
  RTS                                       ; $1C8BA7 |

code_1C8BA8:
  LDA #$B7                                  ; $1C8BA8 |
  STA {entity_handler_low},x                ; $1C8BAA |
  LDA #$8B                                  ; $1C8BAD |
  STA {entity_handler_high},x               ; $1C8BAF |
  LDA #$45                                  ; $1C8BB2 |
  JSR code_1FEA98                           ; $1C8BB4 |
  LDA {entity_direction},x                  ; $1C8BB7 |
  STA $01                                   ; $1C8BBA |
  JSR face_player                           ; $1C8BBC |
  LDY {entity_direction},x                  ; $1C8BBF |
  LDA $01                                   ; $1C8BC2 |
  STA {entity_direction},x                  ; $1C8BC4 |
  CPY $01                                   ; $1C8BC7 |
  BEQ code_1C8C0D                           ; $1C8BC9 |
  LDA #$ED                                  ; $1C8BCB |
  STA {entity_handler_low},x                ; $1C8BCD |
  LDA #$8B                                  ; $1C8BD0 |
  STA {entity_handler_high},x               ; $1C8BD2 |
  LDA #$44                                  ; $1C8BD5 |
  CMP {animation_index},x                   ; $1C8BD7 |
  BEQ code_1C8BED                           ; $1C8BDA |
  JSR code_1FEA98                           ; $1C8BDC |
  LDA #$94                                  ; $1C8BDF |
  STA {sprite_flags},x                      ; $1C8BE1 |
  LDA {y_position_low},x                    ; $1C8BE4 |
  CLC                                       ; $1C8BE7 |
  ADC #$04                                  ; $1C8BE8 |
  STA {y_position_low},x                    ; $1C8BEA |
code_1C8BED:
  LDA {animation_timer},x                   ; $1C8BED |
  CMP #$08                                  ; $1C8BF0 |
  BNE code_1C8C0C                           ; $1C8BF2 |
  LDA {animation_frame},x                   ; $1C8BF4 |
  CMP #$03                                  ; $1C8BF7 |
  BEQ code_1C8C02                           ; $1C8BF9 |
  CMP #$01                                  ; $1C8BFB |
  BNE code_1C8C0C                           ; $1C8BFD |
  JMP code_1FEC4A                           ; $1C8BFF |

code_1C8C02:
  LDA #$B7                                  ; $1C8C02 |
  STA {entity_handler_low},x                ; $1C8C04 |
  LDA #$8B                                  ; $1C8C07 |
  STA {entity_handler_high},x               ; $1C8C09 |
code_1C8C0C:
  RTS                                       ; $1C8C0C |

code_1C8C0D:
  LDA #$45                                  ; $1C8C0D |
  CMP {animation_index},x                   ; $1C8C0F |
  BEQ code_1C8C25                           ; $1C8C12 |
  JSR code_1FEA98                           ; $1C8C14 |
  LDA #$D5                                  ; $1C8C17 |
  STA {sprite_flags},x                      ; $1C8C19 |
  LDA {y_position_low},x                    ; $1C8C1C |
  SEC                                       ; $1C8C1F |
  SBC #$04                                  ; $1C8C20 |
  STA {y_position_low},x                    ; $1C8C22 |
code_1C8C25:
  LDA #$00                                  ; $1C8C25 |
  STA {animation_timer},x                   ; $1C8C27 |
  LDY {entity_var_b},x                      ; $1C8C2A |
  LDA {entity_type},y                       ; $1C8C2D |
  CMP #$1C                                  ; $1C8C30 |
  BEQ code_1C8C0C                           ; $1C8C32 |
  LDA #$3E                                  ; $1C8C34 |
  STA {entity_handler_low},x                ; $1C8C36 |
  LDA #$8C                                  ; $1C8C39 |
  STA {entity_handler_high},x               ; $1C8C3B |
  LDA {animation_timer},x                   ; $1C8C3E |
  CMP #$04                                  ; $1C8C41 |
  BNE code_1C8CAF                           ; $1C8C43 |
  LDA {animation_frame},x                   ; $1C8C45 |
  TAY                                       ; $1C8C48 |
  LDA {y_position_low},x                    ; $1C8C49 |
  CLC                                       ; $1C8C4C |
  ADC $8CB0,y                               ; $1C8C4D |
  STA {y_position_low},x                    ; $1C8C50 |
  LDA $8CB6,y                               ; $1C8C53 |
  STA {sprite_flags},x                      ; $1C8C56 |
  CPY #$05                                  ; $1C8C59 |
  BEQ code_1C8C9B                           ; $1C8C5B |
  CPY #$03                                  ; $1C8C5D |
  BNE code_1C8CAF                           ; $1C8C5F |
  LDA #$3C                                  ; $1C8C61 |
  JSR code_1FEC5D                           ; $1C8C63 |
  JSR code_1FF16F                           ; $1C8C66 |
  BCS code_1C8CAF                           ; $1C8C69 |
  LDA #$1C                                  ; $1C8C6B |
  STA {entity_type},y                       ; $1C8C6D |
  LDA #$C1                                  ; $1C8C70 |
  STA {sprite_flags},y                      ; $1C8C72 |
  LDA #$01                                  ; $1C8C75 |
  STA {entity_life},y                       ; $1C8C77 |
  LDA {entity_direction},x                  ; $1C8C7A |
  STA {entity_direction},y                  ; $1C8C7D |
  AND #$01                                  ; $1C8C80 |
  CLC                                       ; $1C8C82 |
  ADC #$02                                  ; $1C8C83 |
  STA $10                                   ; $1C8C85 |
  LDA #$46                                  ; $1C8C87 |
  JSR code_1FEAF5                           ; $1C8C89 |
  LDA #$00                                  ; $1C8C8C |
  STA {x_speed_frac},y                      ; $1C8C8E |
  LDA #$02                                  ; $1C8C91 |
  STA {x_speed},y                           ; $1C8C93 |
  TYA                                       ; $1C8C96 |
  STA {entity_var_b},x                      ; $1C8C97 |
  RTS                                       ; $1C8C9A |

code_1C8C9B:
  LDA #$43                                  ; $1C8C9B |
  JSR code_1FEA98                           ; $1C8C9D |
  LDA #$61                                  ; $1C8CA0 |
  STA {entity_handler_low},x                ; $1C8CA2 |
  LDA #$8B                                  ; $1C8CA5 |
  STA {entity_handler_high},x               ; $1C8CA7 |
  LDA #$3C                                  ; $1C8CAA |
  STA {entity_var_a},x                      ; $1C8CAC |
code_1C8CAF:
  RTS                                       ; $1C8CAF |

  db $00, $04, $F8, $00, $08, $04, $D5, $D4 ; $1C8CB0 |
  db $D8, $D8, $D4, $93                     ; $1C8CB8 |

  JSR code_1FEA65                           ; $1C8CBC |
  JMP code_1FEA86                           ; $1C8CBF |

  JSR code_1C8DCA                           ; $1C8CC2 |
  JSR face_player                           ; $1C8CC5 |
  JSR code_1FEC30                           ; $1C8CC8 |
  JSR distance_to_player                    ; $1C8CCB |
  CMP #$60                                  ; $1C8CCE |
  BCS code_1C8CD9                           ; $1C8CD0 |
  JSR vertical_distance_to_player           ; $1C8CD2 |
  CMP #$20                                  ; $1C8CD5 |
  BCC code_1C8CDE                           ; $1C8CD7 |
code_1C8CD9:
  LDA #$3C                                  ; $1C8CD9 |
  STA {entity_var_b},x                      ; $1C8CDB |
code_1C8CDE:
  DEC {entity_var_b},x                      ; $1C8CDE |
  BEQ code_1C8D0A                           ; $1C8CE1 |
  LDA {entity_display_flags}                ; $1C8CE3 |
  AND #$40                                  ; $1C8CE6 |
  CMP {entity_var_a},x                      ; $1C8CE8 |
  BEQ code_1C8D09                           ; $1C8CEB |
  LDA #$71                                  ; $1C8CED |
  STA {entity_handler_low},x                ; $1C8CEF |
  LDA #$8D                                  ; $1C8CF2 |
  STA {entity_handler_high},x               ; $1C8CF4 |
  LDA #$0D                                  ; $1C8CF7 |
  JSR code_1FEA98                           ; $1C8CF9 |
  LDA {entity_display_flags},x              ; $1C8CFC |
  AND #$40                                  ; $1C8CFF |
  BEQ code_1C8D06                           ; $1C8D01 |
  JMP reset_vertical_speed                  ; $1C8D03 |

code_1C8D06:
  JSR code_1FEA29                           ; $1C8D06 |
code_1C8D09:
  RTS                                       ; $1C8D09 |

code_1C8D0A:
  LDA #$0C                                  ; $1C8D0A |
  JSR code_1FEA98                           ; $1C8D0C |
  LDA #$19                                  ; $1C8D0F |
  STA {entity_handler_low},x                ; $1C8D11 |
  LDA #$8D                                  ; $1C8D14 |
  STA {entity_handler_high},x               ; $1C8D16 |
  LDA {animation_timer},x                   ; $1C8D19 |
  CMP #$04                                  ; $1C8D1C |
  BNE code_1C8D70                           ; $1C8D1E |
  LDA {animation_frame},x                   ; $1C8D20 |
  BEQ code_1C8D39                           ; $1C8D23 |
  LDA #$C5                                  ; $1C8D25 |
  STA {entity_handler_low},x                ; $1C8D27 |
  LDA #$8C                                  ; $1C8D2A |
  STA {entity_handler_high},x               ; $1C8D2C |
  LDA #$3C                                  ; $1C8D2F |
  STA {entity_var_b},x                      ; $1C8D31 |
  LDA #$0A                                  ; $1C8D34 |
  JMP code_1FEA98                           ; $1C8D36 |

code_1C8D39:
  LDA #$01                                  ; $1C8D39 |
  STA $0E                                   ; $1C8D3B |
code_1C8D3D:
  JSR code_1FF16F                           ; $1C8D3D |
  BCS code_1C8D70                           ; $1C8D40 |
  LDA #$58                                  ; $1C8D42 |
  STA {entity_type},y                       ; $1C8D44 |
  LDA #$87                                  ; $1C8D47 |
  STA {sprite_flags},y                      ; $1C8D49 |
  LDA $0E                                   ; $1C8D4C |
  PHA                                       ; $1C8D4E |
  CLC                                       ; $1C8D4F |
  ADC #$13                                  ; $1C8D50 |
  STA $10                                   ; $1C8D52 |
  LDA #$0E                                  ; $1C8D54 |
  JSR code_1FEAF5                           ; $1C8D56 |
  PLA                                       ; $1C8D59 |
  CLC                                       ; $1C8D5A |
  ADC #$01                                  ; $1C8D5B |
  EOR #$03                                  ; $1C8D5D |
  STA {entity_direction},y                  ; $1C8D5F |
  LDA #$00                                  ; $1C8D62 |
  STA {x_speed_frac},y                      ; $1C8D64 |
  LDA #$02                                  ; $1C8D67 |
  STA {x_speed},y                           ; $1C8D69 |
  DEC $0E                                   ; $1C8D6C |
  BPL code_1C8D3D                           ; $1C8D6E |
code_1C8D70:
  RTS                                       ; $1C8D70 |

  LDA {animation_timer},x                   ; $1C8D71 |
  CMP #$08                                  ; $1C8D74 |
  BNE code_1C8D97                           ; $1C8D76 |
  LDA {animation_frame},x                   ; $1C8D78 |
  BEQ code_1C8D8F                           ; $1C8D7B |
  LDA #$0A                                  ; $1C8D7D |
  JSR code_1FEA98                           ; $1C8D7F |
  LDA #$97                                  ; $1C8D82 |
  STA {entity_handler_low},x                ; $1C8D84 |
  LDA #$8D                                  ; $1C8D87 |
  STA {entity_handler_high},x               ; $1C8D89 |
  JMP code_1C8D97                           ; $1C8D8C |

code_1C8D8F:
  LDA {entity_display_flags},x              ; $1C8D8F |
  EOR #$40                                  ; $1C8D92 |
  STA {entity_display_flags},x              ; $1C8D94 |
code_1C8D97:
  LDA {y_speed},x                           ; $1C8D97 |
  BPL code_1C8DA4                           ; $1C8D9A |
  LDY #$21                                  ; $1C8D9C |
  JSR code_1FE7B7                           ; $1C8D9E |
  BCS code_1C8DB1                           ; $1C8DA1 |
  RTS                                       ; $1C8DA3 |

code_1C8DA4:
  JSR apply_gravity_upwards                 ; $1C8DA4 |
  JSR apply_vertical_speed_up               ; $1C8DA7 |
  LDY #$22                                  ; $1C8DAA |
  JSR code_1FE7A8                           ; $1C8DAC |
  BCC code_1C8DE1                           ; $1C8DAF |
code_1C8DB1:
  LDA #$C0                                  ; $1C8DB1 |
  STA {entity_handler_low},x                ; $1C8DB3 |
  LDA #$8D                                  ; $1C8DB6 |
  STA {entity_handler_high},x               ; $1C8DB8 |
  LDA #$0B                                  ; $1C8DBB |
  JSR code_1FEA98                           ; $1C8DBD |
  LDA {animation_frame},x                   ; $1C8DC0 |
  BEQ code_1C8DE1                           ; $1C8DC3 |
  LDA #$0A                                  ; $1C8DC5 |
  JSR code_1FEA98                           ; $1C8DC7 |
code_1C8DCA:
  LDA {entity_display_flags}                ; $1C8DCA |
  AND #$40                                  ; $1C8DCD |
  STA {entity_var_a},x                      ; $1C8DCF |
  LDA #$C5                                  ; $1C8DD2 |
  STA {entity_handler_low},x                ; $1C8DD4 |
  LDA #$8C                                  ; $1C8DD7 |
  STA {entity_handler_high},x               ; $1C8DD9 |
  LDA #$3C                                  ; $1C8DDC |
  STA {entity_var_b},x                      ; $1C8DDE |
code_1C8DE1:
  RTS                                       ; $1C8DE1 |

  JMP code_1FEA65                           ; $1C8DE2 |

  JSR code_1FEA65                           ; $1C8DE5 |
  JSR distance_to_player                    ; $1C8DE8 |
  CMP #$08                                  ; $1C8DEB |
  BCS code_1C8E56                           ; $1C8DED |
  LDA #$28                                  ; $1C8DEF |
  JSR code_1FEA98                           ; $1C8DF1 |
  LDA #$FE                                  ; $1C8DF4 |
  STA {entity_handler_low},x                ; $1C8DF6 |
  LDA #$8D                                  ; $1C8DF9 |
  STA {entity_handler_high},x               ; $1C8DFB |
  LDA {animation_timer},x                   ; $1C8DFE |
  CMP #$02                                  ; $1C8E01 |
  BNE code_1C8E56                           ; $1C8E03 |
  LDA {animation_frame},x                   ; $1C8E05 |
  CMP #$07                                  ; $1C8E08 |
  BEQ code_1C8E1F                           ; $1C8E0A |
  CMP #$0B                                  ; $1C8E0C |
  BNE code_1C8E56                           ; $1C8E0E |
  LDA #$53                                  ; $1C8E10 |
  STA {entity_handler_low},x                ; $1C8E12 |
  LDA #$8E                                  ; $1C8E15 |
  STA {entity_handler_high},x               ; $1C8E17 |
  LDA #$29                                  ; $1C8E1A |
  JMP code_1FEA98                           ; $1C8E1C |

code_1C8E1F:
  JSR code_1FF16F                           ; $1C8E1F |
  BCS code_1C8E56                           ; $1C8E22 |
  LDA #$14                                  ; $1C8E24 |
  STA {entity_type},y                       ; $1C8E26 |
  LDA #$2B                                  ; $1C8E29 |
  JSR code_1FEAA4                           ; $1C8E2B |
  LDA #$C1                                  ; $1C8E2E |
  STA {sprite_flags},y                      ; $1C8E30 |
  LDA #$01                                  ; $1C8E33 |
  STA {entity_life},y                       ; $1C8E35 |
  LDA {y_position_low},y                    ; $1C8E38 |
  CLC                                       ; $1C8E3B |
  ADC #$10                                  ; $1C8E3C |
  STA {y_position_low},y                    ; $1C8E3E |
  JSR code_1FEA34                           ; $1C8E41 |
  JSR code_1FF16F                           ; $1C8E44 |
  BCS code_1C8E56                           ; $1C8E47 |
  LDA #$01                                  ; $1C8E49 |
  STA {entity_type},y                       ; $1C8E4B |
  LDA #$2A                                  ; $1C8E4E |
  JMP code_1FEAA4                           ; $1C8E50 |

  JSR code_1FEA65                           ; $1C8E53 |
code_1C8E56:
  RTS                                       ; $1C8E56 |

  LDY #$07                                  ; $1C8E57 |
  JSR code_1FE7B7                           ; $1C8E59 |
  BCC code_1C8E56                           ; $1C8E5C |
  JMP $A54D                                 ; $1C8E5E |

  LDA {entity_var_c},x                      ; $1C8E61 |
  BEQ code_1C8E71                           ; $1C8E64 |
  JSR face_player                           ; $1C8E66 |
  JSR code_1FEC30                           ; $1C8E69 |
  DEC {entity_var_c},x                      ; $1C8E6C |
  BNE code_1C8E56                           ; $1C8E6F |
code_1C8E71:
  INC {entity_var_a},x                      ; $1C8E71 |
  LDA {entity_var_a},x                      ; $1C8E74 |
  CMP #$08                                  ; $1C8E77 |
  BEQ code_1C8E9B                           ; $1C8E79 |
  BCS code_1C8E83                           ; $1C8E7B |
  JSR face_player                           ; $1C8E7D |
  JMP code_1FEC30                           ; $1C8E80 |

code_1C8E83:
  CMP #$3C                                  ; $1C8E83 |
  BNE code_1C8E56                           ; $1C8E85 |
  LDA #$CF                                  ; $1C8E87 |
  STA {entity_handler_low},x                ; $1C8E89 |
  LDA #$8E                                  ; $1C8E8C |
  STA {entity_handler_high},x               ; $1C8E8E |
  LDA #$C0                                  ; $1C8E91 |
  STA {sprite_flags},x                      ; $1C8E93 |
  LDA #$7D                                  ; $1C8E96 |
  JMP code_1FEA98                           ; $1C8E98 |

code_1C8E9B:
  JSR code_1FF16F                           ; $1C8E9B |
  BCS code_1C8E56                           ; $1C8E9E |
  LDA #$2D                                  ; $1C8EA0 |
  STA {entity_type},y                       ; $1C8EA2 |
  LDA #$87                                  ; $1C8EA5 |
  STA {sprite_flags},y                      ; $1C8EA7 |
  LDA {entity_direction},x                  ; $1C8EAA |
  STA {entity_direction},y                  ; $1C8EAD |
  AND #$01                                  ; $1C8EB0 |
  CLC                                       ; $1C8EB2 |
  ADC #$2A                                  ; $1C8EB3 |
  STA $10                                   ; $1C8EB5 |
  LDA #$5A                                  ; $1C8EB7 |
  JSR code_1FEAF5                           ; $1C8EB9 |
  LDA #$00                                  ; $1C8EBC |
  STA {x_speed_frac},y                      ; $1C8EBE |
  LDA #$02                                  ; $1C8EC1 |
  STA {x_speed},y                           ; $1C8EC3 |
  TXA                                       ; $1C8EC6 |
  STA {entity_var_b},y                      ; $1C8EC7 |
  TYA                                       ; $1C8ECA |
  STA {entity_var_b},x                      ; $1C8ECB |
  RTS                                       ; $1C8ECE |

  LDA {animation_timer},x                   ; $1C8ECF |
  CMP #$04                                  ; $1C8ED2 |
  BNE code_1C8F12                           ; $1C8ED4 |
  CMP {animation_frame},x                   ; $1C8ED6 |
  BNE code_1C8F12                           ; $1C8ED9 |
  LDA #$E5                                  ; $1C8EDB |
  STA {entity_handler_low},x                ; $1C8EDD |
  LDA #$8E                                  ; $1C8EE0 |
  STA {entity_handler_high},x               ; $1C8EE2 |
  LDA #$00                                  ; $1C8EE5 |
  STA {animation_timer},x                   ; $1C8EE7 |
  LDY {entity_var_b},x                      ; $1C8EEA |
  LDA {entity_type},y                       ; $1C8EED |
  CMP #$2D                                  ; $1C8EF0 |
  BEQ code_1C8F12                           ; $1C8EF2 |
  LDA #$61                                  ; $1C8EF4 |
  STA {entity_handler_low},x                ; $1C8EF6 |
  LDA #$8E                                  ; $1C8EF9 |
  STA {entity_handler_high},x               ; $1C8EFB |
  LDA #$00                                  ; $1C8EFE |
  STA {entity_var_a},x                      ; $1C8F00 |
  LDA #$4D                                  ; $1C8F03 |
  JSR code_1FEA98                           ; $1C8F05 |
  LDA #$78                                  ; $1C8F08 |
  STA {entity_var_c},x                      ; $1C8F0A |
  LDA #$80                                  ; $1C8F0D |
  STA {sprite_flags},x                      ; $1C8F0F |
code_1C8F12:
  RTS                                       ; $1C8F12 |

  LDA {animation_timer},x                   ; $1C8F13 |
  CMP #$02                                  ; $1C8F16 |
  BNE code_1C8F12                           ; $1C8F18 |
  LDA {animation_frame},x                   ; $1C8F1A |
  CMP #$05                                  ; $1C8F1D |
  BEQ code_1C8F22                           ; $1C8F1F |
  RTS                                       ; $1C8F21 |

code_1C8F22:
  LDA #$36                                  ; $1C8F22 |
  STA {entity_handler_low},x                ; $1C8F24 |
  LDA #$8F                                  ; $1C8F27 |
  STA {entity_handler_high},x               ; $1C8F29 |
  LDA #$7C                                  ; $1C8F2C |
  JSR code_1FEA98                           ; $1C8F2E |
  LDA #$85                                  ; $1C8F31 |
  STA {sprite_flags},x                      ; $1C8F33 |
  LDY {entity_var_b},x                      ; $1C8F36 |
  LDA {entity_type},y                       ; $1C8F39 |
  CMP #$2A                                  ; $1C8F3C |
  BEQ code_1C8F43                           ; $1C8F3E |
  JMP $A54D                                 ; $1C8F40 |

code_1C8F43:
  LDA {animation_index},y                   ; $1C8F43 |
  CMP #$7D                                  ; $1C8F46 |
  BNE code_1C8F5C                           ; $1C8F48 |
  LDA #$96                                  ; $1C8F4A |
  JSR code_1FEA98                           ; $1C8F4C |
  LDA #$59                                  ; $1C8F4F |
  STA {entity_handler_low},x                ; $1C8F51 |
  LDA #$8F                                  ; $1C8F54 |
  STA {entity_handler_high},x               ; $1C8F56 |
  JSR code_1FEA65                           ; $1C8F59 |
code_1C8F5C:
  RTS                                       ; $1C8F5C |

  LDA #$01                                  ; $1C8F5D |
  STA {y_speed_frac},x                      ; $1C8F5F |
  STA {y_speed},x                           ; $1C8F62 |
  LDY #$0B                                  ; $1C8F65 |
  JSR code_1FE747                           ; $1C8F67 |
  LDA {entity_direction},x                  ; $1C8F6A |
  AND #$01                                  ; $1C8F6D |
  TAY                                       ; $1C8F6F |
  LDA $0048,y                               ; $1C8F70 |
  AND #$10                                  ; $1C8F73 |
  BEQ code_1C8F7E                           ; $1C8F75 |
  LDY #$0C                                  ; $1C8F77 |
  JSR code_1FEA3F                           ; $1C8F79 |
  BCC code_1C8F9F                           ; $1C8F7C |
code_1C8F7E:
  LDA #$1E                                  ; $1C8F7E |
  STA {entity_var_a},x                      ; $1C8F80 |
  LDA #$8D                                  ; $1C8F83 |
  STA {entity_handler_low},x                ; $1C8F85 |
  LDA #$8F                                  ; $1C8F88 |
  STA {entity_handler_high},x               ; $1C8F8A |
  DEC {entity_var_a},x                      ; $1C8F8D |
  BNE code_1C8F9F                           ; $1C8F90 |
  LDA #$5D                                  ; $1C8F92 |
  STA {entity_handler_low},x                ; $1C8F94 |
  LDA #$8F                                  ; $1C8F97 |
  STA {entity_handler_high},x               ; $1C8F99 |
  JSR code_1FEC4A                           ; $1C8F9C |
code_1C8F9F:
  RTS                                       ; $1C8F9F |

  JSR code_1FEA65                           ; $1C8FA0 |
  JSR get_angle_to_player                   ; $1C8FA3 |
  CMP #$06                                  ; $1C8FA6 |
  BEQ code_1C8FAE                           ; $1C8FA8 |
  CMP #$0A                                  ; $1C8FAA |
  BNE code_1C9010                           ; $1C8FAC |
code_1C8FAE:
  LDA #$BD                                  ; $1C8FAE |
  STA {entity_handler_low},x                ; $1C8FB0 |
  LDA #$8F                                  ; $1C8FB3 |
  STA {entity_handler_high},x               ; $1C8FB5 |
  LDA #$32                                  ; $1C8FB8 |
  JSR code_1FEA98                           ; $1C8FBA |
  LDA {animation_timer},x                   ; $1C8FBD |
  CMP #$04                                  ; $1C8FC0 |
  BNE code_1C900D                           ; $1C8FC2 |
  LDA {animation_frame},x                   ; $1C8FC4 |
  CMP #$04                                  ; $1C8FC7 |
  BEQ code_1C8FE8                           ; $1C8FC9 |
  CMP #$08                                  ; $1C8FCB |
  BEQ code_1C8FE8                           ; $1C8FCD |
  CMP #$0C                                  ; $1C8FCF |
  BEQ code_1C8FE8                           ; $1C8FD1 |
  CMP #$0D                                  ; $1C8FD3 |
  BNE code_1C900D                           ; $1C8FD5 |
  LDA #$0D                                  ; $1C8FD7 |
  STA {entity_handler_low},x                ; $1C8FD9 |
  LDA #$90                                  ; $1C8FDC |
  STA {entity_handler_high},x               ; $1C8FDE |
  LDA #$34                                  ; $1C8FE1 |
  JSR code_1FEA98                           ; $1C8FE3 |
  BEQ code_1C900D                           ; $1C8FE6 |
code_1C8FE8:
  JSR code_1FF16F                           ; $1C8FE8 |
  BCS code_1C9010                           ; $1C8FEB |
  LDA #$1A                                  ; $1C8FED |
  STA {entity_type},y                       ; $1C8FEF |
  LDA #$CA                                  ; $1C8FF2 |
  STA {sprite_flags},y                      ; $1C8FF4 |
  LDA #$01                                  ; $1C8FF7 |
  STA {entity_life},y                       ; $1C8FF9 |
  LDA #$33                                  ; $1C8FFC |
  JSR code_1FEAA4                           ; $1C8FFE |
  LDA {y_position_low},x                    ; $1C9001 |
  CLC                                       ; $1C9004 |
  ADC #$14                                  ; $1C9005 |
  STA {y_position_low},y                    ; $1C9007 |
  JSR code_1FEA34                           ; $1C900A |
code_1C900D:
  JSR code_1FEA65                           ; $1C900D |
code_1C9010:
  RTS                                       ; $1C9010 |

  LDY #$06                                  ; $1C9011 |
  JSR code_1FE7B7                           ; $1C9013 |
  BCC code_1C9010                           ; $1C9016 |
  JMP $A54D                                 ; $1C9018 |

  JSR code_1FEA65                           ; $1C901B |
  JSR get_angle_to_player                   ; $1C901E |
  CMP #$07                                  ; $1C9021 |
  BEQ code_1C9029                           ; $1C9023 |
  CMP #$09                                  ; $1C9025 |
  BNE code_1C9065                           ; $1C9027 |
code_1C9029:
  LDA #$38                                  ; $1C9029 |
  STA {entity_handler_low},x                ; $1C902B |
  LDA #$90                                  ; $1C902E |
  STA {entity_handler_high},x               ; $1C9030 |
  LDA #$30                                  ; $1C9033 |
  JSR code_1FEA98                           ; $1C9035 |
  LDA {animation_frame},x                   ; $1C9038 |
  CMP #$02                                  ; $1C903B |
  BNE code_1C9065                           ; $1C903D |
  LDA {animation_timer},x                   ; $1C903F |
  CMP #$08                                  ; $1C9042 |
  BNE code_1C9065                           ; $1C9044 |
  LDA #$5D                                  ; $1C9046 |
  STA {entity_handler_low},x                ; $1C9048 |
  LDA #$90                                  ; $1C904B |
  STA {entity_handler_high},x               ; $1C904D |
  LDA #$CC                                  ; $1C9050 |
  STA {sprite_flags},x                      ; $1C9052 |
  JSR reset_vertical_speed                  ; $1C9055 |
  LDA #$3B                                  ; $1C9058 |
  JSR code_1FEC5D                           ; $1C905A |
  LDA #$00                                  ; $1C905D |
  STA {animation_timer},x                   ; $1C905F |
  JSR entity_gravity_process                ; $1C9062 |
code_1C9065:
  RTS                                       ; $1C9065 |

  LDA #$2B                                  ; $1C9066 |
  JSR code_1FEC5D                           ; $1C9068 |
  LDA #$75                                  ; $1C906B |
  STA {entity_handler_low},x                ; $1C906D |
  LDA #$90                                  ; $1C9070 |
  STA {entity_handler_high},x               ; $1C9072 |
  LDA {entity_var_b},x                      ; $1C9075 |
  CMP #$09                                  ; $1C9078 |
  BEQ code_1C90B9                           ; $1C907A |
  LDA {entity_var_a},x                      ; $1C907C |
  BEQ code_1C9088                           ; $1C907F |
  DEC {entity_var_a},x                      ; $1C9081 |
  BNE code_1C90B9                           ; $1C9084 |
  LDA #$01                                  ; $1C9086 |
code_1C9088:
  STA $0E                                   ; $1C9088 |
  STX $0F                                   ; $1C908A |
  LDA #$02                                  ; $1C908C |
  STA {entity_var_a},x                      ; $1C908E |
code_1C9091:
  JSR code_1FF16F                           ; $1C9091 |
  BCS code_1C90B2                           ; $1C9094 |
  LDA #$01                                  ; $1C9096 |
  STA {entity_type},y                       ; $1C9098 |
  LDA #$00                                  ; $1C909B |
  STA {sprite_flags},y                      ; $1C909D |
  LDA #$00                                  ; $1C90A0 |
  STA {entity_life},y                       ; $1C90A2 |
  LDA {entity_var_b},x                      ; $1C90A5 |
  CLC                                       ; $1C90A8 |
  ADC #$10                                  ; $1C90A9 |
  STA $10                                   ; $1C90AB |
  LDA #$42                                  ; $1C90AD |
  JSR code_1FEAF5                           ; $1C90AF |
code_1C90B2:
  INC {entity_var_b},x                      ; $1C90B2 |
  DEC $0E                                   ; $1C90B5 |
  BPL code_1C9091                           ; $1C90B7 |
code_1C90B9:
  RTS                                       ; $1C90B9 |

  LDA {entity_var_a},x                      ; $1C90BA |
  BEQ code_1C90C4                           ; $1C90BD |
  DEC {entity_var_a},x                      ; $1C90BF |
  BNE code_1C90F9                           ; $1C90C2 |
code_1C90C4:
  LDA #$10                                  ; $1C90C4 |
  STA {entity_var_a},x                      ; $1C90C6 |
  STX $0F                                   ; $1C90C9 |
  JSR code_1FF16F                           ; $1C90CB |
  BCS code_1C90EC                           ; $1C90CE |
  LDA #$2C                                  ; $1C90D0 |
  JSR code_1FEC5D                           ; $1C90D2 |
  LDA #$2F                                  ; $1C90D5 |
  STA {entity_type},y                       ; $1C90D7 |
  LDA #$00                                  ; $1C90DA |
  STA {sprite_flags},y                      ; $1C90DC |
  LDA {entity_var_b},x                      ; $1C90DF |
  CLC                                       ; $1C90E2 |
  ADC #$19                                  ; $1C90E3 |
  STA $10                                   ; $1C90E5 |
  LDA #$42                                  ; $1C90E7 |
  JSR code_1FEAF5                           ; $1C90E9 |
code_1C90EC:
  INC {entity_var_b},x                      ; $1C90EC |
  LDA {entity_var_b},x                      ; $1C90EF |
  CMP #$05                                  ; $1C90F2 |
  BNE code_1C90F9                           ; $1C90F4 |
  JSR code_1FF2C4                           ; $1C90F6 |
code_1C90F9:
  RTS                                       ; $1C90F9 |

  RTS                                       ; $1C90FA |

  JSR code_1C911A                           ; $1C90FB |
  DEC {entity_var_a},x                      ; $1C90FE |
  BNE code_1C912C                           ; $1C9101 |
  JSR code_1C9174                           ; $1C9103 |
  LDA #$10                                  ; $1C9106 |
  STA {entity_handler_low},x                ; $1C9108 |
  LDA #$91                                  ; $1C910B |
  STA {entity_handler_high},x               ; $1C910D |
  JSR code_1FEF87                           ; $1C9110 |
  BCS code_1C912D                           ; $1C9113 |
  LDA #$00                                  ; $1C9115 |
  STA {entity_var_b},x                      ; $1C9117 |
code_1C911A:
  LDA #$1E                                  ; $1C911A |
  STA {entity_var_a},x                      ; $1C911C |
  STA {entity_var_c},x                      ; $1C911F |
  LDA #$FE                                  ; $1C9122 |
  STA {entity_handler_low},x                ; $1C9124 |
  LDA #$90                                  ; $1C9127 |
  STA {entity_handler_high},x               ; $1C9129 |
code_1C912C:
  RTS                                       ; $1C912C |

code_1C912D:
  JSR code_1FEA65                           ; $1C912D |
  JSR code_1FEA86                           ; $1C9130 |
  JSR distance_to_player                    ; $1C9133 |
  CMP #$32                                  ; $1C9136 |
  BCS code_1C915E                           ; $1C9138 |
  JSR vertical_distance_to_player           ; $1C913A |
  CMP #$32                                  ; $1C913D |
  BCS code_1C915E                           ; $1C913F |
  LDA {entity_var_b},x                      ; $1C9141 |
  BNE code_1C914B                           ; $1C9144 |
  LDA #$1E                                  ; $1C9146 |
  STA {entity_var_b},x                      ; $1C9148 |
code_1C914B:
  DEC {entity_var_b},x                      ; $1C914B |
  BNE code_1C919D                           ; $1C914E |
  LDA #$1E                                  ; $1C9150 |
  STA {entity_var_b},x                      ; $1C9152 |
  JSR get_angle_to_player                   ; $1C9155 |
  TAY                                       ; $1C9158 |
  LDA #$20                                  ; $1C9159 |
  JMP code_1FF470                           ; $1C915B |

code_1C915E:
  LDA {entity_var_b},x                      ; $1C915E |
  BNE code_1C916F                           ; $1C9161 |
  DEC {entity_var_c},x                      ; $1C9163 |
  BNE code_1C919D                           ; $1C9166 |
  LDA #$1E                                  ; $1C9168 |
  STA {entity_var_c},x                      ; $1C916A |
  BNE code_1C9174                           ; $1C916D |
code_1C916F:
  LDA #$00                                  ; $1C916F |
  STA {entity_var_b},x                      ; $1C9171 |
code_1C9174:
  JSR face_player                           ; $1C9174 |
  JSR code_1FEC30                           ; $1C9177 |
  LDY #$08                                  ; $1C917A |
  LDA {y_position_low},x                    ; $1C917C |
  CMP {y_position_low}                      ; $1C917F |
  BCS code_1C9186                           ; $1C9182 |
  LDY #$04                                  ; $1C9184 |
code_1C9186:
  TYA                                       ; $1C9186 |
  ORA {entity_direction},x                  ; $1C9187 |
  STA {entity_direction},x                  ; $1C918A |
  LDA #$0F                                  ; $1C918D |
  STA {x_speed_frac},x                      ; $1C918F |
  STA {y_speed_frac},x                      ; $1C9192 |
  LDA #$01                                  ; $1C9195 |
  STA {x_speed},x                           ; $1C9197 |
  STA {y_speed},x                           ; $1C919A |
code_1C919D:
  RTS                                       ; $1C919D |

  LDA {x_position_high}                     ; $1C919E |
  BEQ code_1C919D                           ; $1C91A1 |
  CMP #$01                                  ; $1C91A3 |
  BNE code_1C91AE                           ; $1C91A5 |
  LDA {x_position_low}                      ; $1C91A7 |
  CMP #$40                                  ; $1C91AA |
  BCC code_1C919D                           ; $1C91AC |
code_1C91AE:
  LDA {x_position_low}                      ; $1C91AE |
  SEC                                       ; $1C91B1 |
  SBC #$70                                  ; $1C91B2 |
  STA {x_position_low},x                    ; $1C91B4 |
  LDA {x_position_high}                     ; $1C91B7 |
  SBC #$00                                  ; $1C91BA |
  STA {x_position_high},x                   ; $1C91BC |
  LDA {entity_var_a},x                      ; $1C91BF |
  BEQ code_1C91C9                           ; $1C91C2 |
  DEC {entity_var_a},x                      ; $1C91C4 |
  BNE code_1C923E                           ; $1C91C7 |
code_1C91C9:
  LDY #$17                                  ; $1C91C9 |
  LDA #$00                                  ; $1C91CB |
  STA $00                                   ; $1C91CD |
code_1C91CF:
  LDA {entity_type},y                       ; $1C91CF |
  CMP #$39                                  ; $1C91D2 |
  BEQ code_1C91DA                           ; $1C91D4 |
  CMP #$01                                  ; $1C91D6 |
  BNE code_1C91DC                           ; $1C91D8 |
code_1C91DA:
  INC $00                                   ; $1C91DA |
code_1C91DC:
  DEY                                       ; $1C91DC |
  CPY #$07                                  ; $1C91DD |
  BCS code_1C91CF                           ; $1C91DF |
  LDA $00                                   ; $1C91E1 |
  CMP #$03                                  ; $1C91E3 |
  BCS code_1C923E                           ; $1C91E5 |
  STX $0F                                   ; $1C91E7 |
  JSR code_1FF16F                           ; $1C91E9 |
  BCS code_1C923E                           ; $1C91EC |
  LDA #$39                                  ; $1C91EE |
  STA {entity_type},y                       ; $1C91F0 |
  LDA #$C1                                  ; $1C91F3 |
  STA {sprite_flags},y                      ; $1C91F5 |
  LDA #$00                                  ; $1C91F8 |
  STA {entity_life},y                       ; $1C91FA |
  LDA #$4B                                  ; $1C91FD |
  JSR code_1FEAA4                           ; $1C91FF |
  LDA $E6                                   ; $1C9202 |\  roll RNG for Star Man's
  ADC $E4                                   ; $1C9204 | | falling rock position
  STA $E6                                   ; $1C9206 |/
  CMP #$E0                                  ; $1C9208 |
  BCC code_1C920F                           ; $1C920A |
  SEC                                       ; $1C920C |
  SBC #$E0                                  ; $1C920D |
code_1C920F:
  STA $0E                                   ; $1C920F |
  LDA {x_position_low},x                    ; $1C9211 |
  CLC                                       ; $1C9214 |
  ADC $0E                                   ; $1C9215 |
  STA {x_position_low},y                    ; $1C9217 |
  LDA {x_position_high},x                   ; $1C921A |
  ADC #$00                                  ; $1C921D |
  STA {x_position_high},y                   ; $1C921F |
  STY $0E                                   ; $1C9222 |
  LDA $E6                                   ; $1C9224 |\
  AND #$03                                  ; $1C9226 | | roll RNG for ???
  ADC #$07                                  ; $1C9228 | | falling rock index
  TAY                                       ; $1C922A |/
  CPY #$0A                                  ; $1C922B |
  BCC code_1C9230                           ; $1C922D |
  DEY                                       ; $1C922F |
code_1C9230:
  LDX $0E                                   ; $1C9230 |
  LDA #$28                                  ; $1C9232 |
  JSR code_1FF470                           ; $1C9234 |
  LDX $0F                                   ; $1C9237 |
  LDA #$0A                                  ; $1C9239 |
  STA {entity_var_a},x                      ; $1C923B |
code_1C923E:
  RTS                                       ; $1C923E |

  LDA #$00                                  ; $1C923F |
  STA {animation_timer},x                   ; $1C9241 |
  LDY #$17                                  ; $1C9244 |
  JSR code_1FEA52                           ; $1C9246 |
  BCS code_1C9252                           ; $1C9249 |
  LDY #$1C                                  ; $1C924B |
  JSR code_1C851A                           ; $1C924D |
  BCC code_1C923E                           ; $1C9250 |
code_1C9252:
  LDA #$01                                  ; $1C9252 |
  STA {animation_frame},x                   ; $1C9254 |
  JSR code_1FF2C4                           ; $1C9257 |
  LDA #$01                                  ; $1C925A |
  STA {entity_type},x                       ; $1C925C |
  LDA #$2B                                  ; $1C925F |
  JMP code_1FEC5D                           ; $1C9261 |

  LDA #$3C                                  ; $1C9264 |
  JSR code_1C9330                           ; $1C9266 |
  LDA {entity_var_a},x                      ; $1C9269 |
  BEQ code_1C9278                           ; $1C926C |
  LDA #$00                                  ; $1C926E |
  STA {animation_timer},x                   ; $1C9270 |
  DEC {entity_var_a},x                      ; $1C9273 |
  BNE code_1C92CE                           ; $1C9276 |
code_1C9278:
  LDA #$C4                                  ; $1C9278 |
  STA {x_speed_frac},x                      ; $1C927A |
  LDA #$01                                  ; $1C927D |
  STA {x_speed},x                           ; $1C927F |
  LDA #$A8                                  ; $1C9282 |
  STA {y_speed_frac},x                      ; $1C9284 |
  LDA #$05                                  ; $1C9287 |
  STA {y_speed},x                           ; $1C9289 |
  JSR face_player                           ; $1C928C |
  JSR code_1FEC30                           ; $1C928F |
  LDA #$A1                                  ; $1C9292 |
  STA {entity_handler_low},x                ; $1C9294 |
  LDA #$92                                  ; $1C9297 |
  STA {entity_handler_high},x               ; $1C9299 |
  LDA #$01                                  ; $1C929C |
  STA {animation_frame},x                   ; $1C929E |
  JSR get_angle_to_player                   ; $1C92A1 |
  CMP #$08                                  ; $1C92A4 |
  BNE code_1C92B8                           ; $1C92A6 |
  LDA #$CF                                  ; $1C92A8 |
  STA {entity_handler_low},x                ; $1C92AA |
  LDA #$92                                  ; $1C92AD |
  STA {entity_handler_high},x               ; $1C92AF |
  LDA #$0A                                  ; $1C92B2 |
  STA {entity_var_b},x                      ; $1C92B4 |
  RTS                                       ; $1C92B7 |

code_1C92B8:
  LDA #$00                                  ; $1C92B8 |
  STA {animation_timer},x                   ; $1C92BA |
  LDY #$0F                                  ; $1C92BD |
  JSR code_1FE7B7                           ; $1C92BF |
  BCS code_1C9307                           ; $1C92C2 |
  LDY #$12                                  ; $1C92C4 |
  JSR code_1FEA3F                           ; $1C92C6 |
  BCC code_1C92CE                           ; $1C92C9 |
  JSR code_1FEC4A                           ; $1C92CB |
code_1C92CE:
  RTS                                       ; $1C92CE |

  LDA #$00                                  ; $1C92CF |
  STA {animation_timer},x                   ; $1C92D1 |
  LDA {entity_var_b},x                      ; $1C92D4 |
  BEQ code_1C92FB                           ; $1C92D7 |
  DEC {entity_var_b},x                      ; $1C92D9 |
  BEQ code_1C92F1                           ; $1C92DC |
  CMP #$04                                  ; $1C92DE |
  BNE code_1C92CE                           ; $1C92E0 |
  JSR code_1FF16F                           ; $1C92E2 |
  BCS code_1C92CE                           ; $1C92E5 |
  LDA #$01                                  ; $1C92E7 |
  STA {entity_type},y                       ; $1C92E9 |
  LDA #$3B                                  ; $1C92EC |
  JMP code_1FEAA4                           ; $1C92EE |

code_1C92F1:
  LDA #$00                                  ; $1C92F1 |
  STA {y_speed_frac},x                      ; $1C92F3 |
  LDA #$04                                  ; $1C92F6 |
  STA {y_speed},x                           ; $1C92F8 |
code_1C92FB:
  LDA #$00                                  ; $1C92FB |
  STA {animation_timer},x                   ; $1C92FD |
  LDY #$0F                                  ; $1C9300 |
  JSR code_1FE747                           ; $1C9302 |
  BCC code_1C92CE                           ; $1C9305 |
code_1C9307:
  LDA #$3A                                  ; $1C9307 |
  JSR code_1FEA98                           ; $1C9309 |
  LDA #$1B                                  ; $1C930C |
  STA {entity_handler_low},x                ; $1C930E |
  LDA #$93                                  ; $1C9311 |
  STA {entity_handler_high},x               ; $1C9313 |
  LDA #$36                                  ; $1C9316 |
  JSR code_1FEC5D                           ; $1C9318 |
  LDA {animation_frame},x                   ; $1C931B |
  CMP #$03                                  ; $1C931E |
  BNE code_1C92CE                           ; $1C9320 |
  LDA {animation_timer},x                   ; $1C9322 |
  CMP #$04                                  ; $1C9325 |
  BNE code_1C92CE                           ; $1C9327 |
  LDA #$39                                  ; $1C9329 |
  JSR code_1FEA98                           ; $1C932B |
  LDA #$2A                                  ; $1C932E |
code_1C9330:
  STA {entity_var_a},x                      ; $1C9330 |
  LDA #$69                                  ; $1C9333 |
  STA {entity_handler_low},x                ; $1C9335 |
  LDA #$92                                  ; $1C9338 |
  STA {entity_handler_high},x               ; $1C933A |
  RTS                                       ; $1C933D |

  INC {entity_var_e},x                      ; $1C933E |
  LDA {entity_var_e},x                      ; $1C9341 |
  CMP #$3C                                  ; $1C9344 |
  BNE code_1C92CE                           ; $1C9346 |
  JSR get_angle_to_player                   ; $1C9348 |
  TAY                                       ; $1C934B |
  LDA #$18                                  ; $1C934C |
  JSR code_1FF470                           ; $1C934E |
  LDA #$60                                  ; $1C9351 |
  STA {entity_handler_low},x                ; $1C9353 |
  LDA #$93                                  ; $1C9356 |
  STA {entity_handler_high},x               ; $1C9358 |
  LDA #$28                                  ; $1C935B |
  STA {entity_var_a},x                      ; $1C935D |
  JSR code_1C84FC                           ; $1C9360 |
  LDA {entity_var_c},x                      ; $1C9363 |
  BEQ code_1C936C                           ; $1C9366 |
  DEC {entity_var_c},x                      ; $1C9368 |
  RTS                                       ; $1C936B |

code_1C936C:
  JSR code_1C9417                           ; $1C936C |
  LDY {entity_var_f},x                      ; $1C936F |
  LDA {entity_type},y                       ; $1C9372 |
  CMP #$55                                  ; $1C9375 |
  BEQ code_1C93CB                           ; $1C9377 |
  JSR code_1FF16F                           ; $1C9379 |
  BCS code_1C93CB                           ; $1C937C |
  STX $0F                                   ; $1C937E |
  LDA #$86                                  ; $1C9380 |
  STA {sprite_flags},y                      ; $1C9382 |
  LDA #$55                                  ; $1C9385 |
  STA {entity_type},y                       ; $1C9387 |
  TYA                                       ; $1C938A |
  STA {entity_var_f},x                      ; $1C938B |
  LDA {entity_var_b},x                      ; $1C938E |
  TAX                                       ; $1C9391 |
  LDA $946F,x                               ; $1C9392 |
  STA {y_speed_frac},y                      ; $1C9395 |
  LDA $9477,x                               ; $1C9398 |
  STA {y_speed},y                           ; $1C939B |
  LDA $945F,x                               ; $1C939E |
  STA {x_speed_frac},y                      ; $1C93A1 |
  LDA $9467,x                               ; $1C93A4 |
  STA {x_speed},y                           ; $1C93A7 |
  LDA $9457,x                               ; $1C93AA |
  STA {entity_direction},y                  ; $1C93AD |
  LDA $944F,x                               ; $1C93B0 |
  STA $10                                   ; $1C93B3 |
  LDX $0F                                   ; $1C93B5 |
  LDA {animation_index},x                   ; $1C93B7 |
  CLC                                       ; $1C93BA |
  ADC #$03                                  ; $1C93BB |
  JSR code_1FEAF5                           ; $1C93BD |
  LDA #$08                                  ; $1C93C0 |
  STA {entity_var_c},x                      ; $1C93C2 |
  LDA #$00                                  ; $1C93C5 |
  STA {entity_var_d},x                      ; $1C93C7 |
  RTS                                       ; $1C93CA |

code_1C93CB:
  DEC {entity_var_a},x                      ; $1C93CB |
  BNE code_1C9416                           ; $1C93CE |
  LDA #$F5                                  ; $1C93D0 |
  STA {entity_handler_low},x                ; $1C93D2 |
  LDA #$93                                  ; $1C93D5 |
  STA {entity_handler_high},x               ; $1C93D7 |
  LDA #$66                                  ; $1C93DA |
  STA {y_speed_frac},x                      ; $1C93DC |
  LDA #$02                                  ; $1C93DF |
  STA {y_speed},x                           ; $1C93E1 |
  LDA #$08                                  ; $1C93E4 |
  STA {entity_direction},x                  ; $1C93E6 |
  LDA {y_position_low},x                    ; $1C93E9 |
  CMP #$40                                  ; $1C93EC |
  BCS code_1C93F5                           ; $1C93EE |
  LDA #$04                                  ; $1C93F0 |
  STA {entity_direction},x                  ; $1C93F2 |
code_1C93F5:
  JSR code_1C9417                           ; $1C93F5 |
  JSR code_1FEA86                           ; $1C93F8 |
  LDA {y_position_low},x                    ; $1C93FB |
  SEC                                       ; $1C93FE |
  SBC #$40                                  ; $1C93FF |
  BCS code_1C9408                           ; $1C9401 |
  EOR #$FF                                  ; $1C9403 |
  CLC                                       ; $1C9405 |
  ADC #$01                                  ; $1C9406 |
code_1C9408:
  CMP #$08                                  ; $1C9408 |
  BCS code_1C9416                           ; $1C940A |
  LDA #$48                                  ; $1C940C |
  STA {entity_handler_low},x                ; $1C940E |
  LDA #$93                                  ; $1C9411 |
  STA {entity_handler_high},x               ; $1C9413 |
code_1C9416:
  RTS                                       ; $1C9416 |

code_1C9417:
  LDA {entity_var_d},x                      ; $1C9417 |
  INC {entity_var_d},x                      ; $1C941A |
  AND #$07                                  ; $1C941D |
  BNE code_1C9416                           ; $1C941F |
  JSR get_angle_to_player                   ; $1C9421 |
  TAY                                       ; $1C9424 |
  LSR                                       ; $1C9425 |
  STA {entity_var_b},x                      ; $1C9426 |
  LDA {entity_direction},x                  ; $1C9429 |
  STA $0F                                   ; $1C942C |
  LDA $ED4B,y                               ; $1C942E |
  STA {entity_direction},x                  ; $1C9431 |
  JSR code_1FEC30                           ; $1C9434 |
  LDA $0F                                   ; $1C9437 |
  STA {entity_direction},x                  ; $1C9439 |
  LDA {entity_var_b},x                      ; $1C943C |
  TAY                                       ; $1C943F |
  LDA $9447,y                               ; $1C9440 |
  STA {animation_index},x                   ; $1C9443 |
  RTS                                       ; $1C9446 |

  db $3D, $3D, $3D, $3C, $3E, $3C, $3D, $3D ; $1C9447 |
  db $04, $04, $04, $05, $06, $07, $08, $08 ; $1C944F |
  db $01, $01, $01, $05, $04, $06, $02, $02 ; $1C9457 |
  db $00, $00, $00, $6A, $00, $6A, $00, $00 ; $1C945F |
  db $02, $02, $02, $01, $00, $01, $02, $02 ; $1C9467 |
  db $00, $00, $00, $6A, $00, $6A, $00, $00 ; $1C946F |
  db $00, $00, $00, $01, $02, $01, $00, $00 ; $1C9477 |

  JSR distance_to_player                    ; $1C947F |
  CMP #$5A                                  ; $1C9482 |
  BCC code_1C948F                           ; $1C9484 |
  LDA $14                                   ; $1C9486 |
  AND #$40                                  ; $1C9488 |
  BNE code_1C948F                           ; $1C948A |
  JMP code_1C9504                           ; $1C948C |

code_1C948F:
  LDA #$9E                                  ; $1C948F |
  STA {entity_handler_low},x                ; $1C9491 |
  LDA #$94                                  ; $1C9494 |
  STA {entity_handler_high},x               ; $1C9496 |
  LDA #$8A                                  ; $1C9499 |
  JSR code_1FEA98                           ; $1C949B |
  LDA $9D                                   ; $1C949E |
  AND #$0F                                  ; $1C94A0 |
  BNE code_1C94A9                           ; $1C94A2 |
  LDA #$47                                  ; $1C94A4 |
  JSR code_1FEC5D                           ; $1C94A6 |
code_1C94A9:
  LDY #$19                                  ; $1C94A9 |
  JSR code_1EC4A1                           ; $1C94AB |
  LDA {entity_direction},x                  ; $1C94AE |
  AND #$01                                  ; $1C94B1 |
  ASL                                       ; $1C94B3 |
  TAY                                       ; $1C94B4 |
  LDA $0048,y                               ; $1C94B5 |
  AND #$10                                  ; $1C94B8 |
  BEQ code_1C94D1                           ; $1C94BA |
  LDY #$26                                  ; $1C94BC |
  JSR code_1C851A                           ; $1C94BE |
  BCS code_1C94D1                           ; $1C94C1 |
  LDA {entity_var_h},x                      ; $1C94C3 |
  CMP #$1F                                  ; $1C94C6 |
  BEQ code_1C94E1                           ; $1C94C8 |
  LDA {x_position_low},x                    ; $1C94CA |
  CMP #$F0                                  ; $1C94CD |
  BCC code_1C94E1                           ; $1C94CF |
code_1C94D1:
  JSR code_1C852F                           ; $1C94D1 |
  LDA {animation_index},x                   ; $1C94D4 |
  EOR #$01                                  ; $1C94D7 |
  STA {animation_index},x                   ; $1C94D9 |
  LDA #$00                                  ; $1C94DC |
  STA {animation_timer},x                   ; $1C94DE |
code_1C94E1:
  LDA {entity_display_flags},x              ; $1C94E1 |
  PHA                                       ; $1C94E4 |
  JSR code_1C850B                           ; $1C94E5 |
  PLA                                       ; $1C94E8 |
  CMP {entity_display_flags},x              ; $1C94E9 |
  BEQ code_1C9504                           ; $1C94EC |
  LDA #$0F                                  ; $1C94EE |
  SEC                                       ; $1C94F0 |
  SBC {animation_frame},x                   ; $1C94F1 |
  STA {animation_frame},x                   ; $1C94F4 |
  LDA {animation_index},x                   ; $1C94F7 |
  EOR #$01                                  ; $1C94FA |
  STA {animation_index},x                   ; $1C94FC |
  LDA #$00                                  ; $1C94FF |
  STA {animation_timer},x                   ; $1C9501 |
code_1C9504:
  LDA {y_position_low},x                    ; $1C9504 |
  PHA                                       ; $1C9507 |
  SEC                                       ; $1C9508 |
  SBC #$1C                                  ; $1C9509 |
  STA {y_position_low},x                    ; $1C950B |
  LDA #$CE                                  ; $1C950E |
  STA {sprite_flags},x                      ; $1C9510 |
  JSR code_1FEFF8                           ; $1C9513 |
  PLA                                       ; $1C9516 |
  STA {y_position_low},x                    ; $1C9517 |
  LDA #$8F                                  ; $1C951A |
  STA {sprite_flags},x                      ; $1C951C |
  BCS code_1C9528                           ; $1C951F |
  LDA #$40                                  ; $1C9521 |
  STA $00                                   ; $1C9523 |
  JMP code_1C809D                           ; $1C9525 |

code_1C9528:
  LDA {entity_var_a},x                      ; $1C9528 |
  BEQ code_1C9532                           ; $1C952B |
  DEC {entity_var_a},x                      ; $1C952D |
  BNE code_1C959B                           ; $1C9530 |
code_1C9532:
  LDY {entity_var_b},x                      ; $1C9532 |
  LDA $959C,y                               ; $1C9535 |
  STA {entity_var_a},x                      ; $1C9538 |
  LDA {entity_display_flags},x              ; $1C953B |
  AND #$20                                  ; $1C953E |
  LSR                                       ; $1C9540 |
  LSR                                       ; $1C9541 |
  LSR                                       ; $1C9542 |
  ORA {entity_var_b},x                      ; $1C9543 |
  TAY                                       ; $1C9546 |
  LDA $95A0,y                               ; $1C9547 |
  STA $0E                                   ; $1C954A |
  STX $0F                                   ; $1C954C |
  LDA #$48                                  ; $1C954E |
  JSR code_1FEC5D                           ; $1C9550 |
  JSR code_1FF16F                           ; $1C9553 |
  BCS code_1C958E                           ; $1C9556 |
  LDA #$87                                  ; $1C9558 |
  STA {sprite_flags},y                      ; $1C955A |
  LDA #$9D                                  ; $1C955D |
  STA {entity_type},y                       ; $1C955F |
  LDA #$13                                  ; $1C9562 |
  STA $0D                                   ; $1C9564 |
  LDA {entity_display_flags},x              ; $1C9566 |
  AND #$20                                  ; $1C9569 |
  BEQ code_1C956F                           ; $1C956B |
  INC $0D                                   ; $1C956D |
code_1C956F:
  LDA $0D                                   ; $1C956F |
  STA $10                                   ; $1C9571 |
  LDA {entity_var_b},x                      ; $1C9573 |
  CLC                                       ; $1C9576 |
  ADC #$8C                                  ; $1C9577 |
  JSR code_1FEAF5                           ; $1C9579 |
  LDA {y_position_low},y                    ; $1C957C |
  SEC                                       ; $1C957F |
  SBC #$0C                                  ; $1C9580 |
  STA {y_position_low},y                    ; $1C9582 |
  TYA                                       ; $1C9585 |
  TAX                                       ; $1C9586 |
  LDY $0E                                   ; $1C9587 |
  LDA #$28                                  ; $1C9589 |
  JSR code_1FF470                           ; $1C958B |
code_1C958E:
  LDX $0F                                   ; $1C958E |
  INC {entity_var_b},x                      ; $1C9590 |
  LDA {entity_var_b},x                      ; $1C9593 |
  AND #$03                                  ; $1C9596 |
  STA {entity_var_b},x                      ; $1C9598 |
code_1C959B:
  RTS                                       ; $1C959B |

  db $14, $14, $14, $78, $0C, $0B, $0A, $09 ; $1C959C |
  db $04, $05, $06, $07                     ; $1C95A4 |

  LDA {animation_timer},x                   ; $1C95A8 |
  CMP #$08                                  ; $1C95AB |
  BNE code_1C95BE                           ; $1C95AD |
  LDA {animation_frame},x                   ; $1C95AF |
  CMP #$09                                  ; $1C95B2 |
  BNE code_1C95BE                           ; $1C95B4 |
  LDA {entity_display_flags},x              ; $1C95B6 |
  EOR #$20                                  ; $1C95B9 |
  STA {entity_display_flags},x              ; $1C95BB |
code_1C95BE:
  LDA {animation_frame},x                   ; $1C95BE |
  TAY                                       ; $1C95C1 |
  CMP #$02                                  ; $1C95C2 |
  BNE code_1C95D0                           ; $1C95C4 |
  LDA {animation_timer},x                   ; $1C95C6 |
  BNE code_1C95D0                           ; $1C95C9 |
  LDA #$38                                  ; $1C95CB |
  JSR code_1FEC5D                           ; $1C95CD |
code_1C95D0:
  LDA {y_position_low},x                    ; $1C95D0 |
  STA $0D                                   ; $1C95D3 |
  LDA {entity_display_flags},x              ; $1C95D5 |
  AND #$40                                  ; $1C95D8 |
  BNE code_1C95E4                           ; $1C95DA |
  LDA $0D                                   ; $1C95DC |
  CLC                                       ; $1C95DE |
  ADC $9635,y                               ; $1C95DF |
  BNE code_1C95EA                           ; $1C95E2 |
code_1C95E4:
  LDA $0D                                   ; $1C95E4 |
  SEC                                       ; $1C95E6 |
  SBC $9635,y                               ; $1C95E7 |
code_1C95EA:
  STA {y_position_low},x                    ; $1C95EA |
  LDA {x_position_low},x                    ; $1C95ED |
  STA $0E                                   ; $1C95F0 |
  LDA {x_position_high},x                   ; $1C95F2 |
  STA $0F                                   ; $1C95F5 |
  LDA {entity_display_flags},x              ; $1C95F7 |
  AND #$20                                  ; $1C95FA |
  BNE code_1C960D                           ; $1C95FC |
  LDA $0E                                   ; $1C95FE |
  SEC                                       ; $1C9600 |
  SBC $963F,y                               ; $1C9601 |
  STA {x_position_low},x                    ; $1C9604 |
  LDA $0F                                   ; $1C9607 |
  SBC #$00                                  ; $1C9609 |
  BCS code_1C961A                           ; $1C960B |
code_1C960D:
  LDA $0E                                   ; $1C960D |
  CLC                                       ; $1C960F |
  ADC $963F,y                               ; $1C9610 |
  STA {x_position_low},x                    ; $1C9613 |
  LDA $0F                                   ; $1C9616 |
  ADC #$00                                  ; $1C9618 |
code_1C961A:
  STA {x_position_high},x                   ; $1C961A |
  JSR code_1FEF87                           ; $1C961D |
  BCS code_1C9625                           ; $1C9620 |
  JSR code_1C82B8                           ; $1C9622 |
code_1C9625:
  LDA $0D                                   ; $1C9625 |
  STA {y_position_low},x                    ; $1C9627 |
  LDA $0E                                   ; $1C962A |
  STA {x_position_low},x                    ; $1C962C |
  LDA $0F                                   ; $1C962F |
  STA {x_position_high},x                   ; $1C9631 |
  RTS                                       ; $1C9634 |

  db $34, $24, $08, $08, $08, $08, $08, $08 ; $1C9635 |
  db $08, $24, $00, $1C, $2C, $2C, $2C, $2C ; $1C963D |
  db $2C, $2C, $2C, $1C                     ; $1C9645 |

  LDA {entity_var_h},x                      ; $1C9649 |
  AND #$07                                  ; $1C964C |
  PHA                                       ; $1C964E |
  AND #$01                                  ; $1C964F |
  TAY                                       ; $1C9651 |
  LDA $96D4,y                               ; $1C9652 |
  STA {entity_var_a},x                      ; $1C9655 |
  PLA                                       ; $1C9658 |
  ASL                                       ; $1C9659 |
  TAY                                       ; $1C965A |
  LDA #$08                                  ; $1C965B |
  JSR code_1FF470                           ; $1C965D |
  LDA #$6A                                  ; $1C9660 |
  STA {entity_handler_low},x                ; $1C9662 |
  LDA #$96                                  ; $1C9665 |
  STA {entity_handler_high},x               ; $1C9667 |
  LDA $30                                   ; $1C966A |
  BNE code_1C96D3                           ; $1C966C |
  DEC {y_position_low},x                    ; $1C966E |
  JSR code_1FEF87                           ; $1C9671 |
  INC {y_position_low},x                    ; $1C9674 |
  BCS code_1C96D3                           ; $1C9677 |
  LDA #$83                                  ; $1C9679 |
  STA {entity_handler_low},x                ; $1C967B |
  LDA #$96                                  ; $1C967E |
  STA {entity_handler_high},x               ; $1C9680 |
  LDA {entity_var_b},x                      ; $1C9683 |
  BEQ code_1C969A                           ; $1C9686 |
  DEC {entity_var_b},x                      ; $1C9688 |
  BNE code_1C96D3                           ; $1C968B |
  LDA #$D0                                  ; $1C968D |
  STA {entity_handler_low},x                ; $1C968F |
  LDA #$96                                  ; $1C9692 |
  STA {entity_handler_high},x               ; $1C9694 |
  JMP reset_vertical_speed                  ; $1C9697 |

code_1C969A:
  LDA $30                                   ; $1C969A |
  BNE code_1C96BC                           ; $1C969C |
  DEC {y_position_low},x                    ; $1C969E |
  JSR code_1FEF87                           ; $1C96A1 |
  INC {y_position_low},x                    ; $1C96A4 |
  BCS code_1C96BC                           ; $1C96A7 |
  LDA {entity_direction},x                  ; $1C96A9 |
  AND #$03                                  ; $1C96AC |
  BEQ code_1C96BC                           ; $1C96AE |
  STA $39                                   ; $1C96B0 |
  LDA {x_speed_frac},x                      ; $1C96B2 |
  STA $3A                                   ; $1C96B5 |
  LDA {x_speed},x                           ; $1C96B7 |
  STA $3B                                   ; $1C96BA |
code_1C96BC:
  JSR code_1FEA65                           ; $1C96BC |
  JSR code_1FEA86                           ; $1C96BF |
  JSR code_1C8526                           ; $1C96C2 |
  DEC {entity_var_a},x                      ; $1C96C5 |
  BNE code_1C96D3                           ; $1C96C8 |
  LDA #$1E                                  ; $1C96CA |
  STA {entity_var_b},x                      ; $1C96CC |
  RTS                                       ; $1C96CF |

  JSR entity_gravity_process                ; $1C96D0 |
code_1C96D3:
  RTS                                       ; $1C96D3 |

  db $40, $38                               ; $1C96D4 |

  JSR face_player                           ; $1C96D6 |
  JSR code_1FEC30                           ; $1C96D9 |
  LDA {entity_var_b},x                      ; $1C96DC |
  BEQ code_1C96E5                           ; $1C96DF |
  DEC {entity_var_b},x                      ; $1C96E1 |
  RTS                                       ; $1C96E4 |

code_1C96E5:
  LDA $14                                   ; $1C96E5 |
  AND #$40                                  ; $1C96E7 |
  BNE code_1C96F9                           ; $1C96E9 |
  JSR distance_to_player                    ; $1C96EB |
  CMP #$5A                                  ; $1C96EE |
  BCS code_1C96D3                           ; $1C96F0 |
  JSR vertical_distance_to_player           ; $1C96F2 |
  CMP #$32                                  ; $1C96F5 |
  BCS code_1C96D3                           ; $1C96F7 |
code_1C96F9:
  JSR code_1C974E                           ; $1C96F9 |
  JSR code_1FEF87                           ; $1C96FC |
  BCS code_1C9706                           ; $1C96FF |
  LDA #$FF                                  ; $1C9701 |
  STA {entity_var_a},x                      ; $1C9703 |
code_1C9706:
  LDY #$1E                                  ; $1C9706 |
  JSR code_1FE7B7                           ; $1C9708 |
  BCS code_1C971A                           ; $1C970B |
  LDY #$24                                  ; $1C970D |
  JSR code_1FEA3F                           ; $1C970F |
  BCC code_1C96D3                           ; $1C9712 |
  INC {entity_var_c},x                      ; $1C9714 |
  JMP code_1FEC4A                           ; $1C9717 |

code_1C971A:
  LDA #$38                                  ; $1C971A |
  CMP {animation_index},x                   ; $1C971C |
  BEQ code_1C9729                           ; $1C971F |
  JSR code_1FEA98                           ; $1C9721 |
  LDA #$CB                                  ; $1C9724 |
  STA {sprite_flags},x                      ; $1C9726 |
code_1C9729:
  LDA {animation_frame},x                   ; $1C9729 |
  CMP #$03                                  ; $1C972C |
  BNE code_1C977C                           ; $1C972E |
  LDA {entity_var_c},x                      ; $1C9730 |
  BNE code_1C974E                           ; $1C9733 |
  LDA {entity_var_a},x                      ; $1C9735 |
  BEQ code_1C974E                           ; $1C9738 |
  LDA #$D6                                  ; $1C973A |
  STA {entity_handler_low},x                ; $1C973C |
  LDA #$96                                  ; $1C973F |
  STA {entity_handler_high},x               ; $1C9741 |
  LDA #$5A                                  ; $1C9744 |
  STA {entity_var_b},x                      ; $1C9746 |
  LDA #$49                                  ; $1C9749 |
  JMP code_1FEA98                           ; $1C974B |

code_1C974E:
  LDA #$45                                  ; $1C974E |
  JSR code_1FEC5D                           ; $1C9750 |
  LDA #$FC                                  ; $1C9753 |
  STA {entity_handler_low},x                ; $1C9755 |
  LDA #$96                                  ; $1C9758 |
  STA {entity_handler_high},x               ; $1C975A |
  LDA #$00                                  ; $1C975D |
  STA {y_speed_frac},x                      ; $1C975F |
  LDA #$04                                  ; $1C9762 |
  STA {y_speed},x                           ; $1C9764 |
  LDA #$37                                  ; $1C9767 |
  JSR code_1FEA98                           ; $1C9769 |
  LDA #$F1                                  ; $1C976C |
  STA {sprite_flags},x                      ; $1C976E |
  LDA #$00                                  ; $1C9771 |
  STA {entity_var_a},x                      ; $1C9773 |
  STA {entity_var_c},x                      ; $1C9776 |
  STA {entity_var_d},x                      ; $1C9779 |
code_1C977C:
  RTS                                       ; $1C977C |

  LDY {entity_var_b},x                      ; $1C977D |
  LDA {entity_type},y                       ; $1C9780 |
  CMP #$25                                  ; $1C9783 |
  BEQ code_1C97BA                           ; $1C9785 |
  JSR distance_to_player                    ; $1C9787 |
  CMP #$20                                  ; $1C978A |
  BCS code_1C97BA                           ; $1C978C |
  JSR code_1FF16F                           ; $1C978E |
  BCS code_1C97BA                           ; $1C9791 |
  LDA #$D0                                  ; $1C9793 |
  STA {sprite_flags},y                      ; $1C9795 |
  LDA #$0A                                  ; $1C9798 |
  STA {entity_life},y                       ; $1C979A |
  LDA #$25                                  ; $1C979D |
  STA {entity_type},y                       ; $1C979F |
  LDA #$4F                                  ; $1C97A2 |
  JSR code_1FEAA4                           ; $1C97A4 |
  LDA #$00                                  ; $1C97A7 |
  STA {y_speed_frac},y                      ; $1C97A9 |
  LDA #$05                                  ; $1C97AC |
  STA {y_speed},y                           ; $1C97AE |
  LDA #$19                                  ; $1C97B1 |
  STA {entity_var_a},y                      ; $1C97B3 |
  TYA                                       ; $1C97B6 |
  STA {entity_var_b},x                      ; $1C97B7 |
code_1C97BA:
  RTS                                       ; $1C97BA |

  LDA {animation_frame},x                   ; $1C97BB |
  BNE code_1C97D3                           ; $1C97BE |
  LDA #$00                                  ; $1C97C0 |
  STA {animation_timer},x                   ; $1C97C2 |
  JSR apply_vertical_speed_up_alt           ; $1C97C5 |
  DEC {entity_var_a},x                      ; $1C97C8 |
  BNE code_1C97BA                           ; $1C97CB |
  LDA #$01                                  ; $1C97CD |
  STA {animation_frame},x                   ; $1C97CF |
  RTS                                       ; $1C97D2 |

code_1C97D3:
  CMP #$02                                  ; $1C97D3 |
  BNE code_1C97BA                           ; $1C97D5 |
  LDA {animation_timer},x                   ; $1C97D7 |
  CMP #$0A                                  ; $1C97DA |
  BNE code_1C97BA                           ; $1C97DC |
  LDA #$51                                  ; $1C97DE |
  JSR code_1FEA98                           ; $1C97E0 |
  LDA #$01                                  ; $1C97E3 |
  STA {y_speed},x                           ; $1C97E5 |
  LDA #$F2                                  ; $1C97E8 |
  STA {entity_handler_low},x                ; $1C97EA |
  LDA #$97                                  ; $1C97ED |
  STA {entity_handler_high},x               ; $1C97EF |
  JSR apply_vertical_speed_down_alt         ; $1C97F2 |
  RTS                                       ; $1C97F5 |

  LDA #$05                                  ; $1C97F6 |
  STA {entity_handler_low},x                ; $1C97F8 |
  LDA #$98                                  ; $1C97FB |
  STA {entity_handler_high},x               ; $1C97FD |
  LDA #$30                                  ; $1C9800 |
  STA {entity_var_a},x                      ; $1C9802 |
  JSR code_1FEA65                           ; $1C9805 |
  LDA {entity_var_a},x                      ; $1C9808 |
  BNE code_1C9812                           ; $1C980B |
  LDA #$60                                  ; $1C980D |
  STA {entity_var_a},x                      ; $1C980F |
code_1C9812:
  DEC {entity_var_a},x                      ; $1C9812 |
  BNE code_1C9864                           ; $1C9815 |
  LDA #$68                                  ; $1C9817 |
  JSR code_1FEA98                           ; $1C9819 |
  LDA #$26                                  ; $1C981C |
  STA {entity_handler_low},x                ; $1C981E |
  LDA #$98                                  ; $1C9821 |
  STA {entity_handler_high},x               ; $1C9823 |
  LDA {animation_timer},x                   ; $1C9826 |
  CMP #$04                                  ; $1C9829 |
  BNE code_1C9864                           ; $1C982B |
  LDA {animation_frame},x                   ; $1C982D |
  TAY                                       ; $1C9830 |
  CMP #$10                                  ; $1C9831 |
  BEQ code_1C984D                           ; $1C9833 |
  AND #$01                                  ; $1C9835 |
  BEQ code_1C9864                           ; $1C9837 |
  TYA                                       ; $1C9839 |
  LSR                                       ; $1C983A |
  TAY                                       ; $1C983B |
  LDA {y_position_low},x                    ; $1C983C |
  CLC                                       ; $1C983F |
  ADC $9865,y                               ; $1C9840 |
  STA {y_position_low},x                    ; $1C9843 |
  LDA $986D,y                               ; $1C9846 |
  STA {sprite_flags},x                      ; $1C9849 |
  RTS                                       ; $1C984C |

code_1C984D:
  LDA #$67                                  ; $1C984D |
  JSR code_1FEA98                           ; $1C984F |
  LDA #$05                                  ; $1C9852 |
  STA {entity_handler_low},x                ; $1C9854 |
  LDA #$98                                  ; $1C9857 |
  STA {entity_handler_high},x               ; $1C9859 |
  LDA #$C0                                  ; $1C985C |
  STA {sprite_flags},x                      ; $1C985E |
  JSR code_1FEC4A                           ; $1C9861 |
code_1C9864:
  RTS                                       ; $1C9864 |

  db $FC, $FC, $FC, $FC, $04, $04, $04, $04 ; $1C9865 |
  db $C0, $D0, $D3, $D4, $D5, $D4, $D3, $D0 ; $1C986D |

  LDA #$00                                  ; $1C9875 |
  STA {animation_timer},x                   ; $1C9877 |
  LDA {entity_display_flags}                ; $1C987A |
  AND #$40                                  ; $1C987D |
  STA $00                                   ; $1C987F |
  LDA {entity_display_flags},x              ; $1C9881 |
  AND #$40                                  ; $1C9884 |
  EOR $00                                   ; $1C9886 |
  BNE code_1C98D0                           ; $1C9888 |
  LDY {entity_var_a},x                      ; $1C988A |
  BEQ code_1C9896                           ; $1C988D |
  LDA {entity_type},y                       ; $1C988F |
  CMP #$29                                  ; $1C9892 |
  BEQ code_1C98F8                           ; $1C9894 |
code_1C9896:
  JSR code_1FF16F                           ; $1C9896 |
  BCS code_1C98F8                           ; $1C9899 |
  LDA #$C7                                  ; $1C989B |
  STA {sprite_flags},y                      ; $1C989D |
  LDA #$01                                  ; $1C98A0 |
  STA {entity_life},y                       ; $1C98A2 |
  LDA #$29                                  ; $1C98A5 |
  STA {entity_type},y                       ; $1C98A7 |
  LDA #$0C                                  ; $1C98AA |
  STA $0F                                   ; $1C98AC |
  LDA {entity_display_flags},x              ; $1C98AE |
  AND #$40                                  ; $1C98B1 |
  BEQ code_1C98B7                           ; $1C98B3 |
  INC $0F                                   ; $1C98B5 |
code_1C98B7:
  LDA $0F                                   ; $1C98B7 |
  STA $10                                   ; $1C98B9 |
  LDA #$54                                  ; $1C98BB |
  JSR code_1FEAF5                           ; $1C98BD |
  LDA {entity_display_flags},x              ; $1C98C0 |
  AND #$40                                  ; $1C98C3 |
  ORA {entity_display_flags},y              ; $1C98C5 |
  STA {entity_display_flags},y              ; $1C98C8 |
  TYA                                       ; $1C98CB |
  STA {entity_var_a},x                      ; $1C98CC |
  RTS                                       ; $1C98CF |

code_1C98D0:
  LDA #$DF                                  ; $1C98D0 |
  STA {entity_handler_low},x                ; $1C98D2 |
  LDA #$98                                  ; $1C98D5 |
  STA {entity_handler_high},x               ; $1C98D7 |
  LDA #$01                                  ; $1C98DA |
  STA {animation_frame},x                   ; $1C98DC |
  LDA {animation_timer},x                   ; $1C98DF |
  CMP #$08                                  ; $1C98E2 |
  BNE code_1C98F8                           ; $1C98E4 |
  LDA {entity_display_flags},x              ; $1C98E6 |
  EOR #$40                                  ; $1C98E9 |
  STA {entity_display_flags},x              ; $1C98EB |
  LDA #$75                                  ; $1C98EE |
  STA {entity_handler_low},x                ; $1C98F0 |
  LDA #$98                                  ; $1C98F3 |
  STA {entity_handler_high},x               ; $1C98F5 |
code_1C98F8:
  RTS                                       ; $1C98F8 |

  LDA {entity_display_flags},x              ; $1C98F9 |
  AND #$40                                  ; $1C98FC |
  BNE code_1C9921                           ; $1C98FE |
  JSR reset_vertical_speed                  ; $1C9900 |
  LDA #$0D                                  ; $1C9903 |
  STA {entity_handler_low},x                ; $1C9905 |
  LDA #$99                                  ; $1C9908 |
  STA {entity_handler_high},x               ; $1C990A |
  LDA #$00                                  ; $1C990D |
  STA {animation_timer},x                   ; $1C990F |
  LDY #$13                                  ; $1C9912 |
  JSR code_1FE7B7                           ; $1C9914 |
  BCS code_1C9940                           ; $1C9917 |
code_1C9919:
  LDA {y_position_high},x                   ; $1C9919 |
  BEQ code_1C98F8                           ; $1C991C |
  JMP code_1FF2C4                           ; $1C991E |

code_1C9921:
  JSR code_1FEA29                           ; $1C9921 |
  LDA #$2E                                  ; $1C9924 |
  STA {entity_handler_low},x                ; $1C9926 |
  LDA #$99                                  ; $1C9929 |
  STA {entity_handler_high},x               ; $1C992B |
  LDA #$00                                  ; $1C992E |
  STA {animation_timer},x                   ; $1C9930 |
  JSR apply_gravity_upwards                 ; $1C9933 |
  JSR apply_vertical_speed_up               ; $1C9936 |
  LDY #$14                                  ; $1C9939 |
  JSR code_1FE7A8                           ; $1C993B |
  BCC code_1C9919                           ; $1C993E |
code_1C9940:
  LDA #$F8                                  ; $1C9940 |
  STA {entity_handler_low},x                ; $1C9942 |
  LDA #$98                                  ; $1C9945 |
  STA {entity_handler_high},x               ; $1C9947 |
  LDA #$01                                  ; $1C994A |
  STA {animation_frame},x                   ; $1C994C |
  RTS                                       ; $1C994F |

  LDA #$00                                  ; $1C9950 |
  STA {animation_timer},x                   ; $1C9952 |
  INC {entity_var_b},x                      ; $1C9955 |
  LDA {entity_var_b},x                      ; $1C9958 |
  CMP #$78                                  ; $1C995B |
  BNE code_1C99CB                           ; $1C995D |
  LDA #$01                                  ; $1C995F |
  STA {animation_frame},x                   ; $1C9961 |
  LDA #$6E                                  ; $1C9964 |
  STA {entity_handler_low},x                ; $1C9966 |
  LDA #$99                                  ; $1C9969 |
  STA {entity_handler_high},x               ; $1C996B |
  LDA {sprite_flags},x                      ; $1C996E |
  ORA #$40                                  ; $1C9971 |
  STA {sprite_flags},x                      ; $1C9973 |
  LDA {animation_frame},x                   ; $1C9976 |
  CMP #$06                                  ; $1C9979 |
  BNE code_1C9994                           ; $1C997B |
  LDA {animation_timer},x                   ; $1C997D |
  CMP #$08                                  ; $1C9980 |
  BNE code_1C99CB                           ; $1C9982 |
  LDA #$50                                  ; $1C9984 |
  STA {entity_handler_low},x                ; $1C9986 |
  LDA #$99                                  ; $1C9989 |
  STA {entity_handler_high},x               ; $1C998B |
  LDA #$00                                  ; $1C998E |
  STA {entity_var_b},x                      ; $1C9990 |
  RTS                                       ; $1C9993 |

code_1C9994:
  CMP #$03                                  ; $1C9994 |
  BNE code_1C99FD                           ; $1C9996 |
  LDA {animation_timer},x                   ; $1C9998 |
  CMP #$08                                  ; $1C999B |
  BNE code_1C99FD                           ; $1C999D |
  JSR code_1FF16F                           ; $1C999F |
  BCS code_1C99CB                           ; $1C99A2 |
  LDA #$87                                  ; $1C99A4 |
  STA {sprite_flags},y                      ; $1C99A6 |
  LDA #$2C                                  ; $1C99A9 |
  STA {entity_type},y                       ; $1C99AB |
  LDA {entity_direction},x                  ; $1C99AE |
  STA {entity_direction},y                  ; $1C99B1 |
  AND #$01                                  ; $1C99B4 |
  CLC                                       ; $1C99B6 |
  ADC #$0E                                  ; $1C99B7 |
  STA $10                                   ; $1C99B9 |
  LDA #$57                                  ; $1C99BB |
  JSR code_1FEAF5                           ; $1C99BD |
  LDA #$00                                  ; $1C99C0 |
  STA {x_speed_frac},y                      ; $1C99C2 |
  LDA #$02                                  ; $1C99C5 |
  STA {x_speed},y                           ; $1C99C7 |
  RTS                                       ; $1C99CA |

code_1C99CB:
  LDA $32                                   ; $1C99CB |
  CMP #$07                                  ; $1C99CD |
  BEQ code_1C99FD                           ; $1C99CF |
  JSR code_1FEFF8                           ; $1C99D1 |
  BCS code_1C99FD                           ; $1C99D4 |
  LDA {x_position_low},x                    ; $1C99D6 |
  SEC                                       ; $1C99D9 |
  SBC {x_position_low},y                    ; $1C99DA |
  LDA {x_position_high},x                   ; $1C99DD |
  SBC {x_position_high},y                   ; $1C99E0 |
  BCS code_1C99EE                           ; $1C99E3 |
  LDA {entity_display_flags},x              ; $1C99E5 |
  AND #$20                                  ; $1C99E8 |
  BEQ code_1C99FD                           ; $1C99EA |
  BNE code_1C99F5                           ; $1C99EC |
code_1C99EE:
  LDA {entity_display_flags},x              ; $1C99EE |
  AND #$20                                  ; $1C99F1 |
  BNE code_1C99FD                           ; $1C99F3 |
code_1C99F5:
  LDA {sprite_flags},x                      ; $1C99F5 |
  AND #$BF                                  ; $1C99F8 |
  STA {sprite_flags},x                      ; $1C99FA |
code_1C99FD:
  RTS                                       ; $1C99FD |

  JSR code_1C9BA5                           ; $1C99FE |
  LDA {animation_frame},x                   ; $1C9A01 |
  BNE code_1C9A23                           ; $1C9A04 |
  LDA #$00                                  ; $1C9A06 |
  STA {animation_timer},x                   ; $1C9A08 |
  JSR face_player                           ; $1C9A0B |
  JSR code_1FEC30                           ; $1C9A0E |
  JSR distance_to_player                    ; $1C9A11 |
  CMP #$40                                  ; $1C9A14 |
  BCS code_1C9A2F                           ; $1C9A16 |
  LDA #$01                                  ; $1C9A18 |
  STA {animation_frame},x                   ; $1C9A1A |
  LDA #$C1                                  ; $1C9A1D |
  STA {sprite_flags},x                      ; $1C9A1F |
  RTS                                       ; $1C9A22 |

code_1C9A23:
  CMP #$03                                  ; $1C9A23 |
  BNE code_1C9A2F                           ; $1C9A25 |
  LDA #$0C                                  ; $1C9A27 |
  STA {entity_var_a},x                      ; $1C9A29 |
  JSR code_1C9B86                           ; $1C9A2C |
code_1C9A2F:
  RTS                                       ; $1C9A2F |

  JSR code_1C9BA5                           ; $1C9A30 |
  LDA {animation_index},x                   ; $1C9A33 |
  CMP #$99                                  ; $1C9A36 |
  BNE code_1C9A46                           ; $1C9A38 |
  LDA {animation_frame},x                   ; $1C9A3A |
  CMP #$03                                  ; $1C9A3D |
  BNE code_1C9A2F                           ; $1C9A3F |
  LDA #$9A                                  ; $1C9A41 |
  JMP code_1FEA98                           ; $1C9A43 |

code_1C9A46:
  LDA {entity_var_a},x                      ; $1C9A46 |
  BEQ code_1C9A61                           ; $1C9A49 |
  DEC {entity_var_a},x                      ; $1C9A4B |
  BNE code_1C9A61                           ; $1C9A4E |
  LDA #$00                                  ; $1C9A50 |
  STA $00                                   ; $1C9A52 |
  LDY {entity_var_f},x                      ; $1C9A54 |
  LDA {entity_type},y                       ; $1C9A57 |
  CMP #$9F                                  ; $1C9A5A |
  BEQ code_1C9A61                           ; $1C9A5C |
  JSR code_1C9B35                           ; $1C9A5E |
code_1C9A61:
  JSR code_1C9B17                           ; $1C9A61 |
  LDA {y_speed},x                           ; $1C9A64 |
  BPL code_1C9A2F                           ; $1C9A67 |
  LDA $10                                   ; $1C9A69 |
  AND #$10                                  ; $1C9A6B |
  BNE code_1C9A87                           ; $1C9A6D |
  LDA #$BC                                  ; $1C9A6F |
  STA {entity_handler_low},x                ; $1C9A71 |
  LDA #$9A                                  ; $1C9A74 |
  STA {entity_handler_high},x               ; $1C9A76 |
  LDA #$00                                  ; $1C9A79 |
  STA {animation_timer},x                   ; $1C9A7B |
  STA {animation_frame},x                   ; $1C9A7E |
  LDA #$0C                                  ; $1C9A81 |
  STA {entity_var_a},x                      ; $1C9A83 |
  RTS                                       ; $1C9A86 |

code_1C9A87:
  LDA #$9E                                  ; $1C9A87 |
  STA {entity_handler_low},x                ; $1C9A89 |
  LDA #$9A                                  ; $1C9A8C |
  STA {entity_handler_high},x               ; $1C9A8E |
  LDA #$00                                  ; $1C9A91 |
  STA {x_speed_frac},x                      ; $1C9A93 |
  STA {x_speed},x                           ; $1C9A96 |
  LDA #$98                                  ; $1C9A99 |
  JMP code_1FEA98                           ; $1C9A9B |

  JSR code_1C9BA5                           ; $1C9A9E |
  LDA {animation_frame},x                   ; $1C9AA1 |
  CMP #$03                                  ; $1C9AA4 |
  BNE code_1C9AAD                           ; $1C9AA6 |
  LDA #$00                                  ; $1C9AA8 |
  STA {animation_timer},x                   ; $1C9AAA |
code_1C9AAD:
  JSR code_1C9B17                           ; $1C9AAD |
  BCC code_1C9B16                           ; $1C9AB0 |
  LDA #$BC                                  ; $1C9AB2 |
  STA {entity_handler_low},x                ; $1C9AB4 |
  LDA #$9A                                  ; $1C9AB7 |
  STA {entity_handler_high},x               ; $1C9AB9 |
  JSR code_1C9BA5                           ; $1C9ABC |
  LDA {animation_index},x                   ; $1C9ABF |
  CMP #$98                                  ; $1C9AC2 |
  BEQ code_1C9AE2                           ; $1C9AC4 |
  LDA #$00                                  ; $1C9AC6 |
  STA {animation_timer},x                   ; $1C9AC8 |
  LDA {entity_var_e},x                      ; $1C9ACB |
  BMI code_1C9AD8                           ; $1C9ACE |
  DEC {entity_var_a},x                      ; $1C9AD0 |
  BNE code_1C9AD8                           ; $1C9AD3 |
  JMP code_1C9B76                           ; $1C9AD5 |

code_1C9AD8:
  JSR code_1C9B17                           ; $1C9AD8 |
  BCC code_1C9B16                           ; $1C9ADB |
  LDA #$98                                  ; $1C9ADD |
  JMP code_1FEA98                           ; $1C9ADF |

code_1C9AE2:
  LDA {entity_var_d},x                      ; $1C9AE2 |
  BEQ code_1C9B05                           ; $1C9AE5 |
  LDA #$00                                  ; $1C9AE7 |
  STA {animation_timer},x                   ; $1C9AE9 |
  DEC {entity_var_d},x                      ; $1C9AEC |
  BNE code_1C9B16                           ; $1C9AEF |
  LDA #$FE                                  ; $1C9AF1 |
  STA {entity_handler_low},x                ; $1C9AF3 |
  LDA #$99                                  ; $1C9AF6 |
  STA {entity_handler_high},x               ; $1C9AF8 |
  LDA #$00                                  ; $1C9AFB |
  STA {entity_var_e},x                      ; $1C9AFD |
  LDA #$99                                  ; $1C9B00 |
  JMP code_1FEA98                           ; $1C9B02 |

code_1C9B05:
  LDA {animation_frame},x                   ; $1C9B05 |
  CMP #$03                                  ; $1C9B08 |
  BNE code_1C9B16                           ; $1C9B0A |
  LDA #$40                                  ; $1C9B0C |
  STA {entity_var_d},x                      ; $1C9B0E |
  LDA #$91                                  ; $1C9B11 |
  STA {sprite_flags},x                      ; $1C9B13 |
code_1C9B16:
  RTS                                       ; $1C9B16 |

code_1C9B17:
  LDA #$15                                  ; $1C9B17 |
  STA $A1                                   ; $1C9B19 |
  LDY #$23                                  ; $1C9B1B |
  JSR code_1FE7B7                           ; $1C9B1D |
  PHP                                       ; $1C9B20 |
  LDA {y_speed},x                           ; $1C9B21 |
  BMI code_1C9B2F                           ; $1C9B24 |
  LDA $10                                   ; $1C9B26 |
  CMP #$80                                  ; $1C9B28 |
  BEQ code_1C9B2F                           ; $1C9B2A |
  JSR reset_vertical_speed                  ; $1C9B2C |
code_1C9B2F:
  PLP                                       ; $1C9B2F |
  LDA #$40                                  ; $1C9B30 |
  STA $A1                                   ; $1C9B32 |
  RTS                                       ; $1C9B34 |

code_1C9B35:
  STX $0F                                   ; $1C9B35 |
  LDA #$02                                  ; $1C9B37 |
  STA $0E                                   ; $1C9B39 |
  LDA {entity_direction},x                  ; $1C9B3B |
  AND #$02                                  ; $1C9B3E |
  ASL                                       ; $1C9B40 |
  ASL                                       ; $1C9B41 |
  STA $0D                                   ; $1C9B42 |
code_1C9B44:
  JSR code_1FF16F                           ; $1C9B44 |
  BCS code_1C9B75                           ; $1C9B47 |
  LDA #$86                                  ; $1C9B49 |
  STA {sprite_flags},y                      ; $1C9B4B |
  LDA #$9F                                  ; $1C9B4E |
  STA {entity_type},y                       ; $1C9B50 |
  LDA #$9C                                  ; $1C9B53 |
  JSR code_1FEAA4                           ; $1C9B55 |
  TYA                                       ; $1C9B58 |
  TAX                                       ; $1C9B59 |
  INC $0D                                   ; $1C9B5A |
  INC $0D                                   ; $1C9B5C |
  LDA $0E                                   ; $1C9B5E |
  CMP #$01                                  ; $1C9B60 |
  BNE code_1C9B68                           ; $1C9B62 |
  TYA                                       ; $1C9B64 |
  STA {entity_var_f},x                      ; $1C9B65 |
code_1C9B68:
  LDY $0D                                   ; $1C9B68 |
  LDA #$18                                  ; $1C9B6A |
  JSR code_1FF470                           ; $1C9B6C |
  LDX $0F                                   ; $1C9B6F |
  DEC $0E                                   ; $1C9B71 |
  BPL code_1C9B44                           ; $1C9B73 |
code_1C9B75:
  RTS                                       ; $1C9B75 |

code_1C9B76:
  LDA #$20                                  ; $1C9B76 |
  STA {entity_var_a},x                      ; $1C9B78 |
  LDA $E6                                   ; $1C9B7B |\
  ADC $E7                                   ; $1C9B7D | | underwater MET
  STA $E7                                   ; $1C9B7F | | RNG roll
  AND #$01                                  ; $1C9B81 | | 50/50 chance to branch
  BEQ code_1C9B86                           ; $1C9B83 |/
  RTS                                       ; $1C9B85 |

code_1C9B86:
  LDA #$95                                  ; $1C9B86 |
  STA {y_speed_frac},x                      ; $1C9B88 |
  LDA #$02                                  ; $1C9B8B |
  STA {y_speed},x                           ; $1C9B8D |
  LDA #$30                                  ; $1C9B90 |
  STA {entity_handler_low},x                ; $1C9B92 |
  LDA #$9A                                  ; $1C9B95 |
  STA {entity_handler_high},x               ; $1C9B97 |
  JSR face_player                           ; $1C9B9A |
  JSR code_1FEC30                           ; $1C9B9D |
  LDA #$9A                                  ; $1C9BA0 |
  JMP code_1FEA98                           ; $1C9BA2 |

code_1C9BA5:
  LDA {entity_var_c},x                      ; $1C9BA5 |
  BEQ code_1C9BAE                           ; $1C9BA8 |
  DEC {entity_var_c},x                      ; $1C9BAA |
  RTS                                       ; $1C9BAD |

code_1C9BAE:
  LDA {entity_var_b},x                      ; $1C9BAE |
  AND #$01                                  ; $1C9BB1 |
  TAY                                       ; $1C9BB3 |
  LDA $9BF1,y                               ; $1C9BB4 |
  STA {entity_var_c},x                      ; $1C9BB7 |
  INC {entity_var_b},x                      ; $1C9BBA |
  JSR code_1FF16F                           ; $1C9BBD |
  BCS code_1C9BF0                           ; $1C9BC0 |
  LDA #$BF                                  ; $1C9BC2 |
  STA {entity_type},y                       ; $1C9BC4 |
  LDA #$00                                  ; $1C9BC7 |
  STA {sprite_flags},y                      ; $1C9BC9 |
  LDA {entity_direction},x                  ; $1C9BCC |
  STA {entity_direction},y                  ; $1C9BCF |
  AND #$01                                  ; $1C9BD2 |
  CLC                                       ; $1C9BD4 |
  ADC #$46                                  ; $1C9BD5 |
  STA $10                                   ; $1C9BD7 |
  LDA #$8C                                  ; $1C9BD9 |
  JSR code_1FEAF5                           ; $1C9BDB |
  LDA {entity_display_flags},y              ; $1C9BDE |
  AND #$BF                                  ; $1C9BE1 |
  STA {entity_display_flags},y              ; $1C9BE3 |
  LDA #$00                                  ; $1C9BE6 |
  STA {y_speed_frac},y                      ; $1C9BE8 |
  LDA #$01                                  ; $1C9BEB |
  STA {y_speed},y                           ; $1C9BED |
code_1C9BF0:
  RTS                                       ; $1C9BF0 |

  db $78, $28                               ; $1C9BF1 |

  LDY #$06                                  ; $1C9BF3 |
  JSR code_1FE780                           ; $1C9BF5 |
  BCS code_1C9C05                           ; $1C9BF8 |
  LDA $10                                   ; $1C9BFA |
  CMP #$80                                  ; $1C9BFC |
  BNE code_1C9C05                           ; $1C9BFE |
  LDA {y_position_high},x                   ; $1C9C00 |
  BEQ code_1C9BF0                           ; $1C9C03 |
code_1C9C05:
  JMP code_1FF2C4                           ; $1C9C05 |

  LDA {animation_frame},x                   ; $1C9C08 |
  BNE code_1C9C5F                           ; $1C9C0B |
  LDA {animation_timer},x                   ; $1C9C0D |
  CMP #$02                                  ; $1C9C10 |
  BNE code_1C9C5F                           ; $1C9C12 |
  INC {entity_var_a},x                      ; $1C9C14 |
  LDA {entity_var_a},x                      ; $1C9C17 |
  AND #$01                                  ; $1C9C1A |
  BNE code_1C9C5F                           ; $1C9C1C |
  LDA #$02                                  ; $1C9C1E |
  STA $0E                                   ; $1C9C20 |
  STX $0F                                   ; $1C9C22 |
code_1C9C24:
  JSR code_1FF16F                           ; $1C9C24 |
  BCS code_1C9C5F                           ; $1C9C27 |
  LDA #$C7                                  ; $1C9C29 |
  STA {sprite_flags},y                      ; $1C9C2B |
  LDA #$01                                  ; $1C9C2E |
  STA {entity_life},y                       ; $1C9C30 |
  LDA #$32                                  ; $1C9C33 |
  STA {entity_type},y                       ; $1C9C35 |
  LDA {entity_direction},x                  ; $1C9C38 |
  AND #$01                                  ; $1C9C3B |
  CLC                                       ; $1C9C3D |
  ADC #$55                                  ; $1C9C3E |
  STA $10                                   ; $1C9C40 |
  LDA #$02                                  ; $1C9C42 |
  CLC                                       ; $1C9C44 |
  ADC $0E                                   ; $1C9C45 |
  JSR code_1FEAF5                           ; $1C9C47 |
  STY $0D                                   ; $1C9C4A |
  LDX $0E                                   ; $1C9C4C |
  LDA $9C7D,x                               ; $1C9C4E |
  TAY                                       ; $1C9C51 |
  LDX $0D                                   ; $1C9C52 |
  LDA #$10                                  ; $1C9C54 |
  JSR code_1FF470                           ; $1C9C56 |
  LDX $0F                                   ; $1C9C59 |
  DEC $0E                                   ; $1C9C5B |
  BPL code_1C9C24                           ; $1C9C5D |
code_1C9C5F:
  LDY #$15                                  ; $1C9C5F |
  JSR code_1FE7B7                           ; $1C9C61 |
  LDA {entity_direction},x                  ; $1C9C64 |
  ASL                                       ; $1C9C67 |
  AND #$03                                  ; $1C9C68 |
  TAY                                       ; $1C9C6A |
  LDA $0048,y                               ; $1C9C6B |
  AND #$10                                  ; $1C9C6E |
  BEQ code_1C9C79                           ; $1C9C70 |
  LDY #$16                                  ; $1C9C72 |
  JSR code_1FEA3F                           ; $1C9C74 |
  BCC code_1C9C7C                           ; $1C9C77 |
code_1C9C79:
  JSR code_1C852F                           ; $1C9C79 |
code_1C9C7C:
  RTS                                       ; $1C9C7C |

  db $0E, $00, $02                          ; $1C9C7D |

  JSR apply_vertical_speed_up_alt           ; $1C9C80 |
  JSR code_1FEA65                           ; $1C9C83 |
  JSR code_1C8526                           ; $1C9C86 |
  RTS                                       ; $1C9C89 |

  LDA {y_position_low}                      ; $1C9C8A |
  PHA                                       ; $1C9C8D |
  SEC                                       ; $1C9C8E |
  SBC #$20                                  ; $1C9C8F |
  BCS code_1C9C95                           ; $1C9C91 |
  LDA #$00                                  ; $1C9C93 |
code_1C9C95:
  STA {y_position_low}                      ; $1C9C95 |
  JSR distance_to_player                    ; $1C9C98 |
  CMP #$03                                  ; $1C9C9B |
  BCS code_1C9CA6                           ; $1C9C9D |
  JSR vertical_distance_to_player           ; $1C9C9F |
  CMP #$03                                  ; $1C9CA2 |
  BCC code_1C9CB9                           ; $1C9CA4 |
code_1C9CA6:
  JSR get_angle_to_player                   ; $1C9CA6 |
  TAY                                       ; $1C9CA9 |
  LDA #$08                                  ; $1C9CAA |
  JSR code_1FF470                           ; $1C9CAC |
  PLA                                       ; $1C9CAF |
  STA {y_position_low}                      ; $1C9CB0 |
code_1C9CB3:
  JSR code_1FEA65                           ; $1C9CB3 |
  JMP code_1FEA86                           ; $1C9CB6 |

code_1C9CB9:
  LDA {y_position_low}                      ; $1C9CB9 |
  STA {y_position_low},x                    ; $1C9CBC |
  LDA {x_position_low}                      ; $1C9CBF |
  STA {x_position_low},x                    ; $1C9CC2 |
  LDA {x_position_high}                     ; $1C9CC5 |
  STA {x_position_high},x                   ; $1C9CC8 |
  PLA                                       ; $1C9CCB |
  STA {y_position_low}                      ; $1C9CCC |
  LDA #$EA                                  ; $1C9CCF |
  STA {entity_handler_low},x                ; $1C9CD1 |
  LDA #$9C                                  ; $1C9CD4 |
  STA {entity_handler_high},x               ; $1C9CD6 |
  LDA #$03                                  ; $1C9CD9 |
  STA {entity_var_b},x                      ; $1C9CDB |
  LDA #$06                                  ; $1C9CDE |
  STA {entity_var_c},x                      ; $1C9CE0 |
  LDA #$0C                                  ; $1C9CE3 |
  STA {entity_var_a},x                      ; $1C9CE5 |
  BNE code_1C9CFF                           ; $1C9CE8 |
  LDA {entity_var_b},x                      ; $1C9CEA |
  BNE code_1C9D1C                           ; $1C9CED |
  LDA #$06                                  ; $1C9CEF |
  STA {entity_var_b},x                      ; $1C9CF1 |
  DEC {entity_var_a},x                      ; $1C9CF4 |
  LDA {entity_var_a},x                      ; $1C9CF7 |
  AND #$0F                                  ; $1C9CFA |
  STA {entity_var_a},x                      ; $1C9CFC |
code_1C9CFF:
  PHA                                       ; $1C9CFF |
  TAY                                       ; $1C9D00 |
  LDA #$08                                  ; $1C9D01 |
  JSR code_1FF470                           ; $1C9D03 |
  PLA                                       ; $1C9D06 |
  CMP #$0C                                  ; $1C9D07 |
  BNE code_1C9D1C                           ; $1C9D09 |
  DEC {entity_var_c},x                      ; $1C9D0B |
  BNE code_1C9D1C                           ; $1C9D0E |
  LDA #$B3                                  ; $1C9D10 |
  STA {entity_handler_low},x                ; $1C9D12 |
  LDA #$9C                                  ; $1C9D15 |
  STA {entity_handler_high},x               ; $1C9D17 |
  BNE code_1C9CB3                           ; $1C9D1A |
code_1C9D1C:
  JSR code_1FEA65                           ; $1C9D1C |
  JSR code_1FEA86                           ; $1C9D1F |
  DEC {entity_var_b},x                      ; $1C9D22 |
  LDA {y_position_low}                      ; $1C9D25 |
  SEC                                       ; $1C9D28 |
  SBC $3E                                   ; $1C9D29 |
  BEQ code_1C9D34                           ; $1C9D2B |
  CLC                                       ; $1C9D2D |
  ADC {y_position_low},x                    ; $1C9D2E |
  STA {y_position_low},x                    ; $1C9D31 |
code_1C9D34:
  LDA {x_position_low}                      ; $1C9D34 |
  SEC                                       ; $1C9D37 |
  SBC $3C                                   ; $1C9D38 |
  STA $00                                   ; $1C9D3A |
  LDA {x_position_high}                     ; $1C9D3C |
  SBC $3D                                   ; $1C9D3F |
  STA $01                                   ; $1C9D41 |
  ORA $00                                   ; $1C9D43 |
  BEQ code_1C9D58                           ; $1C9D45 |
  LDA {x_position_low},x                    ; $1C9D47 |
  CLC                                       ; $1C9D4A |
  ADC $00                                   ; $1C9D4B |
  STA {x_position_low},x                    ; $1C9D4D |
  LDA {x_position_high},x                   ; $1C9D50 |
  ADC $01                                   ; $1C9D53 |
  STA {x_position_high},x                   ; $1C9D55 |
code_1C9D58:
  RTS                                       ; $1C9D58 |

  LDA {entity_var_h},x                      ; $1C9D59 |
  AND #$01                                  ; $1C9D5C |
  CLC                                       ; $1C9D5E |
  ADC #$01                                  ; $1C9D5F |
  STA {entity_direction},x                  ; $1C9D61 |
  JSR code_1FEC30                           ; $1C9D64 |
  LDA #$CF                                  ; $1C9D67 |
  STA {entity_handler_low},x                ; $1C9D69 |
  LDA #$9D                                  ; $1C9D6C |
  STA {entity_handler_high},x               ; $1C9D6E |
  LDA #$01                                  ; $1C9D71 |
  STA {entity_direction},x                  ; $1C9D73 |
  LDA {entity_var_h},x                      ; $1C9D76 |
  AND #$01                                  ; $1C9D79 |
  BNE code_1C9DCF                           ; $1C9D7B |
  LDA {entity_display_flags},x              ; $1C9D7D |
  AND #$FB                                  ; $1C9D80 |
  STA {entity_display_flags},x              ; $1C9D82 |
  LDA $FC                                   ; $1C9D85 |
  STA {x_position_low},x                    ; $1C9D87 |
  LDA $F9                                   ; $1C9D8A |
  STA {x_position_high},x                   ; $1C9D8C |
  LDA #$9E                                  ; $1C9D8F |
  STA {entity_handler_low},x                ; $1C9D91 |
  LDA #$9D                                  ; $1C9D94 |
  STA {entity_handler_high},x               ; $1C9D96 |
  LDA #$3C                                  ; $1C9D99 |
  STA {entity_var_a},x                      ; $1C9D9B |
  DEC {entity_var_a},x                      ; $1C9D9E |
  BNE code_1C9DCF                           ; $1C9DA1 |
  LDA #$3C                                  ; $1C9DA3 |
  STA {entity_var_a},x                      ; $1C9DA5 |
  JSR code_1FF16F                           ; $1C9DA8 |
  BCS code_1C9DDA                           ; $1C9DAB |
  LDA #$87                                  ; $1C9DAD |
  STA {sprite_flags},y                      ; $1C9DAF |
  LDA #$37                                  ; $1C9DB2 |
  STA {entity_type},y                       ; $1C9DB4 |
  LDA #$57                                  ; $1C9DB7 |
  STA $10                                   ; $1C9DB9 |
  LDA #$5B                                  ; $1C9DBB |
  JSR code_1FEAF5                           ; $1C9DBD |
  LDA #$01                                  ; $1C9DC0 |
  STA {entity_direction},y                  ; $1C9DC2 |
  LDA #$00                                  ; $1C9DC5 |
  STA {x_speed_frac},y                      ; $1C9DC7 |
  LDA #$08                                  ; $1C9DCA |
  STA {x_speed},y                           ; $1C9DCC |
code_1C9DCF:
  LDA {entity_display_flags},x              ; $1C9DCF |
  PHA                                       ; $1C9DD2 |
  JSR code_1FEA65                           ; $1C9DD3 |
  PLA                                       ; $1C9DD6 |
  STA {entity_display_flags},x              ; $1C9DD7 |
code_1C9DDA:
  RTS                                       ; $1C9DDA |

  LDA {entity_display_flags},x              ; $1C9DDB |
  AND #$FB                                  ; $1C9DDE |
  STA {entity_display_flags},x              ; $1C9DE0 |
  LDA {y_position_low},x                    ; $1C9DE3 |
  STA {entity_var_b},x                      ; $1C9DE6 |
  LDA #$F3                                  ; $1C9DE9 |
  STA {entity_handler_low},x                ; $1C9DEB |
  LDA #$9D                                  ; $1C9DEE |
  STA {entity_handler_high},x               ; $1C9DF0 |
  LDA #$00                                  ; $1C9DF3 |
  STA {animation_timer},x                   ; $1C9DF5 |
  JSR face_player                           ; $1C9DF8 |
  JSR code_1FEC30                           ; $1C9DFB |
  LDA {entity_type},x                       ; $1C9DFE |
  CLC                                       ; $1C9E01 |
  ADC #$01                                  ; $1C9E02 |
  STA $00                                   ; $1C9E04 |
  LDY {entity_var_c},x                      ; $1C9E06 |
  LDA {entity_type},y                       ; $1C9E09 |
  CMP $00                                   ; $1C9E0C |
  BEQ code_1C9E49                           ; $1C9E0E |
  LDA #$01                                  ; $1C9E10 |
  STA {animation_frame},x                   ; $1C9E12 |
  LDA #$27                                  ; $1C9E15 |
  STA {entity_handler_low},x                ; $1C9E17 |
  LDA #$9E                                  ; $1C9E1A |
  STA {entity_handler_high},x               ; $1C9E1C |
  LDA {entity_type},x                       ; $1C9E1F |
  AND #$01                                  ; $1C9E22 |
  STA {entity_var_a},x                      ; $1C9E24 |
  LDY {entity_var_a},x                      ; $1C9E27 |
  LDA {animation_timer},x                   ; $1C9E2A |
  CMP $9EC6,y                               ; $1C9E2D |
  BNE code_1C9E49                           ; $1C9E30 |
  LDA {animation_frame},x                   ; $1C9E32 |
  CMP $9EC8,y                               ; $1C9E35 |
  BEQ code_1C9E4C                           ; $1C9E38 |
  CMP $9ECA,y                               ; $1C9E3A |
  BNE code_1C9E49                           ; $1C9E3D |
  LDA #$F3                                  ; $1C9E3F |
  STA {entity_handler_low},x                ; $1C9E41 |
  LDA #$9D                                  ; $1C9E44 |
  STA {entity_handler_high},x               ; $1C9E46 |
code_1C9E49:
  JMP code_1C9EB2                           ; $1C9E49 |

code_1C9E4C:
  STX $0F                                   ; $1C9E4C |
  LDY {entity_var_a},x                      ; $1C9E4E |
  LDA $9ECC,y                               ; $1C9E51 |
  STA $0D                                   ; $1C9E54 |
  JSR code_1FF16F                           ; $1C9E56 |
  BCS code_1C9EB2                           ; $1C9E59 |
  LDA #$01                                  ; $1C9E5B |
  STA {entity_life},y                       ; $1C9E5D |
  LDA {animation_index},x                   ; $1C9E60 |
  CMP #$90                                  ; $1C9E63 |
  BNE code_1C9E6C                           ; $1C9E65 |
  LDA #$02                                  ; $1C9E67 |
  STA {entity_life},y                       ; $1C9E69 |
code_1C9E6C:
  LDA {entity_var_a},x                      ; $1C9E6C |
  TAX                                       ; $1C9E6F |
  LDA $9ECE,x                               ; $1C9E70 |
  STA {sprite_flags},y                      ; $1C9E73 |
  LDX $0F                                   ; $1C9E76 |
  LDA {animation_index},x                   ; $1C9E78 |
  CLC                                       ; $1C9E7B |
  ADC #$01                                  ; $1C9E7C |
  JSR code_1FEAA4                           ; $1C9E7E |
  TYA                                       ; $1C9E81 |
  STA {entity_var_c},x                      ; $1C9E82 |
  LDA {entity_type},x                       ; $1C9E85 |
  CLC                                       ; $1C9E88 |
  ADC #$01                                  ; $1C9E89 |
  STA {entity_type},y                       ; $1C9E8B |
  LDA {entity_direction},x                  ; $1C9E8E |
  STA {entity_direction},y                  ; $1C9E91 |
  LDA {y_position_low},x                    ; $1C9E94 |
  SEC                                       ; $1C9E97 |
  SBC $0D                                   ; $1C9E98 |
  STA {y_position_low},y                    ; $1C9E9A |
  LDA #$A8                                  ; $1C9E9D |
  STA {y_speed_frac},y                      ; $1C9E9F |
  LDA #$05                                  ; $1C9EA2 |
  STA {y_speed},y                           ; $1C9EA4 |
  STY $0E                                   ; $1C9EA7 |
  LDX $0E                                   ; $1C9EA9 |
  LDY #$00                                  ; $1C9EAB |
  JSR catapult_aim_func                     ; $1C9EAD |
  LDX $0F                                   ; $1C9EB0 |
code_1C9EB2:
  LDA $26                                   ; $1C9EB2 |
  CMP #$04                                  ; $1C9EB4 |
  BNE code_1C9EC5                           ; $1C9EB6 |
  LDA {entity_var_b},x                      ; $1C9EB8 |
  SEC                                       ; $1C9EBB |
  SBC $FA                                   ; $1C9EBC |
  BCS code_1C9EC2                           ; $1C9EBE |
  SBC #$0F                                  ; $1C9EC0 |
code_1C9EC2:
  STA {y_position_low},x                    ; $1C9EC2 |
code_1C9EC5:
  RTS                                       ; $1C9EC5 |

  db $04, $08, $07, $02, $0A, $05, $10, $18 ; $1C9EC6 |
  db $87, $C1                               ; $1C9ECE |

  LDY #$07                                  ; $1C9ED0 |
  JSR code_1FE7B7                           ; $1C9ED2 |
  BCS code_1C9EDE                           ; $1C9ED5 |
  LDY #$0E                                  ; $1C9ED7 |
  JSR code_1FEA3F                           ; $1C9ED9 |
  BCC code_1C9EC5                           ; $1C9EDC |
code_1C9EDE:
  LDA {animation_index},x                   ; $1C9EDE |
  CMP #$91                                  ; $1C9EE1 |
  BNE code_1C9EFC                           ; $1C9EE3 |
  JSR code_1FF2C4                           ; $1C9EE5 |
  LDA #$5E                                  ; $1C9EE8 |
  STA {entity_type},x                       ; $1C9EEA |
  LDA #$81                                  ; $1C9EED |
  STA {sprite_flags},x                      ; $1C9EEF |
  LDA #$2B                                  ; $1C9EF2 |
  JSR code_1FEC5D                           ; $1C9EF4 |
  LDA #$92                                  ; $1C9EF7 |
  JMP code_1FEA98                           ; $1C9EF9 |

code_1C9EFC:
  JSR $A56C                                 ; $1C9EFC |
  LDA #$8C                                  ; $1C9EFF |
  STA {entity_type},x                       ; $1C9F01 |
  LDA #$8B                                  ; $1C9F04 |
  STA {sprite_flags},x                      ; $1C9F06 |
  RTS                                       ; $1C9F09 |

  RTS                                       ; $1C9F0A |

  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C9F0B |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C9F13 |
  db $00, $00, $00, $01, $00, $00, $00, $00 ; $1C9F1B |
  db $00, $00, $00, $00, $00, $04, $50, $20 ; $1C9F23 |
  db $00, $60, $00, $40, $00, $00, $00, $40 ; $1C9F2B |
  db $00, $10, $00, $00, $00, $03, $00, $81 ; $1C9F33 |
  db $40, $28, $00, $00, $40, $00, $00, $00 ; $1C9F3B |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C9F43 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C9F4B |
  db $00, $00, $00, $01, $00, $00, $10, $00 ; $1C9F53 |
  db $00, $00, $00, $00, $00, $10, $00, $00 ; $1C9F5B |
  db $00, $00, $00, $00, $00, $50, $00, $04 ; $1C9F63 |
  db $00, $00, $00, $02, $50, $00, $01, $00 ; $1C9F6B |
  db $00, $01, $00, $24, $00, $30, $00, $08 ; $1C9F73 |
  db $00, $00, $00, $0C, $11, $00, $00, $00 ; $1C9F7B |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C9F83 |
  db $00, $00, $00, $00, $00, $00, $00, $08 ; $1C9F8B |
  db $00, $00, $00, $00, $00, $00, $00, $20 ; $1C9F93 |
  db $00, $00, $00, $00, $00, $00, $00, $2C ; $1C9F9B |
  db $04, $00, $00, $00, $00, $00, $00, $08 ; $1C9FA3 |
  db $00, $02, $00, $01, $00, $80, $40, $10 ; $1C9FAB |
  db $40, $00, $00, $00, $00, $00, $00, $82 ; $1C9FB3 |
  db $00, $0C, $00, $00, $40, $00, $00, $00 ; $1C9FBB |
  db $00, $00, $00, $01, $00, $00, $00, $00 ; $1C9FC3 |
  db $00, $10, $00, $00, $00, $00, $00, $00 ; $1C9FCB |
  db $00, $00, $00, $01, $00, $00, $00, $00 ; $1C9FD3 |
  db $00, $00, $01, $22, $10, $40, $10, $88 ; $1C9FDB |
  db $40, $20, $00, $41, $04, $00, $00, $60 ; $1C9FE3 |
  db $04, $10, $00, $08, $00, $04, $00, $22 ; $1C9FEB |
  db $10, $00, $00, $00, $00, $20, $00, $00 ; $1C9FF3 |
  db $00, $40, $10, $02, $10                ; $1C9FFB |

bank $1D
org $A000

  LDA $14                                   ; $1D8000 |
  AND #$40                                  ; $1DA002 |
  BNE code_1DA00D                           ; $1DA004 |
  JSR distance_to_player                    ; $1DA006 |
  CMP #$50                                  ; $1DA009 |
  BCS code_1DA032                           ; $1DA00B |
code_1DA00D:
  LDA #$6D                                  ; $1DA00D |
  JSR code_1FEA98                           ; $1DA00F |
  LDA #$1C                                  ; $1DA012 |
  STA {entity_handler_low},x                ; $1DA014 |
  LDA #$A0                                  ; $1DA017 |
  STA {entity_handler_high},x               ; $1DA019 |
  LDA {animation_frame},x                   ; $1DA01C |
  BEQ code_1DA033                           ; $1DA01F |
  LDA {animation_timer},x                   ; $1DA021 |
  CMP #$08                                  ; $1DA024 |
  BNE code_1DA032                           ; $1DA026 |
  LDA #$6F                                  ; $1DA028 |
  STA {y_speed_frac},x                      ; $1DA02A |
  LDA #$09                                  ; $1DA02D |
  STA {y_speed},x                           ; $1DA02F |
code_1DA032:
  RTS                                       ; $1DA032 |

code_1DA033:
  LDA #$00                                  ; $1DA033 |
  STA {animation_timer},x                   ; $1DA035 |
  LDY #$21                                  ; $1DA038 |
  JSR code_1FE7B7                           ; $1DA03A |
  BCC code_1DA045                           ; $1DA03D |
  LDA #$01                                  ; $1DA03F |
  STA {animation_frame},x                   ; $1DA041 |
  RTS                                       ; $1DA044 |

code_1DA045:
  LDA {entity_var_a},x                      ; $1DA045 |
  BEQ code_1DA04F                           ; $1DA048 |
  DEC {entity_var_a},x                      ; $1DA04A |
  BNE code_1DA088                           ; $1DA04D |
code_1DA04F:
  LDY {entity_var_b},x                      ; $1DA04F |
  LDA {entity_type},y                       ; $1DA052 |
  CMP #$3C                                  ; $1DA055 |
  BEQ code_1DA088                           ; $1DA057 |
  LDA #$B4                                  ; $1DA059 |
  STA {entity_var_a},x                      ; $1DA05B |
  JSR face_player                           ; $1DA05E |
  JSR code_1FEC30                           ; $1DA061 |
  JSR code_1DA089                           ; $1DA064 |
code_1DA067:
  JSR code_1FF16F                           ; $1DA067 |
  BCS code_1DA088                           ; $1DA06A |
  LDA #$87                                  ; $1DA06C |
  STA {sprite_flags},y                      ; $1DA06E |
  TYA                                       ; $1DA071 |
  STA {entity_var_b},x                      ; $1DA072 |
  LDA #$6E                                  ; $1DA075 |
  JSR code_1FEAA4                           ; $1DA077 |
  JSR code_1DA09D                           ; $1DA07A |
  LDA #$08                                  ; $1DA07D |
  JSR code_1FF470                           ; $1DA07F |
  LDX $0D                                   ; $1DA082 |
  DEC $0E                                   ; $1DA084 |
  BPL code_1DA067                           ; $1DA086 |
code_1DA088:
  RTS                                       ; $1DA088 |

code_1DA089:
  JSR get_angle_to_player                   ; $1DA089 |
  STA $0F                                   ; $1DA08C |
  DEC $0F                                   ; $1DA08E |
  LDA $0F                                   ; $1DA090 |
  AND #$0F                                  ; $1DA092 |
  STA $0F                                   ; $1DA094 |
  LDA #$01                                  ; $1DA096 |
  STA $0E                                   ; $1DA098 |
  STX $0D                                   ; $1DA09A |
  RTS                                       ; $1DA09C |

code_1DA09D:
  LDA {entity_type},x                       ; $1DA09D |
  CLC                                       ; $1DA0A0 |
  ADC #$01                                  ; $1DA0A1 |
  STA {entity_type},y                       ; $1DA0A3 |
  TYA                                       ; $1DA0A6 |
  TAX                                       ; $1DA0A7 |
  LDA $0E                                   ; $1DA0A8 |
  ASL                                       ; $1DA0AA |
  CLC                                       ; $1DA0AB |
  ADC $0F                                   ; $1DA0AC |
  AND #$0F                                  ; $1DA0AE |
  TAY                                       ; $1DA0B0 |
code_1DA0B1:
  RTS                                       ; $1DA0B1 |

  JSR entity_gravity_process                ; $1DA0B2 |
  JMP code_1FEA65                           ; $1DA0B5 |

  JSR face_player                           ; $1DA0B8 |
  JSR code_1FEC30                           ; $1DA0BB |
  LDA {entity_var_a},x                      ; $1DA0BE |
  BEQ code_1DA0CD                           ; $1DA0C1 |
  LDA #$00                                  ; $1DA0C3 |
  STA {animation_timer},x                   ; $1DA0C5 |
  DEC {entity_var_a},x                      ; $1DA0C8 |
  BNE code_1DA0B1                           ; $1DA0CB |
code_1DA0CD:
  STA {animation_timer},x                   ; $1DA0CD |
  JSR distance_to_player                    ; $1DA0D0 |
  CMP #$50                                  ; $1DA0D3 |
  BCS code_1DA0B1                           ; $1DA0D5 |
  JSR vertical_distance_to_player           ; $1DA0D7 |
  CMP #$14                                  ; $1DA0DA |
  BCS code_1DA0B1                           ; $1DA0DC |
  LDA #$01                                  ; $1DA0DE |
  STA {animation_frame},x                   ; $1DA0E0 |
  LDA {y_position_low},x                    ; $1DA0E3 |
  SEC                                       ; $1DA0E6 |
  SBC #$03                                  ; $1DA0E7 |
  STA {y_position_low},x                    ; $1DA0E9 |
  LDA #$C1                                  ; $1DA0EC |
  STA {sprite_flags},x                      ; $1DA0EE |
  LDA #$FB                                  ; $1DA0F1 |
  STA {entity_handler_low},x                ; $1DA0F3 |
  LDA #$A0                                  ; $1DA0F6 |
  STA {entity_handler_high},x               ; $1DA0F8 |
  JSR code_1FEFF8                           ; $1DA0FB |
  BCS code_1DA13D                           ; $1DA0FE |
  JSR code_1FF2F3                           ; $1DA100 |
  JSR code_1DA54D                           ; $1DA103 |
  LDA #$02                                  ; $1DA106 |
  STA $0E                                   ; $1DA108 |
code_1DA10A:
  JSR code_1FF16F                           ; $1DA10A |
  BCS code_1DA16C                           ; $1DA10D |
  LDA #$C4                                  ; $1DA10F |
  STA {entity_type},y                       ; $1DA111 |
  LDA #$C6                                  ; $1DA114 |
  STA {sprite_flags},y                      ; $1DA116 |
  LDA #$01                                  ; $1DA119 |
  STA {entity_life},y                       ; $1DA11B |
  LDA #$73                                  ; $1DA11E |
  JSR code_1FEAA4                           ; $1DA120 |
  LDA #$F0                                  ; $1DA123 |
  STA {entity_var_a},y                      ; $1DA125 |
  LDA $0E                                   ; $1DA128 |
  STA {entity_direction},y                  ; $1DA12A |
  JSR code_1FEA34                           ; $1DA12D |
  LDA #$00                                  ; $1DA130 |
  STA {x_speed_frac},y                      ; $1DA132 |
  STA {x_speed},y                           ; $1DA135 |
  DEC $0E                                   ; $1DA138 |
  BPL code_1DA10A                           ; $1DA13A |
  RTS                                       ; $1DA13C |

code_1DA13D:
  LDA {animation_timer},x                   ; $1DA13D |
  CMP #$04                                  ; $1DA140 |
  BNE code_1DA1A3                           ; $1DA142 |
  LDA {animation_frame},x                   ; $1DA144 |
  CMP #$03                                  ; $1DA147 |
  BEQ code_1DA16D                           ; $1DA149 |
  CMP #$08                                  ; $1DA14B |
  BNE code_1DA1A3                           ; $1DA14D |
  LDA {y_position_low},x                    ; $1DA14F |
  CLC                                       ; $1DA152 |
  ADC #$03                                  ; $1DA153 |
  STA {y_position_low},x                    ; $1DA155 |
  LDA #$81                                  ; $1DA158 |
  STA {sprite_flags},x                      ; $1DA15A |
  LDA #$3C                                  ; $1DA15D |
  STA {entity_var_a},x                      ; $1DA15F |
  LDA #$B8                                  ; $1DA162 |
  STA {entity_handler_low},x                ; $1DA164 |
  LDA #$A0                                  ; $1DA167 |
  STA {entity_handler_high},x               ; $1DA169 |
code_1DA16C:
  RTS                                       ; $1DA16C |

code_1DA16D:
  STX $0F                                   ; $1DA16D |
  LDA #$02                                  ; $1DA16F |
  STA $0E                                   ; $1DA171 |
  LDA {entity_direction},x                  ; $1DA173 |
  AND #$02                                  ; $1DA176 |
  ASL                                       ; $1DA178 |
  ASL                                       ; $1DA179 |
  STA $0D                                   ; $1DA17A |
code_1DA17C:
  JSR code_1FF16F                           ; $1DA17C |
  BCS code_1DA1A3                           ; $1DA17F |
  LDA #$86                                  ; $1DA181 |
  STA {sprite_flags},y                      ; $1DA183 |
  LDA #$51                                  ; $1DA186 |
  STA {entity_type},y                       ; $1DA188 |
  LDA #$85                                  ; $1DA18B |
  JSR code_1FEAA4                           ; $1DA18D |
  TYA                                       ; $1DA190 |
  TAX                                       ; $1DA191 |
  INC $0D                                   ; $1DA192 |
  INC $0D                                   ; $1DA194 |
  LDY $0D                                   ; $1DA196 |
  LDA #$18                                  ; $1DA198 |
  JSR code_1FF470                           ; $1DA19A |
  LDX $0F                                   ; $1DA19D |
  DEC $0E                                   ; $1DA19F |
  BPL code_1DA17C                           ; $1DA1A1 |
code_1DA1A3:
  RTS                                       ; $1DA1A3 |

  DEC {entity_var_a},x                      ; $1DA1A4 |
  BNE code_1DA1AC                           ; $1DA1A7 |
  JMP code_1DA54D                           ; $1DA1A9 |

code_1DA1AC:
  LDY #$13                                  ; $1DA1AC |
  JSR code_1FE7B7                           ; $1DA1AE |
  BCS code_1DA1C4                           ; $1DA1B1 |
  LDA {entity_direction},x                  ; $1DA1B3 |
  AND #$03                                  ; $1DA1B6 |
  BEQ code_1DA1A3                           ; $1DA1B8 |
  LDY #$1A                                  ; $1DA1BA |
  JSR code_1FEA3F                           ; $1DA1BC |
  BCC code_1DA1A3                           ; $1DA1BF |
  JMP code_1FEC4A                           ; $1DA1C1 |

code_1DA1C4:
  LDA $E6                                   ; $1DA1C4 |\  RNG roll:
  ADC $E7                                   ; $1DA1C6 | | random index into speed
  STA $E6                                   ; $1DA1C8 | | table for mini METs
  AND #$01                                  ; $1DA1CA | | only 2 possibilities
  TAY                                       ; $1DA1CC |/
  LDA mini_MET_x_speeds_lo,y                ; $1DA1CD |\ X velocity
  STA {x_speed_frac},x                      ; $1DA1D0 |/
  LDA mini_MET_y_speeds_lo,y                ; $1DA1D3 |\
  STA {y_speed_frac},x                      ; $1DA1D6 | | Y velocity
  LDA mini_MET_y_speeds_hi,y                ; $1DA1D9 | | (high and low)
  STA {y_speed},x                           ; $1DA1DC |/
  RTS                                       ; $1DA1DF |

mini_MET_y_speeds_lo:
  db $D4, $77                               ; $1DA1E0 |

mini_MET_y_speeds_hi:
  db $02, $03                               ; $1DA1E2 |

mini_MET_x_speeds_lo:
  db $58, $48                               ; $1DA1E4 |

  LDA {x_speed_frac},x                      ; $1DA1E6 |
  STA {y_speed_frac},x                      ; $1DA1E9 |
  LDA {x_speed},x                           ; $1DA1EC |
  STA {y_speed},x                           ; $1DA1EF |
  LDY #$01                                  ; $1DA1F2 |
  LDA {entity_display_flags},x              ; $1DA1F4 |
  STA {entity_var_a},x                      ; $1DA1F7 |
  AND #$20                                  ; $1DA1FA |
  BNE code_1DA1FF                           ; $1DA1FC |
  INY                                       ; $1DA1FE |
code_1DA1FF:
  TYA                                       ; $1DA1FF |
  ORA #$04                                  ; $1DA200 |
  STA {entity_direction},x                  ; $1DA202 |
  LDA #$0F                                  ; $1DA205 |
  STA {entity_handler_low},x                ; $1DA207 |
  LDA #$A2                                  ; $1DA20A |
  STA {entity_handler_high},x               ; $1DA20C |
  LDY #$07                                  ; $1DA20F |
  INC {y_speed},x                           ; $1DA211 |
  JSR code_1FE747                           ; $1DA214 |
  DEC {y_speed},x                           ; $1DA217 |
  BCC code_1DA21F                           ; $1DA21A |
  JMP code_1DA273                           ; $1DA21C |

code_1DA21F:
  INC {y_position_low},x                    ; $1DA21F |
  INC {y_position_low},x                    ; $1DA222 |
  JSR code_1DA2A6                           ; $1DA225 |
  LDY #$0E                                  ; $1DA228 |
  INC {x_speed},x                           ; $1DA22A |
  JSR code_1FEA3F                           ; $1DA22D |
  DEC {x_speed},x                           ; $1DA230 |
  LDA {entity_var_a},x                      ; $1DA233 |
  STA {entity_display_flags},x              ; $1DA236 |
  BCC code_1DA247                           ; $1DA239 |
  LDY #$07                                  ; $1DA23B |
  JSR code_1FEA52                           ; $1DA23D |
  BCC code_1DA290                           ; $1DA240 |
  JSR $852F                                 ; $1DA242 |
  BNE code_1DA24A                           ; $1DA245 |
code_1DA247:
  JSR code_1DA291                           ; $1DA247 |
code_1DA24A:
  LDA {entity_direction},x                  ; $1DA24A |
  AND #$08                                  ; $1DA24D |
  BNE code_1DA25C                           ; $1DA24F |
  LDA #$0F                                  ; $1DA251 |
  STA {entity_handler_low},x                ; $1DA253 |
  LDA #$A2                                  ; $1DA256 |
  STA {entity_handler_high},x               ; $1DA258 |
  RTS                                       ; $1DA25B |

code_1DA25C:
  LDA #$66                                  ; $1DA25C |
  STA {entity_handler_low},x                ; $1DA25E |
  LDA #$A2                                  ; $1DA261 |
  STA {entity_handler_high},x               ; $1DA263 |
  LDY #$08                                  ; $1DA266 |
  INC {y_speed},x                           ; $1DA268 |
  JSR code_1FE780                           ; $1DA26B |
  DEC {y_speed},x                           ; $1DA26E |
  BCC code_1DA287                           ; $1DA271 |
code_1DA273:
  LDY #$0E                                  ; $1DA273 |
  JSR code_1FEA3F                           ; $1DA275 |
  LDA {entity_var_a},x                      ; $1DA278 |
  STA {entity_display_flags},x              ; $1DA27B |
  BCC code_1DA290                           ; $1DA27E |
  LDA {entity_direction},x                  ; $1DA280 |
  EOR #$0C                                  ; $1DA283 |
  BNE code_1DA2AB                           ; $1DA285 |
code_1DA287:
  JSR code_1DA2A6                           ; $1DA287 |
  DEC {y_position_low},x                    ; $1DA28A |
  DEC {y_position_low},x                    ; $1DA28D |
code_1DA290:
  RTS                                       ; $1DA290 |

code_1DA291:
  JSR $8538                                 ; $1DA291 |
  AND #$01                                  ; $1DA294 |
  BNE code_1DA29F                           ; $1DA296 |
  DEC {x_position_low},x                    ; $1DA298 |
  DEC {x_position_low},x                    ; $1DA29B |
  RTS                                       ; $1DA29E |

code_1DA29F:
  INC {x_position_low},x                    ; $1DA29F |
  INC {x_position_low},x                    ; $1DA2A2 |
  RTS                                       ; $1DA2A5 |

code_1DA2A6:
  LDA {entity_direction},x                  ; $1DA2A6 |
  EOR #$03                                  ; $1DA2A9 |
code_1DA2AB:
  STA {entity_direction},x                  ; $1DA2AB |
  LDA #$28                                  ; $1DA2AE |
  STA {entity_handler_low},x                ; $1DA2B0 |
  LDA #$A2                                  ; $1DA2B3 |
  STA {entity_handler_high},x               ; $1DA2B5 |
  RTS                                       ; $1DA2B8 |

  JSR distance_to_player                    ; $1DA2B9 |
  CMP #$50                                  ; $1DA2BC |
  BCS code_1DA31E                           ; $1DA2BE |
  JSR vertical_distance_to_player           ; $1DA2C0 |
  CMP #$10                                  ; $1DA2C3 |
  BCS code_1DA31E                           ; $1DA2C5 |
  LDA #$75                                  ; $1DA2C7 |
  JSR code_1FEA98                           ; $1DA2C9 |
  LDA #$D7                                  ; $1DA2CC |
  STA {entity_handler_low},x                ; $1DA2CE |
  LDA #$A2                                  ; $1DA2D1 |
  STA {entity_handler_high},x               ; $1DA2D3 |
  RTS                                       ; $1DA2D6 |

  LDA {animation_timer},x                   ; $1DA2D7 |
  CMP #$04                                  ; $1DA2DA |
  BNE code_1DA31E                           ; $1DA2DC |
  LDA {animation_frame},x                   ; $1DA2DE |
  BNE code_1DA2F1                           ; $1DA2E1 |
  LDA {y_position_low},x                    ; $1DA2E3 |
  CLC                                       ; $1DA2E6 |
  ADC #$04                                  ; $1DA2E7 |
  STA {y_position_low},x                    ; $1DA2E9 |
  LDA #$D1                                  ; $1DA2EC |
  STA {sprite_flags},x                      ; $1DA2EE |
code_1DA2F1:
  CMP #$02                                  ; $1DA2F1 |
  BNE code_1DA31E                           ; $1DA2F3 |
  LDA #$76                                  ; $1DA2F5 |
  JSR code_1FEA98                           ; $1DA2F7 |
  LDA #$0A                                  ; $1DA2FA |
  STA {entity_handler_low},x                ; $1DA2FC |
  LDA #$A3                                  ; $1DA2FF |
  STA {entity_handler_high},x               ; $1DA301 |
  JSR face_player                           ; $1DA304 |
  JSR code_1FEC30                           ; $1DA307 |
  LDY #$13                                  ; $1DA30A |
  JSR code_1FE7B7                           ; $1DA30C |
  BCC code_1DA31E                           ; $1DA30F |
  LDY #$1A                                  ; $1DA311 |
  JSR code_1FEA3F                           ; $1DA313 |
  JSR $8526                                 ; $1DA316 |
  BCC code_1DA31E                           ; $1DA319 |
  JSR code_1FEC4A                           ; $1DA31B |
code_1DA31E:
  RTS                                       ; $1DA31E |

  LDA #$20                                  ; $1DA31F |
  STA {entity_var_a},x                      ; $1DA321 |
  LDA #$2D                                  ; $1DA324 |
  STA {entity_var_b},x                      ; $1DA326 |
  LDA #$33                                  ; $1DA329 |
  STA {entity_handler_low},x                ; $1DA32B |
  LDA #$A3                                  ; $1DA32E |
  STA {entity_handler_high},x               ; $1DA330 |
  JSR code_1FEA65                           ; $1DA333 |
  JSR $8526                                 ; $1DA336 |
  DEC {entity_var_a},x                      ; $1DA339 |
  BNE code_1DA346                           ; $1DA33C |
  JSR $852F                                 ; $1DA33E |
  LDA #$40                                  ; $1DA341 |
  STA {entity_var_a},x                      ; $1DA343 |
code_1DA346:
  DEC {entity_var_b},x                      ; $1DA346 |
  BNE code_1DA379                           ; $1DA349 |
  LDA #$96                                  ; $1DA34B |
  STA {entity_var_b},x                      ; $1DA34D |
  JSR code_1DA089                           ; $1DA350 |
code_1DA353:
  JSR code_1FF16F                           ; $1DA353 |
  BCS code_1DA379                           ; $1DA356 |
  LDA #$87                                  ; $1DA358 |
  STA {sprite_flags},y                      ; $1DA35A |
  LDA #$78                                  ; $1DA35D |
  JSR code_1FEAA4                           ; $1DA35F |
  LDA {y_position_low},y                    ; $1DA362 |
  SEC                                       ; $1DA365 |
  SBC #$04                                  ; $1DA366 |
  STA {y_position_low},y                    ; $1DA368 |
  JSR code_1DA09D                           ; $1DA36B |
  LDA #$08                                  ; $1DA36E |
  JSR code_1FF470                           ; $1DA370 |
  LDX $0D                                   ; $1DA373 |
  DEC $0E                                   ; $1DA375 |
  BPL code_1DA353                           ; $1DA377 |
code_1DA379:
  RTS                                       ; $1DA379 |

  LDA {animation_frame},x                   ; $1DA37A |
  BNE code_1DA396                           ; $1DA37D |
  STA {animation_timer},x                   ; $1DA37F |
  INC {entity_var_a},x                      ; $1DA382 |
  LDA {entity_var_a},x                      ; $1DA385 |
  CMP #$78                                  ; $1DA388 |
  BCC code_1DA379                           ; $1DA38A |
  LDA #$01                                  ; $1DA38C |
  STA {animation_frame},x                   ; $1DA38E |
  LDA #$37                                  ; $1DA391 |
  JMP code_1FEC5D                           ; $1DA393 |

code_1DA396:
  CMP #$05                                  ; $1DA396 |
  BNE code_1DA379                           ; $1DA398 |
  LDA {animation_timer},x                   ; $1DA39A |
  CMP #$03                                  ; $1DA39D |
  BNE code_1DA379                           ; $1DA39F |
  LDA #$7A                                  ; $1DA3A1 |
  JSR code_1FEA98                           ; $1DA3A3 |
  LDA #$C1                                  ; $1DA3A6 |
  STA {sprite_flags},x                      ; $1DA3A8 |
code_1DA3AB:
  LDA #$00                                  ; $1DA3AB |
  STA {entity_var_b},x                      ; $1DA3AD |
  LDA #$BD                                  ; $1DA3B0 |
  STA {entity_handler_low},x                ; $1DA3B2 |
  LDA #$A3                                  ; $1DA3B5 |
  STA {entity_handler_high},x               ; $1DA3B7 |
  JMP code_1DA3E6                           ; $1DA3BA |

  JSR code_1FEF87                           ; $1DA3BD |
  BCS code_1DA3DC                           ; $1DA3C0 |
  LDA #$00                                  ; $1DA3C2 |
  STA {y_speed_frac},x                      ; $1DA3C4 |
  LDA #$01                                  ; $1DA3C7 |
  STA {y_speed},x                           ; $1DA3C9 |
  LDA #$31                                  ; $1DA3CC |
  STA {entity_handler_low},x                ; $1DA3CE |
  LDA #$A4                                  ; $1DA3D1 |
  STA {entity_handler_high},x               ; $1DA3D3 |
  LDA #$3C                                  ; $1DA3D6 |
  STA {entity_var_d},x                      ; $1DA3D8 |
  RTS                                       ; $1DA3DB |

code_1DA3DC:
  INC {entity_var_b},x                      ; $1DA3DC |
  LDA {entity_var_b},x                      ; $1DA3DF |
  AND #$1F                                  ; $1DA3E2 |
  BNE code_1DA3EF                           ; $1DA3E4 |
code_1DA3E6:
  JSR get_angle_to_player                   ; $1DA3E6 |
  TAY                                       ; $1DA3E9 |
  LDA #$38                                  ; $1DA3EA |
  JSR code_1FF470                           ; $1DA3EC |
code_1DA3EF:
  JSR code_1FEA65                           ; $1DA3EF |
  JSR code_1FEA86                           ; $1DA3F2 |
  DEC {entity_var_a},x                      ; $1DA3F5 |
  BNE code_1DA43C                           ; $1DA3F8 |
  JSR get_angle_to_player                   ; $1DA3FA |
  STA $0D                                   ; $1DA3FD |
  LDA #$78                                  ; $1DA3FF |
  STA {entity_var_a},x                      ; $1DA401 |
  STX $0F                                   ; $1DA404 |
  JSR code_1FF16F                           ; $1DA406 |
  BCS code_1DA43C                           ; $1DA409 |
  LDA #$87                                  ; $1DA40B |
  STA {sprite_flags},y                      ; $1DA40D |
  LDA #$55                                  ; $1DA410 |
  STA {entity_type},y                       ; $1DA412 |
  LDA #$7B                                  ; $1DA415 |
  JSR code_1FEAA4                           ; $1DA417 |
  LDA {y_position_low},y                    ; $1DA41A |
  CLC                                       ; $1DA41D |
  ADC #$08                                  ; $1DA41E |
  STA {y_position_low},y                    ; $1DA420 |
  STY $0E                                   ; $1DA423 |
  LDY $0D                                   ; $1DA425 |
  LDX $0E                                   ; $1DA427 |
  LDA #$08                                  ; $1DA429 |
  JSR code_1FF470                           ; $1DA42B |
  LDX $0F                                   ; $1DA42E |
  RTS                                       ; $1DA430 |

  JSR apply_vertical_speed_up_alt           ; $1DA431 |
  DEC {entity_var_d},x                      ; $1DA434 |
  BNE code_1DA43C                           ; $1DA437 |
  JMP code_1DA3AB                           ; $1DA439 |

code_1DA43C:
  RTS                                       ; $1DA43C |

  LDA {animation_index},x                   ; $1DA43D |
  CMP #$24                                  ; $1DA440 |
  BEQ code_1DA45B                           ; $1DA442 |
  LDY #$18                                  ; $1DA444 |
  JSR code_1FEA3F                           ; $1DA446 |
  BCS code_1DA456                           ; $1DA449 |
  LDY #$20                                  ; $1DA44B |
  JSR code_1EC4A1                           ; $1DA44D |
  LDA $10                                   ; $1DA450 |
  AND #$10                                  ; $1DA452 |
  BNE code_1DA478                           ; $1DA454 |
code_1DA456:
  LDA #$24                                  ; $1DA456 |
  JSR code_1FEA98                           ; $1DA458 |
code_1DA45B:
  LDA {animation_timer},x                   ; $1DA45B |
  CMP #$04                                  ; $1DA45E |
  BNE code_1DA478                           ; $1DA460 |
  LDA {animation_frame},x                   ; $1DA462 |
  CMP #$02                                  ; $1DA465 |
  BEQ code_1DA475                           ; $1DA467 |
  CMP #$04                                  ; $1DA469 |
  BNE code_1DA478                           ; $1DA46B |
  LDA #$23                                  ; $1DA46D |
  JSR code_1FEA98                           ; $1DA46F |
  JMP code_1DA478                           ; $1DA472 |

code_1DA475:
  JSR code_1FEC4A                           ; $1DA475 |
code_1DA478:
  LDA {sprite_flags},x                      ; $1DA478 |
  ORA #$40                                  ; $1DA47B |
  STA {sprite_flags},x                      ; $1DA47D |
  JSR code_1FEFF8                           ; $1DA480 |
  BCS code_1DA497                           ; $1DA483 |
  LDA {entity_direction},y                  ; $1DA485 |
  AND #$03                                  ; $1DA488 |
  CMP {entity_direction},x                  ; $1DA48A |
  BEQ code_1DA497                           ; $1DA48D |
  LDA {sprite_flags},x                      ; $1DA48F |
  AND #$BF                                  ; $1DA492 |
  STA {sprite_flags},x                      ; $1DA494 |
code_1DA497:
  RTS                                       ; $1DA497 |

  LDY #$0E                                  ; $1DA498 |
  JSR code_1FEA3F                           ; $1DA49A |
  BCC code_1DA4DB                           ; $1DA49D |
  JSR code_1DA089                           ; $1DA49F |
  INC $0E                                   ; $1DA4A2 |
  JSR code_1DA54D                           ; $1DA4A4 |
  LDA #$2B                                  ; $1DA4A7 |
  JSR code_1FEC5D                           ; $1DA4A9 |
code_1DA4AC:
  JSR code_1FF16F                           ; $1DA4AC |
  BCS code_1DA4DA                           ; $1DA4AF |
  LDA #$87                                  ; $1DA4B1 |
  STA {sprite_flags},y                      ; $1DA4B3 |
  LDA #$5B                                  ; $1DA4B6 |
  STA {entity_type},y                       ; $1DA4B8 |
  LDA #$82                                  ; $1DA4BB |
  SEC                                       ; $1DA4BD |
  SBC $0E                                   ; $1DA4BE |
  JSR code_1FEAA4                           ; $1DA4C0 |
  TYA                                       ; $1DA4C3 |
  TAX                                       ; $1DA4C4 |
  LDY $0F                                   ; $1DA4C5 |
  LDA #$08                                  ; $1DA4C7 |
  JSR code_1FF470                           ; $1DA4C9 |
  LDX $0D                                   ; $1DA4CC |
  INC $0F                                   ; $1DA4CE |
  LDA $0F                                   ; $1DA4D0 |
  AND #$0F                                  ; $1DA4D2 |
  STA $0F                                   ; $1DA4D4 |
  DEC $0E                                   ; $1DA4D6 |
  BPL code_1DA4AC                           ; $1DA4D8 |
code_1DA4DA:
  RTS                                       ; $1DA4DA |

code_1DA4DB:
  LDA #$A2                                  ; $1DA4DB |
  STA {sprite_flags},x                      ; $1DA4DD |
  LDA $32                                   ; $1DA4E0 |
  CMP #$07                                  ; $1DA4E2 |
  BNE code_1DA4EC                           ; $1DA4E4 |
  LDA #$E2                                  ; $1DA4E6 |
  STA {sprite_flags},x                      ; $1DA4E8 |
  RTS                                       ; $1DA4EB |

code_1DA4EC:
  JSR code_1FEFF8                           ; $1DA4EC |
  BCS code_1DA4DA                           ; $1DA4EF |
  LDA #$40                                  ; $1DA4F1 |
  STA $00                                   ; $1DA4F3 |
  JSR $809D                                 ; $1DA4F5 |
  LDA {entity_type},x                       ; $1DA4F8 |
  CMP #$5A                                  ; $1DA4FB |
  BEQ code_1DA4DA                           ; $1DA4FD |
  LDA #$0E                                  ; $1DA4FF |
  STA $0D                                   ; $1DA501 |
  LDA #$03                                  ; $1DA503 |
  STA $0E                                   ; $1DA505 |
  STX $0F                                   ; $1DA507 |
code_1DA509:
  JSR code_1FF16F                           ; $1DA509 |
  BCS code_1DA4DA                           ; $1DA50C |
  LDA #$87                                  ; $1DA50E |
  STA {sprite_flags},y                      ; $1DA510 |
  LDA #$5B                                  ; $1DA513 |
  STA {entity_type},y                       ; $1DA515 |
  LDA {entity_display_flags},x              ; $1DA518 |
  LDX $0E                                   ; $1DA51B |
  AND #$20                                  ; $1DA51D |
  BEQ code_1DA524                           ; $1DA51F |
  INX                                       ; $1DA521 |
  INX                                       ; $1DA522 |
  INX                                       ; $1DA523 |
code_1DA524:
  LDA $A543,x                               ; $1DA524 |
  LDX $0F                                   ; $1DA527 |
  JSR code_1FEAA4                           ; $1DA529 |
  TYA                                       ; $1DA52C |
  TAX                                       ; $1DA52D |
  LDY $0D                                   ; $1DA52E |
  LDA #$08                                  ; $1DA530 |
  JSR code_1FF470                           ; $1DA532 |
  LDX $0F                                   ; $1DA535 |
  DEC $0E                                   ; $1DA537 |
  LDA $0D                                   ; $1DA539 |
  SEC                                       ; $1DA53B |
  SBC #$04                                  ; $1DA53C |
  STA $0D                                   ; $1DA53E |
  BPL code_1DA509                           ; $1DA540 |
  RTS                                       ; $1DA542 |

  db $80, $82, $81, $7F, $81, $82, $80      ; $1DA543 |

  JMP $84FC                                 ; $1DA54A |

code_1DA54D:
  JSR code_1FF2C4                           ; $1DA54D |
  LDA #$01                                  ; $1DA550 |
  STA {entity_type},x                       ; $1DA552 |
  LDA #$2B                                  ; $1DA555 |
  JSR code_1FEC5D                           ; $1DA557 |
  LDA #$42                                  ; $1DA55A |
  JMP code_1FEA98                           ; $1DA55C |

  JSR code_1FF2FE                           ; $1DA55F |
  LDA #$01                                  ; $1DA562 |
  STA {entity_type},y                       ; $1DA564 |
  LDA #$42                                  ; $1DA567 |
  JMP code_1FEAE9                           ; $1DA569 |

code_1DA56C:
  JSR code_1FF2C4                           ; $1DA56C |
  LDA #$2F                                  ; $1DA56F |
  STA {entity_type},x                       ; $1DA571 |
  LDA #$42                                  ; $1DA574 |
  JMP code_1FEA98                           ; $1DA576 |

  JSR code_1DA620                           ; $1DA579 |
  BCC code_1DA5BD                           ; $1DA57C |
  JSR face_player                           ; $1DA57E |
  JSR code_1FEC30                           ; $1DA581 |
  LDA {entity_var_a},x                      ; $1DA584 |
  BEQ code_1DA58E                           ; $1DA587 |
  DEC {entity_var_a},x                      ; $1DA589 |
  BNE code_1DA5BD                           ; $1DA58C |
code_1DA58E:
  LDA $9D                                   ; $1DA58E |
  AND #$07                                  ; $1DA590 |
  BNE code_1DA5BD                           ; $1DA592 |
  LDA #$00                                  ; $1DA594 |
  STA $00                                   ; $1DA596 |
  LDY #$17                                  ; $1DA598 |
code_1DA59A:
  LDA {entity_type},y                       ; $1DA59A |
  CMP #$52                                  ; $1DA59D |
  BNE code_1DA5A3                           ; $1DA59F |
  INC $00                                   ; $1DA5A1 |
code_1DA5A3:
  DEY                                       ; $1DA5A3 |
  CPY #$07                                  ; $1DA5A4 |
  BCS code_1DA59A                           ; $1DA5A6 |
  LDA $00                                   ; $1DA5A8 |
  CMP #$03                                  ; $1DA5AA |
  BCS code_1DA61F                           ; $1DA5AC |
  LDA #$87                                  ; $1DA5AE |
  JSR code_1FEA98                           ; $1DA5B0 |
  LDA #$BE                                  ; $1DA5B3 |
  STA {entity_handler_low},x                ; $1DA5B5 |
  LDA #$A5                                  ; $1DA5B8 |
  STA {entity_handler_high},x               ; $1DA5BA |
code_1DA5BD:
  RTS                                       ; $1DA5BD |

  JSR code_1DA620                           ; $1DA5BE |
  BCC code_1DA61F                           ; $1DA5C1 |
  LDA {entity_type},x                       ; $1DA5C3 |
  CMP #$5D                                  ; $1DA5C6 |
  BNE code_1DA61F                           ; $1DA5C8 |
  LDA {animation_timer},x                   ; $1DA5CA |
  CMP #$04                                  ; $1DA5CD |
  BEQ code_1DA5E4                           ; $1DA5CF |
  CMP #$08                                  ; $1DA5D1 |
  BNE code_1DA61F                           ; $1DA5D3 |
  LDA #$79                                  ; $1DA5D5 |
  STA {entity_handler_low},x                ; $1DA5D7 |
  LDA #$A5                                  ; $1DA5DA |
  STA {entity_handler_high},x               ; $1DA5DC |
  LDA #$AE                                  ; $1DA5DF |
  JMP code_1FEA98                           ; $1DA5E1 |

code_1DA5E4:
  LDA #$32                                  ; $1DA5E4 |
  STA {entity_var_a},x                      ; $1DA5E6 |
  JSR code_1FF16F                           ; $1DA5E9 |
  BCS code_1DA61F                           ; $1DA5EC |
  LDA #$D6                                  ; $1DA5EE |
  STA {sprite_flags},y                      ; $1DA5F0 |
  LDA #$01                                  ; $1DA5F3 |
  STA {entity_life},y                       ; $1DA5F5 |
  LDA #$52                                  ; $1DA5F8 |
  STA {entity_type},y                       ; $1DA5FA |
  LDA {entity_direction},x                  ; $1DA5FD |
  STA {entity_direction},y                  ; $1DA600 |
  AND #$01                                  ; $1DA603 |
  CLC                                       ; $1DA605 |
  ADC #$02                                  ; $1DA606 |
  STA $10                                   ; $1DA608 |
  LDA #$88                                  ; $1DA60A |
  JSR code_1FEAF5                           ; $1DA60C |
  LDA #$00                                  ; $1DA60F |
  STA {x_speed_frac},y                      ; $1DA611 |
  LDA #$01                                  ; $1DA614 |
  STA {x_speed},y                           ; $1DA616 |
  JSR code_1FEA34                           ; $1DA619 |
  INC {animation_timer},x                   ; $1DA61C |
code_1DA61F:
  RTS                                       ; $1DA61F |

code_1DA620:
  LDA {y_position_low},x                    ; $1DA620 |
  STA {entity_var_b},x                      ; $1DA623 |
  SEC                                       ; $1DA626 |
  SBC #$0C                                  ; $1DA627 |
  STA {y_position_low},x                    ; $1DA629 |
  LDA #$CD                                  ; $1DA62C |
  STA {sprite_flags},x                      ; $1DA62E |
  JSR code_1FEFF8                           ; $1DA631 |
  LDA {entity_var_b},x                      ; $1DA634 |
  STA {y_position_low},x                    ; $1DA637 |
  LDA #$97                                  ; $1DA63A |
  STA {sprite_flags},x                      ; $1DA63C |
  BCS code_1DA61F                           ; $1DA63F |
  LDA #$40                                  ; $1DA641 |
  STA $00                                   ; $1DA643 |
  JSR $809D                                 ; $1DA645 |
  CLC                                       ; $1DA648 |
  RTS                                       ; $1DA649 |

  LDY #$17                                  ; $1DA64A |
  JSR code_1FE7B7                           ; $1DA64C |
  BCC code_1DA68B                           ; $1DA64F |
  LDY #$1C                                  ; $1DA651 |
  JSR code_1FEA3F                           ; $1DA653 |
  BCC code_1DA68B                           ; $1DA656 |
  LDA #$7A                                  ; $1DA658 |
  STA {y_speed_frac},x                      ; $1DA65A |
  LDA #$05                                  ; $1DA65D |
  STA {y_speed},x                           ; $1DA65F |
  LDA #$6C                                  ; $1DA662 |
  STA {entity_handler_low},x                ; $1DA664 |
  LDA #$A6                                  ; $1DA667 |
  STA {entity_handler_high},x               ; $1DA669 |
  LDY #$17                                  ; $1DA66C |
  JSR code_1FE7B7                           ; $1DA66E |
  ROR $0F                                   ; $1DA671 |
  LDY #$1C                                  ; $1DA673 |
  JSR code_1FEA3F                           ; $1DA675 |
  LDA $0F                                   ; $1DA678 |
  BPL code_1DA68B                           ; $1DA67A |
  BCC code_1DA681                           ; $1DA67C |
  JSR code_1FEC4A                           ; $1DA67E |
code_1DA681:
  LDA #$4A                                  ; $1DA681 |
  STA {entity_handler_low},x                ; $1DA683 |
  LDA #$A6                                  ; $1DA686 |
  STA {entity_handler_high},x               ; $1DA688 |
code_1DA68B:
  RTS                                       ; $1DA68B |

  LDA #$B5                                  ; $1DA68C |
  STA {x_speed_frac},x                      ; $1DA68E |
  LDA #$00                                  ; $1DA691 |
  STA {x_speed},x                           ; $1DA693 |
  JSR code_1DA6C5                           ; $1DA696 |
  LDA #$00                                  ; $1DA699 |
  STA {animation_timer},x                   ; $1DA69B |
  LDY #$17                                  ; $1DA69E |
  JSR code_1FE7B7                           ; $1DA6A0 |
  BCS code_1DA6A8                           ; $1DA6A3 |
  JMP code_1FEA65                           ; $1DA6A5 |

code_1DA6A8:
  LDA #$01                                  ; $1DA6A8 |
  STA {animation_frame},x                   ; $1DA6AA |
  LDA #$B7                                  ; $1DA6AD |
  STA {entity_handler_low},x                ; $1DA6AF |
  LDA #$A6                                  ; $1DA6B2 |
  STA {entity_handler_high},x               ; $1DA6B4 |
  LDA {animation_timer},x                   ; $1DA6B7 |
  CMP #$04                                  ; $1DA6BA |
  BNE code_1DA6D9                           ; $1DA6BC |
  LDA {animation_frame},x                   ; $1DA6BE |
  CMP #$02                                  ; $1DA6C1 |
  BNE code_1DA6D9                           ; $1DA6C3 |
code_1DA6C5:
  LDA #$A8                                  ; $1DA6C5 |
  STA {y_speed_frac},x                      ; $1DA6C7 |
  LDA #$05                                  ; $1DA6CA |
  STA {y_speed},x                           ; $1DA6CC |
  LDA #$99                                  ; $1DA6CF |
  STA {entity_handler_low},x                ; $1DA6D1 |
  LDA #$A6                                  ; $1DA6D4 |
  STA {entity_handler_high},x               ; $1DA6D6 |
code_1DA6D9:
  RTS                                       ; $1DA6D9 |

  LDA #$00                                  ; $1DA6DA |
  STA {animation_timer},x                   ; $1DA6DC |
  JSR distance_to_player                    ; $1DA6DF |
  CMP #$40                                  ; $1DA6E2 |
  BCS code_1DA6D9                           ; $1DA6E4 |
  JSR vertical_distance_to_player           ; $1DA6E6 |
  CMP #$10                                  ; $1DA6E9 |
  BCS code_1DA6D9                           ; $1DA6EB |
  LDA #$FC                                  ; $1DA6ED |
  STA {entity_handler_low},x                ; $1DA6EF |
  LDA #$A6                                  ; $1DA6F2 |
  STA {entity_handler_high},x               ; $1DA6F4 |
  LDA #$04                                  ; $1DA6F7 |
  STA {animation_timer},x                   ; $1DA6F9 |
  JSR face_player                           ; $1DA6FC |
  JSR code_1FEC30                           ; $1DA6FF |
  LDA {animation_timer},x                   ; $1DA702 |
  CMP #$04                                  ; $1DA705 |
  BNE code_1DA6D9                           ; $1DA707 |
  LDY {animation_frame},x                   ; $1DA709 |
  LDA $A7BB,y                               ; $1DA70C |
  STA {sprite_flags},x                      ; $1DA70F |
  LDA {y_position_low},x                    ; $1DA712 |
  SEC                                       ; $1DA715 |
  SBC #$04                                  ; $1DA716 |
  STA {y_position_low},x                    ; $1DA718 |
  CPY #$02                                  ; $1DA71B |
  BNE code_1DA6D9                           ; $1DA71D |
  LDA #$29                                  ; $1DA71F |
  STA {entity_handler_low},x                ; $1DA721 |
  LDA #$A7                                  ; $1DA724 |
  STA {entity_handler_high},x               ; $1DA726 |
  LDA {animation_timer},x                   ; $1DA729 |
  CMP #$04                                  ; $1DA72C |
  BNE code_1DA6D9                           ; $1DA72E |
  LDA {animation_frame},x                   ; $1DA730 |
  CMP #$10                                  ; $1DA733 |
  BEQ code_1DA767                           ; $1DA735 |
  CMP #$09                                  ; $1DA737 |
  BNE code_1DA6D9                           ; $1DA739 |
  JSR code_1FF16F                           ; $1DA73B |
  BCS code_1DA6D9                           ; $1DA73E |
  LDA #$87                                  ; $1DA740 |
  STA {sprite_flags},y                      ; $1DA742 |
  LDA #$61                                  ; $1DA745 |
  STA {entity_type},y                       ; $1DA747 |
  LDA {entity_direction},x                  ; $1DA74A |
  STA {entity_direction},y                  ; $1DA74D |
  AND #$01                                  ; $1DA750 |
  CLC                                       ; $1DA752 |
  ADC #$28                                  ; $1DA753 |
  STA $10                                   ; $1DA755 |
  LDA #$8A                                  ; $1DA757 |
  JSR code_1FEAF5                           ; $1DA759 |
  LDA #$00                                  ; $1DA75C |
  STA {x_speed_frac},y                      ; $1DA75E |
  LDA #$02                                  ; $1DA761 |
  STA {x_speed},y                           ; $1DA763 |
  RTS                                       ; $1DA766 |

code_1DA767:
  LDA #$76                                  ; $1DA767 |
  STA {entity_handler_low},x                ; $1DA769 |
  LDA #$A7                                  ; $1DA76C |
  STA {entity_handler_high},x               ; $1DA76E |
  LDA #$02                                  ; $1DA771 |
  STA {entity_var_a},x                      ; $1DA773 |
  LDA {entity_var_b},x                      ; $1DA776 |
  BEQ code_1DA790                           ; $1DA779 |
  LDA #$00                                  ; $1DA77B |
  STA {animation_timer},x                   ; $1DA77D |
  DEC {entity_var_b},x                      ; $1DA780 |
  BNE code_1DA7B9                           ; $1DA783 |
  LDA #$DA                                  ; $1DA785 |
  STA {entity_handler_low},x                ; $1DA787 |
  LDA #$A6                                  ; $1DA78A |
  STA {entity_handler_high},x               ; $1DA78C |
  RTS                                       ; $1DA78F |

code_1DA790:
  LDA {animation_timer},x                   ; $1DA790 |
  CMP #$04                                  ; $1DA793 |
  BNE code_1DA7B9                           ; $1DA795 |
  LDA {animation_frame},x                   ; $1DA797 |
  CMP #$13                                  ; $1DA79A |
  BEQ code_1DA7B4                           ; $1DA79C |
  LDA {y_position_low},x                    ; $1DA79E |
  CLC                                       ; $1DA7A1 |
  ADC #$04                                  ; $1DA7A2 |
  STA {y_position_low},x                    ; $1DA7A4 |
  LDY {entity_var_a},x                      ; $1DA7A7 |
  LDA $A7BA,y                               ; $1DA7AA |
  STA {sprite_flags},x                      ; $1DA7AD |
  DEC {entity_var_a},x                      ; $1DA7B0 |
  RTS                                       ; $1DA7B3 |

code_1DA7B4:
  LDA #$1E                                  ; $1DA7B4 |
  STA {entity_var_b},x                      ; $1DA7B6 |
code_1DA7B9:
  RTS                                       ; $1DA7B9 |

  db $CA, $D1, $C0, $CC                     ; $1DA7BA |

  LDA {entity_var_a},x                      ; $1DA7BE |
  BEQ code_1DA7C8                           ; $1DA7C1 |
  DEC {entity_var_a},x                      ; $1DA7C3 |
  BNE code_1DA82D                           ; $1DA7C6 |
code_1DA7C8:
  JSR reset_vertical_speed                  ; $1DA7C8 |
  LDA {entity_display_flags},x              ; $1DA7CB |
  AND #$FB                                  ; $1DA7CE |
  STA {entity_display_flags},x              ; $1DA7D0 |
  LDA #$DD                                  ; $1DA7D3 |
  STA {entity_handler_low},x                ; $1DA7D5 |
  LDA #$A7                                  ; $1DA7D8 |
  STA {entity_handler_high},x               ; $1DA7DA |
  JSR entity_gravity_process                ; $1DA7DD |
  JSR code_1FEFF8                           ; $1DA7E0 |
  BCS code_1DA800                           ; $1DA7E3 |
  LDA $0438,x                               ; $1DA7E5 |
  PHA                                       ; $1DA7E8 |
  LDA #$00                                  ; $1DA7E9 |
  STA $00                                   ; $1DA7EB |
  JSR $809D                                 ; $1DA7ED |
  PLA                                       ; $1DA7F0 |
  STA $0438,x                               ; $1DA7F1 |
  LDA {entity_type},x                       ; $1DA7F4 |
  BNE code_1DA800                           ; $1DA7F7 |
  LDA #$26                                  ; $1DA7F9 |
  STA {entity_type},x                       ; $1DA7FB |
  BNE code_1DA807                           ; $1DA7FE |
code_1DA800:
  LDA {y_position_low},x                    ; $1DA800 |
  CMP #$E8                                  ; $1DA803 |
  BCC code_1DA82D                           ; $1DA805 |
code_1DA807:
  LDA $E6                                   ; $1DA807 |\  RNG roll:
  ADC $E5                                   ; $1DA809 | | random index into
  STA $E6                                   ; $1DA80B | | timer values for new
  AND #$03                                  ; $1DA80D | | falling crystal spawn
  TAY                                       ; $1DA80F |/  4 possibilities
  LDA falling_crystal_timer,y               ; $1DA810 |\ random timer value
  STA {entity_var_a},x                      ; $1DA813 |/ -> wildcard 1 (timer)
  LDA {entity_display_flags},x              ; $1DA816 |
  ORA #$04                                  ; $1DA819 |
  STA {entity_display_flags},x              ; $1DA81B |
  LDA #$30                                  ; $1DA81E |
  STA {y_position_low},x                    ; $1DA820 |
  LDA #$BE                                  ; $1DA823 |
  STA {entity_handler_low},x                ; $1DA825 |
  LDA #$A7                                  ; $1DA828 |
  STA {entity_handler_high},x               ; $1DA82A |
code_1DA82D:
  RTS                                       ; $1DA82D |

; # of frames to wait until a new falling crystal
; spawns at a certain location
; this table is randomly selected from, 1/4 chance each value
falling_crystal_timer:
  db $0A, $3C, $78, $0A                     ; $1DA82E |

  LDA {entity_var_b},x                      ; $1DA832 |
  BEQ code_1DA83F                           ; $1DA835 |
  DEC {entity_var_b},x                      ; $1DA837 |
  BNE code_1DA83F                           ; $1DA83A |
  JMP code_1DA56C                           ; $1DA83C |

code_1DA83F:
  LDA {animation_index},x                   ; $1DA83F |
  CMP #$36                                  ; $1DA842 |
  BNE code_1DA866                           ; $1DA844 |
  LDA {animation_timer},x                   ; $1DA846 |
  CMP #$06                                  ; $1DA849 |
  BNE code_1DA82D                           ; $1DA84B |
  LDA {animation_frame},x                   ; $1DA84D |
  BNE code_1DA855                           ; $1DA850 |
  JMP code_1FEC4A                           ; $1DA852 |

code_1DA855:
  LDA {entity_var_a},x                      ; $1DA855 |
  PHA                                       ; $1DA858 |
  JSR code_1FEA98                           ; $1DA859 |
  PLA                                       ; $1DA85C |
  AND #$01                                  ; $1DA85D |
  TAY                                       ; $1DA85F |
  LDA $A908,y                               ; $1DA860 |
  STA {sprite_flags},x                      ; $1DA863 |
code_1DA866:
  LDA {entity_var_c},x                      ; $1DA866 |
  BEQ code_1DA870                           ; $1DA869 |
  DEC {entity_var_c},x                      ; $1DA86B |
  BNE code_1DA82D                           ; $1DA86E |
code_1DA870:
  LDY #$0D                                  ; $1DA870 |
  JSR code_1FE7B7                           ; $1DA872 |
  BCC code_1DA88E                           ; $1DA875 |
  LDY #$10                                  ; $1DA877 |
  JSR code_1FEA3F                           ; $1DA879 |
  BCC code_1DA88E                           ; $1DA87C |
  LDA {animation_index},x                   ; $1DA87E |
  STA {entity_var_a},x                      ; $1DA881 |
  LDA #$91                                  ; $1DA884 |
  STA {sprite_flags},x                      ; $1DA886 |
  LDA #$36                                  ; $1DA889 |
  JMP code_1FEA98                           ; $1DA88B |

code_1DA88E:
  LDA {animation_index},x                   ; $1DA88E |
  CMP #$26                                  ; $1DA891 |
  BNE code_1DA907                           ; $1DA893 |
  JSR distance_to_player                    ; $1DA895 |
  CMP #$50                                  ; $1DA898 |
  BCS code_1DA907                           ; $1DA89A |
  JSR vertical_distance_to_player           ; $1DA89C |
  CMP #$28                                  ; $1DA89F |
  BCS code_1DA907                           ; $1DA8A1 |
  DEC {animation_index},x                   ; $1DA8A3 |
  LDA #$C9                                  ; $1DA8A6 |
  STA {sprite_flags},x                      ; $1DA8A8 |
  LDA #$F0                                  ; $1DA8AB |
  STA {entity_var_b},x                      ; $1DA8AD |
  LDA #$00                                  ; $1DA8B0 |
  STA {x_speed_frac},x                      ; $1DA8B2 |
  LDA #$02                                  ; $1DA8B5 |
  STA {x_speed},x                           ; $1DA8B7 |
  LDA #$3D                                  ; $1DA8BA |
  JSR code_1FEC5D                           ; $1DA8BC |
  STX $0F                                   ; $1DA8BF |
  LDA #$02                                  ; $1DA8C1 |
  STA $0E                                   ; $1DA8C3 |
code_1DA8C5:
  JSR code_1FF16F                           ; $1DA8C5 |
  BCS code_1DA907                           ; $1DA8C8 |
  LDA #$87                                  ; $1DA8CA |
  STA {sprite_flags},y                      ; $1DA8CC |
  LDA #$55                                  ; $1DA8CF |
  STA {entity_type},y                       ; $1DA8D1 |
  LDA #$9D                                  ; $1DA8D4 |
  JSR code_1FEAA4                           ; $1DA8D6 |
  LDA {y_position_low},y                    ; $1DA8D9 |
  SEC                                       ; $1DA8DC |
  SBC #$04                                  ; $1DA8DD |
  STA {y_position_low},y                    ; $1DA8DF |
  STY $0D                                   ; $1DA8E2 |
  LDA {entity_direction},x                  ; $1DA8E4 |
  AND #$02                                  ; $1DA8E7 |
  ASL                                       ; $1DA8E9 |
  ASL                                       ; $1DA8EA |
  CLC                                       ; $1DA8EB |
  ADC $0E                                   ; $1DA8EC |
  TAY                                       ; $1DA8EE |
  LDX $0D                                   ; $1DA8EF |
  LDA #$40                                  ; $1DA8F1 |
  JSR code_1FF470                           ; $1DA8F3 |
  LDX $0F                                   ; $1DA8F6 |
  INC $0E                                   ; $1DA8F8 |
  INC $0E                                   ; $1DA8FA |
  LDA $0E                                   ; $1DA8FC |
  CMP #$08                                  ; $1DA8FE |
  BNE code_1DA8C5                           ; $1DA900 |
  LDA #$3C                                  ; $1DA902 |
  STA {entity_var_c},x                      ; $1DA904 |
code_1DA907:
  RTS                                       ; $1DA907 |

  db $80, $C0                               ; $1DA908 |

  LDA {animation_index},x                   ; $1DA90A |
  CMP #$1E                                  ; $1DA90D |
  BEQ code_1DA920                           ; $1DA90F |
  JSR distance_to_player                    ; $1DA911 |
  CMP #$30                                  ; $1DA914 |
  BCS code_1DA964                           ; $1DA916 |
  INC {animation_index},x                   ; $1DA918 |
  LDA #$3B                                  ; $1DA91B |
  JSR code_1FEC5D                           ; $1DA91D |
code_1DA920:
  LDY #$17                                  ; $1DA920 |
  JSR code_1FE7B7                           ; $1DA922 |
  BCC code_1DA964                           ; $1DA925 |
  LDA #$1F                                  ; $1DA927 |
  JSR code_1FEA98                           ; $1DA929 |
  LDA {entity_display_flags},x              ; $1DA92C |
  AND #$BF                                  ; $1DA92F |
  STA {entity_display_flags},x              ; $1DA931 |
  JSR face_player                           ; $1DA934 |
  JSR code_1FEC30                           ; $1DA937 |
  LDA #$44                                  ; $1DA93A |
  STA {entity_handler_low},x                ; $1DA93C |
  LDA #$A9                                  ; $1DA93F |
  STA {entity_handler_high},x               ; $1DA941 |
  LDY #$17                                  ; $1DA944 |
  JSR code_1FE7B7                           ; $1DA946 |
  BCC code_1DA964                           ; $1DA949 |
  LDY #$1C                                  ; $1DA94B |
  JSR code_1FEA3F                           ; $1DA94D |
  BCC code_1DA964                           ; $1DA950 |
  JSR code_1FF2C4                           ; $1DA952 |
  LDA #$42                                  ; $1DA955 |
  JSR code_1FEA98                           ; $1DA957 |
  LDA #$8C                                  ; $1DA95A |
  STA {entity_type},x                       ; $1DA95C |
  LDA #$8B                                  ; $1DA95F |
  STA {sprite_flags},x                      ; $1DA961 |
code_1DA964:
  RTS                                       ; $1DA964 |

code_1DA965:
  LDA #$80                                  ; $1DA965 |
  STA {y_speed_frac},x                      ; $1DA967 |
  LDA #$00                                  ; $1DA96A |
  STA {y_speed},x                           ; $1DA96C |
  LDA #$08                                  ; $1DA96F |
  STA {entity_direction},x                  ; $1DA971 |
  LDA #$08                                  ; $1DA974 |
  STA {entity_var_a},x                      ; $1DA976 |
  STA {entity_var_b},x                      ; $1DA979 |
  LDA #$D1                                  ; $1DA97C |
  STA {sprite_flags},x                      ; $1DA97E |
  LDA #$00                                  ; $1DA981 |
  STA {animation_frame},x                   ; $1DA983 |
  STA {animation_timer},x                   ; $1DA986 |
  LDA #$93                                  ; $1DA989 |
  STA {entity_handler_low},x                ; $1DA98B |
  LDA #$A9                                  ; $1DA98E |
  STA {entity_handler_high},x               ; $1DA990 |
  LDA #$00                                  ; $1DA993 |
  STA {animation_timer},x                   ; $1DA995 |
  JSR code_1FEA86                           ; $1DA998 |
  DEC {entity_var_a},x                      ; $1DA99B |
  BNE code_1DA9DF                           ; $1DA99E |
  LDA #$08                                  ; $1DA9A0 |
  STA {entity_var_a},x                      ; $1DA9A2 |
  JSR $8538                                 ; $1DA9A5 |
  DEC {entity_var_b},x                      ; $1DA9A8 |
  BNE code_1DA9DF                           ; $1DA9AB |
  JSR get_angle_to_player                   ; $1DA9AD |
  TAY                                       ; $1DA9B0 |
  LDA #$18                                  ; $1DA9B1 |
  JSR code_1FF470                           ; $1DA9B3 |
  LDA #$20                                  ; $1DA9B6 |
  STA {entity_var_c},x                      ; $1DA9B8 |
  LDA #$CF                                  ; $1DA9BB |
  STA {entity_handler_low},x                ; $1DA9BD |
  LDA #$A9                                  ; $1DA9C0 |
  STA {entity_handler_high},x               ; $1DA9C2 |
  LDA #$01                                  ; $1DA9C5 |
  STA {animation_frame},x                   ; $1DA9C7 |
  LDA #$C0                                  ; $1DA9CA |
  STA {sprite_flags},x                      ; $1DA9CC |
  LDA #$00                                  ; $1DA9CF |
  STA {animation_timer},x                   ; $1DA9D1 |
  JSR code_1FEA65                           ; $1DA9D4 |
  JSR code_1FEA86                           ; $1DA9D7 |
  DEC {entity_var_c},x                      ; $1DA9DA |
  BEQ code_1DA965                           ; $1DA9DD |
code_1DA9DF:
  RTS                                       ; $1DA9DF |

  LDY $32                                   ; $1DA9E0 |
  LDA {sprite_flags},x                      ; $1DA9E2 |
  AND #$BF                                  ; $1DA9E5 |
  ORA $AAB0,y                               ; $1DA9E7 |
  STA {sprite_flags},x                      ; $1DA9EA |
  LDA {y_position_low},x                    ; $1DA9ED |
  PHA                                       ; $1DA9F0 |
  SEC                                       ; $1DA9F1 |
  SBC #$18                                  ; $1DA9F2 |
  STA {y_position_low},x                    ; $1DA9F4 |
  LDA {sprite_flags},x                      ; $1DA9F7 |
  PHA                                       ; $1DA9FA |
  LDA #$C1                                  ; $1DA9FB |
  STA {sprite_flags},x                      ; $1DA9FD |
  JSR code_1FEFF8                           ; $1DAA00 |
  PLA                                       ; $1DAA03 |
  STA {sprite_flags},x                      ; $1DAA04 |
  PLA                                       ; $1DAA07 |
  STA {y_position_low},x                    ; $1DAA08 |
  BCS code_1DAA14                           ; $1DAA0B |
  LDA #$40                                  ; $1DAA0D |
  STA $00                                   ; $1DAA0F |
  JMP $809D                                 ; $1DAA11 |

code_1DAA14:
  JSR face_player                           ; $1DAA14 |
  JSR code_1FEC30                           ; $1DAA17 |
  LDA {animation_index},x                   ; $1DAA1A |
  CMP #$62                                  ; $1DAA1D |
  BNE code_1DAA3C                           ; $1DAA1F |
  LDA {animation_timer},x                   ; $1DAA21 |
  CMP #$03                                  ; $1DAA24 |
  BNE code_1DA9DF                           ; $1DAA26 |
  LDA {animation_frame},x                   ; $1DAA28 |
  CMP #$03                                  ; $1DAA2B |
  BEQ code_1DAA65                           ; $1DAA2D |
  CMP #$0F                                  ; $1DAA2F |
  BEQ code_1DAA70                           ; $1DAA31 |
  CMP #$13                                  ; $1DAA33 |
  BNE code_1DAAAF                           ; $1DAA35 |
  LDA #$61                                  ; $1DAA37 |
  JSR code_1FEA98                           ; $1DAA39 |
code_1DAA3C:
  LDA #$00                                  ; $1DAA3C |
  STA $00                                   ; $1DAA3E |
  LDY #$17                                  ; $1DAA40 |
code_1DAA42:
  LDA {entity_type},y                       ; $1DAA42 |
  CMP #$62                                  ; $1DAA45 |
  BNE code_1DAA4B                           ; $1DAA47 |
  INC $00                                   ; $1DAA49 |
code_1DAA4B:
  DEY                                       ; $1DAA4B |
  CPY #$07                                  ; $1DAA4C |
  BCS code_1DAA42                           ; $1DAA4E |
  LDA $00                                   ; $1DAA50 |
  CMP #$02                                  ; $1DAA52 |
  BCS code_1DAAAF                           ; $1DAA54 |
  LDA {sprite_flags},x                      ; $1DAA56 |
  AND #$C0                                  ; $1DAA59 |
  ORA #$25                                  ; $1DAA5B |
  STA {sprite_flags},x                      ; $1DAA5D |
  LDA #$62                                  ; $1DAA60 |
  JMP code_1FEA98                           ; $1DAA62 |

code_1DAA65:
  LDA {sprite_flags},x                      ; $1DAA65 |
  AND #$C0                                  ; $1DAA68 |
  ORA #$24                                  ; $1DAA6A |
  STA {sprite_flags},x                      ; $1DAA6C |
  RTS                                       ; $1DAA6F |

code_1DAA70:
  JSR code_1FF16F                           ; $1DAA70 |
  BCS code_1DAAAF                           ; $1DAA73 |
  LDA #$C5                                  ; $1DAA75 |
  STA {sprite_flags},y                      ; $1DAA77 |
  LDA #$01                                  ; $1DAA7A |
  STA {entity_life},y                       ; $1DAA7C |
  LDA #$62                                  ; $1DAA7F |
  STA {entity_type},y                       ; $1DAA81 |
  LDA {entity_direction},x                  ; $1DAA84 |
  STA {entity_direction},y                  ; $1DAA87 |
  AND #$01                                  ; $1DAA8A |
  CLC                                       ; $1DAA8C |
  ADC #$1E                                  ; $1DAA8D |
  STA $10                                   ; $1DAA8F |
  LDA #$00                                  ; $1DAA91 |
  STA {x_speed_frac},y                      ; $1DAA93 |
  LDA #$01                                  ; $1DAA96 |
  STA {x_speed},y                           ; $1DAA98 |
  LDA #$87                                  ; $1DAA9B |
  JSR code_1FEAF5                           ; $1DAA9D |
  LDA #$0A                                  ; $1DAAA0 |
  STA {entity_var_a},y                      ; $1DAAA2 |
  TXA                                       ; $1DAAA5 |
  STA {entity_var_b},y                      ; $1DAAA6 |
  LDA {x_position_high},x                   ; $1DAAA9 |
  STA {entity_var_c},y                      ; $1DAAAC |
code_1DAAAF:
  RTS                                       ; $1DAAAF |

  db $00, $00, $00, $00, $00, $00, $00, $40 ; $1DAAB0 |
  db $00, $00, $00, $00, $00                ; $1DAAB8 |

  LDY {entity_var_b},x                      ; $1DAABD |
  LDA {entity_type},y                       ; $1DAAC0 |
  CMP #$59                                  ; $1DAAC3 |
  BNE code_1DAACF                           ; $1DAAC5 |
  LDA {entity_var_c},x                      ; $1DAAC7 |
  CMP {x_position_high},y                   ; $1DAACA |
  BEQ code_1DAAD2                           ; $1DAACD |
code_1DAACF:
  JMP code_1DA54D                           ; $1DAACF |

code_1DAAD2:
  JSR $84FC                                 ; $1DAAD2 |
  DEC {entity_var_a},x                      ; $1DAAD5 |
  BNE code_1DAAAF                           ; $1DAAD8 |
  LDA #$0A                                  ; $1DAADA |
  STA {entity_var_a},x                      ; $1DAADC |
  JSR code_1FED5B                           ; $1DAADF |
  LDA $AAF3,y                               ; $1DAAE2 |
  STA {entity_display_flags},x              ; $1DAAE5 |
  LDA $AB03,y                               ; $1DAAE8 |
  STA {animation_index},x                   ; $1DAAEB |
  LDA #$20                                  ; $1DAAEE |
  JMP code_1FF470                           ; $1DAAF0 |

  db $80, $A0, $A0, $A0, $A0, $E0, $E0, $E0 ; $1DAAF3 |
  db $C0, $C0, $C0, $C0, $80, $80, $80, $80 ; $1DAAFB |
  db $88, $64, $64, $64, $87, $64, $64, $64 ; $1DAB03 |
  db $88, $64, $64, $64, $87, $64, $64, $64 ; $1DAB0B |

  LDY #$15                                  ; $1DAB13 |
  JSR code_1FE7B7                           ; $1DAB15 |
  BCC code_1DAB24                           ; $1DAB18 |
  LDY #$16                                  ; $1DAB1A |
  JSR code_1FEA3F                           ; $1DAB1C |
  BCC code_1DAB24                           ; $1DAB1F |
  JSR code_1FEC4A                           ; $1DAB21 |
code_1DAB24:
  RTS                                       ; $1DAB24 |

  LDA {entity_var_a},x                      ; $1DAB25 |
  INC {entity_var_a},x                      ; $1DAB28 |
  AND #$0F                                  ; $1DAB2B |
  BNE code_1DAB38                           ; $1DAB2D |
  JSR get_angle_to_player                   ; $1DAB2F |
  TAY                                       ; $1DAB32 |
  LDA #$38                                  ; $1DAB33 |
  JSR code_1FF470                           ; $1DAB35 |
code_1DAB38:
  JSR code_1FEA65                           ; $1DAB38 |
  JSR code_1FEA86                           ; $1DAB3B |
code_1DAB3E:
  RTS                                       ; $1DAB3E |

  LDA #$00                                  ; $1DAB3F |
  STA {animation_timer},x                   ; $1DAB41 |
  LDA {entity_var_c},x                      ; $1DAB44 |
  BEQ code_1DAB4E                           ; $1DAB47 |
  DEC {entity_var_c},x                      ; $1DAB49 |
  BNE code_1DAB3E                           ; $1DAB4C |
code_1DAB4E:
  JSR distance_to_player                    ; $1DAB4E |
  CMP #$20                                  ; $1DAB51 |
  BCS code_1DAB3E                           ; $1DAB53 |
  JSR vertical_distance_to_player           ; $1DAB55 |
  CMP #$18                                  ; $1DAB58 |
  BCS code_1DAB3E                           ; $1DAB5A |
  LDA #$66                                  ; $1DAB5C |
  STA {entity_handler_low},x                ; $1DAB5E |
  LDA #$AB                                  ; $1DAB61 |
  STA {entity_handler_high},x               ; $1DAB63 |
  LDA {animation_timer},x                   ; $1DAB66 |
  CMP #$02                                  ; $1DAB69 |
  BNE code_1DAB3E                           ; $1DAB6B |
  LDY {animation_frame},x                   ; $1DAB6D |
  LDA {y_position_low},x                    ; $1DAB70 |
  SEC                                       ; $1DAB73 |
  SBC $ABFB,y                               ; $1DAB74 |
  STA {y_position_low},x                    ; $1DAB77 |
  LDA $ABFF,y                               ; $1DAB7A |
  STA {sprite_flags},x                      ; $1DAB7D |
  CPY #$03                                  ; $1DAB80 |
  BNE code_1DABFA                           ; $1DAB82 |
  LDA #$98                                  ; $1DAB84 |
  STA {entity_handler_low},x                ; $1DAB86 |
  LDA #$AB                                  ; $1DAB89 |
  STA {entity_handler_high},x               ; $1DAB8B |
  LDA #$95                                  ; $1DAB8E |
  JSR code_1FEA98                           ; $1DAB90 |
  LDA #$07                                  ; $1DAB93 |
  STA {entity_var_a},x                      ; $1DAB95 |
  LDA {animation_timer},x                   ; $1DAB98 |
  CMP #$02                                  ; $1DAB9B |
  BNE code_1DABFA                           ; $1DAB9D |
  LDA {animation_frame},x                   ; $1DAB9F |
  CMP #$03                                  ; $1DABA2 |
  BNE code_1DABFA                           ; $1DABA4 |
  DEC {entity_var_a},x                      ; $1DABA6 |
  BNE code_1DABFA                           ; $1DABA9 |
  LDA #$C8                                  ; $1DABAB |
  STA {entity_handler_low},x                ; $1DABAD |
  LDA #$AB                                  ; $1DABB0 |
  STA {entity_handler_high},x               ; $1DABB2 |
  LDA #$91                                  ; $1DABB5 |
  JSR code_1FEA98                           ; $1DABB7 |
  LDA #$A0                                  ; $1DABBA |
  STA {sprite_flags},x                      ; $1DABBC |
  LDA {y_position_low},x                    ; $1DABBF |
  SEC                                       ; $1DABC2 |
  SBC #$04                                  ; $1DABC3 |
  STA {y_position_low},x                    ; $1DABC5 |
  LDA {animation_timer},x                   ; $1DABC8 |
  CMP #$04                                  ; $1DABCB |
  BNE code_1DABFA                           ; $1DABCD |
  LDY {animation_frame},x                   ; $1DABCF |
  LDA {y_position_low},x                    ; $1DABD2 |
  SEC                                       ; $1DABD5 |
  SBC $AC03,y                               ; $1DABD6 |
  STA {y_position_low},x                    ; $1DABD9 |
  LDA $AC09,y                               ; $1DABDC |
  STA {sprite_flags},x                      ; $1DABDF |
  CPY #$05                                  ; $1DABE2 |
  BNE code_1DABFA                           ; $1DABE4 |
  LDA #$3F                                  ; $1DABE6 |
  STA {entity_handler_low},x                ; $1DABE8 |
  LDA #$AB                                  ; $1DABEB |
  STA {entity_handler_high},x               ; $1DABED |
  LDA #$59                                  ; $1DABF0 |
  JSR code_1FEA98                           ; $1DABF2 |
  LDA #$3C                                  ; $1DABF5 |
  STA {entity_var_c},x                      ; $1DABF7 |
code_1DABFA:
  RTS                                       ; $1DABFA |

  db $08, $08, $00, $00, $9B, $9C, $9C, $9C ; $1DABFB |
  db $07, $01, $00, $00, $00, $E4, $A3, $A3 ; $1DAC03 |
  db $A3, $00, $00, $00                     ; $1DAC0B |

  JSR face_player                           ; $1DAC0F |
  JSR code_1FEC30                           ; $1DAC12 |
  LDA {animation_index},x                   ; $1DAC15 |
  CMP #$97                                  ; $1DAC18 |
  BEQ code_1DAC33                           ; $1DAC1A |
  LDA {sprite_flags},x                      ; $1DAC1C |
  PHA                                       ; $1DAC1F |
  LDA #$E6                                  ; $1DAC20 |
  STA {sprite_flags},x                      ; $1DAC22 |
  JSR code_1FEFF8                           ; $1DAC25 |
  PLA                                       ; $1DAC28 |
  STA {sprite_flags},x                      ; $1DAC29 |
  BCS code_1DAC7D                           ; $1DAC2C |
  LDA #$97                                  ; $1DAC2E |
  JSR code_1FEA98                           ; $1DAC30 |
code_1DAC33:
  LDA {animation_timer},x                   ; $1DAC33 |
  CMP #$05                                  ; $1DAC36 |
  BNE code_1DAC7D                           ; $1DAC38 |
  LDA {animation_frame},x                   ; $1DAC3A |
  BEQ code_1DAC48                           ; $1DAC3D |
  CMP #$05                                  ; $1DAC3F |
  BNE code_1DAC7D                           ; $1DAC41 |
  LDA #$96                                  ; $1DAC43 |
  JMP code_1FEA98                           ; $1DAC45 |

code_1DAC48:
  JSR code_1FF16F                           ; $1DAC48 |
  BCS code_1DAC7D                           ; $1DAC4B |
  LDA #$C7                                  ; $1DAC4D |
  STA {sprite_flags},y                      ; $1DAC4F |
  LDA #$01                                  ; $1DAC52 |
  STA {entity_life},y                       ; $1DAC54 |
  LDA #$65                                  ; $1DAC57 |
  STA {entity_type},y                       ; $1DAC59 |
  LDA {entity_direction},x                  ; $1DAC5C |
  STA {entity_direction},y                  ; $1DAC5F |
  AND #$01                                  ; $1DAC62 |
  CLC                                       ; $1DAC64 |
  ADC #$53                                  ; $1DAC65 |
  STA $10                                   ; $1DAC67 |
  LDA #$9E                                  ; $1DAC69 |
  JSR code_1FEAF5                           ; $1DAC6B |
  LDA #$00                                  ; $1DAC6E |
  STA {x_speed_frac},y                      ; $1DAC70 |
  LDA #$04                                  ; $1DAC73 |
  STA {x_speed},y                           ; $1DAC75 |
  TYA                                       ; $1DAC78 |
  STA {entity_var_b},x                      ; $1DAC79 |
  RTS                                       ; $1DAC7C |

code_1DAC7D:
  INC {entity_var_a},x                      ; $1DAC7D |
  LDA {entity_var_a},x                      ; $1DAC80 |
  CMP #$78                                  ; $1DAC83 |
  BCC code_1DACC1                           ; $1DAC85 |
  LDA #$00                                  ; $1DAC87 |
  STA {entity_var_a},x                      ; $1DAC89 |
  LDY {entity_var_b},x                      ; $1DAC8C |
  LDA {entity_type},y                       ; $1DAC8F |
  CMP #$65                                  ; $1DAC92 |
  BEQ code_1DACC1                           ; $1DAC94 |
  JSR code_1FF16F                           ; $1DAC96 |
  BCS code_1DACC1                           ; $1DAC99 |
  LDA #$87                                  ; $1DAC9B |
  STA {sprite_flags},y                      ; $1DAC9D |
  LDA #$9B                                  ; $1DACA0 |
  STA {entity_type},y                       ; $1DACA2 |
  LDA {entity_direction},x                  ; $1DACA5 |
  STA {entity_direction},y                  ; $1DACA8 |
  AND #$01                                  ; $1DACAB |
  CLC                                       ; $1DACAD |
  ADC #$02                                  ; $1DACAE |
  STA $10                                   ; $1DACB0 |
  LDA #$9F                                  ; $1DACB2 |
  JSR code_1FEAF5                           ; $1DACB4 |
  LDA #$00                                  ; $1DACB7 |
  STA {x_speed_frac},y                      ; $1DACB9 |
  LDA #$02                                  ; $1DACBC |
  STA {x_speed},y                           ; $1DACBE |
code_1DACC1:
  RTS                                       ; $1DACC1 |

  LDA {entity_display_flags},x              ; $1DACC2 |
  AND #$FB                                  ; $1DACC5 |
  STA {entity_display_flags},x              ; $1DACC7 |
  LDA #$DB                                  ; $1DACCA |
  STA {entity_handler_low},x                ; $1DACCC |
  LDA #$AC                                  ; $1DACCF |
  STA {entity_handler_high},x               ; $1DACD1 |
  LDA $5D                                   ; $1DACD4 |
  BEQ code_1DACDB                           ; $1DACD6 |
  JMP code_1FF2C4                           ; $1DACD8 |

code_1DACDB:
  LDY #$21                                  ; $1DACDB |
  JSR code_1FE7B7                           ; $1DACDD |
  BCC code_1DAD2B                           ; $1DACE0 |
  LDY #$28                                  ; $1DACE2 |
  JSR code_1FEA3F                           ; $1DACE4 |
  BCC code_1DACEC                           ; $1DACE7 |
  JSR code_1FEC4A                           ; $1DACE9 |
code_1DACEC:
  JSR distance_to_player                    ; $1DACEC |
  CMP #$20                                  ; $1DACEF |
  BCS code_1DAD2B                           ; $1DACF1 |
  LDA #$02                                  ; $1DACF3 |
  STA {entity_handler_low},x                ; $1DACF5 |
  LDA #$AD                                  ; $1DACF8 |
  STA {entity_handler_high},x               ; $1DACFA |
  LDA #$08                                  ; $1DACFD |
  JSR code_1FEA98                           ; $1DACFF |
  LDA {animation_timer},x                   ; $1DAD02 |
  CMP #$08                                  ; $1DAD05 |
  BNE code_1DAD7B                           ; $1DAD07 |
  LDA {animation_frame},x                   ; $1DAD09 |
  CMP #$03                                  ; $1DAD0C |
  BEQ code_1DAD2C                           ; $1DAD0E |
  CMP #$05                                  ; $1DAD10 |
  BNE code_1DAD7B                           ; $1DAD12 |
  LDA #$50                                  ; $1DAD14 |
  STA {entity_var_a},x                      ; $1DAD16 |
  LDA #$7C                                  ; $1DAD19 |
  STA {entity_handler_low},x                ; $1DAD1B |
  LDA #$AD                                  ; $1DAD1E |
  STA {entity_handler_high},x               ; $1DAD20 |
  LDA #$07                                  ; $1DAD23 |
  JSR code_1FEA98                           ; $1DAD25 |
  INC {animation_frame},x                   ; $1DAD28 |
code_1DAD2B:
  RTS                                       ; $1DAD2B |

code_1DAD2C:
  STX $0F                                   ; $1DAD2C |
  JSR code_1FF16F                           ; $1DAD2E |
  BCS code_1DAD7B                           ; $1DAD31 |
  LDA #$57                                  ; $1DAD33 |
  STA {entity_type},y                       ; $1DAD35 |
  LDA #$00                                  ; $1DAD38 |
  STA {sprite_flags},y                      ; $1DAD3A |
  STA {entity_life},y                       ; $1DAD3D |
  STA {x_speed_frac},y                      ; $1DAD40 |
  STA {y_speed_frac},y                      ; $1DAD43 |
  LDA #$01                                  ; $1DAD46 |
  STA {x_speed},y                           ; $1DAD48 |
  LDA #$04                                  ; $1DAD4B |
  STA {y_speed},y                           ; $1DAD4D |
  LDA {entity_direction},x                  ; $1DAD50 |
  STA {entity_direction},y                  ; $1DAD53 |
  LDA $0438,x                               ; $1DAD56 |
  STA $0438,y                               ; $1DAD59 |
  LDA $E5                                   ; $1DAD5C |\  RNG roll:
  ADC $E7                                   ; $1DAD5E | | random index
  STA $E7                                   ; $1DAD60 | | for Eddie item drop
  AND #$07                                  ; $1DAD62 | | BASED EDDIE
  TAX                                       ; $1DAD64 |/  8 possibilities
  LDA eddie_item_drops,x                    ; $1DAD65 |
  LDX $0F                                   ; $1DAD68 |
  JSR code_1FEAA4                           ; $1DAD6A |
  LDA #$23                                  ; $1DAD6D |
  STA {entity_var_a},y                      ; $1DAD6F |
  LDA {y_position_low},y                    ; $1DAD72 |
  SEC                                       ; $1DAD75 |
  SBC #$0C                                  ; $1DAD76 |
  STA {y_position_low},y                    ; $1DAD78 |
code_1DAD7B:
  RTS                                       ; $1DAD7B |

  LDA {entity_var_a},x                      ; $1DAD7C |
  BEQ code_1DAD90                           ; $1DAD7F |
  LDA #$00                                  ; $1DAD81 |
  STA {animation_timer},x                   ; $1DAD83 |
  DEC {entity_var_a},x                      ; $1DAD86 |
  BNE code_1DAD7B                           ; $1DAD89 |
  LDA #$09                                  ; $1DAD8B |
  JSR code_1FEA98                           ; $1DAD8D |
code_1DAD90:
  LDA {animation_timer},x                   ; $1DAD90 |
  CMP #$02                                  ; $1DAD93 |
  BNE code_1DAD7B                           ; $1DAD95 |
  CMP {animation_frame},x                   ; $1DAD97 |
  BNE code_1DAD7B                           ; $1DAD9A |
  LDA #$B1                                  ; $1DAD9C |
  STA {entity_handler_low},x                ; $1DAD9E |
  LDA #$AD                                  ; $1DADA1 |
  STA {entity_handler_high},x               ; $1DADA3 |
  LDA #$00                                  ; $1DADA6 |
  STA {y_speed_frac},x                      ; $1DADA8 |
  STA {y_speed},x                           ; $1DADAB |
  INC {animation_frame},x                   ; $1DADAE |
  LDA #$00                                  ; $1DADB1 |
  STA {animation_timer},x                   ; $1DADB3 |
  JSR apply_gravity_upwards                 ; $1DADB6 |
  JSR apply_vertical_speed_up_alt           ; $1DADB9 |
  LDA {y_position_high},x                   ; $1DADBC |
  BEQ code_1DAD7B                           ; $1DADBF |
  JMP code_1FF2C4                           ; $1DADC1 |

; the items Eddie can drop
; 3/8 chance: extra life
; 2/8 chance: large energy container
; 2/8 chance: large ammo container
; 1/8 chance: E tank
eddie_item_drops:
  db $78, $74, $76, $72, $78, $74, $76, $78 ; $1DADC4 |

  LDY {entity_var_a},x                      ; $1DADCC |
  JSR code_1FE7B7                           ; $1DADCF |
  BCC code_1DADDE                           ; $1DADD2 |
  LDA #$ED                                  ; $1DADD4 |
  STA {entity_handler_low},x                ; $1DADD6 |
  LDA #$AD                                  ; $1DADD9 |
  STA {entity_handler_high},x               ; $1DADDB |
code_1DADDE:
  LDY #$2A                                  ; $1DADDE |
  JSR code_1FEA3F                           ; $1DADE0 |
  JSR $8526                                 ; $1DADE3 |
  BCC code_1DADED                           ; $1DADE6 |
  LDA #$00                                  ; $1DADE8 |
  STA {entity_direction},x                  ; $1DADEA |
code_1DADED:
  LDA {animation_index},x                   ; $1DADED |
  CMP #$73                                  ; $1DADF0 |
  BNE code_1DADFD                           ; $1DADF2 |
  LDA $BE                                   ; $1DADF4 |
  CMP #$80                                  ; $1DADF6 |
  BEQ code_1DADFD                           ; $1DADF8 |
  JMP code_1FF2C4                           ; $1DADFA |

code_1DADFD:
  LDA {entity_display_flags},x              ; $1DADFD |
  AND #$FB                                  ; $1DAE00 |
  STA {entity_display_flags},x              ; $1DAE02 |
  LDA $30                                   ; $1DAE05 |
  CMP #$06                                  ; $1DAE07 |
  BCS code_1DAE42                           ; $1DAE09 |
  JSR code_1FEF87                           ; $1DAE0B |
  BCS code_1DAE42                           ; $1DAE0E |
  LDA {entity_type},x                       ; $1DAE10 |
  CMP #$B6                                  ; $1DAE13 |
  BEQ code_1DAE1F                           ; $1DAE15 |
  CMP #$57                                  ; $1DAE17 |
  BNE code_1DAE22                           ; $1DAE19 |
  INC $5D                                   ; $1DAE1B |
  BNE code_1DAE22                           ; $1DAE1D |
code_1DAE1F:
  JSR code_1FF297                           ; $1DAE1F |
code_1DAE22:
  LDY {animation_index},x                   ; $1DAE22 |
  LDA $AEC7,y                               ; $1DAE25 |
  BEQ code_1DAE2D                           ; $1DAE28 |
  JSR code_1FEC5D                           ; $1DAE2A |
code_1DAE2D:
  LDA $AEB8,y                               ; $1DAE2D |
  STA $5A                                   ; $1DAE30 |
  LDA $AED6,y                               ; $1DAE32 |
  STA $00                                   ; $1DAE35 |
  LDA $AEE5,y                               ; $1DAE37 |
  STA $01                                   ; $1DAE3A |
  JSR code_1FF2C4                           ; $1DAE3C |
  JMP ($0000)                               ; $1DAE3F |

code_1DAE42:
  LDA {entity_type},x                       ; $1DAE42 |
  CMP #$B7                                  ; $1DAE45 |
  BNE code_1DAE58                           ; $1DAE47 |
  DEC {entity_var_b},x                      ; $1DAE49 |
  LDA {entity_var_b},x                      ; $1DAE4C |
  BEQ code_1DAE8B                           ; $1DAE4F |
  CMP #$3C                                  ; $1DAE51 |
  BCS code_1DAE58                           ; $1DAE53 |
  STA {entity_flash_counter},x              ; $1DAE55 |
code_1DAE58:
  RTS                                       ; $1DAE58 |

  LDA {animation_frame},x                   ; $1DAE59 |
  CMP #$04                                  ; $1DAE5C |
  BNE code_1DAE58                           ; $1DAE5E |
  LDA $2F                                   ; $1DAE60 |
  BMI code_1DAE58                           ; $1DAE62 |
  LDA $E6                                   ; $1DAE64 |\
  ADC $E7                                   ; $1DAE66 | | enemy drop RNG roll
  ADC $00                                   ; $1DAE68 |/
  SBC $9D                                   ; $1DAE6A |
  STA $E6                                   ; $1DAE6C |
  ADC $01                                   ; $1DAE6E |
  SBC $E5                                   ; $1DAE70 |
  ADC $92                                   ; $1DAE72 |
  STA $E7                                   ; $1DAE74 |
  STA $00                                   ; $1DAE76 |
  LDA #$32                                  ; $1DAE78 |
  STA $01                                   ; $1DAE7A |
  JSR code_1FF207                           ; $1DAE7C |
  LDY #$04                                  ; $1DAE7F |
  LDA $03                                   ; $1DAE81 |
code_1DAE83:
  CMP $AF1B,y                               ; $1DAE83 |
  BCC code_1DAE8E                           ; $1DAE86 |
  DEY                                       ; $1DAE88 |
  BPL code_1DAE83                           ; $1DAE89 |
code_1DAE8B:
  JMP code_1FF2C4                           ; $1DAE8B |

code_1DAE8E:
  LDA $AF20,y                               ; $1DAE8E |
  JSR code_1FEA98                           ; $1DAE91 |
  LDA #$00                                  ; $1DAE94 |
  STA {sprite_flags},x                      ; $1DAE96 |
  STA {entity_direction},x                  ; $1DAE99 |
  LDA $AF25,y                               ; $1DAE9C |
  STA {entity_var_a},x                      ; $1DAE9F |
  LDA #$FF                                  ; $1DAEA2 |
  STA {entity_var_b},x                      ; $1DAEA4 |
  JSR reset_vertical_speed                  ; $1DAEA7 |
  LDA #$B7                                  ; $1DAEAA |
  STA {entity_type},x                       ; $1DAEAC |
  LDA #$CC                                  ; $1DAEAF |
  STA {entity_handler_low},x                ; $1DAEB1 |
  LDA #$AD                                  ; $1DAEB4 |
  STA {entity_handler_high},x               ; $1DAEB6 |
code_1DAEB9:
  RTS                                       ; $1DAEB9 |

  LDA $BD                                   ; $1DAEBA |
  CMP #$89                                  ; $1DAEBC |
  BEQ code_1DAEB9                           ; $1DAEBE |
  INC $BD                                   ; $1DAEC0 |
  BNE code_1DAEB9                           ; $1DAEC2 |
  LDA $BE                                   ; $1DAEC4 |
  CMP #$89                                  ; $1DAEC6 |
  BEQ code_1DAEB9                           ; $1DAEC8 |
  INC $BE                                   ; $1DAECA |
  BNE code_1DAEB9                           ; $1DAECC |
  LDA $BF                                   ; $1DAECE |
  CMP #$09                                  ; $1DAED0 |
  BEQ code_1DAEB9                           ; $1DAED2 |
  INC $BF                                   ; $1DAED4 |
  BNE code_1DAEB9                           ; $1DAED6 |
  LDX #$00                                  ; $1DAED8 |
  BEQ code_1DAEE0                           ; $1DAEDA |
  LDX $32                                   ; $1DAEDC |
  BEQ code_1DAEFD                           ; $1DAEDE |
code_1DAEE0:
  LDA $B0,x                                 ; $1DAEE0 |
  CMP #$9C                                  ; $1DAEE2 |
  BEQ code_1DAEFD                           ; $1DAEE4 |
  INC $B0,x                                 ; $1DAEE6 |
  TXA                                       ; $1DAEE8 |
  PHA                                       ; $1DAEE9 |
  LDA #$26                                  ; $1DAEEA |
  JSR code_1FEC5D                           ; $1DAEEC |
  JSR code_1FF363                           ; $1DAEEF |
  LDA #$03                                  ; $1DAEF2 |
  JSR async_next_frame.a                    ; $1DAEF4 |
  PLA                                       ; $1DAEF7 |
  TAX                                       ; $1DAEF8 |
  DEC $5A                                   ; $1DAEF9 |
  BNE code_1DAEE0                           ; $1DAEFB |
code_1DAEFD:
  LDA #$01                                  ; $1DAEFD |
  STA $95                                   ; $1DAEFF |
  LDA #$00                                  ; $1DAF01 |
  STA $5A                                   ; $1DAF03 |
  LDX $A6                                   ; $1DAF05 |
  RTS                                       ; $1DAF07 |

  LDY {animation_index},x                   ; $1DAF08 |
  LDA $F239,y                               ; $1DAF0B |
  ORA $6D                                   ; $1DAF0E |
  STA $6D                                   ; $1DAF10 |
  CMP #$FF                                  ; $1DAF12 |
  BNE code_1DAF1A                           ; $1DAF14 |
  LDA #$9C                                  ; $1DAF16 |
  STA $BC                                   ; $1DAF18 |
code_1DAF1A:
  RTS                                       ; $1DAF1A |

  db $0E, $0A, $08, $03, $02, $77, $74, $75 ; $1DAF1B |
  db $78, $76, $13, $23, $13, $23, $23, $00 ; $1DAF23 |
  db $00, $0A, $02, $0A, $02, $00, $00, $00 ; $1DAF2B |
  db $00, $00, $00, $00, $00, $00, $24, $24 ; $1DAF33 |
  db $00, $00, $00, $00, $24, $24, $24, $24 ; $1DAF3B |
  db $24, $24, $24, $24, $24, $BA, $C4, $D8 ; $1DAF43 |
  db $D8, $DC, $DC, $CE, $08, $08, $08, $08 ; $1DAF4B |
  db $08, $08, $08, $08, $AE, $AE, $AE, $AE ; $1DAF53 |
  db $AE, $AE, $AE, $AF, $AF, $AF, $AF, $AF ; $1DAF5B |
  db $AF, $AF, $AF                          ; $1DAF63 |

  JSR code_1FEA65                           ; $1DAF66 |
  LDA {x_position_low},x                    ; $1DAF69 |
  SEC                                       ; $1DAF6C |
  SBC $FC                                   ; $1DAF6D |
  STA $00                                   ; $1DAF6F |
  LDA {x_position_high},x                   ; $1DAF71 |
  SBC $F9                                   ; $1DAF74 |
  BNE code_1DAFDB                           ; $1DAF76 |
  LDA $00                                   ; $1DAF78 |
  CMP #$18                                  ; $1DAF7A |
  BCC code_1DAFDB                           ; $1DAF7C |
  CMP #$F4                                  ; $1DAF7E |
  BCS code_1DAFDB                           ; $1DAF80 |
  LDY $26                                   ; $1DAF82 |
  LDA $B0E1,y                               ; $1DAF84 |
  BEQ code_1DAFDB                           ; $1DAF87 |
  CPY #$0B                                  ; $1DAF89 |
  BNE code_1DAF93                           ; $1DAF8B |
  LDA $FA                                   ; $1DAF8D |
  AND #$0F                                  ; $1DAF8F |
  BNE code_1DAFDB                           ; $1DAF91 |
code_1DAF93:
  LDA $1C                                   ; $1DAF93 |
  BNE code_1DAFDB                           ; $1DAF95 |
  LDY #$06                                  ; $1DAF97 |
  JSR code_1EC4A1                           ; $1DAF99 |
  LDA $10                                   ; $1DAF9C |
  CMP #$30                                  ; $1DAF9E |
  BNE code_1DAFDB                           ; $1DAFA0 |
  LDA #$2B                                  ; $1DAFA2 |
  JSR code_1FEC5D                           ; $1DAFA4 |
  JSR code_1FF2C4                           ; $1DAFA7 |
  LDA #$42                                  ; $1DAFAA |
  JSR code_1FEA98                           ; $1DAFAC |
  LDA #$01                                  ; $1DAFAF |
  STA {entity_type},x                       ; $1DAFB1 |
  LDA {x_position_low},x                    ; $1DAFB4 |
  AND #$F0                                  ; $1DAFB7 |
  ORA #$08                                  ; $1DAFB9 |
  STA {x_position_low},x                    ; $1DAFBB |
  LDA {y_position_low},x                    ; $1DAFBE |
  AND #$F0                                  ; $1DAFC1 |
  ORA #$08                                  ; $1DAFC3 |
  STA {y_position_low},x                    ; $1DAFC5 |
  LDY $26                                   ; $1DAFC8 |
  LDA $B0E1,y                               ; $1DAFCA |
  TAY                                       ; $1DAFCD |
  LDA $B0F0,y                               ; $1DAFCE |
  STA $00                                   ; $1DAFD1 |
  LDA $B0F3,y                               ; $1DAFD3 |
  STA $01                                   ; $1DAFD6 |
  JMP ($0000)                               ; $1DAFD8 |

code_1DAFDB:
  RTS                                       ; $1DAFDB |

  LDY #$30                                  ; $1DAFDC |
code_1DAFDE:
  LDA $B0AD,y                               ; $1DAFDE |
  CMP {x_position_high},x                   ; $1DAFE1 |
  BNE code_1DB019                           ; $1DAFE4 |
  LDA $B0AE,y                               ; $1DAFE6 |
  CMP $22                                   ; $1DAFE9 |
  BNE code_1DB019                           ; $1DAFEB |
  LDA $B0AF,y                               ; $1DAFED |
  CMP $03                                   ; $1DAFF0 |
  BNE code_1DB019                           ; $1DAFF2 |
  STA $10                                   ; $1DAFF4 |
  LDX $43                                   ; $1DAFF6 |
  STA $06C2,x                               ; $1DAFF8 |
  LDA $B0AD,y                               ; $1DAFFB |
  STA $06C0,x                               ; $1DAFFE |
  LDA $B0AE,y                               ; $1DB001 |
  STA $06C1,x                               ; $1DB004 |
  LDA $B0B0,y                               ; $1DB007 |
  STA $06C3,x                               ; $1DB00A |
  INX                                       ; $1DB00D |
  INX                                       ; $1DB00E |
  INX                                       ; $1DB00F |
  INX                                       ; $1DB010 |
  STX $43                                   ; $1DB011 |
  LDX $A6                                   ; $1DB013 |
  TAY                                       ; $1DB015 |
  JMP code_1ED7DB                           ; $1DB016 |

code_1DB019:
  DEY                                       ; $1DB019 |
  DEY                                       ; $1DB01A |
  DEY                                       ; $1DB01B |
  DEY                                       ; $1DB01C |
  BPL code_1DAFDE                           ; $1DB01D |
  RTS                                       ; $1DB01F |

  LDA {y_position_low},x                    ; $1DB020 |
  PHA                                       ; $1DB023 |
  LDA $11                                   ; $1DB024 |
  STA {y_position_low},x                    ; $1DB026 |
  JSR code_1ED8A2                           ; $1DB029 |
  JSR code_1ED8C7                           ; $1DB02C |
  LDY #$00                                  ; $1DB02F |
  JSR code_1ED7DB                           ; $1DB031 |
  PLA                                       ; $1DB034 |
  STA {y_position_low},x                    ; $1DB035 |
  RTS                                       ; $1DB038 |

  LDA {y_position_low},x                    ; $1DB039 |
  PHA                                       ; $1DB03C |
  LDA $11                                   ; $1DB03D |
  STA {y_position_low},x                    ; $1DB03F |
  LDA {x_position_high},x                   ; $1DB042 |
  PHA                                       ; $1DB045 |
  LDA $13                                   ; $1DB046 |
  STA {x_position_high},x                   ; $1DB048 |
  TAY                                       ; $1DB04B |
  LDA $11                                   ; $1DB04C |
  AND #$F0                                  ; $1DB04E |
  ORA $13                                   ; $1DB050 |
  STA $00                                   ; $1DB052 |
  LDA $BA18,y                               ; $1DB054 |
  STA $01                                   ; $1DB057 |
  LDA $B9BB,y                               ; $1DB059 |
  TAY                                       ; $1DB05C |
code_1DB05D:
  LDA $B9BE,y                               ; $1DB05D |
  CMP $00                                   ; $1DB060 |
  BNE code_1DB06C                           ; $1DB062 |
  LDA $B9BF,y                               ; $1DB064 |
  CMP {x_position_low},x                    ; $1DB067 |
  BEQ code_1DB073                           ; $1DB06A |
code_1DB06C:
  INY                                       ; $1DB06C |
  INY                                       ; $1DB06D |
  INY                                       ; $1DB06E |
  INC $01                                   ; $1DB06F |
  BNE code_1DB05D                           ; $1DB071 |
code_1DB073:
  LDA $01                                   ; $1DB073 |
  AND #$07                                  ; $1DB075 |
  TAY                                       ; $1DB077 |
  LDA $F2B2,y                               ; $1DB078 |
  STA $00                                   ; $1DB07B |
  LDA $01                                   ; $1DB07D |
  PHA                                       ; $1DB07F |
  LSR                                       ; $1DB080 |
  LSR                                       ; $1DB081 |
  LSR                                       ; $1DB082 |
  TAY                                       ; $1DB083 |
  LDA $05DC,y                               ; $1DB084 |
  ORA $00                                   ; $1DB087 |
  STA $05DC,y                               ; $1DB089 |
  JSR code_1ED8A2                           ; $1DB08C |
  JSR code_1ED8C7                           ; $1DB08F |
  PLA                                       ; $1DB092 |
  TAY                                       ; $1DB093 |
  LDA $BA1B,y                               ; $1DB094 |
  TAY                                       ; $1DB097 |
  JSR code_1ED7DB                           ; $1DB098 |
  PLA                                       ; $1DB09B |
  STA {x_position_high},x                   ; $1DB09C |
  PLA                                       ; $1DB09F |
  STA {y_position_low},x                    ; $1DB0A0 |
  LDA #$00                                  ; $1DB0A3 |
  STA $95                                   ; $1DB0A5 |
  JSR async_next_frame                      ; $1DB0A7 |
  INC $95                                   ; $1DB0AA |
  RTS                                       ; $1DB0AC |

  db $05, $2F, $02, $00, $05, $2F, $03, $00 ; $1DB0AD |
  db $05, $37, $00, $00, $05, $37, $01, $00 ; $1DB0B5 |
  db $0F, $1F, $01, $00, $0F, $1F, $03, $00 ; $1DB0BD |
  db $0F, $27, $01, $00, $1A, $1F, $00, $00 ; $1DB0C5 |
  db $1A, $1F, $01, $00, $1A, $1F, $02, $00 ; $1DB0CD |
  db $1A, $1F, $03, $00, $1A, $27, $00, $00 ; $1DB0D5 |
  db $1A, $27, $01, $00, $00, $00, $01, $00 ; $1DB0DD |
  db $00, $00, $00, $00, $00, $00, $00, $03 ; $1DB0E5 |
  db $02, $00, $00, $00, $DC, $20, $39, $AF ; $1DB0ED |
  db $B0, $B0                               ; $1DB0F5 |

  LDA $FC                                   ; $1DB0F7 |
  CLC                                       ; $1DB0F9 |
  ADC #$80                                  ; $1DB0FA |
  STA {x_position_low},x                    ; $1DB0FC |
  LDA $F9                                   ; $1DB0FF |
  ADC #$00                                  ; $1DB101 |
  STA {x_position_high},x                   ; $1DB103 |
  DEC {entity_var_a},x                      ; $1DB106 |
  BNE code_1DB118                           ; $1DB109 |
  LDA $0620                                 ; $1DB10B |
  STA $0610                                 ; $1DB10E |
  LDA #$FF                                  ; $1DB111 |
  STA $18                                   ; $1DB113 |
  JMP code_1FF2C4                           ; $1DB115 |

code_1DB118:
  RTS                                       ; $1DB118 |

  LDA #$00                                  ; $1DB119 |
  STA {animation_timer},x                   ; $1DB11B |
  LDA {entity_var_a},x                      ; $1DB11E |
  BEQ code_1DB130                           ; $1DB121 |
  DEC {entity_var_a},x                      ; $1DB123 |
  BNE code_1DB118                           ; $1DB126 |
  LDA {entity_display_flags},x              ; $1DB128 |
  EOR #$40                                  ; $1DB12B |
  STA {entity_display_flags},x              ; $1DB12D |
code_1DB130:
  JSR apply_gravity_upwards                 ; $1DB130 |
  JSR apply_vertical_speed_up               ; $1DB133 |
  LDA {y_position_high},x                   ; $1DB136 |
  BEQ code_1DB13E                           ; $1DB139 |
  JSR code_1FF2C4                           ; $1DB13B |
code_1DB13E:
  RTS                                       ; $1DB13E |

  JSR apply_teleport_vertical_speedup       ; $1DB13F |
  JSR apply_vertical_speed_down_alt         ; $1DB142 |
  LDA $46                                   ; $1DB145 |
  ORA $AF                                   ; $1DB147 |
  BNE code_1DB182                           ; $1DB149 |
  LDA {y_position_low}                      ; $1DB14B |
  SEC                                       ; $1DB14E |
  SBC {y_position_low},x                    ; $1DB14F |
  BCC code_1DB158                           ; $1DB152 |
  CMP #$28                                  ; $1DB154 |
  BCS code_1DB182                           ; $1DB156 |
code_1DB158:
  LDY #$1B                                  ; $1DB158 |
  JSR code_1EC4A1                           ; $1DB15A |
  LDA $10                                   ; $1DB15D |
  AND #$10                                  ; $1DB15F |
  BNE code_1DB182                           ; $1DB161 |
  LDY #$17                                  ; $1DB163 |
  JSR code_1EC4A1                           ; $1DB165 |
  LDA $10                                   ; $1DB168 |
  AND #$10                                  ; $1DB16A |
  BNE code_1DB182                           ; $1DB16C |
  LDA #$78                                  ; $1DB16E |
  STA {entity_handler_low},x                ; $1DB170 |
  LDA #$B1                                  ; $1DB173 |
  STA {entity_handler_high},x               ; $1DB175 |
  LDY #$17                                  ; $1DB178 |
  JSR apply_teleport_vertical_speedup       ; $1DB17A |
  JSR code_1FE747                           ; $1DB17D |
  BCS code_1DB188                           ; $1DB180 |
code_1DB182:
  LDA #$00                                  ; $1DB182 |
  STA {animation_timer},x                   ; $1DB184 |
code_1DB187:
  RTS                                       ; $1DB187 |

code_1DB188:
  LDA {animation_frame},x                   ; $1DB188 |
  CMP #$04                                  ; $1DB18B |
  BNE code_1DB187                           ; $1DB18D |
  LDA #$99                                  ; $1DB18F |
  JSR code_1FEA98                           ; $1DB191 |
  LDA #$05                                  ; $1DB194 |
  STA $ED                                   ; $1DB196 |
  LDA #$A2                                  ; $1DB198 |
  STA {entity_handler_low},x                ; $1DB19A |
  LDA #$B1                                  ; $1DB19D |
  STA {entity_handler_high},x               ; $1DB19F |
  LDA $30                                   ; $1DB1A2 |
  CMP #$02                                  ; $1DB1A4 |
  BCS code_1DB187                           ; $1DB1A6 |
  JSR code_1FEF87                           ; $1DB1A8 |
  BCS code_1DB187                           ; $1DB1AB |
  JSR distance_to_player                    ; $1DB1AD |
  CMP #$07                                  ; $1DB1B0 |
  BCS code_1DB187                           ; $1DB1B2 |
  LDA {y_position_low},x                    ; $1DB1B4 |
  SEC                                       ; $1DB1B7 |
  SBC {y_position_low}                      ; $1DB1B8 |
  BCC code_1DB187                           ; $1DB1BB |
  CMP #$0C                                  ; $1DB1BD |
  BCC code_1DB187                           ; $1DB1BF |
  LDA {entity_display_flags},x              ; $1DB1C1 |
  ORA #$01                                  ; $1DB1C4 |
  STA {entity_display_flags},x              ; $1DB1C6 |
  LDA #$A9                                  ; $1DB1C9 |
  STA {y_speed_frac},x                      ; $1DB1CB |
  LDA #$05                                  ; $1DB1CE |
  STA {y_speed},x                           ; $1DB1D0 |
  LDA #$11                                  ; $1DB1D3 |
  STA {sprite_flags},x                      ; $1DB1D5 |
  LDA #$E7                                  ; $1DB1D8 |
  STA {entity_handler_low},x                ; $1DB1DA |
  LDA #$B1                                  ; $1DB1DD |
  STA {entity_handler_high},x               ; $1DB1DF |
  LDA #$04                                  ; $1DB1E2 |
  JMP code_1DB5E8                           ; $1DB1E4 |

  LDA #$9A                                  ; $1DB1E7 |
  CMP {animation_index},x                   ; $1DB1E9 |
  BEQ code_1DB1F1                           ; $1DB1EC |
  JSR code_1FEA98                           ; $1DB1EE |
code_1DB1F1:
  LDY #$17                                  ; $1DB1F1 |
  JSR code_1FE7B7                           ; $1DB1F3 |
  BCC code_1DB238                           ; $1DB1F6 |
code_1DB1F8:
  LDA #$00                                  ; $1DB1F8 |
  STA {y_speed_frac},x                      ; $1DB1FA |
  LDA #$08                                  ; $1DB1FD |
  STA {y_speed},x                           ; $1DB1FF |
  LDA #$22                                  ; $1DB202 |
  STA {entity_handler_low},x                ; $1DB204 |
  LDA #$B2                                  ; $1DB207 |
  STA {entity_handler_high},x               ; $1DB209 |
  LDA #$4E                                  ; $1DB20C |
  JSR code_1FEA98                           ; $1DB20E |
  LDA #$46                                  ; $1DB211 |
  STA $ED                                   ; $1DB213 |
  LDA #$04                                  ; $1DB215 |
  STA {animation_frame},x                   ; $1DB217 |
  LDA {entity_display_flags},x              ; $1DB21A |
  AND #$FE                                  ; $1DB21D |
  STA {entity_display_flags},x              ; $1DB21F |
  LDA {animation_frame},x                   ; $1DB222 |
  BNE code_1DB238                           ; $1DB225 |
  JSR apply_teleport_vertical_speedup       ; $1DB227 |
  JSR apply_vertical_speed_up_alt           ; $1DB22A |
  LDA {y_position_high},x                   ; $1DB22D |
  STA {animation_timer},x                   ; $1DB230 |
  BEQ code_1DB238                           ; $1DB233 |
  JSR code_1FF2C4                           ; $1DB235 |
code_1DB238:
  RTS                                       ; $1DB238 |

  JSR apply_teleport_vertical_speedup       ; $1DB239 |
  JSR apply_vertical_speed_down_alt         ; $1DB23C |
  LDA $46                                   ; $1DB23F |
  ORA $AF                                   ; $1DB241 |
  BNE code_1DB26E                           ; $1DB243 |
  LDA {y_position_low}                      ; $1DB245 |
  SEC                                       ; $1DB248 |
  SBC {y_position_low},x                    ; $1DB249 |
  BCC code_1DB252                           ; $1DB24C |
  CMP #$10                                  ; $1DB24E |
  BCS code_1DB26E                           ; $1DB250 |
code_1DB252:
  LDY #$17                                  ; $1DB252 |
  JSR code_1EC4A1                           ; $1DB254 |
  LDA $10                                   ; $1DB257 |
  AND #$10                                  ; $1DB259 |
  BNE code_1DB26E                           ; $1DB25B |
  LDA {y_position_low},x                    ; $1DB25D |
  CMP #$D0                                  ; $1DB260 |
  BCS code_1DB26E                           ; $1DB262 |
  LDA #$74                                  ; $1DB264 |
  STA {entity_handler_low},x                ; $1DB266 |
  LDA #$B2                                  ; $1DB269 |
  STA {entity_handler_high},x               ; $1DB26B |
code_1DB26E:
  LDA #$00                                  ; $1DB26E |
  STA {animation_timer},x                   ; $1DB270 |
code_1DB273:
  RTS                                       ; $1DB273 |

  LDA {animation_frame},x                   ; $1DB274 |
  CMP #$04                                  ; $1DB277 |
  BNE code_1DB273                           ; $1DB279 |
  LDA #$98                                  ; $1DB27B |
  JSR code_1FEA98                           ; $1DB27D |
  LDA #$04                                  ; $1DB280 |
  STA $ED                                   ; $1DB282 |
  LDA #$96                                  ; $1DB284 |
  STA {entity_handler_low},x                ; $1DB286 |
  LDA #$B2                                  ; $1DB289 |
  STA {entity_handler_high},x               ; $1DB28B |
  LDA {entity_display_flags},x              ; $1DB28E |
  ORA #$01                                  ; $1DB291 |
  STA {entity_display_flags},x              ; $1DB293 |
  LDA {entity_var_e}                        ; $1DB296 |
  BEQ code_1DB273                           ; $1DB299 |
  LDA #$C1                                  ; $1DB29B |
  STA {entity_handler_low},x                ; $1DB29D |
  LDA #$B2                                  ; $1DB2A0 |
  STA {entity_handler_high},x               ; $1DB2A2 |
  LDA {entity_direction},x                  ; $1DB2A5 |
  STA {entity_direction}                    ; $1DB2A8 |
  LDA {entity_display_flags},x              ; $1DB2AB |
  AND #$20                                  ; $1DB2AE |
  STA $00                                   ; $1DB2B0 |
  LDA {entity_display_flags}                ; $1DB2B2 |
  AND #$DF                                  ; $1DB2B5 |
  ORA $00                                   ; $1DB2B7 |
  STA {entity_display_flags}                ; $1DB2B9 |
  LDA #$32                                  ; $1DB2BC |
  STA {entity_var_a},x                      ; $1DB2BE |
  DEC {entity_var_a},x                      ; $1DB2C1 |
  BNE code_1DB2D0                           ; $1DB2C4 |
  LDA #$32                                  ; $1DB2C6 |
  STA {entity_var_a},x                      ; $1DB2C8 |
  LDA #$01                                  ; $1DB2CB |
  JSR code_1DB5E8                           ; $1DB2CD |
code_1DB2D0:
  LDA {entity_direction},x                  ; $1DB2D0 |
  AND #$03                                  ; $1DB2D3 |
  STA {entity_direction},x                  ; $1DB2D5 |
  LDY #$00                                  ; $1DB2D8 |
  LDA {entity_var_e}                        ; $1DB2DA |
  BEQ code_1DB2FE                           ; $1DB2DD |
  LDA {entity_direction},x                  ; $1DB2DF |
  STA $39                                   ; $1DB2E2 |
  LDA $16                                   ; $1DB2E4 |
  AND #$03                                  ; $1DB2E6 |
  BEQ code_1DB2F1                           ; $1DB2E8 |
  CMP {entity_direction},x                  ; $1DB2EA |
  BEQ code_1DB2F1                           ; $1DB2ED |
  LDY #$02                                  ; $1DB2EF |
code_1DB2F1:
  LDA $16                                   ; $1DB2F1 |
  AND #$0C                                  ; $1DB2F3 |
  BEQ code_1DB2FE                           ; $1DB2F5 |
  ORA {entity_direction},x                  ; $1DB2F7 |
  STA {entity_direction},x                  ; $1DB2FA |
  INY                                       ; $1DB2FD |
code_1DB2FE:
  LDA $B34F,y                               ; $1DB2FE |
  STA {x_speed_frac},x                      ; $1DB301 |
  STA $3A                                   ; $1DB304 |
  LDA $B353,y                               ; $1DB306 |
  STA {x_speed},x                           ; $1DB309 |
  STA $3B                                   ; $1DB30C |
  LDA $B357,y                               ; $1DB30E |
  STA {y_speed_frac},x                      ; $1DB311 |
  LDA $B35B,y                               ; $1DB314 |
  STA {y_speed},x                           ; $1DB317 |
  LDA $BB                                   ; $1DB31A |
  CMP #$80                                  ; $1DB31C |
  BEQ code_1DB327                           ; $1DB31E |
  LDY #$1C                                  ; $1DB320 |
  JSR code_1FEA3F                           ; $1DB322 |
  BCC code_1DB338                           ; $1DB325 |
code_1DB327:
  LDA $39                                   ; $1DB327 |
  BEQ code_1DB335                           ; $1DB329 |
  LDA {y_speed}                             ; $1DB32B |
  BPL code_1DB335                           ; $1DB32E |
  LDY #$00                                  ; $1DB330 |
  JSR code_1FEA34                           ; $1DB332 |
code_1DB335:
  JMP code_1DB1F8                           ; $1DB335 |

code_1DB338:
  LDY #$17                                  ; $1DB338 |
  JSR code_1FEA52                           ; $1DB33A |
  LDA #$E8                                  ; $1DB33D |
  CMP {y_position_low},x                    ; $1DB33F |
  BCC code_1DB34B                           ; $1DB342 |
  LDA #$1C                                  ; $1DB344 |
  CMP {y_position_low},x                    ; $1DB346 |
  BCC code_1DB34E                           ; $1DB349 |
code_1DB34B:
  STA {y_position_low},x                    ; $1DB34B |
code_1DB34E:
  RTS                                       ; $1DB34E |

  db $4C, $33, $00, $B5, $01, $01, $01, $00 ; $1DB34F |
  db $00, $7F, $00, $B5, $00, $00, $00, $00 ; $1DB357 |

  LDY #$13                                  ; $1DB35F |
  LDA {y_speed_frac},x                      ; $1DB361 |
  STA {entity_var_b},x                      ; $1DB364 |
  LDA {y_speed},x                           ; $1DB367 |
  STA {entity_var_c},x                      ; $1DB36A |
  JSR code_1FE7B7                           ; $1DB36D |
  BCC code_1DB38E                           ; $1DB370 |
  LDY #$00                                  ; $1DB372 |
  LDA {entity_var_b},x                      ; $1DB374 |
  SEC                                       ; $1DB377 |
  SBC #$00                                  ; $1DB378 |
  LDA {entity_var_c},x                      ; $1DB37A |
  SBC #$FD                                  ; $1DB37D |
  BCS code_1DB382                           ; $1DB37F |
  INY                                       ; $1DB381 |
code_1DB382:
  LDA $B3B0,y                               ; $1DB382 |
  STA {y_speed_frac},x                      ; $1DB385 |
  LDA $B3B2,y                               ; $1DB388 |
  STA {y_speed},x                           ; $1DB38B |
code_1DB38E:
  LDY #$1A                                  ; $1DB38E |
  JSR code_1FEA3F                           ; $1DB390 |
  BCC code_1DB39D                           ; $1DB393 |
  LDA {entity_direction},x                  ; $1DB395 |
  EOR #$03                                  ; $1DB398 |
  STA {entity_direction},x                  ; $1DB39A |
code_1DB39D:
  DEC {entity_var_a},x                      ; $1DB39D |
  BNE code_1DB3AF                           ; $1DB3A0 |
  JSR code_1FF2C4                           ; $1DB3A2 |
  LDA #$42                                  ; $1DB3A5 |
  JSR code_1FEA98                           ; $1DB3A7 |
  LDA #$C2                                  ; $1DB3AA |
  STA {entity_type},x                       ; $1DB3AC |
code_1DB3AF:
  RTS                                       ; $1DB3AF |

  db $80, $80, $01, $02                     ; $1DB3B0 |

  LDY #$1A                                  ; $1DB3B4 |
  JSR code_1FEA3F                           ; $1DB3B6 |
  BCC code_1DB40A                           ; $1DB3B9 |
  LDA #$0F                                  ; $1DB3BB |
  STA $5B                                   ; $1DB3BD |
  LDY #$03                                  ; $1DB3BF |
code_1DB3C1:
  LDA #$AD                                  ; $1DB3C1 |
  JSR code_1FEAA4                           ; $1DB3C3 |
  LDA #$73                                  ; $1DB3C6 |
  STA {entity_type},y                       ; $1DB3C8 |
  LDA #$00                                  ; $1DB3CB |
  STA {sprite_flags},y                      ; $1DB3CD |
  LDA #$0B                                  ; $1DB3D0 |
  STA {entity_handler_low},y                ; $1DB3D2 |
  LDA #$B4                                  ; $1DB3D5 |
  STA {entity_handler_high},y               ; $1DB3D7 |
  LDA {entity_direction},x                  ; $1DB3DA |
  EOR #$03                                  ; $1DB3DD |
  ORA $B43B,y                               ; $1DB3DF |
  STA {entity_direction},y                  ; $1DB3E2 |
  LDA $B43E,y                               ; $1DB3E5 |
  STA {x_speed_frac},y                      ; $1DB3E8 |
  LDA $B441,y                               ; $1DB3EB |
  STA {x_speed},y                           ; $1DB3EE |
  LDA $B444,y                               ; $1DB3F1 |
  STA {y_speed_frac},y                      ; $1DB3F4 |
  LDA $B447,y                               ; $1DB3F7 |
  STA {y_speed},y                           ; $1DB3FA |
  LDA #$00                                  ; $1DB3FD |
  STA {sprite_flags},y                      ; $1DB3FF |
  LDA #$78                                  ; $1DB402 |
  STA {entity_var_a},y                      ; $1DB404 |
  DEY                                       ; $1DB407 |
  BNE code_1DB3C1                           ; $1DB408 |
code_1DB40A:
  RTS                                       ; $1DB40A |

  LDY #$1A                                  ; $1DB40B |
  JSR code_1FEA3F                           ; $1DB40D |
  BCC code_1DB41A                           ; $1DB410 |
  LDA {entity_direction},x                  ; $1DB412 |
  EOR #$03                                  ; $1DB415 |
  STA {entity_direction},x                  ; $1DB417 |
code_1DB41A:
  LDY #$13                                  ; $1DB41A |
  JSR code_1FEA52                           ; $1DB41C |
  BCC code_1DB429                           ; $1DB41F |
  LDA {entity_direction},x                  ; $1DB421 |
  EOR #$0C                                  ; $1DB424 |
  STA {entity_direction},x                  ; $1DB426 |
code_1DB429:
  DEC {entity_var_a},x                      ; $1DB429 |
  BNE code_1DB43B                           ; $1DB42C |
  JSR code_1FF2C4                           ; $1DB42E |
  LDA #$01                                  ; $1DB431 |
  STA {entity_type},x                       ; $1DB433 |
  LDA #$42                                  ; $1DB436 |
  JSR code_1FEA98                           ; $1DB438 |
code_1DB43B:
  RTS                                       ; $1DB43B |

  db $00, $08, $04, $00, $D4, $D4, $04, $02 ; $1DB43C |
  db $02, $00, $D4, $D4, $00, $02, $02      ; $1DB444 |

  LDA $16                                   ; $1DB44B |
  AND #$0C                                  ; $1DB44D |
  BEQ code_1DB45E                           ; $1DB44F |
  STA {entity_direction},x                  ; $1DB451 |
  LDA #$5E                                  ; $1DB454 |
  STA {entity_handler_low},x                ; $1DB456 |
  LDA #$B4                                  ; $1DB459 |
  STA {entity_handler_high},x               ; $1DB45B |
code_1DB45E:
  LDA {entity_var_c},x                      ; $1DB45E |
  CMP #$24                                  ; $1DB461 |
  BNE code_1DB46F                           ; $1DB463 |
  LDA #$00                                  ; $1DB465 |
  STA {entity_var_c},x                      ; $1DB467 |
  LDA #$41                                  ; $1DB46A |
  JSR code_1FEC5D                           ; $1DB46C |
code_1DB46F:
  INC {entity_var_c},x                      ; $1DB46F |
  JSR code_1FEA65                           ; $1DB472 |
  JSR code_1FEA86                           ; $1DB475 |
  LDA {y_position_high},x                   ; $1DB478 |
  BEQ code_1DB480                           ; $1DB47B |
  JSR code_1FF2C4                           ; $1DB47D |
code_1DB480:
  RTS                                       ; $1DB480 |

  LDA {animation_timer},x                   ; $1DB481 |
  CMP #$02                                  ; $1DB484 |
  BNE code_1DB4AC                           ; $1DB486 |
  LDY {animation_frame},x                   ; $1DB488 |
  LDA {y_position_low},x                    ; $1DB48B |
  CLC                                       ; $1DB48E |
  ADC $B4D6,y                               ; $1DB48F |
  STA {y_position_low},x                    ; $1DB492 |
  LDA $B4DC,y                               ; $1DB495 |
  STA {entity_var_a},x                      ; $1DB498 |
  LDA $B4E2,y                               ; $1DB49B |
  STA $5B                                   ; $1DB49E |
  LDA {entity_var_b},x                      ; $1DB4A0 |
  BEQ code_1DB4AC                           ; $1DB4A3 |
  CPY #$05                                  ; $1DB4A5 |
  BNE code_1DB4AC                           ; $1DB4A7 |
  JMP code_1FF2C4                           ; $1DB4A9 |

code_1DB4AC:
  LDA {entity_var_c},x                      ; $1DB4AC |
  BEQ code_1DB4BE                           ; $1DB4AF |
  DEC {entity_var_c},x                      ; $1DB4B1 |
  BNE code_1DB4D5                           ; $1DB4B4 |
  LDA {entity_display_flags},x              ; $1DB4B6 |
  AND #$FB                                  ; $1DB4B9 |
  STA {entity_display_flags},x              ; $1DB4BB |
code_1DB4BE:
  LDY {entity_var_a},x                      ; $1DB4BE |
  JSR code_1FE7B7                           ; $1DB4C1 |
  BCC code_1DB4D5                           ; $1DB4C4 |
  LDA #$00                                  ; $1DB4C6 |
  STA {entity_var_b},x                      ; $1DB4C8 |
  LDY #$1A                                  ; $1DB4CB |
  JSR code_1FEA3F                           ; $1DB4CD |
  BCC code_1DB4D5                           ; $1DB4D0 |
  INC {entity_var_b},x                      ; $1DB4D2 |
code_1DB4D5:
  RTS                                       ; $1DB4D5 |

  db $FC, $FC, $FC, $04, $04, $04, $23, $27 ; $1DB4D6 |
  db $1C, $27, $23, $13, $01, $01, $01, $01 ; $1DB4DE |
  db $01, $01                               ; $1DB4E6 |

  LDA {entity_var_a},x                      ; $1DB4E8 |
  BEQ code_1DB501                           ; $1DB4EB |
  DEC {entity_var_a},x                      ; $1DB4ED |
  BNE code_1DB51B                           ; $1DB4F0 |
  LDA #$05                                  ; $1DB4F2 |
  STA {entity_var_a},x                      ; $1DB4F4 |
  LDA #$01                                  ; $1DB4F7 |
  STA {entity_handler_low},x                ; $1DB4F9 |
  LDA #$B5                                  ; $1DB4FC |
  STA {entity_handler_high},x               ; $1DB4FE |
code_1DB501:
  LDA {x_speed_frac},x                      ; $1DB501 |
  CLC                                       ; $1DB504 |
  ADC #$33                                  ; $1DB505 |
  STA {x_speed_frac},x                      ; $1DB507 |
  LDA {x_speed},x                           ; $1DB50A |
  ADC #$00                                  ; $1DB50D |
  STA {x_speed},x                           ; $1DB50F |
  CMP #$04                                  ; $1DB512 |
  BNE code_1DB51B                           ; $1DB514 |
  LDA #$00                                  ; $1DB516 |
  STA {x_speed_frac},x                      ; $1DB518 |
code_1DB51B:
  LDA #$00                                  ; $1DB51B |
  STA $0F                                   ; $1DB51D |
  LDY #$1E                                  ; $1DB51F |
  JSR code_1FEA3F                           ; $1DB521 |
  BCC code_1DB57F                           ; $1DB524 |
  INC {animation_frame},x                   ; $1DB526 |
  LDA #$60                                  ; $1DB529 |
  STA {entity_handler_low},x                ; $1DB52B |
  LDA #$B5                                  ; $1DB52E |
  STA {entity_handler_high},x               ; $1DB530 |
  LDA #$78                                  ; $1DB533 |
  STA {entity_var_a},x                      ; $1DB535 |
  LDA $26                                   ; $1DB538 |
  CMP #$0E                                  ; $1DB53A |
  BNE code_1DB54C                           ; $1DB53C |
  LDA {y_position_low},x                    ; $1DB53E |
  STA {entity_var_c},x                      ; $1DB541 |
  LDA $FA                                   ; $1DB544 |
  STA {entity_var_e},x                      ; $1DB546 |
  JMP code_1DB560                           ; $1DB549 |

code_1DB54C:
  LDA {y_position_low},x                    ; $1DB54C |
  CLC                                       ; $1DB54F |
  ADC $FA                                   ; $1DB550 |
  STA {entity_var_c},x                      ; $1DB552 |
  BCS code_1DB55B                           ; $1DB555 |
  CMP #$F0                                  ; $1DB557 |
  BCC code_1DB560                           ; $1DB559 |
code_1DB55B:
  ADC #$0F                                  ; $1DB55B |
  STA {entity_var_c},x                      ; $1DB55D |
code_1DB560:
  LDA #$FF                                  ; $1DB560 |
  STA $0F                                   ; $1DB562 |
  DEC {entity_var_a},x                      ; $1DB564 |
  BNE code_1DB5A1                           ; $1DB567 |
  JSR code_1FF2C4                           ; $1DB569 |
  LDA #$01                                  ; $1DB56C |
  STA {entity_type},x                       ; $1DB56E |
  LDA #$42                                  ; $1DB571 |
  JSR code_1FEA98                           ; $1DB573 |
  LDA {entity_display_flags},x              ; $1DB576 |
  AND #$FC                                  ; $1DB579 |
  STA {entity_display_flags},x              ; $1DB57B |
  RTS                                       ; $1DB57E |

code_1DB57F:
  CPX $73                                   ; $1DB57F |
  BNE code_1DB5A1                           ; $1DB581 |
  DEC {entity_var_a},x                      ; $1DB583 |
  BNE code_1DB592                           ; $1DB586 |
  LDA #$05                                  ; $1DB588 |
  STA {entity_var_a},x                      ; $1DB58A |
  LDA #$01                                  ; $1DB58D |
  JSR code_1DB5E8                           ; $1DB58F |
code_1DB592:
  LDA {entity_direction},x                  ; $1DB592 |
  STA $39                                   ; $1DB595 |
  LDA {x_speed_frac},x                      ; $1DB597 |
  STA $3A                                   ; $1DB59A |
  LDA {x_speed},x                           ; $1DB59C |
  STA $3B                                   ; $1DB59F |
code_1DB5A1:
  LDA #$00                                  ; $1DB5A1 |
  STA {animation_timer},x                   ; $1DB5A3 |
  LDA $0F                                   ; $1DB5A6 |
  BEQ code_1DB5E7                           ; $1DB5A8 |
  LDA $46                                   ; $1DB5AA |
  BEQ code_1DB5E7                           ; $1DB5AC |
  LDA $26                                   ; $1DB5AE |
  CMP #$0E                                  ; $1DB5B0 |
  BNE code_1DB5CD                           ; $1DB5B2 |
  LDA $FA                                   ; $1DB5B4 |
  SEC                                       ; $1DB5B6 |
  SBC {entity_var_e},x                      ; $1DB5B7 |
  CLC                                       ; $1DB5BA |
  ADC {entity_var_c},x                      ; $1DB5BB |
  STA {y_position_low},x                    ; $1DB5BE |
  BCS code_1DB5DD                           ; $1DB5C1 |
  CMP #$F0                                  ; $1DB5C3 |
  BCC code_1DB5E7                           ; $1DB5C5 |
  ADC #$0F                                  ; $1DB5C7 |
  STA {y_position_low},x                    ; $1DB5C9 |
  RTS                                       ; $1DB5CC |

code_1DB5CD:
  LDA {entity_var_c},x                      ; $1DB5CD |
  SEC                                       ; $1DB5D0 |
  SBC $FA                                   ; $1DB5D1 |
  STA {y_position_low},x                    ; $1DB5D3 |
  BCS code_1DB5DD                           ; $1DB5D6 |
  SBC #$0F                                  ; $1DB5D8 |
  STA {y_position_low},x                    ; $1DB5DA |
code_1DB5DD:
  LDY $26                                   ; $1DB5DD |
  CMP $B5FE,y                               ; $1DB5DF |
  BCC code_1DB5E7                           ; $1DB5E2 |
  JSR code_1FF2C4                           ; $1DB5E4 |
code_1DB5E7:
  RTS                                       ; $1DB5E7 |

code_1DB5E8:
  STA $00                                   ; $1DB5E8 |
  LDY $32                                   ; $1DB5EA |
  LDA $00B0,y                               ; $1DB5EC |
  AND #$7F                                  ; $1DB5EF |
  SEC                                       ; $1DB5F1 |
  SBC $00                                   ; $1DB5F2 |
  BCS code_1DB5F8                           ; $1DB5F4 |
  LDA #$00                                  ; $1DB5F6 |
code_1DB5F8:
  ORA #$80                                  ; $1DB5F8 |
  STA $00B0,y                               ; $1DB5FA |
  RTS                                       ; $1DB5FD |

  db $F0, $F0, $F0, $C0, $F0, $F0, $F0, $F0 ; $1DB5FE |
  db $F0, $F0, $F0, $C0, $D0, $F0, $F0, $F0 ; $1DB606 |

  LDA {animation_frame},x                   ; $1DB60E |
  CMP #$02                                  ; $1DB611 |
  BNE code_1DB654                           ; $1DB613 |
  LDA #$AB                                  ; $1DB615 |
  JSR code_1FEA98                           ; $1DB617 |
  LDA #$24                                  ; $1DB61A |
  STA {entity_handler_low},x                ; $1DB61C |
  LDA #$B6                                  ; $1DB61F |
  STA {entity_handler_high},x               ; $1DB621 |
  LDA $14                                   ; $1DB624 |
  AND #$40                                  ; $1DB626 |
  BEQ code_1DB654                           ; $1DB628 |
  LDA #$01                                  ; $1DB62A |
  STA {entity_direction},x                  ; $1DB62C |
  LDA {entity_display_flags}                ; $1DB62F |
  AND #$20                                  ; $1DB632 |
  BNE code_1DB63B                           ; $1DB634 |
  LDA #$02                                  ; $1DB636 |
  STA {entity_direction},x                  ; $1DB638 |
code_1DB63B:
  LDA #$00                                  ; $1DB63B |
  STA {x_speed_frac},x                      ; $1DB63D |
  LDA #$03                                  ; $1DB640 |
  STA {x_speed},x                           ; $1DB642 |
  LDA #$6D                                  ; $1DB645 |
  STA {entity_handler_low},x                ; $1DB647 |
  LDA #$B6                                  ; $1DB64A |
  STA {entity_handler_high},x               ; $1DB64C |
  LDA #$02                                  ; $1DB64F |
  JSR code_1DB5E8                           ; $1DB651 |
code_1DB654:
  LDA {x_position_low}                      ; $1DB654 |
  STA {x_position_low},x                    ; $1DB657 |
  LDA {x_position_high}                     ; $1DB65A |
  STA {x_position_high},x                   ; $1DB65D |
  LDA {y_position_low}                      ; $1DB660 |
  STA {y_position_low},x                    ; $1DB663 |
  LDA {y_position_high}                     ; $1DB666 |
  STA {y_position_high},x                   ; $1DB669 |
  RTS                                       ; $1DB66C |

  LDA {entity_display_flags},x              ; $1DB66D |
  PHA                                       ; $1DB670 |
  JSR code_1FEA65                           ; $1DB671 |
  PLA                                       ; $1DB674 |
  STA {entity_display_flags},x              ; $1DB675 |
  RTS                                       ; $1DB678 |

  LDA {entity_var_b},x                      ; $1DB679 |
  BNE code_1DB6AA                           ; $1DB67C |
  LDY {entity_var_a},x                      ; $1DB67E |
  LDA #$48                                  ; $1DB681 |
  JSR code_1FF470                           ; $1DB683 |
  DEC {entity_var_a},x                      ; $1DB686 |
  LDA {entity_var_a},x                      ; $1DB689 |
  AND #$0F                                  ; $1DB68C |
  STA {entity_var_a},x                      ; $1DB68E |
  AND #$03                                  ; $1DB691 |
  BNE code_1DB698                           ; $1DB693 |
  INC {entity_var_c},x                      ; $1DB695 |
code_1DB698:
  LDA {entity_var_c},x                      ; $1DB698 |
  STA {entity_var_b},x                      ; $1DB69B |
  CMP #$08                                  ; $1DB69E |
  BCC code_1DB6AA                           ; $1DB6A0 |
  LDA {entity_display_flags},x              ; $1DB6A2 |
  BMI code_1DB6AA                           ; $1DB6A5 |
  JMP code_1FF2C4                           ; $1DB6A7 |

code_1DB6AA:
  LDA {animation_frame},x                   ; $1DB6AA |
  CMP #$03                                  ; $1DB6AD |
  BNE code_1DB6B6                           ; $1DB6AF |
  LDA #$00                                  ; $1DB6B1 |
  STA {animation_timer},x                   ; $1DB6B3 |
code_1DB6B6:
  JSR code_1FEA65                           ; $1DB6B6 |
  JSR code_1FEA86                           ; $1DB6B9 |
  LDA {entity_display_flags},x              ; $1DB6BC |
  AND #$DF                                  ; $1DB6BF |
  STA {entity_display_flags},x              ; $1DB6C1 |
  DEC {entity_var_b},x                      ; $1DB6C4 |
  RTS                                       ; $1DB6C7 |

  LDA $BC                                   ; $1DB6C8 |
  CMP #$80                                  ; $1DB6CA |
  BEQ code_1DB731                           ; $1DB6CC |
  LDA {x_position_low}                      ; $1DB6CE |
  PHA                                       ; $1DB6D1 |
  LDA {x_position_high}                     ; $1DB6D2 |
  PHA                                       ; $1DB6D5 |
  LDA {y_position_low}                      ; $1DB6D6 |
  PHA                                       ; $1DB6D9 |
  LDA {y_position_low}                      ; $1DB6DA |
  SEC                                       ; $1DB6DD |
  SBC #$18                                  ; $1DB6DE |
  BCS code_1DB6E4                           ; $1DB6E0 |
  LDA #$00                                  ; $1DB6E2 |
code_1DB6E4:
  STA {y_position_low}                      ; $1DB6E4 |
  LDY #$00                                  ; $1DB6E7 |
  LDA {entity_display_flags}                ; $1DB6E9 |
  AND #$20                                  ; $1DB6EC |
  BEQ code_1DB6F1                           ; $1DB6EE |
  INY                                       ; $1DB6F0 |
code_1DB6F1:
  LDA {x_position_low}                      ; $1DB6F1 |
  CLC                                       ; $1DB6F4 |
  ADC $B82F,y                               ; $1DB6F5 |
  STA {x_position_low}                      ; $1DB6F8 |
  LDA {x_position_high}                     ; $1DB6FB |
  ADC $B831,y                               ; $1DB6FE |
  STA {x_position_high}                     ; $1DB701 |
  JSR code_1DB7EE                           ; $1DB704 |
  BCC code_1DB711                           ; $1DB707 |
  JSR code_1FED5B                           ; $1DB709 |
  LDA #$40                                  ; $1DB70C |
  JSR code_1FF470                           ; $1DB70E |
code_1DB711:
  PLA                                       ; $1DB711 |
  STA {y_position_low}                      ; $1DB712 |
  PLA                                       ; $1DB715 |
  STA {x_position_high}                     ; $1DB716 |
  PLA                                       ; $1DB719 |
  STA {x_position_low}                      ; $1DB71A |
  JSR code_1FEA65                           ; $1DB71D |
  JSR code_1FEA86                           ; $1DB720 |
  DEC {entity_var_a},x                      ; $1DB723 |
  BNE code_1DB730                           ; $1DB726 |
  LDA #$0A                                  ; $1DB728 |
  STA {entity_var_a},x                      ; $1DB72A |
  JSR code_1DB783                           ; $1DB72D |
code_1DB730:
  RTS                                       ; $1DB730 |

code_1DB731:
  JSR code_1FF2C4                           ; $1DB731 |
  LDA #$46                                  ; $1DB734 |
  STA {entity_type},x                       ; $1DB736 |
  LDA #$C6                                  ; $1DB739 |
  STA {x_speed_frac},x                      ; $1DB73B |
  STA {y_speed_frac},x                      ; $1DB73E |
  LDA #$01                                  ; $1DB741 |
  STA {x_speed},x                           ; $1DB743 |
  STA {y_speed},x                           ; $1DB746 |
  LDA {x_position_low},x                    ; $1DB749 |
  SEC                                       ; $1DB74C |
  SBC $FC                                   ; $1DB74D |
  TAY                                       ; $1DB74F |
  LDA #$09                                  ; $1DB750 |
  CPY #$80                                  ; $1DB752 |
  BCS code_1DB758                           ; $1DB754 |
  LDA #$0A                                  ; $1DB756 |
code_1DB758:
  STA {entity_direction},x                  ; $1DB758 |
  RTS                                       ; $1DB75B |

  LDY {entity_var_a},x                      ; $1DB75C |
  JSR code_1FED5D                           ; $1DB75F |
  LDA #$40                                  ; $1DB762 |
  JSR code_1FF470                           ; $1DB764 |
  LDY {entity_var_a},x                      ; $1DB767 |
  LDA {entity_type},y                       ; $1DB76A |
  CMP {entity_var_b},x                      ; $1DB76D |
  BNE code_1DB778                           ; $1DB770 |
  JSR code_1FEA65                           ; $1DB772 |
  JMP code_1FEA86                           ; $1DB775 |

code_1DB778:
  LDA #$C8                                  ; $1DB778 |
  STA {entity_handler_low},x                ; $1DB77A |
  LDA #$B6                                  ; $1DB77D |
  STA {entity_handler_high},x               ; $1DB77F |
  RTS                                       ; $1DB782 |

code_1DB783:
  LDY #$17                                  ; $1DB783 |
  LDA #$FF                                  ; $1DB785 |
  STA $01                                   ; $1DB787 |
  LDA #$00                                  ; $1DB789 |
  STA $02                                   ; $1DB78B |
code_1DB78D:
  LDA {entity_type},y                       ; $1DB78D |
  BEQ code_1DB7B8                           ; $1DB790 |
  LDA {entity_display_flags},y              ; $1DB792 |
  BPL code_1DB7B8                           ; $1DB795 |
  AND #$04                                  ; $1DB797 |
  BNE code_1DB7B8                           ; $1DB799 |
  LDA {sprite_flags},y                      ; $1DB79B |
  AND #$40                                  ; $1DB79E |
  BEQ code_1DB7B8                           ; $1DB7A0 |
  JSR distance_to_entity                    ; $1DB7A2 |
  STA $00                                   ; $1DB7A5 |
  JSR vertical_distance_to_entity           ; $1DB7A7 |
  CMP $00                                   ; $1DB7AA |
  BCC code_1DB7B0                           ; $1DB7AC |
  LDA $00                                   ; $1DB7AE |
code_1DB7B0:
  CMP $01                                   ; $1DB7B0 |
  BCS code_1DB7B8                           ; $1DB7B2 |
  STA $01                                   ; $1DB7B4 |
  STY $02                                   ; $1DB7B6 |
code_1DB7B8:
  DEY                                       ; $1DB7B8 |
  CPY #$07                                  ; $1DB7B9 |
  BNE code_1DB78D                           ; $1DB7BB |
  LDA $02                                   ; $1DB7BD |
  BEQ code_1DB7ED                           ; $1DB7BF |
  STA {entity_var_a},x                      ; $1DB7C1 |
  TAY                                       ; $1DB7C4 |
  LDA {entity_type},y                       ; $1DB7C5 |
  STA {entity_var_b},x                      ; $1DB7C8 |
  LDA {x_position_low},y                    ; $1DB7CB |
  STA {entity_var_c},x                      ; $1DB7CE |
  LDA {y_position_low},y                    ; $1DB7D1 |
  STA {entity_var_e},x                      ; $1DB7D4 |
  LDA #$5C                                  ; $1DB7D7 |
  STA {entity_handler_low},x                ; $1DB7D9 |
  LDA #$B7                                  ; $1DB7DC |
  STA {entity_handler_high},x               ; $1DB7DE |
  JSR get_angle_to_entity                   ; $1DB7E1 |
  TAY                                       ; $1DB7E4 |
  STA {entity_var_d},x                      ; $1DB7E5 |
  LDA #$40                                  ; $1DB7E8 |
  JSR code_1FF470                           ; $1DB7EA |
code_1DB7ED:
  RTS                                       ; $1DB7ED |

code_1DB7EE:
  JSR vertical_distance_to_player           ; $1DB7EE |
  CMP #$04                                  ; $1DB7F1 |
  BCS code_1DB829                           ; $1DB7F3 |
  JSR distance_to_player                    ; $1DB7F5 |
  CMP #$04                                  ; $1DB7F8 |
  BCS code_1DB829                           ; $1DB7FA |
  LDA #$00                                  ; $1DB7FC |
  STA {entity_direction},x                  ; $1DB7FE |
  LDA {x_position_low}                      ; $1DB801 |
  STA {x_position_low},x                    ; $1DB804 |
  LDA {x_position_high}                     ; $1DB807 |
  STA {x_position_high},x                   ; $1DB80A |
  LDA {y_position_low}                      ; $1DB80D |
  STA {y_position_low},x                    ; $1DB810 |
  LDA #$9C                                  ; $1DB813 |
  CMP {animation_index},x                   ; $1DB815 |
  BEQ code_1DB81D                           ; $1DB818 |
  JSR code_1FEA98                           ; $1DB81A |
code_1DB81D:
  CLC                                       ; $1DB81D |
  LDA {entity_display_flags}                ; $1DB81E |
  AND #$20                                  ; $1DB821 |
  ORA #$80                                  ; $1DB823 |
  STA {entity_display_flags},x              ; $1DB825 |
  RTS                                       ; $1DB828 |

code_1DB829:
  LDA #$0A                                  ; $1DB829 |
  STA {entity_var_a},x                      ; $1DB82B |
  RTS                                       ; $1DB82E |

  db $10, $F0, $00, $FF                     ; $1DB82F |

  LDA {entity_display_flags},x              ; $1DB833 |
  BPL code_1DB872                           ; $1DB836 |
  LDA {x_position_frac},x                   ; $1DB838 |
  CLC                                       ; $1DB83B |
  ADC {x_speed_frac},x                      ; $1DB83C |
  STA {x_position_frac},x                   ; $1DB83F |
  LDA {x_position_low},x                    ; $1DB842 |
  ADC {x_speed},x                           ; $1DB845 |
  STA {x_position_low},x                    ; $1DB848 |
  LDA {x_position_high},x                   ; $1DB84B |
  ADC {entity_var_a},x                      ; $1DB84E |
  STA {x_position_high},x                   ; $1DB851 |
  LDA {y_position_frac},x                   ; $1DB854 |
  CLC                                       ; $1DB857 |
  ADC {y_speed_frac},x                      ; $1DB858 |
  STA {y_position_frac},x                   ; $1DB85B |
  LDA {y_position_low},x                    ; $1DB85E |
  ADC {y_speed},x                           ; $1DB861 |
  STA {y_position_low},x                    ; $1DB864 |
  LDA {y_position_high},x                   ; $1DB867 |
  ADC {entity_var_b},x                      ; $1DB86A |
  STA {y_position_high},x                   ; $1DB86D |
  BEQ code_1DB875                           ; $1DB870 |
code_1DB872:
  JSR code_1FF2C4                           ; $1DB872 |
code_1DB875:
  RTS                                       ; $1DB875 |

  LDA #$80                                  ; $1DB876 |
  STA $1E                                   ; $1DB878 |
  STA $29                                   ; $1DB87A |
  LDA #$04                                  ; $1DB87C |
  STA $23                                   ; $1DB87E |
  LDA #$00                                  ; $1DB880 |
  STA $05DC                                 ; $1DB882 |
  STA $05DD                                 ; $1DB885 |
  STA $05DE                                 ; $1DB888 |
  STA $05DF                                 ; $1DB88B |
  LDA #$98                                  ; $1DB88E |
  STA {entity_handler_low},x                ; $1DB890 |
  LDA #$B8                                  ; $1DB893 |
  STA {entity_handler_high},x               ; $1DB895 |
  LDA $1E                                   ; $1DB898 |
  BNE code_1DB875                           ; $1DB89A |
  STA {y_position_frac}                     ; $1DB89C |
  INC $46                                   ; $1DB89F |
  LDA #$BF                                  ; $1DB8A1 |
  STA $9B                                   ; $1DB8A3 |
  LDA #$02                                  ; $1DB8A5 |
  STA $99                                   ; $1DB8A7 |
  LDA #$1D                                  ; $1DB8A9 |
  STA $25                                   ; $1DB8AB |
  LDA #$01                                  ; $1DB8AD |
  STA $24                                   ; $1DB8AF |
  LDA #$BB                                  ; $1DB8B1 |
  STA {entity_handler_low},x                ; $1DB8B3 |
  LDA #$B8                                  ; $1DB8B6 |
  STA {entity_handler_high},x               ; $1DB8B8 |
  LDA {entity_var_b},x                      ; $1DB8BB |
  PHA                                       ; $1DB8BE |
  JSR code_1DB96E                           ; $1DB8BF |
  PLA                                       ; $1DB8C2 |
  CMP {entity_var_b},x                      ; $1DB8C3 |
  BEQ code_1DB875                           ; $1DB8C6 |
  LDA #$40                                  ; $1DB8C8 |
  STA {entity_var_d},x                      ; $1DB8CA |
  STA {y_speed_frac},x                      ; $1DB8CD |
  LDA #$00                                  ; $1DB8D0 |
  STA {y_speed},x                           ; $1DB8D2 |
  LDA #$E4                                  ; $1DB8D5 |
  STA {entity_handler_low},x                ; $1DB8D7 |
  LDA #$B8                                  ; $1DB8DA |
  STA {entity_handler_high},x               ; $1DB8DC |
  LDA #$2D                                  ; $1DB8DF |
  STA {entity_var_e},x                      ; $1DB8E1 |
  LDA {entity_var_e},x                      ; $1DB8E4 |
  BEQ code_1DB8F3                           ; $1DB8E7 |
  DEC {entity_var_e},x                      ; $1DB8E9 |
  AND #$02                                  ; $1DB8EC |
  STA $FC                                   ; $1DB8EE |
  JMP code_1DB96E                           ; $1DB8F0 |

code_1DB8F3:
  LDA {entity_var_d},x                      ; $1DB8F3 |
  SEC                                       ; $1DB8F6 |
  SBC {y_speed_frac},x                      ; $1DB8F7 |
  STA {entity_var_d},x                      ; $1DB8FA |
  LDA $FA                                   ; $1DB8FD |
  SBC {y_speed},x                           ; $1DB8FF |
  BCS code_1DB908                           ; $1DB902 |
  SBC #$0F                                  ; $1DB904 |
  INC $FB                                   ; $1DB906 |
code_1DB908:
  STA $FA                                   ; $1DB908 |
  JSR apply_gravity_upwards                 ; $1DB90A |
  LDA $FB                                   ; $1DB90D |
  CMP {entity_var_c},x                      ; $1DB90F |
  BCC code_1DB942                           ; $1DB912 |
  BNE code_1DB91D                           ; $1DB914 |
  LDA {entity_var_b},x                      ; $1DB916 |
  CMP $FA                                   ; $1DB919 |
  BCC code_1DB942                           ; $1DB91B |
code_1DB91D:
  LDA {entity_var_b},x                      ; $1DB91D |
  STA $FA                                   ; $1DB920 |
  LDA {entity_var_c},x                      ; $1DB922 |
  STA $FB                                   ; $1DB925 |
  LDA #$BB                                  ; $1DB927 |
  STA {entity_handler_low},x                ; $1DB929 |
  LDA #$B8                                  ; $1DB92C |
  STA {entity_handler_high},x               ; $1DB92E |
  LDA {entity_var_a},x                      ; $1DB931 |
  CMP #$1D                                  ; $1DB934 |
  BNE code_1DB942                           ; $1DB936 |
  LDA #$43                                  ; $1DB938 |
  STA {entity_handler_low},x                ; $1DB93A |
  LDA #$B9                                  ; $1DB93D |
  STA {entity_handler_high},x               ; $1DB93F |
code_1DB942:
  RTS                                       ; $1DB942 |

  LDA $25                                   ; $1DB943 |
  CMP #$18                                  ; $1DB945 |
  BCS code_1DB942                           ; $1DB947 |
  LDA #$03                                  ; $1DB949 |
  STA $24                                   ; $1DB94B |
  LDA #$00                                  ; $1DB94D |
  STA $2B                                   ; $1DB94F |
  STA $2A                                   ; $1DB951 |
  STA $25                                   ; $1DB953 |
  STA $FB                                   ; $1DB955 |
  LDA #$22                                  ; $1DB957 |
  STA $29                                   ; $1DB959 |
  LDA #$01                                  ; $1DB95B |
  STA $28                                   ; $1DB95D |
  LDA #$02                                  ; $1DB95F |
  STA $F9                                   ; $1DB961 |
  STA {x_position_high}                     ; $1DB963 |
  STA {x_position_high},x                   ; $1DB966 |
  LDA #$01                                  ; $1DB969 |
  JMP code_1FFFB7                           ; $1DB96B |

code_1DB96E:
  LDA {entity_var_a},x                      ; $1DB96E |
  PHA                                       ; $1DB971 |
  AND #$07                                  ; $1DB972 |
  TAY                                       ; $1DB974 |
  LDA $F2B2,y                               ; $1DB975 |
  STA $00                                   ; $1DB978 |
  PLA                                       ; $1DB97A |
  LSR                                       ; $1DB97B |
  LSR                                       ; $1DB97C |
  LSR                                       ; $1DB97D |
  TAY                                       ; $1DB97E |
  LDA $05DC,y                               ; $1DB97F |
  AND $00                                   ; $1DB982 |
  BEQ code_1DB9AF                           ; $1DB984 |
  LDA {entity_var_a},x                      ; $1DB986 |
  ASL                                       ; $1DB989 |
  ADC {entity_var_a},x                      ; $1DB98A |
  INC {entity_var_a},x                      ; $1DB98D |
  TAY                                       ; $1DB990 |
  LDA $B9C0,y                               ; $1DB991 |
  AND #$F0                                  ; $1DB994 |
  CMP $FA                                   ; $1DB996 |
  BEQ code_1DB96E                           ; $1DB998 |
  STA {entity_var_b},x                      ; $1DB99A |
  LDA $B9C0,y                               ; $1DB99D |
  AND #$0F                                  ; $1DB9A0 |
  STA {entity_var_c},x                      ; $1DB9A2 |
  CPY #$2A                                  ; $1DB9A5 |
  BNE code_1DB96E                           ; $1DB9A7 |
  JSR code_1DB9B0                           ; $1DB9A9 |
  JMP code_1DB96E                           ; $1DB9AC |

code_1DB9AF:
  RTS                                       ; $1DB9AF |

code_1DB9B0:
  LDY #$1F                                  ; $1DB9B0 |
  LDA #$00                                  ; $1DB9B2 |
code_1DB9B4:
  STA $0680,y                               ; $1DB9B4 |
  DEY                                       ; $1DB9B7 |
  BPL code_1DB9B4                           ; $1DB9B8 |
  RTS                                       ; $1DB9BA |

  db $00, $24, $4E, $B0, $A8, $E1, $A0, $A8 ; $1DB9BB |
  db $D1, $90, $A8, $B1, $70, $88, $B1, $70 ; $1DB9C3 |
  db $48, $A1, $60, $88, $A1, $60, $48, $91 ; $1DB9CB |
  db $50, $88, $91, $50, $48, $71, $30, $C8 ; $1DB9D3 |
  db $61, $20, $C8, $51, $10, $C8, $31, $E1 ; $1DB9DB |
  db $68, $21, $D1, $68, $11, $C1, $68, $01 ; $1DB9E3 |
  db $B1, $68, $E2, $A1, $68, $D2, $91, $68 ; $1DB9EB |
  db $C2, $81, $68, $B2, $71, $68, $A2, $61 ; $1DB9F3 |
  db $68, $82, $41, $28, $72, $31, $28, $62 ; $1DB9FB |
  db $21, $28, $52, $11, $28, $42, $01, $28 ; $1DBA03 |
  db $32, $E2, $28, $22, $D2, $28, $12, $C2 ; $1DBA0B |
  db $28, $02, $00, $00, $00, $00, $0C, $1A ; $1DBA13 |
  db $65, $65, $6D, $65, $65, $65, $65, $6D ; $1DBA1B |
  db $6D, $65, $65, $6D, $65, $65, $65, $65 ; $1DBA23 |
  db $65, $65, $65, $65, $6D, $65, $65, $65 ; $1DBA2B |
  db $65, $65, $65, $65, $6D, $65, $65, $65 ; $1DBA33 |

  LDA {entity_var_a},x                      ; $1DBA3B |
  BNE code_1DBA6B                           ; $1DBA3E |
  DEC {entity_var_c},x                      ; $1DBA40 |
  BNE code_1DBA48                           ; $1DBA43 |
  JMP code_1FF2C4                           ; $1DBA45 |

code_1DBA48:
  DEC {entity_var_b},x                      ; $1DBA48 |
  LDA {entity_var_b},x                      ; $1DBA4B |
  AND #$0F                                  ; $1DBA4E |
  TAY                                       ; $1DBA50 |
  LDA #$30                                  ; $1DBA51 |
  JSR code_1FF470                           ; $1DBA53 |
  ASL {x_speed_frac},x                      ; $1DBA56 |
  ROL {x_speed},x                           ; $1DBA59 |
  ASL {y_speed_frac},x                      ; $1DBA5C |
  ROL {y_speed},x                           ; $1DBA5F |
  LDY {entity_var_c},x                      ; $1DBA62 |
  LDA $BA75,y                               ; $1DBA65 |
  STA {entity_var_a},x                      ; $1DBA68 |
code_1DBA6B:
  JSR code_1FEA65                           ; $1DBA6B |
  JSR code_1FEA86                           ; $1DBA6E |
  DEC {entity_var_a},x                      ; $1DBA71 |
  RTS                                       ; $1DBA74 |

  db $03, $03, $02, $02, $02, $02, $03, $03 ; $1DBA75 |

  INC {entity_var_a},x                      ; $1DBA7D |
  LDA {entity_var_a},x                      ; $1DBA80 |
  CMP #$3C                                  ; $1DBA83 |
  BNE code_1DBAF3                           ; $1DBA85 |
  LDA #$9D                                  ; $1DBA87 |
  STA {entity_handler_low},x                ; $1DBA89 |
  LDA #$BA                                  ; $1DBA8C |
  STA {entity_handler_high},x               ; $1DBA8E |
  LDY {x_position_high},x                   ; $1DBA91 |
  LDA $BAE3,y                               ; $1DBA94 |
  STA {entity_var_b},x                      ; $1DBA97 |
  STA {entity_var_c},x                      ; $1DBA9A |
  LDA {entity_var_a},x                      ; $1DBA9D |
  BNE code_1DBAF0                           ; $1DBAA0 |
  LDA #$3C                                  ; $1DBAA2 |
  STA {entity_var_a},x                      ; $1DBAA4 |
code_1DBAA7:
  JSR code_1FF16F                           ; $1DBAA7 |
  BCS code_1DBAD7                           ; $1DBAAA |
  LDA #$39                                  ; $1DBAAC |
  JSR code_1FEC5D                           ; $1DBAAE |
  LDA #$B9                                  ; $1DBAB1 |
  JSR code_1FEAA4                           ; $1DBAB3 |
  LDA #$01                                  ; $1DBAB6 |
  STA {entity_type},y                       ; $1DBAB8 |
  LDA #$00                                  ; $1DBABB |
  STA {sprite_flags},y                      ; $1DBABD |
  LDA #$02                                  ; $1DBAC0 |
  STA {entity_display_flags},y              ; $1DBAC2 |
  LDA {entity_var_b},x                      ; $1DBAC5 |
  TAX                                       ; $1DBAC8 |
  LDA $BAF6,x                               ; $1DBAC9 |
  STA {x_position_low},y                    ; $1DBACC |
  LDA $BAF7,x                               ; $1DBACF |
  STA {y_position_low},y                    ; $1DBAD2 |
  LDX $A6                                   ; $1DBAD5 |
code_1DBAD7:
  LDY {entity_var_b},x                      ; $1DBAD7 |
  INC {entity_var_b},x                      ; $1DBADA |
  INC {entity_var_b},x                      ; $1DBADD |
  INC {entity_var_b},x                      ; $1DBAE0 |
  LDA $BAF8,y                               ; $1DBAE3 |
  BEQ code_1DBAF0                           ; $1DBAE6 |
  BPL code_1DBAA7                           ; $1DBAE8 |
  LDA {entity_var_c},x                      ; $1DBAEA |
  STA {entity_var_b},x                      ; $1DBAED |
code_1DBAF0:
  DEC {entity_var_a},x                      ; $1DBAF0 |
code_1DBAF3:
  RTS                                       ; $1DBAF3 |

  db $00, $24, $38, $98, $01, $98, $B8, $00 ; $1DBAF4 |
  db $38, $68, $01, $78, $A8, $00, $48, $A8 ; $1DBAFC |
  db $01, $98, $78, $00, $68, $A8, $01, $78 ; $1DBB04 |
  db $68, $00, $38, $98, $01, $88, $88, $00 ; $1DBB0C |
  db $58, $98, $01, $68, $68, $FF, $58, $A8 ; $1DBB14 |
  db $01, $68, $68, $00, $88, $A8, $01, $C8 ; $1DBB1C |
  db $78, $00, $78, $68, $01, $B8, $B8, $00 ; $1DBB24 |
  db $58, $98, $01, $A8, $B8, $00, $88, $B8 ; $1DBB2C |
  db $00, $88, $78, $01, $A8, $B8, $FF      ; $1DBB34 |

  LDY {entity_var_a},x                      ; $1DBB3B |
  LDA {y_position_low},y                    ; $1DBB3E |
  CLC                                       ; $1DBB41 |
  ADC {entity_var_b},x                      ; $1DBB42 |
  STA {y_position_low},x                    ; $1DBB45 |
  LDA {x_position_low},y                    ; $1DBB48 |
  STA {x_position_low},x                    ; $1DBB4B |
  RTS                                       ; $1DBB4E |

  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBB4F |
  db $00, $00, $00, $00, $02, $00, $00, $00 ; $1DBB57 |
  db $00, $08, $00, $00, $22, $08, $01, $08 ; $1DBB5F |
  db $10, $02, $00, $00, $10, $00, $21, $00 ; $1DBB67 |
  db $09, $00, $00, $00, $40, $00, $00, $00 ; $1DBB6F |
  db $00, $00, $88, $00, $20, $08, $00, $80 ; $1DBB77 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBB7F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBB87 |
  db $00, $00, $00, $00, $00, $20, $00, $00 ; $1DBB8F |
  db $00, $00, $00, $00, $01, $20, $00, $00 ; $1DBB97 |
  db $00, $00, $00, $00, $00, $00, $20, $00 ; $1DBB9F |
  db $80, $08, $00, $00, $04, $88, $A0, $00 ; $1DBBA7 |
  db $40, $00, $00, $00, $00, $20, $00, $00 ; $1DBBAF |
  db $00, $00, $00, $00, $01, $00, $00, $02 ; $1DBBB7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBBBF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBBC7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBBCF |
  db $40, $00, $82, $00, $00, $00, $00, $00 ; $1DBBD7 |
  db $00, $08, $00, $00, $00, $00, $04, $00 ; $1DBBDF |
  db $00, $00, $82, $00, $00, $00, $60, $20 ; $1DBBE7 |
  db $01, $80, $00, $00, $25, $00, $02, $00 ; $1DBBEF |
  db $00, $00, $00, $00, $00, $08, $00, $00 ; $1DBBF7 |
  db $10, $00, $00, $00, $00, $00, $00, $02 ; $1DBBFF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBC07 |
  db $00, $02, $00, $00, $00, $00, $00, $00 ; $1DBC0F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBC17 |
  db $10, $00, $00, $00, $00, $00, $00, $04 ; $1DBC1F |
  db $01, $00, $00, $00, $00, $60, $00, $04 ; $1DBC27 |
  db $00, $41, $01, $08, $00, $00, $10, $01 ; $1DBC2F |
  db $00, $00, $00, $00, $00, $00, $01, $20 ; $1DBC37 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $1DBC3F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBC47 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBC4F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBC57 |
  db $00, $80, $00, $00, $00, $01, $00, $0A ; $1DBC5F |
  db $04, $18, $01, $A1, $00, $20, $00, $01 ; $1DBC67 |
  db $00, $07, $00, $00, $00, $00, $44, $08 ; $1DBC6F |
  db $04, $20, $01, $08, $00, $08, $00, $02 ; $1DBC77 |
  db $50, $00, $00, $00, $00, $00, $00, $00 ; $1DBC7F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBC87 |
  db $00, $08, $00, $00, $00, $00, $00, $00 ; $1DBC8F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBC97 |
  db $00, $01, $00, $10, $00, $00, $00, $02 ; $1DBC9F |
  db $14, $08, $00, $00, $00, $00, $00, $08 ; $1DBCA7 |
  db $01, $00, $00, $00, $00, $00, $00, $01 ; $1DBCAF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBCB7 |
  db $40, $08, $00, $00, $01, $00, $00, $00 ; $1DBCBF |
  db $00, $00, $00, $02, $00, $00, $00, $00 ; $1DBCC7 |
  db $00, $00, $00, $00, $10, $20, $00, $02 ; $1DBCCF |
  db $00, $00, $00, $18, $00, $00, $00, $00 ; $1DBCD7 |
  db $00, $08, $10, $00, $00, $40, $00, $00 ; $1DBCDF |
  db $00, $00, $01, $09, $40, $20, $00, $00 ; $1DBCE7 |
  db $00, $20, $00, $08, $00, $08, $00, $80 ; $1DBCEF |
  db $00, $11, $01, $15, $01, $00, $00, $20 ; $1DBCF7 |
  db $10, $00, $00, $00, $00, $00, $00, $00 ; $1DBCFF |
  db $00, $00, $00, $00, $00, $80, $00, $00 ; $1DBD07 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBD0F |
  db $00, $00, $00, $01, $00, $01, $00, $02 ; $1DBD17 |
  db $00, $00, $00, $00, $00, $02, $00, $00 ; $1DBD1F |
  db $01, $02, $00, $00, $00, $00, $00, $00 ; $1DBD27 |
  db $10, $00, $00, $00, $00, $20, $41, $81 ; $1DBD2F |
  db $04, $00, $00, $00, $00, $00, $10, $00 ; $1DBD37 |
  db $00, $00, $00, $00, $00, $40, $00, $00 ; $1DBD3F |
  db $04, $00, $00, $00, $00, $02, $01, $00 ; $1DBD47 |
  db $00, $04, $00, $00, $00, $00, $00, $04 ; $1DBD4F |
  db $00, $00, $00, $08, $00, $00, $00, $00 ; $1DBD57 |
  db $01, $08, $00, $00, $00, $00, $10, $04 ; $1DBD5F |
  db $00, $00, $00, $00, $00, $90, $40, $00 ; $1DBD67 |
  db $40, $20, $00, $00, $00, $00, $00, $00 ; $1DBD6F |
  db $10, $C0, $00, $00, $00, $00, $00, $04 ; $1DBD77 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $1DBD7F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBD87 |
  db $00, $00, $00, $00, $00, $40, $00, $00 ; $1DBD8F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBD97 |
  db $00, $12, $00, $00, $10, $00, $00, $80 ; $1DBD9F |
  db $00, $00, $00, $C0, $40, $00, $00, $04 ; $1DBDA7 |
  db $10, $20, $10, $20, $14, $A0, $00, $08 ; $1DBDAF |
  db $00, $40, $00, $10, $00, $02, $01, $82 ; $1DBDB7 |
  db $40, $00, $00, $00, $00, $00, $00, $00 ; $1DBDBF |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $1DBDC7 |
  db $00, $00, $00, $40, $00, $00, $00, $00 ; $1DBDCF |
  db $00, $00, $00, $20, $00, $00, $00, $20 ; $1DBDD7 |
  db $00, $08, $00, $00, $00, $00, $00, $0A ; $1DBDDF |
  db $00, $A0, $00, $00, $10, $0E, $00, $00 ; $1DBDE7 |
  db $04, $00, $00, $08, $01, $00, $00, $20 ; $1DBDEF |
  db $00, $00, $00, $00, $04, $18, $01, $48 ; $1DBDF7 |
  db $51, $00, $00, $00, $00, $00, $00, $00 ; $1DBDFF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBE07 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBE0F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBE17 |
  db $00, $00, $01, $0A, $00, $00, $00, $80 ; $1DBE1F |
  db $00, $00, $00, $00, $00, $20, $00, $00 ; $1DBE27 |
  db $04, $00, $10, $00, $00, $00, $00, $00 ; $1DBE2F |
  db $00, $00, $10, $00, $00, $00, $00, $00 ; $1DBE37 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $1DBE3F |
  db $00, $00, $00, $80, $00, $00, $40, $00 ; $1DBE47 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBE4F |
  db $00, $00, $00, $00, $00, $04, $00, $01 ; $1DBE57 |
  db $00, $00, $00, $00, $00, $00, $00, $01 ; $1DBE5F |
  db $10, $01, $00, $81, $14, $00, $00, $10 ; $1DBE67 |
  db $00, $84, $05, $84, $00, $88, $00, $20 ; $1DBE6F |
  db $00, $40, $00, $01, $00, $80, $11, $00 ; $1DBE77 |
  db $01, $00, $00, $00, $00, $00, $00, $01 ; $1DBE7F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBE87 |
  db $00, $00, $00, $00, $00, $40, $00, $00 ; $1DBE8F |
  db $00, $00, $00, $00, $00, $00, $00, $02 ; $1DBE97 |
  db $00, $00, $00, $00, $00, $00, $04, $00 ; $1DBE9F |
  db $00, $40, $40, $80, $00, $00, $00, $00 ; $1DBEA7 |
  db $00, $40, $04, $40, $01, $42, $00, $02 ; $1DBEAF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBEB7 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $1DBEBF |
  db $00, $00, $01, $00, $00, $00, $00, $00 ; $1DBEC7 |
  db $40, $00, $00, $00, $00, $00, $00, $40 ; $1DBECF |
  db $40, $00, $00, $01, $00, $00, $04, $00 ; $1DBED7 |
  db $00, $00, $00, $00, $04, $00, $00, $00 ; $1DBEDF |
  db $00, $00, $00, $40, $00, $82, $00, $80 ; $1DBEE7 |
  db $00, $11, $40, $49, $00, $00, $00, $40 ; $1DBEEF |
  db $04, $00, $01, $00, $00, $00, $00, $00 ; $1DBEF7 |
  db $00, $00, $00, $20, $01, $00, $00, $00 ; $1DBEFF |
  db $00, $00, $00, $40, $00, $00, $00, $00 ; $1DBF07 |
  db $00, $00, $40, $00, $00, $00, $00, $00 ; $1DBF0F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBF17 |
  db $10, $00, $00, $00, $00, $00, $00, $00 ; $1DBF1F |
  db $00, $00, $00, $00, $00, $40, $04, $01 ; $1DBF27 |
  db $04, $00, $00, $01, $00, $01, $00, $00 ; $1DBF2F |
  db $00, $00, $04, $00, $00, $00, $00, $00 ; $1DBF37 |
  db $11, $00, $00, $04, $00, $00, $00, $00 ; $1DBF3F |
  db $00, $80, $00, $00, $00, $00, $00, $04 ; $1DBF47 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBF4F |
  db $00, $08, $00, $00, $00, $00, $00, $00 ; $1DBF57 |
  db $01, $00, $00, $00, $00, $E0, $04, $00 ; $1DBF5F |
  db $00, $01, $01, $04, $00, $01, $01, $08 ; $1DBF67 |
  db $00, $00, $00, $00, $04, $04, $00, $21 ; $1DBF6F |
  db $00, $00, $00, $41, $00, $02, $00, $00 ; $1DBF77 |
  db $40, $00, $00, $00, $00, $00, $00, $00 ; $1DBF7F |
  db $00, $00, $00, $00, $00, $00, $00, $01 ; $1DBF87 |
  db $00, $00, $00, $00, $00, $00, $00, $80 ; $1DBF8F |
  db $00, $00, $00, $00, $00, $40, $00, $00 ; $1DBF97 |
  db $10, $04, $00, $00, $00, $00, $00, $80 ; $1DBF9F |
  db $00, $40, $00, $80, $00, $20, $00, $00 ; $1DBFA7 |
  db $00, $00, $00, $00, $10, $10, $00, $44 ; $1DBFAF |
  db $00, $40, $00, $00, $00, $00, $00, $01 ; $1DBFB7 |
  db $15, $00, $00, $00, $00, $00, $00, $00 ; $1DBFBF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1DBFC7 |
  db $00, $00, $01, $04, $00, $00, $00, $40 ; $1DBFCF |
  db $00, $00, $10, $80, $04, $C0, $00, $04 ; $1DBFD7 |
  db $01, $2D, $00, $00, $04, $08, $00, $00 ; $1DBFDF |
  db $00, $01, $00, $80, $00, $00, $01, $21 ; $1DBFE7 |
  db $00, $00, $14, $00, $00, $09, $00, $00 ; $1DBFEF |
  db $00, $40, $00, $00, $00, $00, $00, $04 ; $1DBFF7 |
  db $00                                    ; $1DBFFF |

bank $1E
org $C000

NMI:
  PHP                                       ; $1EC000 |\
  PHA                                       ; $1EC001 | | preserve status,
  TXA                                       ; $1EC002 | | X, Y, and A
  PHA                                       ; $1EC003 | |
  TYA                                       ; $1EC004 | |
  PHA                                       ; $1EC005 |/
  LDA $F0                                   ; $1EC006 |
  BEQ code_1EC00D                           ; $1EC008 |
  JMP code_1EC107                           ; $1EC00A |

code_1EC00D:
  LDA $95                                   ; $1EC00D |
  BEQ code_1EC014                           ; $1EC00F |
  JMP code_1EC0BE                           ; $1EC011 |

code_1EC014:
  LDA $19                                   ; $1EC014 |
  ORA $1A                                   ; $1EC016 |
  STA $60                                   ; $1EC018 |
  LDA $FA                                   ; $1EC01A |
  STA $A2                                   ; $1EC01C |
  LDA $FC                                   ; $1EC01E |
  STA $A4                                   ; $1EC020 |
  LDA $FD                                   ; $1EC022 |
  AND #$03                                  ; $1EC024 |
  STA $A5                                   ; $1EC026 |
  LDA $9B                                   ; $1EC028 |
  STA $9C                                   ; $1EC02A |
  LDA $99                                   ; $1EC02C |
  STA $9A                                   ; $1EC02E |
  CMP #$05                                  ; $1EC030 |
  BNE code_1EC038                           ; $1EC032 |
  LDA $78                                   ; $1EC034 |
  STA $A4                                   ; $1EC036 |
code_1EC038:
  LDA $FF                                   ; $1EC038 |
  AND #$78                                  ; $1EC03A |
  STA $2000                                 ; $1EC03C |
  LDA #$00                                  ; $1EC03F |
  STA $2001                                 ; $1EC041 |
  STA $2003                                 ; $1EC044 |
  LDA #$02                                  ; $1EC047 |
  STA $4014                                 ; $1EC049 |
  LDA $1C                                   ; $1EC04C |
  BEQ code_1EC059                           ; $1EC04E |
  LDA #$00                                  ; $1EC050 |
  STA $1C                                   ; $1EC052 |
  LDX #$50                                  ; $1EC054 |
  JSR code_1EC29C                           ; $1EC056 |
code_1EC059:
  LDA $19                                   ; $1EC059 |
  BEQ code_1EC060                           ; $1EC05B |
  JSR code_1EC298                           ; $1EC05D |
code_1EC060:
  LDA $1A                                   ; $1EC060 |
  BEQ code_1EC07B                           ; $1EC062 |
  LDA $FF                                   ; $1EC064 |
  AND #$7F                                  ; $1EC066 |
  ORA #$04                                  ; $1EC068 |
  STA $2000                                 ; $1EC06A |
  LDX #$00                                  ; $1EC06D |
  STX $1A                                   ; $1EC06F |
  JSR code_1EC29C                           ; $1EC071 |
  LDA $FF                                   ; $1EC074 |
  AND #$7F                                  ; $1EC076 |
  STA $2000                                 ; $1EC078 |
code_1EC07B:
  LDA $18                                   ; $1EC07B |
  BEQ select_CHR_banks                      ; $1EC07D |
  LDA $60                                   ; $1EC07F |
  BNE select_CHR_banks                      ; $1EC081 |
  LDX #$00                                  ; $1EC083 |
  STX $18                                   ; $1EC085 |
  LDA $2002                                 ; $1EC087 |
  LDA #$3F                                  ; $1EC08A |
  STA $2006                                 ; $1EC08C |
  STX $2006                                 ; $1EC08F |
  LDY #$20                                  ; $1EC092 |
code_1EC094:
  LDA $0600,x                               ; $1EC094 |
  STA $2007                                 ; $1EC097 |
  INX                                       ; $1EC09A |
  DEY                                       ; $1EC09B |
  BNE code_1EC094                           ; $1EC09C |
  LDA #$3F                                  ; $1EC09E |
  STA $2006                                 ; $1EC0A0 |
  STY $2006                                 ; $1EC0A3 |
  STY $2006                                 ; $1EC0A6 |
  STY $2006                                 ; $1EC0A9 |
select_CHR_banks:
  LDX #$05                                  ; $1EC0AC | $00-$05 are MMC3's CHR banks
loop_CHR_banks:
  STX $8000                                 ; $1EC0AE | loop index -> bank select register
  LDA $EA,x                                 ; $1EC0B1 |\ table value at $EA
  STA $8001                                 ; $1EC0B3 |/ -> bank data
  DEX                                       ; $1EC0B6 |\ continue loop until after $00
  BPL loop_CHR_banks                        ; $1EC0B7 |/
  LDA $F2                                   ; $1EC0B9 |
  STA $8000                                 ; $1EC0BB |
code_1EC0BE:
  LDA $9A                                   ; $1EC0BE |
  CMP #$04                                  ; $1EC0C0 |
  BNE code_1EC0D3                           ; $1EC0C2 |
  LDA $2002                                 ; $1EC0C4 |
  LDA $78                                   ; $1EC0C7 |
  STA $2005                                 ; $1EC0C9 |
  LDA #$00                                  ; $1EC0CC |
  STA $2005                                 ; $1EC0CE |
  BEQ code_1EC0E0                           ; $1EC0D1 |
code_1EC0D3:
  LDA $2002                                 ; $1EC0D3 |
  LDA $A4                                   ; $1EC0D6 |
  STA $2005                                 ; $1EC0D8 |
  LDA $A2                                   ; $1EC0DB |
  STA $2005                                 ; $1EC0DD |
code_1EC0E0:
  LDA $FE                                   ; $1EC0E0 |
  STA $2001                                 ; $1EC0E2 |
  LDA $A5                                   ; $1EC0E5 |
  ORA $FF                                   ; $1EC0E7 |
  STA $2000                                 ; $1EC0E9 |
  LDA $9C                                   ; $1EC0EC |
  STA $C000                                 ; $1EC0EE |
  STA $C001                                 ; $1EC0F1 |
  LDX $96                                   ; $1EC0F4 |
  STA $E000,x                               ; $1EC0F6 |
  BEQ code_1EC107                           ; $1EC0F9 |
  LDX $9A                                   ; $1EC0FB |
  LDA $C280,x                               ; $1EC0FD |
  STA $97                                   ; $1EC100 |
  LDA $C288,x                               ; $1EC102 |
  STA $98                                   ; $1EC105 |
code_1EC107:
  INC $92                                   ; $1EC107 |
  LDX #$FF                                  ; $1EC109 |
  STX $90                                   ; $1EC10B |
  INX                                       ; $1EC10D |
  LDY #$04                                  ; $1EC10E | loop through 4 subsystems
.loop_subsystem:
  LDA $80,x                                 ; $1EC110 |\
  CMP #$01                                  ; $1EC112 | | if it has already been processed
  BNE .next_subsystem                       ; $1EC114 |/
  DEC $81,x                                 ; $1EC116 |\ then dec & check delay timer
  BNE .next_subsystem                       ; $1EC118 |/
  LDA #$04                                  ; $1EC11A |\ if no delay on the timer,
  STA $80,x                                 ; $1EC11C |/ reset it to needs processing
.next_subsystem:
  INX                                       ; $1EC11E |\
  INX                                       ; $1EC11F | | next subsystem in table
  INX                                       ; $1EC120 | |
  INX                                       ; $1EC121 |/
  DEY                                       ; $1EC122 | dec loop counter
  BNE .loop_subsystem                       ; $1EC123 |
  LDA $9A                                   ; $1EC125 |
  CMP #$04                                  ; $1EC127 |
  BEQ code_1EC140                           ; $1EC129 |
code_1EC12B:
  TSX                                       ; $1EC12B |
  LDA $0107,x                               ; $1EC12C |
  STA $E9                                   ; $1EC12F |
  LDA $0106,x                               ; $1EC131 |
  STA $E8                                   ; $1EC134 |
  LDA #$C1                                  ; $1EC136 |
  STA $0107,x                               ; $1EC138 |
  LDA #$47                                  ; $1EC13B |
  STA $0106,x                               ; $1EC13D |
code_1EC140:
  PLA                                       ; $1EC140 |\
  TAY                                       ; $1EC141 | |
  PLA                                       ; $1EC142 | | restore status,
  TAX                                       ; $1EC143 | | X, Y, and A
  PLA                                       ; $1EC144 | | and return from interrupt
  PLP                                       ; $1EC145 | |
  RTI                                       ; $1EC146 |/

  PHP                                       ; $1EC147 |
  PHP                                       ; $1EC148 |
  PHP                                       ; $1EC149 |
  PHA                                       ; $1EC14A |
  TXA                                       ; $1EC14B |
  PHA                                       ; $1EC14C |
  TYA                                       ; $1EC14D |
  PHA                                       ; $1EC14E |
  TSX                                       ; $1EC14F |
  SEC                                       ; $1EC150 |
  LDA $E8                                   ; $1EC151 |
  SBC #$01                                  ; $1EC153 |
  STA $0105,x                               ; $1EC155 |
  LDA $E9                                   ; $1EC158 |
  SBC #$00                                  ; $1EC15A |
  STA $0106,x                               ; $1EC15C |
  JSR code_1FFF68                           ; $1EC15F |
  PLA                                       ; $1EC162 |
  TAY                                       ; $1EC163 |
  PLA                                       ; $1EC164 |
  TAX                                       ; $1EC165 |
  PLA                                       ; $1EC166 |
  PLP                                       ; $1EC167 |
  RTS                                       ; $1EC168 |

IRQ:
  PHP                                       ; $1EC169 |
  PHA                                       ; $1EC16A |
  TXA                                       ; $1EC16B |
  PHA                                       ; $1EC16C |
  TYA                                       ; $1EC16D |
  PHA                                       ; $1EC16E |
  STA $E000                                 ; $1EC16F |
  STA $E001                                 ; $1EC172 |
  LDX $9A                                   ; $1EC175 |
  LDA $C290,x                               ; $1EC177 |
  BNE code_1EC182                           ; $1EC17A |
  LDX #$07                                  ; $1EC17C |
code_1EC17E:
  NOP                                       ; $1EC17E |
  DEX                                       ; $1EC17F |
  BNE code_1EC17E                           ; $1EC180 |
code_1EC182:
  JMP ($0097)                               ; $1EC182 |

  LDA $2002                                 ; $1EC185 |
  LDA $A4                                   ; $1EC188 |
  LSR                                       ; $1EC18A |
  LSR                                       ; $1EC18B |
  LSR                                       ; $1EC18C |
  ORA $78                                   ; $1EC18D |
  LDY $79                                   ; $1EC18F |
  STY $2006                                 ; $1EC191 |
  STA $2006                                 ; $1EC194 |
  LDA $FF                                   ; $1EC197 |
  STA $2000                                 ; $1EC199 |
  LDA $A4                                   ; $1EC19C |
  STA $2005                                 ; $1EC19E |
  LDA #$00                                  ; $1EC1A1 |
  STA $2005                                 ; $1EC1A3 |
  JMP code_1EC276                           ; $1EC1A6 |

  LDA $2002                                 ; $1EC1A9 |
  LDA #$23                                  ; $1EC1AC |
  STA $2006                                 ; $1EC1AE |
  LDA #$00                                  ; $1EC1B1 |
  STA $2006                                 ; $1EC1B3 |
  LDA #$00                                  ; $1EC1B6 |
  STA $2005                                 ; $1EC1B8 |
  STA $2005                                 ; $1EC1BB |
  LDA $A5                                   ; $1EC1BE |
  EOR #$01                                  ; $1EC1C0 |
  ORA $FF                                   ; $1EC1C2 |
  STA $2000                                 ; $1EC1C4 |
  JMP code_1EC276                           ; $1EC1C7 |

  LDA $2002                                 ; $1EC1CA |
  LDA $78                                   ; $1EC1CD |
  STA $2005                                 ; $1EC1CF |
  LDA #$00                                  ; $1EC1D2 |
  STA $2005                                 ; $1EC1D4 |
  LDA #$2E                                  ; $1EC1D7 |
  STA $C000                                 ; $1EC1D9 |
  LDA #$04                                  ; $1EC1DC |
  STA $97                                   ; $1EC1DE |
  LDA #$C2                                  ; $1EC1E0 |
  STA $98                                   ; $1EC1E2 |
  JMP code_1EC279                           ; $1EC1E4 |

  LDA $2002                                 ; $1EC1E7 |
  LDA $79                                   ; $1EC1EA |
  STA $2005                                 ; $1EC1EC |
  LDA $A2                                   ; $1EC1EF |
  STA $2005                                 ; $1EC1F1 |
  LDA $7A                                   ; $1EC1F4 |
  STA $C000                                 ; $1EC1F6 |
  LDA #$04                                  ; $1EC1F9 |
  STA $97                                   ; $1EC1FB |
  LDA #$C2                                  ; $1EC1FD |
  STA $98                                   ; $1EC1FF |
  JMP code_1EC12B                           ; $1EC201 |

  LDA $2002                                 ; $1EC204 |
  LDA $A4                                   ; $1EC207 |
  STA $2005                                 ; $1EC209 |
  LDA $A2                                   ; $1EC20C |
  STA $2005                                 ; $1EC20E |
  BEQ code_1EC276                           ; $1EC211 |
  LDA $2002                                 ; $1EC213 |
  LDA $7A                                   ; $1EC216 |
  STA $2006                                 ; $1EC218 |
  LDA $7B                                   ; $1EC21B |
  STA $2006                                 ; $1EC21D |
  LDA #$00                                  ; $1EC220 |
  STA $2005                                 ; $1EC222 |
  STA $2005                                 ; $1EC225 |
  LDA $FF                                   ; $1EC228 |
  STA $2000                                 ; $1EC22A |
  BNE code_1EC276                           ; $1EC22D |
  LDA $2002                                 ; $1EC22F |
  LDA #$29                                  ; $1EC232 |
  STA $2006                                 ; $1EC234 |
  LDA #$C0                                  ; $1EC237 |
  STA $2006                                 ; $1EC239 |
  LDA #$00                                  ; $1EC23C |
  STA $2005                                 ; $1EC23E |
  STA $2005                                 ; $1EC241 |
  LDA $FF                                   ; $1EC244 |
  ORA #$02                                  ; $1EC246 |
  STA $2000                                 ; $1EC248 |
  BNE code_1EC276                           ; $1EC24B |
  LDA $2002                                 ; $1EC24D |
  LDA $78                                   ; $1EC250 |
  STA $2005                                 ; $1EC252 |
  LDA #$00                                  ; $1EC255 |
  STA $2005                                 ; $1EC257 |
  LDA #$1F                                  ; $1EC25A |
  STA $C000                                 ; $1EC25C |
  LDA #$69                                  ; $1EC25F |
  STA $97                                   ; $1EC261 |
  LDA #$C2                                  ; $1EC263 |
  STA $98                                   ; $1EC265 |
  BNE code_1EC279                           ; $1EC267 |
  LDA $2002                                 ; $1EC269 |
  LDA $79                                   ; $1EC26C |
  STA $2005                                 ; $1EC26E |
  LDA #$00                                  ; $1EC271 |
  STA $2005                                 ; $1EC273 |
code_1EC276:
  STA $E000                                 ; $1EC276 |
code_1EC279:
  PLA                                       ; $1EC279 |
  TAY                                       ; $1EC27A |
  PLA                                       ; $1EC27B |
  TAX                                       ; $1EC27C |
  PLA                                       ; $1EC27D |
  PLP                                       ; $1EC27E |
  RTI                                       ; $1EC27F |

  db $76, $85, $A9, $CA, $E7, $13, $2F, $4D ; $1EC280 |
  db $C2, $C1, $C1, $C1, $C1, $C2, $C2, $C2 ; $1EC288 |
  db $00, $00, $00, $01, $01, $00, $00, $01 ; $1EC290 |

code_1EC298:
  LDX #$00                                  ; $1EC298 |
  STX $19                                   ; $1EC29A |
code_1EC29C:
  LDA $0780,x                               ; $1EC29C |
  BMI code_1EC2BC                           ; $1EC29F |
  STA $2006                                 ; $1EC2A1 |
  LDA $0781,x                               ; $1EC2A4 |
  STA $2006                                 ; $1EC2A7 |
  LDY $0782,x                               ; $1EC2AA |
code_1EC2AD:
  LDA $0783,x                               ; $1EC2AD |
  STA $2007                                 ; $1EC2B0 |
  INX                                       ; $1EC2B3 |
  DEY                                       ; $1EC2B4 |
  BPL code_1EC2AD                           ; $1EC2B5 |
  INX                                       ; $1EC2B7 |
  INX                                       ; $1EC2B8 |
  INX                                       ; $1EC2B9 |
  BNE code_1EC29C                           ; $1EC2BA |
code_1EC2BC:
  RTS                                       ; $1EC2BC |

  LDA $FF                                   ; $1EC2BD |
  AND #$11                                  ; $1EC2BF |
  STA $FF                                   ; $1EC2C1 |
  STA $2000                                 ; $1EC2C3 |
  RTS                                       ; $1EC2C6 |

  LDA $FF                                   ; $1EC2C7 |
  ORA #$80                                  ; $1EC2C9 |
  STA $FF                                   ; $1EC2CB |
  STA $2000                                 ; $1EC2CD |
  RTS                                       ; $1EC2D0 |

code_1EC2D1:
  INC $F0                                   ; $1EC2D1 |
  LDA #$00                                  ; $1EC2D3 |
  STA $FE                                   ; $1EC2D5 |
  STA $2001                                 ; $1EC2D7 |
  RTS                                       ; $1EC2DA |

code_1EC2DB:
  DEC $F0                                   ; $1EC2DB |
  LDA #$18                                  ; $1EC2DD |
  STA $FE                                   ; $1EC2DF |
  STA $2001                                 ; $1EC2E1 |
  RTS                                       ; $1EC2E4 |

code_1EC2E5:
  LDX #$01                                  ; $1EC2E5 |
  STX $4016                                 ; $1EC2E7 |
  DEX                                       ; $1EC2EA |
  STX $4016                                 ; $1EC2EB |
  LDX #$08                                  ; $1EC2EE |
code_1EC2F0:
  LDA $4016                                 ; $1EC2F0 |
  LSR                                       ; $1EC2F3 |
  ROL $14                                   ; $1EC2F4 |
  LSR                                       ; $1EC2F6 |
  ROL $00                                   ; $1EC2F7 |
  LDA $4017                                 ; $1EC2F9 |
  LSR                                       ; $1EC2FC |
  ROL $15                                   ; $1EC2FD |
  LSR                                       ; $1EC2FF |
  ROL $01                                   ; $1EC300 |
  DEX                                       ; $1EC302 |
  BNE code_1EC2F0                           ; $1EC303 |
  LDA $00                                   ; $1EC305 |
  ORA $14                                   ; $1EC307 |
  STA $14                                   ; $1EC309 |
  LDA $01                                   ; $1EC30B |
  ORA $15                                   ; $1EC30D |
  STA $15                                   ; $1EC30F |
  LDX #$01                                  ; $1EC311 |
code_1EC313:
  LDA $14,x                                 ; $1EC313 |
  TAY                                       ; $1EC315 |
  EOR $16,x                                 ; $1EC316 |
  AND $14,x                                 ; $1EC318 |
  STA $14,x                                 ; $1EC31A |
  STY $16,x                                 ; $1EC31C |
  DEX                                       ; $1EC31E |
  BPL code_1EC313                           ; $1EC31F |
  LDX #$03                                  ; $1EC321 |
code_1EC323:
  LDA $14,x                                 ; $1EC323 |
  AND #$0C                                  ; $1EC325 |
  CMP #$0C                                  ; $1EC327 |
  BEQ code_1EC333                           ; $1EC329 |
  LDA $14,x                                 ; $1EC32B |
  AND #$03                                  ; $1EC32D |
  CMP #$03                                  ; $1EC32F |
  BNE code_1EC339                           ; $1EC331 |
code_1EC333:
  LDA $14,x                                 ; $1EC333 |
  AND #$F0                                  ; $1EC335 |
  STA $14,x                                 ; $1EC337 |
code_1EC339:
  DEX                                       ; $1EC339 |
  BPL code_1EC323                           ; $1EC33A |
  LDA #$00                                  ; $1EC33C |
  STA $15                                   ; $1EC33E |
  STA $17                                   ; $1EC340 |
  RTS                                       ; $1EC342 |

code_1EC343:
  STA $00                                   ; $1EC343 |
  STX $01                                   ; $1EC345 |
  STY $02                                   ; $1EC347 |
  LDA $2002                                 ; $1EC349 |
  LDA $FF                                   ; $1EC34C |
  AND #$FE                                  ; $1EC34E |
  STA $2000                                 ; $1EC350 |
  LDA $00                                   ; $1EC353 |
  STA $2006                                 ; $1EC355 |
  LDY #$00                                  ; $1EC358 |
  STY $2006                                 ; $1EC35A |
  LDX #$04                                  ; $1EC35D |
  CMP #$20                                  ; $1EC35F |
  BCS code_1EC365                           ; $1EC361 |
  LDX $02                                   ; $1EC363 |
code_1EC365:
  LDY #$00                                  ; $1EC365 |
  LDA $01                                   ; $1EC367 |
code_1EC369:
  STA $2007                                 ; $1EC369 |
  DEY                                       ; $1EC36C |
  BNE code_1EC369                           ; $1EC36D |
  DEX                                       ; $1EC36F |
  BNE code_1EC369                           ; $1EC370 |
  LDY $02                                   ; $1EC372 |
  LDA $00                                   ; $1EC374 |
  CMP #$20                                  ; $1EC376 |
  BCC code_1EC38C                           ; $1EC378 |
  ADC #$02                                  ; $1EC37A |
  STA $2006                                 ; $1EC37C |
  LDA #$C0                                  ; $1EC37F |
  STA $2006                                 ; $1EC381 |
  LDX #$40                                  ; $1EC384 |
code_1EC386:
  STY $2007                                 ; $1EC386 |
  DEX                                       ; $1EC389 |
  BNE code_1EC386                           ; $1EC38A |
code_1EC38C:
  LDX $01                                   ; $1EC38C |
  RTS                                       ; $1EC38E |

code_1EC38F:
  LDX #$00                                  ; $1EC38F |
code_1EC391:
  LDA #$F8                                  ; $1EC391 |
code_1EC393:
  STA $0200,x                               ; $1EC393 |
  INX                                       ; $1EC396 |
  INX                                       ; $1EC397 |
  INX                                       ; $1EC398 |
  INX                                       ; $1EC399 |
  BNE code_1EC393                           ; $1EC39A |
  RTS                                       ; $1EC39C |

code_1EC39D:
  LDX #$17                                  ; $1EC39D |
code_1EC39F:
  LDA #$00                                  ; $1EC39F |
  STA {entity_type},x                       ; $1EC3A1 |
  STA {entity_handler_high},x               ; $1EC3A4 |
  STA {entity_flash_counter},x              ; $1EC3A7 |
  STA {entity_life},x                       ; $1EC3AA |
  LDA #$FF                                  ; $1EC3AD |
  STA $0438,x                               ; $1EC3AF |
  DEX                                       ; $1EC3B2 |
  BNE code_1EC39F                           ; $1EC3B3 |
  STX $74                                   ; $1EC3B5 |
  RTS                                       ; $1EC3B7 |

code_1EC3B8:
  LDA #$00                                  ; $1EC3B8 |
  STA $99                                   ; $1EC3BA |
  STA $46                                   ; $1EC3BC |
  STA $78                                   ; $1EC3BE |
  STA $79                                   ; $1EC3C0 |
  STA $7A                                   ; $1EC3C2 |
  STA $7B                                   ; $1EC3C4 |
  STA $FA                                   ; $1EC3C6 |
  STA $FB                                   ; $1EC3C8 |
  STA $FC                                   ; $1EC3CA |
  STA $FD                                   ; $1EC3CC |
  LDY #$88                                  ; $1EC3CE |
  STY $9B                                   ; $1EC3D0 |
  LDY #$3F                                  ; $1EC3D2 |
code_1EC3D4:
  STA $0680,y                               ; $1EC3D4 |
  DEY                                       ; $1EC3D7 |
  BPL code_1EC3D4                           ; $1EC3D8 |
  STA $58                                   ; $1EC3DA |
  LDA #$50                                  ; $1EC3DC |
  STA $57                                   ; $1EC3DE |
  LDA $26                                   ; $1EC3E0 |
  CMP #$0A                                  ; $1EC3E2 |
  BNE code_1EC3EA                           ; $1EC3E4 |
  LDA #$00                                  ; $1EC3E6 |
  STA $43                                   ; $1EC3E8 |
code_1EC3EA:
  RTS                                       ; $1EC3EA |

code_1EC3EB:
  LDA #$30                                  ; $1EC3EB |
  LDX #$F0                                  ; $1EC3ED |
  BNE code_1EC3F4                           ; $1EC3EF |
code_1EC3F1:
  LDA #$10                                  ; $1EC3F1 |
  TAX                                       ; $1EC3F3 |
code_1EC3F4:
  STA $0F                                   ; $1EC3F4 |
  STX $0D                                   ; $1EC3F6 |
  INC $1B                                   ; $1EC3F8 |
  LDY #$04                                  ; $1EC3FA |
  STY $0E                                   ; $1EC3FC |
code_1EC3FE:
  LDA $A9                                   ; $1EC3FE |
  PHA                                       ; $1EC400 |
  LDY #$1F                                  ; $1EC401 |
code_1EC403:
  TYA                                       ; $1EC403 |
  AND #$03                                  ; $1EC404 |
  CMP #$03                                  ; $1EC406 |
  BNE code_1EC414                           ; $1EC408 |
  LSR $A9                                   ; $1EC40A |
  BCC code_1EC414                           ; $1EC40C |
  DEY                                       ; $1EC40E |
  DEY                                       ; $1EC40F |
  DEY                                       ; $1EC410 |
  JMP code_1EC421                           ; $1EC411 |

code_1EC414:
  LDA $0620,y                               ; $1EC414 |
  SEC                                       ; $1EC417 |
  SBC $0F                                   ; $1EC418 |
  BPL code_1EC41E                           ; $1EC41A |
  LDA #$0F                                  ; $1EC41C |
code_1EC41E:
  STA $0600,y                               ; $1EC41E |
code_1EC421:
  DEY                                       ; $1EC421 |
  BPL code_1EC403                           ; $1EC422 |
  LDA $0600                                 ; $1EC424 |
  STA $0610                                 ; $1EC427 |
  STY $18                                   ; $1EC42A |
  PLA                                       ; $1EC42C |
  STA $A9                                   ; $1EC42D |
  LDA $0E                                   ; $1EC42F |
code_1EC431:
  PHA                                       ; $1EC431 |
  JSR async_next_frame                      ; $1EC432 |
  PLA                                       ; $1EC435 |
  SEC                                       ; $1EC436 |
  SBC #$01                                  ; $1EC437 |
  BNE code_1EC431                           ; $1EC439 |
  LDA $0F                                   ; $1EC43B |
  CLC                                       ; $1EC43D |
  ADC $0D                                   ; $1EC43E |
  STA $0F                                   ; $1EC440 |
  CMP #$50                                  ; $1EC442 |
  BEQ code_1EC44A                           ; $1EC444 |
  LDA $0F                                   ; $1EC446 |
  BPL code_1EC3FE                           ; $1EC448 |
code_1EC44A:
  LDA #$00                                  ; $1EC44A |
  STA $A9                                   ; $1EC44C |
  DEC $1B                                   ; $1EC44E |
  RTS                                       ; $1EC450 |

  PLA                                       ; $1EC451 |
  STA $02                                   ; $1EC452 |
  PLA                                       ; $1EC454 |
  STA $03                                   ; $1EC455 |
  LDY #$01                                  ; $1EC457 |
  LDA ($02),y                               ; $1EC459 |
  STA $04                                   ; $1EC45B |
  INY                                       ; $1EC45D |
  LDA ($02),y                               ; $1EC45E |
  STA $05                                   ; $1EC460 |
  LDY #$00                                  ; $1EC462 |
code_1EC464:
  LDA ($04),y                               ; $1EC464 |
  BEQ code_1EC48B                           ; $1EC466 |
  STA $2006                                 ; $1EC468 |
  JSR code_1EC49B                           ; $1EC46B |
  LDA ($04),y                               ; $1EC46E |
  STA $2006                                 ; $1EC470 |
  JSR code_1EC49B                           ; $1EC473 |
  LDA ($04),y                               ; $1EC476 |
  STA $06                                   ; $1EC478 |
  JSR code_1EC49B                           ; $1EC47A |
code_1EC47D:
  LDA ($04),y                               ; $1EC47D |
  STA $2007                                 ; $1EC47F |
  JSR code_1EC49B                           ; $1EC482 |
  DEC $06                                   ; $1EC485 |
  BPL code_1EC47D                           ; $1EC487 |
  BMI code_1EC464                           ; $1EC489 |
code_1EC48B:
  LDA $02                                   ; $1EC48B |
  CLC                                       ; $1EC48D |
  ADC #$02                                  ; $1EC48E |
  STA $02                                   ; $1EC490 |
  LDA $03                                   ; $1EC492 |
  ADC #$00                                  ; $1EC494 |
  PHA                                       ; $1EC496 |
  LDA $02                                   ; $1EC497 |
  PHA                                       ; $1EC499 |
  RTS                                       ; $1EC49A |

code_1EC49B:
  INY                                       ; $1EC49B |
  BNE code_1EC4A0                           ; $1EC49C |
  INC $05                                   ; $1EC49E |
code_1EC4A0:
  RTS                                       ; $1EC4A0 |

code_1EC4A1:
  JSR code_1EC6DB                           ; $1EC4A1 |
  LDA $17                                   ; $1EC4A4 |
  AND #$08                                  ; $1EC4A6 |
  BEQ code_1EC4AD                           ; $1EC4A8 |
  JMP code_1EC5A7                           ; $1EC4AA |

code_1EC4AD:
  LDA $C807,y                               ; $1EC4AD |
  STA $40                                   ; $1EC4B0 |
  TAY                                       ; $1EC4B2 |
  LDA $C837,y                               ; $1EC4B3 |
  STA $06                                   ; $1EC4B6 |
  LDA #$00                                  ; $1EC4B8 |
  STA $02                                   ; $1EC4BA |
  JSR code_1EC7AA                           ; $1EC4BC |
  LDA {y_position_high},x                   ; $1EC4BF |
  STA $03                                   ; $1EC4C2 |
  LDA $C838,y                               ; $1EC4C4 |
  PHA                                       ; $1EC4C7 |
  CLC                                       ; $1EC4C8 |
  ADC $11                                   ; $1EC4C9 |
  STA $11                                   ; $1EC4CB |
  PLA                                       ; $1EC4CD |
  BMI code_1EC4E7                           ; $1EC4CE |
  BCS code_1EC4D8                           ; $1EC4D0 |
  LDA $11                                   ; $1EC4D2 |
  CMP #$F0                                  ; $1EC4D4 |
  BCC code_1EC504                           ; $1EC4D6 |
code_1EC4D8:
  LDA $46                                   ; $1EC4D8 |
  BEQ code_1EC4F7                           ; $1EC4DA |
  LDA $11                                   ; $1EC4DC |
  ADC #$0F                                  ; $1EC4DE |
  STA $11                                   ; $1EC4E0 |
  DEC $13                                   ; $1EC4E2 |
  JMP code_1EC504                           ; $1EC4E4 |

code_1EC4E7:
  BCS code_1EC504                           ; $1EC4E7 |
  LDA $46                                   ; $1EC4E9 |
  BEQ code_1EC4F7                           ; $1EC4EB |
  LDA $11                                   ; $1EC4ED |
  SBC #$0F                                  ; $1EC4EF |
  STA $11                                   ; $1EC4F1 |
  INC $13                                   ; $1EC4F3 |
  BNE code_1EC504                           ; $1EC4F5 |
code_1EC4F7:
  LDA #$00                                  ; $1EC4F7 |
  LDY $06                                   ; $1EC4F9 |
code_1EC4FB:
  STA $0048,y                               ; $1EC4FB |
  DEY                                       ; $1EC4FE |
  BPL code_1EC4FB                           ; $1EC4FF |
  JMP code_1EC737                           ; $1EC501 |

code_1EC504:
  LDA $03                                   ; $1EC504 |
  BNE code_1EC4F7                           ; $1EC506 |
  LDA $11                                   ; $1EC508 |
  LSR                                       ; $1EC50A |
  LSR                                       ; $1EC50B |
  PHA                                       ; $1EC50C |
  AND #$38                                  ; $1EC50D |
  STA $22                                   ; $1EC50F |
  PLA                                       ; $1EC511 |
  LSR                                       ; $1EC512 |
  AND #$02                                  ; $1EC513 |
  STA $03                                   ; $1EC515 |
  LDA #$00                                  ; $1EC517 |
  STA $04                                   ; $1EC519 |
  LDA $C839,y                               ; $1EC51B |
  BPL code_1EC522                           ; $1EC51E |
  DEC $04                                   ; $1EC520 |
code_1EC522:
  CLC                                       ; $1EC522 |
  ADC {x_position_low},x                    ; $1EC523 |
  STA $12                                   ; $1EC526 |
  LDA $13                                   ; $1EC528 |
  ADC $04                                   ; $1EC52A |
  STA $13                                   ; $1EC52C |
  LDA $12                                   ; $1EC52E |
  LSR                                       ; $1EC530 |
  LSR                                       ; $1EC531 |
  LSR                                       ; $1EC532 |
  LSR                                       ; $1EC533 |
  PHA                                       ; $1EC534 |
  AND #$01                                  ; $1EC535 |
  ORA $03                                   ; $1EC537 |
  STA $03                                   ; $1EC539 |
  PLA                                       ; $1EC53B |
  LSR                                       ; $1EC53C |
  ORA $22                                   ; $1EC53D |
  STA $22                                   ; $1EC53F |
code_1EC541:
  LDY $13                                   ; $1EC541 |
  JSR code_1ED7A3                           ; $1EC543 |
code_1EC546:
  JSR code_1ED758                           ; $1EC546 |
code_1EC549:
  LDY $03                                   ; $1EC549 |
  LDA ($00),y                               ; $1EC54B |
  TAY                                       ; $1EC54D |
  LDA $B100,y                               ; $1EC54E |
  AND #$F0                                  ; $1EC551 |
  JSR code_1EC74E                           ; $1EC553 |
  JSR code_1EC77C                           ; $1EC556 |
  LDY $02                                   ; $1EC559 |
  STA $0048,y                               ; $1EC55B |
  CMP $42                                   ; $1EC55E |
  BCC code_1EC564                           ; $1EC560 |
  STA $42                                   ; $1EC562 |
code_1EC564:
  ORA $10                                   ; $1EC564 |
  STA $10                                   ; $1EC566 |
  LDA $02                                   ; $1EC568 |
  CMP $06                                   ; $1EC56A |
  BEQ code_1EC5A7                           ; $1EC56C |
  INC $02                                   ; $1EC56E |
  INC $40                                   ; $1EC570 |
  LDY $40                                   ; $1EC572 |
  LDA $12                                   ; $1EC574 |
  PHA                                       ; $1EC576 |
  AND #$10                                  ; $1EC577 |
  STA $04                                   ; $1EC579 |
  PLA                                       ; $1EC57B |
  CLC                                       ; $1EC57C |
  ADC $C839,y                               ; $1EC57D |
  STA $12                                   ; $1EC580 |
  AND #$10                                  ; $1EC582 |
  CMP $04                                   ; $1EC584 |
  BEQ code_1EC549                           ; $1EC586 |
  LDA $03                                   ; $1EC588 |
  EOR #$01                                  ; $1EC58A |
  STA $03                                   ; $1EC58C |
  AND #$01                                  ; $1EC58E |
  BNE code_1EC549                           ; $1EC590 |
  INC $22                                   ; $1EC592 |
  LDA $22                                   ; $1EC594 |
  AND #$07                                  ; $1EC596 |
  BNE code_1EC546                           ; $1EC598 |
  INC $13                                   ; $1EC59A |
  DEC $22                                   ; $1EC59C |
  LDA $22                                   ; $1EC59E |
  AND #$38                                  ; $1EC5A0 |
  STA $22                                   ; $1EC5A2 |
  JMP code_1EC541                           ; $1EC5A4 |

code_1EC5A7:
  JMP code_1EC737                           ; $1EC5A7 |

code_1EC5AA:
  JSR code_1EC6DB                           ; $1EC5AA |
  LDA $17                                   ; $1EC5AD |
  AND #$08                                  ; $1EC5AF |
  BEQ code_1EC5B6                           ; $1EC5B1 |
  JMP code_1EC6D8                           ; $1EC5B3 |

code_1EC5B6:
  LDA $C8E2,y                               ; $1EC5B6 |
  STA $40                                   ; $1EC5B9 |
  TAY                                       ; $1EC5BB |
  LDA $C912,y                               ; $1EC5BC |
  STA $06                                   ; $1EC5BF |
  LDA #$00                                  ; $1EC5C1 |
  STA $02                                   ; $1EC5C3 |
  LDA #$00                                  ; $1EC5C5 |
  STA $04                                   ; $1EC5C7 |
  STA $05                                   ; $1EC5C9 |
  LDA $C913,y                               ; $1EC5CB |
  BPL code_1EC5D2                           ; $1EC5CE |
  DEC $04                                   ; $1EC5D0 |
code_1EC5D2:
  CLC                                       ; $1EC5D2 |
  ADC {x_position_low},x                    ; $1EC5D3 |
  STA $12                                   ; $1EC5D6 |
  LDA $13                                   ; $1EC5D8 |
  ADC $04                                   ; $1EC5DA |
  STA $13                                   ; $1EC5DC |
  LDA $12                                   ; $1EC5DE |
  LSR                                       ; $1EC5E0 |
  LSR                                       ; $1EC5E1 |
  LSR                                       ; $1EC5E2 |
  LSR                                       ; $1EC5E3 |
  PHA                                       ; $1EC5E4 |
  AND #$01                                  ; $1EC5E5 |
  STA $03                                   ; $1EC5E7 |
  PLA                                       ; $1EC5E9 |
  LSR                                       ; $1EC5EA |
  STA $22                                   ; $1EC5EB |
  LDA {y_position_high},x                   ; $1EC5ED |
  BMI code_1EC630                           ; $1EC5F0 |
  BNE code_1EC618                           ; $1EC5F2 |
  LDA $11                                   ; $1EC5F4 |
  CLC                                       ; $1EC5F6 |
  ADC $C914,y                               ; $1EC5F7 |
  STA $11                                   ; $1EC5FA |
  LDA $C914,y                               ; $1EC5FC |
  BMI code_1EC620                           ; $1EC5FF |
  BCS code_1EC609                           ; $1EC601 |
  LDA $11                                   ; $1EC603 |
  CMP #$F0                                  ; $1EC605 |
  BCC code_1EC636                           ; $1EC607 |
code_1EC609:
  LDA $46                                   ; $1EC609 |
  BEQ code_1EC618                           ; $1EC60B |
  LDA $11                                   ; $1EC60D |
  ADC #$0F                                  ; $1EC60F |
  STA $11                                   ; $1EC611 |
  DEC $13                                   ; $1EC613 |
  JMP code_1EC636                           ; $1EC615 |

code_1EC618:
  LDA #$EF                                  ; $1EC618 |
  STA $11                                   ; $1EC61A |
  INC $05                                   ; $1EC61C |
  BNE code_1EC636                           ; $1EC61E |
code_1EC620:
  BCS code_1EC636                           ; $1EC620 |
  LDA $46                                   ; $1EC622 |
  BEQ code_1EC630                           ; $1EC624 |
  LDA $11                                   ; $1EC626 |
  SBC #$0F                                  ; $1EC628 |
  STA $11                                   ; $1EC62A |
  INC $13                                   ; $1EC62C |
  BNE code_1EC636                           ; $1EC62E |
code_1EC630:
  LDA #$00                                  ; $1EC630 |
  STA $11                                   ; $1EC632 |
  INC $05                                   ; $1EC634 |
code_1EC636:
  LDA $11                                   ; $1EC636 |
  LSR                                       ; $1EC638 |
  LSR                                       ; $1EC639 |
  PHA                                       ; $1EC63A |
  AND #$38                                  ; $1EC63B |
  ORA $22                                   ; $1EC63D |
  STA $22                                   ; $1EC63F |
  PLA                                       ; $1EC641 |
  LSR                                       ; $1EC642 |
  AND #$02                                  ; $1EC643 |
  ORA $03                                   ; $1EC645 |
  STA $03                                   ; $1EC647 |
code_1EC649:
  LDY $13                                   ; $1EC649 |
  JSR code_1ED7A3                           ; $1EC64B |
code_1EC64E:
  JSR code_1ED758                           ; $1EC64E |
code_1EC651:
  LDY $03                                   ; $1EC651 |
  LDA ($00),y                               ; $1EC653 |
  TAY                                       ; $1EC655 |
  LDA $B100,y                               ; $1EC656 |
  AND #$F0                                  ; $1EC659 |
  CMP #$40                                  ; $1EC65B |
  BNE code_1EC661                           ; $1EC65D |
  LDA #$20                                  ; $1EC65F |
code_1EC661:
  JSR code_1EC74E                           ; $1EC661 |
  JSR code_1EC77C                           ; $1EC664 |
  LDY $02                                   ; $1EC667 |
  STA $0048,y                               ; $1EC669 |
  CMP $42                                   ; $1EC66C |
  BCC code_1EC672                           ; $1EC66E |
  STA $42                                   ; $1EC670 |
code_1EC672:
  ORA $10                                   ; $1EC672 |
  STA $10                                   ; $1EC674 |
  LDA $02                                   ; $1EC676 |
  CMP $06                                   ; $1EC678 |
  BEQ code_1EC6D8                           ; $1EC67A |
  INC $02                                   ; $1EC67C |
  INC $40                                   ; $1EC67E |
  LDA $05                                   ; $1EC680 |
  BNE code_1EC651                           ; $1EC682 |
  LDY $40                                   ; $1EC684 |
  LDA $11                                   ; $1EC686 |
  PHA                                       ; $1EC688 |
  AND #$10                                  ; $1EC689 |
  STA $04                                   ; $1EC68B |
  PLA                                       ; $1EC68D |
  CLC                                       ; $1EC68E |
  ADC $C914,y                               ; $1EC68F |
  STA $11                                   ; $1EC692 |
  AND #$10                                  ; $1EC694 |
  CMP $04                                   ; $1EC696 |
  BEQ code_1EC651                           ; $1EC698 |
  LDA $03                                   ; $1EC69A |
  EOR #$02                                  ; $1EC69C |
  STA $03                                   ; $1EC69E |
  AND #$02                                  ; $1EC6A0 |
  BEQ code_1EC6B8                           ; $1EC6A2 |
  LDA $22                                   ; $1EC6A4 |
  CMP #$38                                  ; $1EC6A6 |
  BCC code_1EC651                           ; $1EC6A8 |
  LDA $46                                   ; $1EC6AA |
  BNE code_1EC6C1                           ; $1EC6AC |
  LDA $03                                   ; $1EC6AE |
  EOR #$02                                  ; $1EC6B0 |
  STA $03                                   ; $1EC6B2 |
  INC $05                                   ; $1EC6B4 |
  BNE code_1EC651                           ; $1EC6B6 |
code_1EC6B8:
  LDA $22                                   ; $1EC6B8 |
  CLC                                       ; $1EC6BA |
  ADC #$08                                  ; $1EC6BB |
  STA $22                                   ; $1EC6BD |
  BNE code_1EC64E                           ; $1EC6BF |
code_1EC6C1:
  LDA $11                                   ; $1EC6C1 |
  AND #$0F                                  ; $1EC6C3 |
  STA $11                                   ; $1EC6C5 |
  LDA $22                                   ; $1EC6C7 |
  AND #$07                                  ; $1EC6C9 |
  STA $22                                   ; $1EC6CB |
  LDA $03                                   ; $1EC6CD |
  AND #$01                                  ; $1EC6CF |
  STA $03                                   ; $1EC6D1 |
  DEC $13                                   ; $1EC6D3 |
  JMP code_1EC649                           ; $1EC6D5 |

code_1EC6D8:
  JMP code_1EC737                           ; $1EC6D8 |

code_1EC6DB:
  LDA #$00                                  ; $1EC6DB |
  STA $10                                   ; $1EC6DD |
  STA $42                                   ; $1EC6DF |
  LDA $F6                                   ; $1EC6E1 |
  STA $F1                                   ; $1EC6E3 |
  LDA {x_position_high},x                   ; $1EC6E5 |
  STA $13                                   ; $1EC6E8 |
  LDA {y_position_low},x                    ; $1EC6EA |
  STA $11                                   ; $1EC6ED |
  LDA $46                                   ; $1EC6EF |
  BEQ code_1EC736                           ; $1EC6F1 |
  LDA $26                                   ; $1EC6F3 |
  CMP #$0E                                  ; $1EC6F5 |
  BNE code_1EC705                           ; $1EC6F7 |
  LDA $11                                   ; $1EC6F9 |
  CMP #$60                                  ; $1EC6FB |
  BCC code_1EC736                           ; $1EC6FD |
  CLC                                       ; $1EC6FF |
  ADC $79                                   ; $1EC700 |
  STA $11                                   ; $1EC702 |
  RTS                                       ; $1EC704 |

code_1EC705:
  LDA {y_position_high},x                   ; $1EC705 |
  BEQ code_1EC712                           ; $1EC708 |
  LDA $13                                   ; $1EC70A |
  SEC                                       ; $1EC70C |
  SBC {y_position_high},x                   ; $1EC70D |
  STA $13                                   ; $1EC710 |
code_1EC712:
  LDA $13                                   ; $1EC712 |
  CLC                                       ; $1EC714 |
  ADC $FB                                   ; $1EC715 |
  STA $13                                   ; $1EC717 |
  LDA {y_position_low},x                    ; $1EC719 |
  CLC                                       ; $1EC71C |
  ADC $FA                                   ; $1EC71D |
  BCS code_1EC725                           ; $1EC71F |
  CMP #$F0                                  ; $1EC721 |
  BCC code_1EC729                           ; $1EC723 |
code_1EC725:
  DEC $13                                   ; $1EC725 |
  ADC #$0F                                  ; $1EC727 |
code_1EC729:
  STA $11                                   ; $1EC729 |
  LDA $26                                   ; $1EC72B |
  CMP #$0C                                  ; $1EC72D |
  BNE code_1EC736                           ; $1EC72F |
  LDA {x_position_high},x                   ; $1EC731 |
  STA $13                                   ; $1EC734 |
code_1EC736:
  RTS                                       ; $1EC736 |

code_1EC737:
  CPX #$00                                  ; $1EC737 |
  BNE code_1EC747                           ; $1EC739 |
  LDA $36                                   ; $1EC73B |
  BNE code_1EC747                           ; $1EC73D |
  LDA $42                                   ; $1EC73F |
  CMP #$D0                                  ; $1EC741 |
  BCC code_1EC747                           ; $1EC743 |
  STA $36                                   ; $1EC745 |
code_1EC747:
  LDA $F1                                   ; $1EC747 |
  STA $F6                                   ; $1EC749 |
  JMP select_PRG_banks                      ; $1EC74B |

code_1EC74E:
  STA $07                                   ; $1EC74E |
  LDY $43                                   ; $1EC750 |
  BEQ code_1EC779                           ; $1EC752 |
code_1EC754:
  LDA $06BC,y                               ; $1EC754 |
  CMP $13                                   ; $1EC757 |
  BNE code_1EC773                           ; $1EC759 |
  LDA $06BD,y                               ; $1EC75B |
  CMP $22                                   ; $1EC75E |
  BNE code_1EC773                           ; $1EC760 |
  LDA $06BE,y                               ; $1EC762 |
  CMP $03                                   ; $1EC765 |
  BNE code_1EC773                           ; $1EC767 |
  LDA $06BF,y                               ; $1EC769 |
  TAY                                       ; $1EC76C |
  LDA $B100,y                               ; $1EC76D |
  AND #$F0                                  ; $1EC770 |
  RTS                                       ; $1EC772 |

code_1EC773:
  DEY                                       ; $1EC773 |
  DEY                                       ; $1EC774 |
  DEY                                       ; $1EC775 |
  DEY                                       ; $1EC776 |
  BNE code_1EC754                           ; $1EC777 |
code_1EC779:
  LDA $07                                   ; $1EC779 |
  RTS                                       ; $1EC77B |

code_1EC77C:
  PHA                                       ; $1EC77C |
  LDA $1E                                   ; $1EC77D |
  BNE code_1EC7A8                           ; $1EC77F |
  LDA $22                                   ; $1EC781 |
  AND #$01                                  ; $1EC783 |
  ASL                                       ; $1EC785 |
  ASL                                       ; $1EC786 |
  ORA $03                                   ; $1EC787 |
  TAY                                       ; $1EC789 |
  LDA $F2B2,y                               ; $1EC78A |
  STA $07                                   ; $1EC78D |
  LDA $13                                   ; $1EC78F |
  AND #$01                                  ; $1EC791 |
  TAY                                       ; $1EC793 |
  LDA $22                                   ; $1EC794 |
  LSR                                       ; $1EC796 |
  ORA $F2C2,y                               ; $1EC797 |
  TAY                                       ; $1EC79A |
  LDA $0680,y                               ; $1EC79B |
  AND $07                                   ; $1EC79E |
  BEQ code_1EC7A8                           ; $1EC7A0 |
  PLA                                       ; $1EC7A2 |
  AND #$10                                  ; $1EC7A3 |
  EOR #$10                                  ; $1EC7A5 |
  PHA                                       ; $1EC7A7 |
code_1EC7A8:
  PLA                                       ; $1EC7A8 |
  RTS                                       ; $1EC7A9 |

code_1EC7AA:
  STY $00                                   ; $1EC7AA |
  LDY $26                                   ; $1EC7AC |
  LDA $C7E7,y                               ; $1EC7AE |
  STA $01                                   ; $1EC7B1 |
  LDA $C7F7,y                               ; $1EC7B3 |
  STA $03                                   ; $1EC7B6 |
  LDY $00                                   ; $1EC7B8 |
  LDA $46                                   ; $1EC7BA |
  BEQ code_1EC7E6                           ; $1EC7BC |
  LDA $01                                   ; $1EC7BE |
  BEQ code_1EC7E6                           ; $1EC7C0 |
  LDA $26                                   ; $1EC7C2 |
  CMP #$0C                                  ; $1EC7C4 |
  BNE code_1EC7CC                           ; $1EC7C6 |
  CPX #$00                                  ; $1EC7C8 |
  BEQ code_1EC7E6                           ; $1EC7CA |
code_1EC7CC:
  LDA $C838,y                               ; $1EC7CC |
  BMI code_1EC7E6                           ; $1EC7CF |
  CLC                                       ; $1EC7D1 |
  ADC {y_position_low},x                    ; $1EC7D2 |
  BCS code_1EC7E6                           ; $1EC7D5 |
  CMP $01                                   ; $1EC7D7 |
  BCC code_1EC7E6                           ; $1EC7D9 |
  LDA {y_position_low},x                    ; $1EC7DB |
  STA $11                                   ; $1EC7DE |
  LDA $03                                   ; $1EC7E0 |
  BMI code_1EC7E6                           ; $1EC7E2 |
  STA $13                                   ; $1EC7E4 |
code_1EC7E6:
  RTS                                       ; $1EC7E6 |

  db $00, $00, $00, $C0, $00, $00, $00, $00 ; $1EC7E7 |
  db $00, $00, $00, $C0, $D0, $00, $00, $00 ; $1EC7EF |
  db $00, $00, $00, $13, $00, $00, $00, $00 ; $1EC7F7 |
  db $00, $00, $00, $00, $FF, $00, $00, $00 ; $1EC7FF |
  db $00, $05, $09, $0E, $13, $18, $1D, $20 ; $1EC807 |
  db $24, $28, $2D, $32, $36, $3A, $3F, $44 ; $1EC80F |
  db $49, $4E, $52, $56, $59, $5C, $61, $66 ; $1EC817 |
  db $6A, $6E, $73, $78, $7C, $7F, $82, $87 ; $1EC81F |
  db $8C, $8F, $93, $97, $9A, $9D, $A1, $A5 ; $1EC827 |
  db $A8, $AB, $AB, $AB, $AB, $AB, $AB, $AB ; $1EC82F |
  db $02, $0C, $F9, $07, $07, $01, $F6, $F9 ; $1EC837 |
  db $0E, $02, $F2, $F2, $0E, $0E, $02, $0C ; $1EC83F |
  db $F2, $0E, $0E, $02, $0A, $F2, $0E, $0E ; $1EC847 |
  db $02, $F8, $F2, $0E, $0E, $00, $00, $00 ; $1EC84F |
  db $01, $06, $FB, $0A, $01, $FA, $FB, $0A ; $1EC857 |
  db $02, $10, $F5, $0B, $0B, $02, $F0, $F5 ; $1EC85F |
  db $0B, $0B, $01, $04, $F9, $0E, $01, $FC ; $1EC867 |
  db $F9, $0E, $02, $10, $F1, $0F, $0F, $02 ; $1EC86F |
  db $F0, $F1, $0F, $0F, $02, $1C, $F1, $0F ; $1EC877 |
  db $0F, $02, $E4, $F1, $0F, $0F, $01, $14 ; $1EC87F |
  db $F9, $0E, $01, $EC, $F9, $0E, $00, $04 ; $1EC887 |
  db $00, $00, $FC, $00, $02, $0C, $F5, $0B ; $1EC88F |
  db $0B, $02, $F4, $F5, $0B, $0B, $01, $08 ; $1EC897 |
  db $F9, $0E, $01, $F8, $F9, $0E, $02, $14 ; $1EC89F |
  db $F5, $0B, $0B, $02, $EC, $F5, $0B, $0B ; $1EC8A7 |
  db $01, $00, $F9, $0E, $00, $10, $00, $00 ; $1EC8AF |
  db $F0, $00, $02, $0C, $F1, $0F, $0F, $02 ; $1EC8B7 |
  db $F4, $F1, $0F, $0F, $00, $36, $00, $01 ; $1EC8BF |
  db $0C, $F9, $0E, $01, $F4, $F9, $0E, $00 ; $1EC8C7 |
  db $08, $00, $00, $F8, $00, $01, $FA, $F9 ; $1EC8CF |
  db $0E, $01, $05, $F9, $0E, $00, $0C, $00 ; $1EC8D7 |
  db $00, $F4, $00, $00, $05, $0A, $0F, $14 ; $1EC8DF |
  db $18, $1C, $20, $24, $27, $2A, $2F, $34 ; $1EC8E7 |
  db $38, $3C, $40, $44, $49, $4E, $55, $5C ; $1EC8EF |
  db $62, $68, $6D, $72, $77, $7C, $7F, $82 ; $1EC8F7 |
  db $86, $8A, $8D, $90, $94, $98, $9B, $9E ; $1EC8FF |
  db $A3, $A8, $AE, $B4, $B9, $BE, $C1, $C4 ; $1EC907 |
  db $C8, $CB, $CB, $02, $08, $F7, $09, $0B ; $1EC90F |
  db $02, $F8, $F7, $09, $0B, $02, $00, $F5 ; $1EC917 |
  db $0B, $05, $02, $00, $FB, $05, $0B, $01 ; $1EC91F |
  db $0F, $FB, $0E, $01, $F1, $FB, $0E, $01 ; $1EC927 |
  db $0F, $F9, $00, $01, $F1, $F9, $00, $00 ; $1EC92F |
  db $0F, $04, $00, $F1, $04, $02, $0C, $F1 ; $1EC937 |
  db $0F, $0F, $02, $F4, $F1, $0F, $0F, $01 ; $1EC93F |
  db $08, $FD, $06, $01, $F8, $FD, $06, $01 ; $1EC947 |
  db $06, $FB, $0A, $01, $FA, $FB, $0A, $02 ; $1EC94F |
  db $10, $F1, $0F, $0F, $02, $F0, $F1, $0F ; $1EC957 |
  db $0F, $04, $10, $E5, $0F, $0F, $0F, $09 ; $1EC95F |
  db $04, $F0, $E5, $0F, $0F, $0F, $09, $03 ; $1EC967 |
  db $08, $ED, $10, $10, $06, $03, $F8, $ED ; $1EC96F |
  db $10, $10, $06, $02, $0C, $F5, $0B, $0B ; $1EC977 |
  db $02, $F4, $F5, $0B, $0B, $02, $07, $F5 ; $1EC97F |
  db $0B, $0B, $02, $F9, $F5, $0B, $0B, $00 ; $1EC987 |
  db $04, $00, $00, $FC, $00, $01, $08, $F9 ; $1EC98F |
  db $0E, $01, $F8, $F9, $0E, $00, $0C, $00 ; $1EC997 |
  db $00, $F4, $00, $01, $10, $00, $0C, $01 ; $1EC99F |
  db $F1, $00, $0C, $00, $14, $00, $00, $EC ; $1EC9A7 |
  db $00, $02, $10, $F5, $0B, $0B, $02, $F0 ; $1EC9AF |
  db $F5, $0B, $0B, $03, $0C, $ED, $10, $10 ; $1EC9B7 |
  db $06, $03, $F4, $ED, $10, $10, $06, $02 ; $1EC9BF |
  db $08, $F5, $0B, $0B, $02, $F8, $F5, $0B ; $1EC9C7 |
  db $0B, $00, $08, $00, $00, $F8, $00, $01 ; $1EC9CF |
  db $00, $FA, $08, $00, $00, $05           ; $1EC9D7 |

; large routine handles screen transitions and maybe
; other camera updates
code_1EC9DD:
  LDA $26                                   ; $1EC9DD |
  CMP #$01                                  ; $1EC9DF |
  BNE code_1ECA31                           ; $1EC9E1 |
  LDA $29                                   ; $1EC9E3 |
  AND #$1F                                  ; $1EC9E5 |
  CMP #$08                                  ; $1EC9E7 |
  BEQ code_1EC9EF                           ; $1EC9E9 |
  CMP #$0A                                  ; $1EC9EB |
  BNE code_1ECA31                           ; $1EC9ED |
code_1EC9EF:
  LDA $99                                   ; $1EC9EF |
  BNE code_1ECA03                           ; $1EC9F1 |
  STA $78                                   ; $1EC9F3 |
  STA $79                                   ; $1EC9F5 |
  LDA #$4F                                  ; $1EC9F7 |
  STA $7A                                   ; $1EC9F9 |
  LDA #$40                                  ; $1EC9FB |
  STA $9B                                   ; $1EC9FD |
  LDA #$04                                  ; $1EC9FF |
  STA $99                                   ; $1ECA01 |
code_1ECA03:
  LDA {x_position_low}                      ; $1ECA03 |
  CLC                                       ; $1ECA06 |
  ADC #$03                                  ; $1ECA07 |
  STA {x_position_low}                      ; $1ECA09 |
  LDA {x_position_high}                     ; $1ECA0C |
  ADC #$00                                  ; $1ECA0F |
  STA {x_position_high}                     ; $1ECA11 |
  LDA $FC                                   ; $1ECA14 |
  BNE code_1ECA24                           ; $1ECA16 |
  STA $11                                   ; $1ECA18 |
  LDA $F9                                   ; $1ECA1A |
  CMP #$23                                  ; $1ECA1C |
  BEQ code_1ECA2E                           ; $1ECA1E |
  CMP #$3F                                  ; $1ECA20 |
  BEQ code_1ECA2E                           ; $1ECA22 |
code_1ECA24:
  INC $78                                   ; $1ECA24 |
  INC $79                                   ; $1ECA26 |
  INC $79                                   ; $1ECA28 |
  LDA #$03                                  ; $1ECA2A |
  STA $11                                   ; $1ECA2C |
code_1ECA2E:
  JMP code_1ECAB4                           ; $1ECA2E |

code_1ECA31:
  LDA $30                                   ; $1ECA31 |
  CMP #$22                                  ; $1ECA33 |
  BNE code_1ECA38                           ; $1ECA35 |
  RTS                                       ; $1ECA37 |

code_1ECA38:
  LDA $29                                   ; $1ECA38 |
  AND #$C0                                  ; $1ECA3A |
  BNE code_1ECA59                           ; $1ECA3C |
  LDA {x_position_low}                      ; $1ECA3E |
  SEC                                       ; $1ECA41 |
  SBC $FC                                   ; $1ECA42 |
  STA $10                                   ; $1ECA44 |
  LDA {x_position_low}                      ; $1ECA46 |
  SEC                                       ; $1ECA49 |
  SBC $3C                                   ; $1ECA4A |
  STA $11                                   ; $1ECA4C |
  LDA {x_position_high}                     ; $1ECA4E |
  SBC $3D                                   ; $1ECA51 |
  ORA $11                                   ; $1ECA53 |
  BCC code_1ECA5C                           ; $1ECA55 |
  BNE code_1ECAA4                           ; $1ECA57 |
code_1ECA59:
  JMP code_1ECD10                           ; $1ECA59 |

code_1ECA5C:
  LDA $10                                   ; $1ECA5C |
  CMP #$81                                  ; $1ECA5E |
  BCS code_1ECA59                           ; $1ECA60 |
  LDA $11                                   ; $1ECA62 |
  EOR #$FF                                  ; $1ECA64 |
  ADC #$01                                  ; $1ECA66 |
  CMP #$08                                  ; $1ECA68 |
  BCC code_1ECA6E                           ; $1ECA6A |
  LDA #$08                                  ; $1ECA6C |
code_1ECA6E:
  STA $11                                   ; $1ECA6E |
  LDA $FC                                   ; $1ECA70 |
  SEC                                       ; $1ECA72 |
  SBC $11                                   ; $1ECA73 |
  STA $FC                                   ; $1ECA75 |
  PHP                                       ; $1ECA77 |
  LDA $F9                                   ; $1ECA78 |
  STA $11                                   ; $1ECA7A |
  SBC #$00                                  ; $1ECA7C |
  STA $F9                                   ; $1ECA7E |
  PLP                                       ; $1ECA80 |
  LDA $2B                                   ; $1ECA81 |
  SBC #$00                                  ; $1ECA83 |
  STA $2B                                   ; $1ECA85 |
  BCS code_1ECAA0                           ; $1ECA87 |
  LDA #$00                                  ; $1ECA89 |
  STA $FC                                   ; $1ECA8B |
  STA $2B                                   ; $1ECA8D |
  LDA $11                                   ; $1ECA8F |
  STA $F9                                   ; $1ECA91 |
  LDA #$10                                  ; $1ECA93 |
  CMP {x_position_low}                      ; $1ECA95 |
  BCC code_1ECAA0                           ; $1ECA98 |
  STA {x_position_low}                      ; $1ECA9A |
  JMP code_1ECC49                           ; $1ECA9D |

code_1ECAA0:
  LDA #$02                                  ; $1ECAA0 |
  BNE code_1ECAE9                           ; $1ECAA2 |
code_1ECAA4:
  BEQ code_1ECAE6                           ; $1ECAA4 |
  LDA $10                                   ; $1ECAA6 |
  CMP #$80                                  ; $1ECAA8 |
  BCC code_1ECAE6                           ; $1ECAAA |
  LDA #$08                                  ; $1ECAAC |
  CMP $11                                   ; $1ECAAE |
  BCS code_1ECAB4                           ; $1ECAB0 |
  STA $11                                   ; $1ECAB2 |
code_1ECAB4:
  LDA $FC                                   ; $1ECAB4 |
  CLC                                       ; $1ECAB6 |
  ADC $11                                   ; $1ECAB7 |
  STA $FC                                   ; $1ECAB9 |
  PHP                                       ; $1ECABB |
  LDA $F9                                   ; $1ECABC |
  ADC #$00                                  ; $1ECABE |
  STA $F9                                   ; $1ECAC0 |
  PLP                                       ; $1ECAC2 |
  LDA $2B                                   ; $1ECAC3 |
  ADC #$00                                  ; $1ECAC5 |
  STA $2B                                   ; $1ECAC7 |
  CMP $2A                                   ; $1ECAC9 |
  BNE code_1ECAE2                           ; $1ECACB |
  LDA #$00                                  ; $1ECACD |
  STA $FC                                   ; $1ECACF |
  LDA #$F0                                  ; $1ECAD1 |
  CMP {x_position_low}                      ; $1ECAD3 |
  BCS code_1ECAE2                           ; $1ECAD6 |
  STA {x_position_low}                      ; $1ECAD8 |
  LDA #$00                                  ; $1ECADB |
  STA $FC                                   ; $1ECADD |
  JMP code_1ECB5F                           ; $1ECADF |

code_1ECAE2:
  LDA #$01                                  ; $1ECAE2 |
  BNE code_1ECAE9                           ; $1ECAE4 |
code_1ECAE6:
  JMP code_1ECD10                           ; $1ECAE6 |

code_1ECAE9:
  STA $10                                   ; $1ECAE9 |
  STA $AC                                   ; $1ECAEB |
  LDA $FC                                   ; $1ECAED |
  SEC                                       ; $1ECAEF |
  SBC $44                                   ; $1ECAF0 |
  BPL code_1ECAF9                           ; $1ECAF2 |
  EOR #$FF                                  ; $1ECAF4 |
  CLC                                       ; $1ECAF6 |
  ADC #$01                                  ; $1ECAF7 |
code_1ECAF9:
  STA $11                                   ; $1ECAF9 |
  BEQ code_1ECAE6                           ; $1ECAFB |
  LDA $10                                   ; $1ECAFD |
  AND #$01                                  ; $1ECAFF |
  BEQ code_1ECB08                           ; $1ECB01 |
  LDA $44                                   ; $1ECB03 |
  JMP code_1ECB0C                           ; $1ECB05 |

code_1ECB08:
  LDA $44                                   ; $1ECB08 |
  EOR #$FF                                  ; $1ECB0A |
code_1ECB0C:
  AND #$07                                  ; $1ECB0C |
  CLC                                       ; $1ECB0E |
  ADC $11                                   ; $1ECB0F |
  LSR                                       ; $1ECB11 |
  LSR                                       ; $1ECB12 |
  LSR                                       ; $1ECB13 |
  BEQ code_1ECB5C                           ; $1ECB14 |
  LDA $10                                   ; $1ECB16 |
  CMP $28                                   ; $1ECB18 |
  STA $28                                   ; $1ECB1A |
  PHP                                       ; $1ECB1C |
  AND #$01                                  ; $1ECB1D |
  TAY                                       ; $1ECB1F |
  PLP                                       ; $1ECB20 |
  BNE code_1ECB31                           ; $1ECB21 |
  LDA $25                                   ; $1ECB23 |
  CLC                                       ; $1ECB25 |
  ADC $D0C6,y                               ; $1ECB26 |
  CMP #$20                                  ; $1ECB29 |
  AND #$1F                                  ; $1ECB2B |
  STA $25                                   ; $1ECB2D |
  BCC code_1ECB39                           ; $1ECB2F |
code_1ECB31:
  LDA $24                                   ; $1ECB31 |
  CLC                                       ; $1ECB33 |
  ADC $D0C6,y                               ; $1ECB34 |
  STA $24                                   ; $1ECB37 |
code_1ECB39:
  LDA $25                                   ; $1ECB39 |
  BNE code_1ECB4D                           ; $1ECB3B |
  LDA $26                                   ; $1ECB3D |
  CMP #$05                                  ; $1ECB3F |
  BNE code_1ECB4D                           ; $1ECB41 |
  LDA $24                                   ; $1ECB43 |
  CMP #$0B                                  ; $1ECB45 |
  BEQ code_1ECB5C                           ; $1ECB47 |
  CMP #$1A                                  ; $1ECB49 |
  BEQ code_1ECB5C                           ; $1ECB4B |
code_1ECB4D:
  LDA $F6                                   ; $1ECB4D |
  PHA                                       ; $1ECB4F |
  JSR code_1ED8EB                           ; $1ECB50 |
  JSR code_1ED4E2                           ; $1ECB53 |
  PLA                                       ; $1ECB56 |
  STA $F6                                   ; $1ECB57 |
  JSR select_PRG_banks                      ; $1ECB59 |
code_1ECB5C:
  JMP code_1ECD10                           ; $1ECB5C |

code_1ECB5F:
  LDA $55                                   ; $1ECB5F |
  BNE code_1ECB5C                           ; $1ECB61 |
  LDA $29                                   ; $1ECB63 |
  AND #$1F                                  ; $1ECB65 |
  TAY                                       ; $1ECB67 |
  LDA $A951,y                               ; $1ECB68 |
  AND #$20                                  ; $1ECB6B |
  BEQ code_1ECB5C                           ; $1ECB6D |
  LDA $A951,y                               ; $1ECB6F |
  AND #$C0                                  ; $1ECB72 |
  BNE code_1ECB5C                           ; $1ECB74 |
  INY                                       ; $1ECB76 |
  STY $00                                   ; $1ECB77 |
  LDA $A950,y                               ; $1ECB79 |
  AND #$20                                  ; $1ECB7C |
  ORA $00                                   ; $1ECB7E |
  STA $29                                   ; $1ECB80 |
  LDA $A950,y                               ; $1ECB82 |
  AND #$1F                                  ; $1ECB85 |
  STA $2A                                   ; $1ECB87 |
  LDA #$00                                  ; $1ECB89 |
  STA $2B                                   ; $1ECB8B |
  LDA $A968,y                               ; $1ECB8D |
  PHA                                       ; $1ECB90 |
  BPL code_1ECB96                           ; $1ECB91 |
  JSR code_1ED0FC                           ; $1ECB93 |
code_1ECB96:
  JSR code_1EC3B8                           ; $1ECB96 |
  JSR code_1EC39D                           ; $1ECB99 |
  JSR code_1FF32D                           ; $1ECB9C |
  JSR code_1ED07F                           ; $1ECB9F |
  LDA $28                                   ; $1ECBA2 |
  PHA                                       ; $1ECBA4 |
  LDA #$01                                  ; $1ECBA5 |
  STA $28                                   ; $1ECBA7 |
  STA $AC                                   ; $1ECBA9 |
  PLA                                       ; $1ECBAB |
  AND #$01                                  ; $1ECBAC |
  BNE code_1ECBB4                           ; $1ECBAE |
  INC $24                                   ; $1ECBB0 |
  DEC $25                                   ; $1ECBB2 |
code_1ECBB4:
  LDA $FC                                   ; $1ECBB4 |\
  CLC                                       ; $1ECBB6 | | scroll right by 4
  ADC #$04                                  ; $1ECBB7 | |
  STA $FC                                   ; $1ECBB9 |/
  LDA $F9                                   ; $1ECBBB |
  ADC #$00                                  ; $1ECBBD |
  STA $F9                                   ; $1ECBBF |
  LDA {x_position_frac}                     ; $1ECBC1 |
  CLC                                       ; $1ECBC4 |
  ADC #$A0                                  ; $1ECBC5 |
  STA {x_position_frac}                     ; $1ECBC7 |
  LDA {x_position_low}                      ; $1ECBCA |
  ADC #$00                                  ; $1ECBCD |
  STA {x_position_low}                      ; $1ECBCF |
  LDA {x_position_high}                     ; $1ECBD2 |
  ADC #$00                                  ; $1ECBD5 |
  STA {x_position_high}                     ; $1ECBD7 |
  LDA $FC                                   ; $1ECBDA |
  SEC                                       ; $1ECBDC |
  SBC $44                                   ; $1ECBDD |
  STA $11                                   ; $1ECBDF |
  BEQ code_1ECBFE                           ; $1ECBE1 |
  LDA $44                                   ; $1ECBE3 |
  AND #$07                                  ; $1ECBE5 |
  CLC                                       ; $1ECBE7 |
  ADC $11                                   ; $1ECBE8 |
  LSR                                       ; $1ECBEA |
  LSR                                       ; $1ECBEB |
  LSR                                       ; $1ECBEC |
  BEQ code_1ECBFE                           ; $1ECBED |
  INC $25                                   ; $1ECBEF |
  LDA $25                                   ; $1ECBF1 |
  AND #$1F                                  ; $1ECBF3 |
  STA $25                                   ; $1ECBF5 |
  BNE code_1ECBFB                           ; $1ECBF7 |
  INC $24                                   ; $1ECBF9 |
code_1ECBFB:
  JSR code_1ED4E2                           ; $1ECBFB |
code_1ECBFE:
  LDA $FC                                   ; $1ECBFE |
  STA $44                                   ; $1ECC00 |
  LDA #$04                                  ; $1ECC02 |
  STA $9F                                   ; $1ECC04 |
  JSR code_1EC38F                           ; $1ECC06 |
  LDA $F6                                   ; $1ECC09 |
  PHA                                       ; $1ECC0B |
  LDA #$12                                  ; $1ECC0C |
  JSR select_PRG_banks_A                    ; $1ECC0E |
  JSR code_1EDF5E                           ; $1ECC11 |
  LDA {animation_index}                     ; $1ECC14 |
  CMP #$1D                                  ; $1ECC17 |
  BNE code_1ECC20                           ; $1ECC19 |
  LDA #$00                                  ; $1ECC1B |
  STA {animation_timer}                     ; $1ECC1D |
code_1ECC20:
  PLA                                       ; $1ECC20 |
  STA $F6                                   ; $1ECC21 |
  JSR select_PRG_banks                      ; $1ECC23 |
  LDA #$01                                  ; $1ECC26 |
  STA {entity_type}                         ; $1ECC28 |
  LDA #$00                                  ; $1ECC2B |
  STA $95                                   ; $1ECC2D |
  JSR async_next_frame                      ; $1ECC2F |\
  INC $95                                   ; $1ECC32 | | async gameloop here
  LDA $FC                                   ; $1ECC34 | | if screen transition not
  BEQ code_1ECC3B                           ; $1ECC36 | | done, keep looping
  JMP code_1ECBB4                           ; $1ECC38 |/

code_1ECC3B:
  PLA                                       ; $1ECC3B |
  BPL code_1ECC41                           ; $1ECC3C |
  JSR code_1ED16B                           ; $1ECC3E |
code_1ECC41:
  LDA #$00                                  ; $1ECC41 |
  STA $35                                   ; $1ECC43 |
  RTS                                       ; $1ECC45 | right screen transition done

code_1ECC46:
  JMP code_1ECD10                           ; $1ECC46 |

code_1ECC49:
  LDA $29                                   ; $1ECC49 |
  AND #$1F                                  ; $1ECC4B |
  BEQ code_1ECC46                           ; $1ECC4D |
  TAY                                       ; $1ECC4F |
  LDA $A968,y                               ; $1ECC50 |
  AND #$40                                  ; $1ECC53 |
  BEQ code_1ECC46                           ; $1ECC55 |
  LDA $A94F,y                               ; $1ECC57 |
  AND #$20                                  ; $1ECC5A |
  BEQ code_1ECC46                           ; $1ECC5C |
  DEY                                       ; $1ECC5E |
  STY $00                                   ; $1ECC5F |
  LDA $A950,y                               ; $1ECC61 |
  AND #$20                                  ; $1ECC64 |
  ORA $00                                   ; $1ECC66 |
  STA $29                                   ; $1ECC68 |
  LDA $A950,y                               ; $1ECC6A |
  AND #$1F                                  ; $1ECC6D |
  STA $2A                                   ; $1ECC6F |
  STA $2B                                   ; $1ECC71 |
  JSR code_1EC3B8                           ; $1ECC73 |
  JSR code_1EC39D                           ; $1ECC76 |
  JSR code_1FF32D                           ; $1ECC79 |
  LDA $28                                   ; $1ECC7C |
  PHA                                       ; $1ECC7E |
  LDA #$02                                  ; $1ECC7F |
  STA $28                                   ; $1ECC81 |
  STA $AC                                   ; $1ECC83 |
  PLA                                       ; $1ECC85 |
  AND #$02                                  ; $1ECC86 |
  BNE code_1ECC8E                           ; $1ECC88 |
  DEC $24                                   ; $1ECC8A |
  INC $25                                   ; $1ECC8C |
code_1ECC8E:
  LDA $FC                                   ; $1ECC8E |\
  SEC                                       ; $1ECC90 | | scroll left by 4
  SBC #$04                                  ; $1ECC91 | |
  STA $FC                                   ; $1ECC93 |/
  LDA $F9                                   ; $1ECC95 |
  SBC #$00                                  ; $1ECC97 |
  STA $F9                                   ; $1ECC99 |
  LDA {x_position_frac}                     ; $1ECC9B |
  SEC                                       ; $1ECC9E |
  SBC #$80                                  ; $1ECC9F |
  STA {x_position_frac}                     ; $1ECCA1 |
  LDA {x_position_low}                      ; $1ECCA4 |
  SBC #$00                                  ; $1ECCA7 |
  STA {x_position_low}                      ; $1ECCA9 |
  LDA {x_position_high}                     ; $1ECCAC |
  SBC #$00                                  ; $1ECCAF |
  STA {x_position_high}                     ; $1ECCB1 |
  LDA $FC                                   ; $1ECCB4 |
  SEC                                       ; $1ECCB6 |
  SBC $44                                   ; $1ECCB7 |
  BPL code_1ECCC0                           ; $1ECCB9 |
  EOR #$FF                                  ; $1ECCBB |
  CLC                                       ; $1ECCBD |
  ADC #$01                                  ; $1ECCBE |
code_1ECCC0:
  STA $11                                   ; $1ECCC0 |
  BEQ code_1ECCDF                           ; $1ECCC2 |
  LDA $44                                   ; $1ECCC4 |
  EOR #$FF                                  ; $1ECCC6 |
  AND #$07                                  ; $1ECCC8 |
  CLC                                       ; $1ECCCA |
  ADC $11                                   ; $1ECCCB |
  LSR                                       ; $1ECCCD |
  LSR                                       ; $1ECCCE |
  LSR                                       ; $1ECCCF |
  BEQ code_1ECCDF                           ; $1ECCD0 |
  DEC $25                                   ; $1ECCD2 |
  BPL code_1ECCDC                           ; $1ECCD4 |
  LDA #$1F                                  ; $1ECCD6 |
  STA $25                                   ; $1ECCD8 |
  DEC $24                                   ; $1ECCDA |
code_1ECCDC:
  JSR code_1ED4E2                           ; $1ECCDC |
code_1ECCDF:
  LDA $FC                                   ; $1ECCDF |
  STA $44                                   ; $1ECCE1 |
  LDA #$04                                  ; $1ECCE3 |
  STA $9F                                   ; $1ECCE5 |
  JSR code_1EC38F                           ; $1ECCE7 |
  LDA $F6                                   ; $1ECCEA |
  PHA                                       ; $1ECCEC |
  LDA #$12                                  ; $1ECCED |
  JSR select_PRG_banks_A                    ; $1ECCEF |
  JSR code_1EDF5E                           ; $1ECCF2 |
  PLA                                       ; $1ECCF5 |
  STA $F6                                   ; $1ECCF6 |
  JSR select_PRG_banks                      ; $1ECCF8 |
  LDA #$01                                  ; $1ECCFB |
  STA {entity_type}                         ; $1ECCFD |
  LDA #$00                                  ; $1ECD00 |
  STA $95                                   ; $1ECD02 |
  JSR async_next_frame                      ; $1ECD04 |\
  INC $95                                   ; $1ECD07 | | async gameloop here
  LDA $FC                                   ; $1ECD09 | | if screen transition
  BNE code_1ECC8E                           ; $1ECD0B |/  not done, keep looping
  STA $35                                   ; $1ECD0D |
code_1ECD0F:
  RTS                                       ; $1ECD0F | left screen transition done

code_1ECD10:
  LDA $FC                                   ; $1ECD10 |
  BNE code_1ECD0F                           ; $1ECD12 |
  LDA #$10                                  ; $1ECD14 |
  CMP {x_position_low}                      ; $1ECD16 |
  BCS code_1ECD22                           ; $1ECD19 |
  LDA #$F0                                  ; $1ECD1B |
  CMP {x_position_low}                      ; $1ECD1D |
  BCS code_1ECD25                           ; $1ECD20 |
code_1ECD22:
  STA {x_position_low}                      ; $1ECD22 |
code_1ECD25:
  LDY $26                                   ; $1ECD25 |
  LDA $D0CC,y                               ; $1ECD27 |
  BEQ code_1ECD33                           ; $1ECD2A |
  CMP $29                                   ; $1ECD2C |
  BNE code_1ECD33                           ; $1ECD2E |
  JMP code_1ECF5D                           ; $1ECD30 |

code_1ECD33:
  LDA {y_position_high}                     ; $1ECD33 |
  BNE code_1ECD0F                           ; $1ECD36 |
  LDA $AF                                   ; $1ECD38 |
  BEQ code_1ECD57                           ; $1ECD3A |
  LDA #$80                                  ; $1ECD3C |
  STA $01                                   ; $1ECD3E |
  LDA {y_position_low}                      ; $1ECD40 |
  CMP #$08                                  ; $1ECD43 |
  BCC code_1ECD74                           ; $1ECD45 |
  CMP #$E8                                  ; $1ECD47 |
  BCC code_1ECD0F                           ; $1ECD49 |
  LDA $30                                   ; $1ECD4B |
  CMP #$03                                  ; $1ECD4D |
  BNE code_1ECD0F                           ; $1ECD4F |
  LDA #$40                                  ; $1ECD51 |
  STA $01                                   ; $1ECD53 |
  BNE code_1ECD74                           ; $1ECD55 |
code_1ECD57:
  LDA #$40                                  ; $1ECD57 |
  STA $01                                   ; $1ECD59 |
  LDA {y_position_low}                      ; $1ECD5B |
  CMP #$E8                                  ; $1ECD5E |
  BCS code_1ECD74                           ; $1ECD60 |
  CMP #$08                                  ; $1ECD62 |
  BCS code_1ECD0F                           ; $1ECD64 |
  LDA $37                                   ; $1ECD66 |
  BNE code_1ECD70                           ; $1ECD68 |
  LDA $30                                   ; $1ECD6A |
  CMP #$03                                  ; $1ECD6C |
  BNE code_1ECD0F                           ; $1ECD6E |
code_1ECD70:
  LDA #$80                                  ; $1ECD70 |
  STA $01                                   ; $1ECD72 |
code_1ECD74:
  JSR code_1ECFF0                           ; $1ECD74 |
  BCS code_1ECDCC                           ; $1ECD77 |
  LDA $29                                   ; $1ECD79 |
  AND #$C0                                  ; $1ECD7B |
  BEQ code_1ECDEE                           ; $1ECD7D |
  LDA $01                                   ; $1ECD7F |
  AND $29                                   ; $1ECD81 |
  BEQ code_1ECDBB                           ; $1ECD83 |
  LDA $2B                                   ; $1ECD85 |
  CMP $2A                                   ; $1ECD87 |
  BEQ code_1ECD9B                           ; $1ECD89 |
  INC $2B                                   ; $1ECD8B |
code_1ECD8D:
  INC $24                                   ; $1ECD8D |
  INC $F9                                   ; $1ECD8F |
  INC {x_position_high}                     ; $1ECD91 |
  LDA #$01                                  ; $1ECD94 |
  STA $AC                                   ; $1ECD96 |
  JMP code_1ECE7C                           ; $1ECD98 |

code_1ECD9B:
  INC $29                                   ; $1ECD9B |
  LDA $29                                   ; $1ECD9D |
  AND #$1F                                  ; $1ECD9F |
  STA $29                                   ; $1ECDA1 |
  TAY                                       ; $1ECDA3 |
  LDA $A950,y                               ; $1ECDA4 |
  AND #$E0                                  ; $1ECDA7 |
  ORA $29                                   ; $1ECDA9 |
  STA $29                                   ; $1ECDAB |
  LDA #$00                                  ; $1ECDAD |
  STA $2B                                   ; $1ECDAF |
  LDA $A950,y                               ; $1ECDB1 |
  AND #$1F                                  ; $1ECDB4 |
  STA $2A                                   ; $1ECDB6 |
  JMP code_1ECD8D                           ; $1ECDB8 |

code_1ECDBB:
  LDA $2B                                   ; $1ECDBB |
  BEQ code_1ECDCF                           ; $1ECDBD |
  DEC $2B                                   ; $1ECDBF |
code_1ECDC1:
  DEC $24                                   ; $1ECDC1 |
  DEC $F9                                   ; $1ECDC3 |
  DEC {x_position_high}                     ; $1ECDC5 |
  LDA #$02                                  ; $1ECDC8 |
  STA $AC                                   ; $1ECDCA |
code_1ECDCC:
  JMP code_1ECE7C                           ; $1ECDCC |

code_1ECDCF:
  DEC $29                                   ; $1ECDCF |
  LDA $29                                   ; $1ECDD1 |
  AND #$1F                                  ; $1ECDD3 |
  STA $29                                   ; $1ECDD5 |
  TAY                                       ; $1ECDD7 |
  LDA $A950,y                               ; $1ECDD8 |
  AND #$E0                                  ; $1ECDDB |
  ORA $29                                   ; $1ECDDD |
  STA $29                                   ; $1ECDDF |
  LDA $A950,y                               ; $1ECDE1 |
  AND #$1F                                  ; $1ECDE4 |
  STA $2B                                   ; $1ECDE6 |
  STA $2A                                   ; $1ECDE8 |
  JMP code_1ECDC1                           ; $1ECDEA |

code_1ECDED:
  RTS                                       ; $1ECDED |

code_1ECDEE:
  LDA $FC                                   ; $1ECDEE |
  BNE code_1ECDED                           ; $1ECDF0 |
  LDA $29                                   ; $1ECDF2 |
  AND #$1F                                  ; $1ECDF4 |
  TAY                                       ; $1ECDF6 |
  LDA $2A                                   ; $1ECDF7 |
  BNE code_1ECE04                           ; $1ECDF9 |
  LDA $A951,y                               ; $1ECDFB |
  AND $01                                   ; $1ECDFE |
  BNE code_1ECE0C                           ; $1ECE00 |
  BEQ code_1ECE2B                           ; $1ECE02 |
code_1ECE04:
  LDA $2B                                   ; $1ECE04 |
  BEQ code_1ECE2B                           ; $1ECE06 |
  CMP $2A                                   ; $1ECE08 |
  BNE code_1ECE7B                           ; $1ECE0A |
code_1ECE0C:
  INY                                       ; $1ECE0C |
  LDA $A950,y                               ; $1ECE0D |
  AND #$C0                                  ; $1ECE10 |
  BEQ code_1ECE7B                           ; $1ECE12 |
  STA $10                                   ; $1ECE14 |
  LDA #$00                                  ; $1ECE16 |
  STA $11                                   ; $1ECE18 |
  LDA $A950,y                               ; $1ECE1A |
  AND #$1F                                  ; $1ECE1D |
  STA $12                                   ; $1ECE1F |
  LDA #$01                                  ; $1ECE21 |
  STA $13                                   ; $1ECE23 |
  LDA #$01                                  ; $1ECE25 |
  STA $02                                   ; $1ECE27 |
  BNE code_1ECE4A                           ; $1ECE29 |
code_1ECE2B:
  LDA $A950,y                               ; $1ECE2B |
  DEY                                       ; $1ECE2E |
  BMI code_1ECE7B                           ; $1ECE2F |
  AND #$C0                                  ; $1ECE31 |
  BEQ code_1ECE7B                           ; $1ECE33 |
  EOR #$C0                                  ; $1ECE35 |
  STA $10                                   ; $1ECE37 |
  LDA $A950,y                               ; $1ECE39 |
  AND #$1F                                  ; $1ECE3C |
  STA $11                                   ; $1ECE3E |
  STA $12                                   ; $1ECE40 |
  LDA #$FF                                  ; $1ECE42 |
  STA $13                                   ; $1ECE44 |
  LDA #$02                                  ; $1ECE46 |
  STA $02                                   ; $1ECE48 |
code_1ECE4A:
  LDA $01                                   ; $1ECE4A |
  AND $10                                   ; $1ECE4C |
  BEQ code_1ECE7B                           ; $1ECE4E |
  STY $10                                   ; $1ECE50 |
  LDA $A950,y                               ; $1ECE52 |
  AND #$E0                                  ; $1ECE55 |
  ORA $10                                   ; $1ECE57 |
  STA $29                                   ; $1ECE59 |
  LDA $11                                   ; $1ECE5B |
  STA $2B                                   ; $1ECE5D |
  LDA $12                                   ; $1ECE5F |
  STA $2A                                   ; $1ECE61 |
  LDA $F9                                   ; $1ECE63 |
  CLC                                       ; $1ECE65 |
  ADC $13                                   ; $1ECE66 |
  STA $F9                                   ; $1ECE68 |
  STA $24                                   ; $1ECE6A |
  STA {x_position_high}                     ; $1ECE6C |
  LDA $02                                   ; $1ECE6F |
  STA $AC                                   ; $1ECE71 |
  LDA #$00                                  ; $1ECE73 |
  JSR code_1FFFB7                           ; $1ECE75 |
  JMP code_1ECE7C                           ; $1ECE78 |

code_1ECE7B:
  RTS                                       ; $1ECE7B |

code_1ECE7C:
  LDA $01                                   ; $1ECE7C |
  LSR                                       ; $1ECE7E |
  LSR                                       ; $1ECE7F |
  LSR                                       ; $1ECE80 |
  LSR                                       ; $1ECE81 |
  STA $28                                   ; $1ECE82 |
  AND #$04                                  ; $1ECE84 |
  LSR                                       ; $1ECE86 |
  LSR                                       ; $1ECE87 |
  STA $11                                   ; $1ECE88 |
  TAX                                       ; $1ECE8A |
  LDA $D0C8,x                               ; $1ECE8B |
  STA $25                                   ; $1ECE8E |
  JSR code_1EC3B8                           ; $1ECE90 |
  JSR code_1FF32D                           ; $1ECE93 |
  LDA $37                                   ; $1ECE96 |
  BEQ code_1ECEA0                           ; $1ECE98 |
  LDA $28                                   ; $1ECE9A |
  AND #$04                                  ; $1ECE9C |
  BEQ code_1ECEA3                           ; $1ECE9E |
code_1ECEA0:
  JSR code_1EC39D                           ; $1ECEA0 |
code_1ECEA3:
  LDA $28                                   ; $1ECEA3 |
  AND #$04                                  ; $1ECEA5 |
  BEQ code_1ECED3                           ; $1ECEA7 |
  LDA $FA                                   ; $1ECEA9 |\
  CLC                                       ; $1ECEAB | | scroll down by 4
  ADC #$04                                  ; $1ECEAC | |
  STA $FA                                   ; $1ECEAE |/
  CMP #$F0                                  ; $1ECEB0 |
  BCC code_1ECEB8                           ; $1ECEB2 |
  ADC #$0F                                  ; $1ECEB4 |
  STA $FA                                   ; $1ECEB6 |
code_1ECEB8:
  LDA {y_position_frac}                     ; $1ECEB8 |
  SEC                                       ; $1ECEBB |
  SBC #$80                                  ; $1ECEBC |
  STA {y_position_frac}                     ; $1ECEBE |
  LDA {y_position_low}                      ; $1ECEC1 |
  SBC #$03                                  ; $1ECEC4 |
  STA {y_position_low}                      ; $1ECEC6 |
  BCS code_1ECF01                           ; $1ECEC9 |
  SBC #$0F                                  ; $1ECECB |
  STA {y_position_low}                      ; $1ECECD |
  JMP code_1ECF01                           ; $1ECED0 |

code_1ECED3:
  LDA $FA                                   ; $1ECED3 |\
  SEC                                       ; $1ECED5 | | scroll up by 4
  SBC #$04                                  ; $1ECED6 | |
  STA $FA                                   ; $1ECED8 |/
  BCS code_1ECEE0                           ; $1ECEDA |
  SBC #$0F                                  ; $1ECEDC |
  STA $FA                                   ; $1ECEDE |
code_1ECEE0:
  LDA $37                                   ; $1ECEE0 |
  BEQ code_1ECEE7                           ; $1ECEE2 |
  JSR code_1ED04F                           ; $1ECEE4 |
code_1ECEE7:
  LDA {y_position_frac}                     ; $1ECEE7 |
  CLC                                       ; $1ECEEA |
  ADC #$80                                  ; $1ECEEB |
  STA {y_position_frac}                     ; $1ECEED |
  LDA {y_position_low}                      ; $1ECEF0 |
  ADC #$03                                  ; $1ECEF3 |
  STA {y_position_low}                      ; $1ECEF5 |
  CMP #$F0                                  ; $1ECEF8 |
  BCC code_1ECF01                           ; $1ECEFA |
  ADC #$0F                                  ; $1ECEFC |
  STA {y_position_low}                      ; $1ECEFE |
code_1ECF01:
  JSR code_1ECF94                           ; $1ECF01 |
  LDA $11                                   ; $1ECF04 |
  PHA                                       ; $1ECF06 |
  LDA #$04                                  ; $1ECF07 |
  STA $9F                                   ; $1ECF09 |
  JSR code_1EC38F                           ; $1ECF0B |
  LDA $F6                                   ; $1ECF0E |
  PHA                                       ; $1ECF10 |
  LDA #$12                                  ; $1ECF11 |
  JSR select_PRG_banks_A                    ; $1ECF13 |
  JSR code_1EDF5E                           ; $1ECF16 |
  PLA                                       ; $1ECF19 |
  STA $F6                                   ; $1ECF1A |
  JSR select_PRG_banks                      ; $1ECF1C |
  LDA #$01                                  ; $1ECF1F |
  STA {entity_type}                         ; $1ECF21 |
  LDA #$00                                  ; $1ECF24 |
  STA $95                                   ; $1ECF26 |
  JSR async_next_frame                      ; $1ECF28 | async gameloop
  PLA                                       ; $1ECF2B |
  STA $11                                   ; $1ECF2C |
  INC $95                                   ; $1ECF2E |
  LDA $FA                                   ; $1ECF30 |
  STA $45                                   ; $1ECF32 |
  BEQ code_1ECF39                           ; $1ECF34 |\ if screen transition not
  JMP code_1ECEA3                           ; $1ECF36 |/ done, keep looping

; at this point, vertical screen transition done
code_1ECF39:
  LDA {y_position_low}                      ; $1ECF39 |
  AND #$F8                                  ; $1ECF3C |
  STA {y_position_low}                      ; $1ECF3E |
  LDA $29                                   ; $1ECF41 |
  AND #$20                                  ; $1ECF43 |
  BEQ code_1ECF5C                           ; $1ECF45 |
  LDA $29                                   ; $1ECF47 |
  AND #$3F                                  ; $1ECF49 |
  STA $29                                   ; $1ECF4B |
  LDA #$00                                  ; $1ECF4D |
  STA $25                                   ; $1ECF4F |
  INC $24                                   ; $1ECF51 |
  LDA #$01                                  ; $1ECF53 |
  STA $28                                   ; $1ECF55 |
  LDA #$01                                  ; $1ECF57 |
  JSR code_1FFFB7                           ; $1ECF59 |
code_1ECF5C:
  RTS                                       ; $1ECF5C |

code_1ECF5D:
  LDA #$08                                  ; $1ECF5D |
  STA $28                                   ; $1ECF5F |
  LDA #$00                                  ; $1ECF61 |
  STA $11                                   ; $1ECF63 |
  LDY $26                                   ; $1ECF65 |
  LDA $24                                   ; $1ECF67 |
  CMP $D0EC,y                               ; $1ECF69 |
  BEQ code_1ECFBF                           ; $1ECF6C |
  JSR code_1ECF94                           ; $1ECF6E |
  LDA $25                                   ; $1ECF71 |
  BPL code_1ECF93                           ; $1ECF73 |
  LDA #$1D                                  ; $1ECF75 |
  STA $25                                   ; $1ECF77 |
  INC $24                                   ; $1ECF79 |
  LDY $26                                   ; $1ECF7B |
  LDA $24                                   ; $1ECF7D |
  CMP $D0DC,y                               ; $1ECF7F |
  BNE code_1ECF93                           ; $1ECF82 |
  LDA $D0EC,y                               ; $1ECF84 |
  STA $24                                   ; $1ECF87 |
  LDY #$3F                                  ; $1ECF89 |
  LDA #$00                                  ; $1ECF8B |
code_1ECF8D:
  STA $0680,y                               ; $1ECF8D |
  DEY                                       ; $1ECF90 |
  BPL code_1ECF8D                           ; $1ECF91 |
code_1ECF93:
  RTS                                       ; $1ECF93 |

code_1ECF94:
  LDA $FA                                   ; $1ECF94 |
  SEC                                       ; $1ECF96 |
  SBC $45                                   ; $1ECF97 |
  BPL code_1ECFA0                           ; $1ECF99 |
  EOR #$FF                                  ; $1ECF9B |
  CLC                                       ; $1ECF9D |
  ADC #$01                                  ; $1ECF9E |
code_1ECFA0:
  AND #$0F                                  ; $1ECFA0 |
  STA $10                                   ; $1ECFA2 |
  BEQ code_1ECF93                           ; $1ECFA4 |
  LDA $28                                   ; $1ECFA6 |
  AND #$04                                  ; $1ECFA8 |
  BEQ code_1ECFB1                           ; $1ECFAA |
  LDA $45                                   ; $1ECFAC |
  JMP code_1ECFB5                           ; $1ECFAE |

code_1ECFB1:
  LDA $45                                   ; $1ECFB1 |
  EOR #$FF                                  ; $1ECFB3 |
code_1ECFB5:
  AND #$07                                  ; $1ECFB5 |
  CLC                                       ; $1ECFB7 |
  ADC $10                                   ; $1ECFB8 |
  LSR                                       ; $1ECFBA |
  LSR                                       ; $1ECFBB |
  LSR                                       ; $1ECFBC |
  BEQ code_1ECF93                           ; $1ECFBD |
code_1ECFBF:
  LDX $11                                   ; $1ECFBF |
  LDA $25                                   ; $1ECFC1 |
  AND #$01                                  ; $1ECFC3 |
  CMP $D0CA,x                               ; $1ECFC5 |
  BNE code_1ECFD9                           ; $1ECFC8 |
  LDA $F6                                   ; $1ECFCA |
  PHA                                       ; $1ECFCC |
  JSR code_1ED583                           ; $1ECFCD |
  PLA                                       ; $1ECFD0 |
  STA $F6                                   ; $1ECFD1 |
  JSR select_PRG_banks                      ; $1ECFD3 |
  JMP code_1ECFE5                           ; $1ECFD6 |

code_1ECFD9:
  LDA $F6                                   ; $1ECFD9 |
  PHA                                       ; $1ECFDB |
  JSR code_1ED674                           ; $1ECFDC |
  PLA                                       ; $1ECFDF |
  STA $F6                                   ; $1ECFE0 |
  JSR select_PRG_banks                      ; $1ECFE2 |
code_1ECFE5:
  LDX $11                                   ; $1ECFE5 |
  LDA $25                                   ; $1ECFE7 |
  CLC                                       ; $1ECFE9 |
  ADC $D0C6,x                               ; $1ECFEA |
  STA $25                                   ; $1ECFED |
  RTS                                       ; $1ECFEF |

code_1ECFF0:
  LDX #$00                                  ; $1ECFF0 |
code_1ECFF2:
  LDA $A9E0,x                               ; $1ECFF2 |
  BMI code_1ED04D                           ; $1ECFF5 |
  CMP {x_position_high}                     ; $1ECFF7 |
  BNE code_1ED047                           ; $1ECFFA |
  LDA $A9E1,x                               ; $1ECFFC |
  CMP $01                                   ; $1ECFFF |
  BNE code_1ED04D                           ; $1ED001 |
  LDA $A9E2,x                               ; $1ED003 |
  STA $24                                   ; $1ED006 |
  STA $F9                                   ; $1ED008 |
  STA {x_position_high}                     ; $1ED00A |
  LDY $A9E3,x                               ; $1ED00D |
  LDA $29                                   ; $1ED010 |
  AND #$1F                                  ; $1ED012 |
  CMP $A9E3,x                               ; $1ED014 |
  BCC code_1ED028                           ; $1ED017 |
  LDA #$02                                  ; $1ED019 |
  STA $AC                                   ; $1ED01B |
  LDA $A950,y                               ; $1ED01D |
  AND #$1F                                  ; $1ED020 |
  STA $2B                                   ; $1ED022 |
  LDA #$02                                  ; $1ED024 |
  BNE code_1ED02E                           ; $1ED026 |
code_1ED028:
  LDA #$00                                  ; $1ED028 |
  STA $2B                                   ; $1ED02A |
  LDA #$01                                  ; $1ED02C |
code_1ED02E:
  STA $AC                                   ; $1ED02E |
  LDA $A950,y                               ; $1ED030 |
  PHA                                       ; $1ED033 |
  AND #$1F                                  ; $1ED034 |
  STA $2A                                   ; $1ED036 |
  PLA                                       ; $1ED038 |
  AND #$E0                                  ; $1ED039 |
  ORA $A9E3,x                               ; $1ED03B |
  STA $29                                   ; $1ED03E |
  LDA #$00                                  ; $1ED040 |
  JSR code_1FFFB7                           ; $1ED042 |
  SEC                                       ; $1ED045 |
  RTS                                       ; $1ED046 |

code_1ED047:
  INX                                       ; $1ED047 |
  INX                                       ; $1ED048 |
  INX                                       ; $1ED049 |
  INX                                       ; $1ED04A |
  BNE code_1ECFF2                           ; $1ED04B |
code_1ED04D:
  CLC                                       ; $1ED04D |
  RTS                                       ; $1ED04E |

code_1ED04F:
  LDY #$17                                  ; $1ED04F |
code_1ED051:
  LDA {entity_type},y                       ; $1ED051 |
  CMP #$0D                                  ; $1ED054 |
  BNE code_1ED078                           ; $1ED056 |
  LDA #$00                                  ; $1ED058 |
  STA {animation_timer},y                   ; $1ED05A |
  LDA {x_position_high}                     ; $1ED05D |
  STA {x_position_high},y                   ; $1ED060 |
  LDA {y_position_frac},y                   ; $1ED063 |
  CLC                                       ; $1ED066 |
  ADC #$80                                  ; $1ED067 |
  STA {y_position_frac},y                   ; $1ED069 |
  LDA {y_position_low},y                    ; $1ED06C |
  ADC #$03                                  ; $1ED06F |
  STA {y_position_low},y                    ; $1ED071 |
  CMP #$F0                                  ; $1ED074 |
  BCC code_1ED07B                           ; $1ED076 |
code_1ED078:
  JSR code_1FF2FE                           ; $1ED078 |
code_1ED07B:
  DEY                                       ; $1ED07B |
  BNE code_1ED051                           ; $1ED07C |
  RTS                                       ; $1ED07E |

code_1ED07F:
  LDA $26                                   ; $1ED07F |
  CMP #$06                                  ; $1ED081 |
  BEQ code_1ED0B0                           ; $1ED083 |
  CMP #$01                                  ; $1ED085 |
  BNE code_1ED0AF                           ; $1ED087 |
  LDA #$8C                                  ; $1ED089 |
  STA $00                                   ; $1ED08B |
  LDA $29                                   ; $1ED08D |
  CMP #$29                                  ; $1ED08F |
  BEQ code_1ED09B                           ; $1ED091 |
  CMP #$2A                                  ; $1ED093 |
  BNE code_1ED0AF                           ; $1ED095 |
  LDA #$8F                                  ; $1ED097 |
  STA $00                                   ; $1ED099 |
code_1ED09B:
  LDY #$02                                  ; $1ED09B |
code_1ED09D:
  LDA $00                                   ; $1ED09D |
  STA $05F0,y                               ; $1ED09F |
  LDA #$00                                  ; $1ED0A2 |
  STA $05F8,y                               ; $1ED0A4 |
  STA $05F4,y                               ; $1ED0A7 |
  DEC $00                                   ; $1ED0AA |
  DEY                                       ; $1ED0AC |
  BPL code_1ED09D                           ; $1ED0AD |
code_1ED0AF:
  RTS                                       ; $1ED0AF |

code_1ED0B0:
  LDA $29                                   ; $1ED0B0 |
  CMP #$24                                  ; $1ED0B2 |
  BNE code_1ED0AF                           ; $1ED0B4 |
  LDA #$0F                                  ; $1ED0B6 |
  LDY #$03                                  ; $1ED0B8 |
code_1ED0BA:
  STA $060C,y                               ; $1ED0BA |
  STA $062C,y                               ; $1ED0BD |
  DEY                                       ; $1ED0C0 |
  BPL code_1ED0BA                           ; $1ED0C1 |
  STY $18                                   ; $1ED0C3 |
  RTS                                       ; $1ED0C5 |

  db $FF, $01, $1D, $00, $01, $00, $00, $00 ; $1ED0C6 |
  db $00, $29, $00, $00, $00, $00, $00, $00 ; $1ED0CE |
  db $00, $80, $00, $00, $00, $00, $00, $00 ; $1ED0D6 |
  db $00, $16, $00, $00, $00, $00, $00, $00 ; $1ED0DE |
  db $00, $03, $00, $00, $00, $00, $00, $00 ; $1ED0E6 |
  db $00, $1D, $00, $00, $00, $00, $00, $00 ; $1ED0EE |
  db $00, $04, $00, $00, $00, $00           ; $1ED0F6 |

code_1ED0FC:
  LDA #$00                                  ; $1ED0FC |
  STA $9D                                   ; $1ED0FE |
  LDA $26                                   ; $1ED100 |
  ASL                                       ; $1ED102 |
  ASL                                       ; $1ED103 |
  ASL                                       ; $1ED104 |
  TAX                                       ; $1ED105 |
  LDA $D231,x                               ; $1ED106 |
  STA $07D0                                 ; $1ED109 |
  LDA $D232,x                               ; $1ED10C |
  STA $07D1                                 ; $1ED10F |
  LDA $D233,x                               ; $1ED112 |
  STA $22                                   ; $1ED115 |
  LDA $D234,x                               ; $1ED117 |
  STA $10                                   ; $1ED11A |
  LDA #$03                                  ; $1ED11C |
  STA $11                                   ; $1ED11E |
  LDA #$25                                  ; $1ED120 |
  JSR code_1FEC5D                           ; $1ED122 |
code_1ED125:
  LDY $D235,x                               ; $1ED125 |
  JSR code_1ED829                           ; $1ED128 |
  LDA #$FF                                  ; $1ED12B |
  STA $1C                                   ; $1ED12D |
code_1ED12F:
  LDA #$00                                  ; $1ED12F |
  STA $95                                   ; $1ED131 |
  JSR async_next_frame                      ; $1ED133 |
  INC $95                                   ; $1ED136 |
  INC $9D                                   ; $1ED138 |
  LDA $9D                                   ; $1ED13A |
  AND #$03                                  ; $1ED13C |
  BNE code_1ED12F                           ; $1ED13E |
  INX                                       ; $1ED140 |
  DEC $11                                   ; $1ED141 |
  BEQ code_1ED16A                           ; $1ED143 |
  LDA $07D1                                 ; $1ED145 |
  SEC                                       ; $1ED148 |
  SBC #$40                                  ; $1ED149 |
  STA $07D1                                 ; $1ED14B |
  LDA $07D0                                 ; $1ED14E |
  SBC #$00                                  ; $1ED151 |
  STA $07D0                                 ; $1ED153 |
  LDA $10                                   ; $1ED156 |
  EOR #$02                                  ; $1ED158 |
  STA $10                                   ; $1ED15A |
  AND #$02                                  ; $1ED15C |
  BEQ code_1ED125                           ; $1ED15E |
  LDA $22                                   ; $1ED160 |
  SEC                                       ; $1ED162 |
  SBC #$08                                  ; $1ED163 |
  STA $22                                   ; $1ED165 |
  JMP code_1ED125                           ; $1ED167 |

code_1ED16A:
  RTS                                       ; $1ED16A |

code_1ED16B:
  LDY $26                                   ; $1ED16B |
  LDA {x_position_high}                     ; $1ED16D |
  CMP $D301,y                               ; $1ED170 |
  BEQ code_1ED16A                           ; $1ED173 |
  LDA #$00                                  ; $1ED175 |
  STA $9D                                   ; $1ED177 |
  LDA $26                                   ; $1ED179 |
  STA $00                                   ; $1ED17B |
  CMP #$0E                                  ; $1ED17D |
  BNE code_1ED18A                           ; $1ED17F |
  LDY $F9                                   ; $1ED181 |
  LDA $D793,y                               ; $1ED183 |
  STA $00                                   ; $1ED186 |
  STA $27                                   ; $1ED188 |
code_1ED18A:
  LDA $00                                   ; $1ED18A |
  ASL                                       ; $1ED18C |
  ASL                                       ; $1ED18D |
  CLC                                       ; $1ED18E |
  ADC $00                                   ; $1ED18F |
  TAX                                       ; $1ED191 |
  LDA $D2B1,x                               ; $1ED192 |
  STA $07D0                                 ; $1ED195 |
  LDA $D2B2,x                               ; $1ED198 |
  STA $07D1                                 ; $1ED19B |
  LDA $D2B3,x                               ; $1ED19E |
  STA $22                                   ; $1ED1A1 |
  LDA $D2B4,x                               ; $1ED1A3 |
  STA $10                                   ; $1ED1A6 |
  LDA #$03                                  ; $1ED1A8 |
  STA $11                                   ; $1ED1AA |
  LDA $D2B5,x                               ; $1ED1AC |
  STA $12                                   ; $1ED1AF |
  LDA $F0                                   ; $1ED1B1 |
  BNE code_1ED1BA                           ; $1ED1B3 |
  LDA #$25                                  ; $1ED1B5 |
  JSR code_1FEC5D                           ; $1ED1B7 |
code_1ED1BA:
  LDY $12                                   ; $1ED1BA |
  JSR code_1ED829                           ; $1ED1BC |
  LDX #$00                                  ; $1ED1BF |
  JSR code_1ED8C7                           ; $1ED1C1 |
  LDY #$00                                  ; $1ED1C4 |
  STY $07D2                                 ; $1ED1C6 |
  STY $07D7                                 ; $1ED1C9 |
code_1ED1CC:
  LDA $07D4,y                               ; $1ED1CC |
  STA $07D3,y                               ; $1ED1CF |
  INY                                       ; $1ED1D2 |
  CPY #$04                                  ; $1ED1D3 |
  BNE code_1ED1CC                           ; $1ED1D5 |
  LDY #$00                                  ; $1ED1D7 |
code_1ED1D9:
  LDA $07D9,y                               ; $1ED1D9 |
  STA $07D7,y                               ; $1ED1DC |
  INY                                       ; $1ED1DF |
  CPY #$06                                  ; $1ED1E0 |
  BNE code_1ED1D9                           ; $1ED1E2 |
  STA $1C                                   ; $1ED1E4 |
  LDA $F0                                   ; $1ED1E6 |
  BEQ code_1ED1F6                           ; $1ED1E8 |
  LDA #$00                                  ; $1ED1EA |
  STA $1C                                   ; $1ED1EC |
  LDX #$50                                  ; $1ED1EE |
  JSR code_1EC29C                           ; $1ED1F0 |
  JMP code_1ED207                           ; $1ED1F3 |

code_1ED1F6:
  LDA #$00                                  ; $1ED1F6 |
  STA $95                                   ; $1ED1F8 |
  JSR async_next_frame                      ; $1ED1FA |
  INC $95                                   ; $1ED1FD |
  INC $9D                                   ; $1ED1FF |
  LDA $9D                                   ; $1ED201 |
  AND #$03                                  ; $1ED203 |
  BNE code_1ED1F6                           ; $1ED205 |
code_1ED207:
  DEC $11                                   ; $1ED207 |
  BEQ code_1ED230                           ; $1ED209 |
  LDA $07D1                                 ; $1ED20B |
  CLC                                       ; $1ED20E |
  ADC #$40                                  ; $1ED20F |
  STA $07D1                                 ; $1ED211 |
  LDA $07D0                                 ; $1ED214 |
  ADC #$00                                  ; $1ED217 |
  STA $07D0                                 ; $1ED219 |
  LDA $10                                   ; $1ED21C |
  EOR #$02                                  ; $1ED21E |
  STA $10                                   ; $1ED220 |
  AND #$02                                  ; $1ED222 |
  BNE code_1ED1BA                           ; $1ED224 |
  LDA $22                                   ; $1ED226 |
  CLC                                       ; $1ED228 |
  ADC #$08                                  ; $1ED229 |
  STA $22                                   ; $1ED22B |
  JMP code_1ED1BA                           ; $1ED22D |

code_1ED230:
  RTS                                       ; $1ED230 |

  db $22, $DE, $2F, $03, $E2, $E2, $E3, $00 ; $1ED231 |
  db $22, $DE, $2F, $03, $6C, $64, $6F, $00 ; $1ED239 |
  db $22, $DE, $2F, $03, $5F, $5F, $00, $00 ; $1ED241 |
  db $22, $DE, $2F, $03, $00, $00, $00, $00 ; $1ED249 |
  db $22, $DE, $2F, $03, $C0, $C0, $C1, $00 ; $1ED251 |
  db $22, $DE, $2F, $03, $01, $01, $10, $00 ; $1ED259 |
  db $22, $DE, $2F, $03, $50, $50, $51, $00 ; $1ED261 |
  db $22, $DE, $2F, $03, $0D, $05, $00, $00 ; $1ED269 |
  db $22, $DE, $2F, $03, $65, $65, $6D, $00 ; $1ED271 |
  db $22, $DE, $2F, $03, $AA, $AA, $00, $00 ; $1ED279 |
  db $22, $DE, $2F, $03, $16, $15, $11, $00 ; $1ED281 |
  db $22, $1E, $27, $01, $65, $65, $6D, $00 ; $1ED289 |
  db $22, $DE, $2F, $03, $21, $24, $2C, $00 ; $1ED291 |
  db $22, $DE, $2F, $03, $8B, $8B, $15, $00 ; $1ED299 |
  db $22, $DE, $2F, $03, $E2, $E2, $E3, $00 ; $1ED2A1 |
  db $22, $DE, $2F, $03, $72, $72, $7B, $00 ; $1ED2A9 |
  db $22, $41, $20, $02, $CA, $22, $41, $20 ; $1ED2B1 |
  db $02, $02, $22, $41, $20, $02, $17, $22 ; $1ED2B9 |
  db $41, $20, $02, $5F, $22, $41, $20, $02 ; $1ED2C1 |
  db $0A, $22, $41, $20, $02, $F8, $22, $41 ; $1ED2C9 |
  db $20, $02, $7A, $22, $41, $20, $02, $0E ; $1ED2D1 |
  db $22, $41, $20, $02, $0A, $22, $41, $20 ; $1ED2D9 |
  db $02, $09, $22, $41, $20, $02, $85, $21 ; $1ED2E1 |
  db $81, $18, $00, $0A, $22, $41, $20, $02 ; $1ED2E9 |
  db $07, $22, $41, $20, $02, $0A, $22, $41 ; $1ED2F1 |
  db $20, $02, $CA, $22, $41, $20, $02, $41 ; $1ED2F9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1ED301 |
  db $00, $00, $00, $00, $1B, $18, $00, $07 ; $1ED309 |

code_1ED311:
  LDA #$00                                  ; $1ED311 |
  STA $95                                   ; $1ED313 |
  JSR code_1EC3F1                           ; $1ED315 |
  INC $1B                                   ; $1ED318 |
  JSR code_1EC38F                           ; $1ED31A |
  JSR code_1EC39D                           ; $1ED31D |
  JSR code_1EC3B8                           ; $1ED320 |
  JSR async_next_frame                      ; $1ED323 |
  JSR code_1EC2D1                           ; $1ED326 |
  JSR code_1FF3F2                           ; $1ED329 |
  LDA $F9                                   ; $1ED32C |
  STA $24                                   ; $1ED32E |
  STA {x_position_high}                     ; $1ED330 |
  LDY $26                                   ; $1ED333 |
  LDA $D4C2,y                               ; $1ED335 |
  STA $27                                   ; $1ED338 |
code_1ED33A:
  JSR code_1ED4E2                           ; $1ED33A |
  LDA $FF                                   ; $1ED33D |
  ORA #$04                                  ; $1ED33F |
  STA $2000                                 ; $1ED341 |
  LDX #$00                                  ; $1ED344 |
  STX $1A                                   ; $1ED346 |
  JSR code_1EC29C                           ; $1ED348 |
  LDA $FF                                   ; $1ED34B |
  STA $2000                                 ; $1ED34D |
  LDA $24                                   ; $1ED350 |
  CMP $F9                                   ; $1ED352 |
  BNE code_1ED364                           ; $1ED354 |
  INC $25                                   ; $1ED356 |
  LDA $25                                   ; $1ED358 |
  AND #$1F                                  ; $1ED35A |
  STA $25                                   ; $1ED35C |
  BNE code_1ED33A                           ; $1ED35E |
  INC $24                                   ; $1ED360 |
  BNE code_1ED33A                           ; $1ED362 |
code_1ED364:
  LDA $26                                   ; $1ED364 |
  STA $F6                                   ; $1ED366 |
  JSR select_PRG_banks                      ; $1ED368 |
  LDY #$0F                                  ; $1ED36B |
code_1ED36D:
  LDA $A988,y                               ; $1ED36D |
  STA $0620,y                               ; $1ED370 |
  LDA $D4B2,y                               ; $1ED373 |
  STA $0630,y                               ; $1ED376 |
  CPY #$04                                  ; $1ED379 |
  BCS code_1ED38B                           ; $1ED37B |
  LDA $A998,y                               ; $1ED37D |
  STA $05F0,y                               ; $1ED380 |
  LDA #$00                                  ; $1ED383 |
  STA $05F4,y                               ; $1ED385 |
  STA $05F8,y                               ; $1ED388 |
code_1ED38B:
  DEY                                       ; $1ED38B |
  BPL code_1ED36D                           ; $1ED38C |
  LDA $0620                                 ; $1ED38E |
  STA $0630                                 ; $1ED391 |
  LDA $A980                                 ; $1ED394 |
  STA $EA                                   ; $1ED397 |
  LDA $A981                                 ; $1ED399 |
  STA $EB                                   ; $1ED39C |
  LDY $F9                                   ; $1ED39E |
  LDA $AC00,y                               ; $1ED3A0 |
  STA $AD                                   ; $1ED3A3 |
  STA $AE                                   ; $1ED3A5 |
  LDA #$01                                  ; $1ED3A7 |
  STA $28                                   ; $1ED3A9 |
  STA $AC                                   ; $1ED3AB |
  LDA #$4C                                  ; $1ED3AD |
  STA {x_speed_frac}                        ; $1ED3AF |
  LDA #$01                                  ; $1ED3B2 |
  STA {x_speed}                             ; $1ED3B4 |
  LDY $29                                   ; $1ED3B7 |
  STY $00                                   ; $1ED3B9 |
  LDA $A950,y                               ; $1ED3BB |
  AND #$1F                                  ; $1ED3BE |
  STA $2A                                   ; $1ED3C0 |
  LDA #$00                                  ; $1ED3C2 |
  STA $2B                                   ; $1ED3C4 |
  LDA $A950,y                               ; $1ED3C6 |
  AND #$E0                                  ; $1ED3C9 |
  ORA $00                                   ; $1ED3CB |
  STA $29                                   ; $1ED3CD |
  AND #$20                                  ; $1ED3CF |
  BEQ code_1ED3DD                           ; $1ED3D1 |
  LDA $29                                   ; $1ED3D3 |
  AND #$3F                                  ; $1ED3D5 |
  STA $29                                   ; $1ED3D7 |
  LDA #$01                                  ; $1ED3D9 |
  BNE code_1ED3E3                           ; $1ED3DB |
code_1ED3DD:
  LDA $F9                                   ; $1ED3DD |
  STA $24                                   ; $1ED3DF |
  LDA #$00                                  ; $1ED3E1 |
code_1ED3E3:
  JSR code_1FFFB7                           ; $1ED3E3 |
  LDY $00                                   ; $1ED3E6 |
  LDA $A968,y                               ; $1ED3E8 |
  BPL code_1ED3F0                           ; $1ED3EB |
  JSR code_1ED16B                           ; $1ED3ED |
code_1ED3F0:
  JSR code_1FF32D                           ; $1ED3F0 |
  LDY $26                                   ; $1ED3F3 |
  LDA $D4D2,y                               ; $1ED3F5 |
  JSR code_1FEC5B                           ; $1ED3F8 |
  LDA #$01                                  ; $1ED3FB |
  STA $F5                                   ; $1ED3FD |
  JSR select_PRG_banks                      ; $1ED3FF |
  LDY $50                                   ; $1ED402 |
  LDA $85F1,y                               ; $1ED404 |
  STA $ED                                   ; $1ED407 |
  LDA $50                                   ; $1ED409 |
  ASL                                       ; $1ED40B |
  ASL                                       ; $1ED40C |
  TAY                                       ; $1ED40D |
  LDA $854B,y                               ; $1ED40E |
  STA $0631                                 ; $1ED411 |
  LDA $854C,y                               ; $1ED414 |
  STA $0632                                 ; $1ED417 |
  LDA $854D,y                               ; $1ED41A |
  STA $0633                                 ; $1ED41D |
  LDA $FC                                   ; $1ED420 |
  STA $44                                   ; $1ED422 |
  LDA $FA                                   ; $1ED424 |
  STA $45                                   ; $1ED426 |
  LDA {y_position_low}                      ; $1ED428 |
  STA $3E                                   ; $1ED42B |
  LDA {x_position_high}                     ; $1ED42D |
  STA $3D                                   ; $1ED430 |
  LDA {x_position_low}                      ; $1ED432 |
  STA $3C                                   ; $1ED435 |
  LDA #$0B                                  ; $1ED437 |
  STA $F5                                   ; $1ED439 |
  JSR select_PRG_banks                      ; $1ED43B |
  JSR $814D                                 ; $1ED43E |
  LDA $26                                   ; $1ED441 |
  CMP #$0E                                  ; $1ED443 |
  BNE code_1ED450                           ; $1ED445 |
  LDA $F9                                   ; $1ED447 |
  CMP #$03                                  ; $1ED449 |
  BNE code_1ED450                           ; $1ED44B |
  JSR $8000                                 ; $1ED44D |
code_1ED450:
  JSR code_1ED474                           ; $1ED450 |
  JSR code_1EC2DB                           ; $1ED453 |
  JSR async_next_frame                      ; $1ED456 |
  LDA #$00                                  ; $1ED459 |
  STA $1B                                   ; $1ED45B |
  JMP code_1EC3EB                           ; $1ED45D |

code_1ED460:
  LDA $F5                                   ; $1ED460 |
  PHA                                       ; $1ED462 |
  LDA $F6                                   ; $1ED463 |
  PHA                                       ; $1ED465 |
  JSR code_1ED311                           ; $1ED466 |
  INC $95                                   ; $1ED469 |
  PLA                                       ; $1ED46B |
  STA $F6                                   ; $1ED46C |
  PLA                                       ; $1ED46E |
  STA $F5                                   ; $1ED46F |
  JMP select_PRG_banks                      ; $1ED471 |

code_1ED474:
  LDA $26                                   ; $1ED474 |
  CMP #$0B                                  ; $1ED476 |
  BNE code_1ED4B1                           ; $1ED478 |
  LDA $69                                   ; $1ED47A |
  CMP #$04                                  ; $1ED47C |
  BNE code_1ED4B1                           ; $1ED47E |
  LDA #$1B                                  ; $1ED480 |
  STA $F5                                   ; $1ED482 |
  JSR select_PRG_banks                      ; $1ED484 |
  LDY #$36                                  ; $1ED487 |
  LDX #$28                                  ; $1ED489 |
  STX $43                                   ; $1ED48B |
code_1ED48D:
  LDA $8F7F,y                               ; $1ED48D |
  STA $06BC,x                               ; $1ED490 |
  LDA $8F80,y                               ; $1ED493 |
  STA $06BD,x                               ; $1ED496 |
  LDA $8F81,y                               ; $1ED499 |
  STA $06BE,x                               ; $1ED49C |
  LDA $8F82,y                               ; $1ED49F |
  STA $06BF,x                               ; $1ED4A2 |
  DEY                                       ; $1ED4A5 |
  DEY                                       ; $1ED4A6 |
  DEY                                       ; $1ED4A7 |
  DEY                                       ; $1ED4A8 |
  DEY                                       ; $1ED4A9 |
  DEY                                       ; $1ED4AA |
  DEX                                       ; $1ED4AB |
  DEX                                       ; $1ED4AC |
  DEX                                       ; $1ED4AD |
  DEX                                       ; $1ED4AE |
  BNE code_1ED48D                           ; $1ED4AF |
code_1ED4B1:
  RTS                                       ; $1ED4B1 |

  db $0F, $0F, $2C, $11, $0F, $0F, $20, $37 ; $1ED4B2 |
  db $0F, $0F, $20, $27, $0F, $0F, $20, $2A ; $1ED4BA |
  db $00, $01, $02, $03, $04, $05, $06, $07 ; $1ED4C2 |
  db $08, $09, $0A, $08, $0C, $0D, $0E, $0E ; $1ED4CA |
  db $00, $02, $01, $05, $03, $06, $07, $04 ; $1ED4D2 |
  db $08, $08, $08, $08, $09, $09, $09, $09 ; $1ED4DA |

code_1ED4E2:
  LDY $24                                   ; $1ED4E2 |
  JSR code_1ED7A3                           ; $1ED4E4 |
  LDA #$20                                  ; $1ED4E7 |
  STA $0780                                 ; $1ED4E9 |
  LDA $25                                   ; $1ED4EC |
  STA $0781                                 ; $1ED4EE |
  LSR                                       ; $1ED4F1 |
  LSR                                       ; $1ED4F2 |
  STA $22                                   ; $1ED4F3 |
  LDA #$1D                                  ; $1ED4F5 |
  STA $0782                                 ; $1ED4F7 |
  LDA #$00                                  ; $1ED4FA |
  STA $03                                   ; $1ED4FC |
  STA $04                                   ; $1ED4FE |
  LDA $25                                   ; $1ED500 |
  AND #$03                                  ; $1ED502 |
  STA $05                                   ; $1ED504 |
code_1ED506:
  JSR code_1ED6C0                           ; $1ED506 |
  LDX $03                                   ; $1ED509 |
  LDY $05                                   ; $1ED50B |
  LDA $05E0,y                               ; $1ED50D |
  STA $0783,x                               ; $1ED510 |
  LDA $05E4,y                               ; $1ED513 |
  STA $0784,x                               ; $1ED516 |
  LDA $22                                   ; $1ED519 |
  CMP #$38                                  ; $1ED51B |
  BCS code_1ED531                           ; $1ED51D |
  LDA $05E8,y                               ; $1ED51F |
  STA $0785,x                               ; $1ED522 |
  LDA $05EC,y                               ; $1ED525 |
  STA $0786,x                               ; $1ED528 |
  INX                                       ; $1ED52B |
  INX                                       ; $1ED52C |
  INX                                       ; $1ED52D |
  INX                                       ; $1ED52E |
  STX $03                                   ; $1ED52F |
code_1ED531:
  LDA $05                                   ; $1ED531 |
  LSR                                       ; $1ED533 |
  BCC code_1ED567                           ; $1ED534 |
  TAY                                       ; $1ED536 |
  LDX $22                                   ; $1ED537 |
  LDA $0640,x                               ; $1ED539 |
  AND $D57F,y                               ; $1ED53C |
  STA $00                                   ; $1ED53F |
  LDA $10                                   ; $1ED541 |
  AND $D581,y                               ; $1ED543 |
  ORA $00                                   ; $1ED546 |
  STA $0640,x                               ; $1ED548 |
  LDX $04                                   ; $1ED54B |
  STA $07A4,x                               ; $1ED54D |
  LDA #$23                                  ; $1ED550 |
  STA $07A1,x                               ; $1ED552 |
  LDA #$C0                                  ; $1ED555 |
  ORA $22                                   ; $1ED557 |
  STA $07A2,x                               ; $1ED559 |
  LDA #$00                                  ; $1ED55C |
  STA $07A3,x                               ; $1ED55E |
  INX                                       ; $1ED561 |
  INX                                       ; $1ED562 |
  INX                                       ; $1ED563 |
  INX                                       ; $1ED564 |
  STX $04                                   ; $1ED565 |
code_1ED567:
  LDA $22                                   ; $1ED567 |
  CLC                                       ; $1ED569 |
  ADC #$08                                  ; $1ED56A |
  STA $22                                   ; $1ED56C |
  CMP #$40                                  ; $1ED56E |
  BCC code_1ED506                           ; $1ED570 |
  LDA #$20                                  ; $1ED572 |
  ADC $04                                   ; $1ED574 |
  TAY                                       ; $1ED576 |
  LDA #$FF                                  ; $1ED577 |
  STA $0780,y                               ; $1ED579 |
  STA $1A                                   ; $1ED57C |
  RTS                                       ; $1ED57E |

  db $CC, $33, $33, $CC                     ; $1ED57F |

code_1ED583:
  LDY $24                                   ; $1ED583 |
  JSR code_1ED7A3                           ; $1ED585 |
  LDA $25                                   ; $1ED588 |
  AND #$1C                                  ; $1ED58A |
  ASL                                       ; $1ED58C |
  STA $22                                   ; $1ED58D |
  LDA #$00                                  ; $1ED58F |
  STA $03                                   ; $1ED591 |
  STA $06                                   ; $1ED593 |
  LDA $25                                   ; $1ED595 |
  AND #$03                                  ; $1ED597 |
  TAX                                       ; $1ED599 |
  EOR #$01                                  ; $1ED59A |
  TAY                                       ; $1ED59C |
  LDA $D6A4,x                               ; $1ED59D |
  STA $04                                   ; $1ED5A0 |
  LDA $D6A4,y                               ; $1ED5A2 |
  STA $05                                   ; $1ED5A5 |
  LDA $25                                   ; $1ED5A7 |
  LSR                                       ; $1ED5A9 |
  LSR                                       ; $1ED5AA |
  TAY                                       ; $1ED5AB |
  LDA $D6B8,y                               ; $1ED5AC |
  STA $0780                                 ; $1ED5AF |
  STA $07D0                                 ; $1ED5B2 |
  LDA $D6B0,y                               ; $1ED5B5 |
  ORA $D6A8,x                               ; $1ED5B8 |
  STA $0781                                 ; $1ED5BB |
  STA $07D1                                 ; $1ED5BE |
  LDA #$1F                                  ; $1ED5C1 |
  STA $0782                                 ; $1ED5C3 |
  STA $07D2                                 ; $1ED5C6 |
  LDA #$23                                  ; $1ED5C9 |
  STA $07A3                                 ; $1ED5CB |
  STA $07F3                                 ; $1ED5CE |
  LDA #$C0                                  ; $1ED5D1 |
  ORA $22                                   ; $1ED5D3 |
  STA $07A4                                 ; $1ED5D5 |
  STA $07F4                                 ; $1ED5D8 |
  LDA #$07                                  ; $1ED5DB |
  STA $07A5                                 ; $1ED5DD |
  STA $07F5                                 ; $1ED5E0 |
code_1ED5E3:
  JSR code_1ED6C0                           ; $1ED5E3 |
  LDA #$04                                  ; $1ED5E6 |
  STA $07                                   ; $1ED5E8 |
  LDA $04                                   ; $1ED5EA |
  PHA                                       ; $1ED5EC |
  LDA $05                                   ; $1ED5ED |
  PHA                                       ; $1ED5EF |
code_1ED5F0:
  LDX $03                                   ; $1ED5F0 |
  LDY $04                                   ; $1ED5F2 |
  LDA $05E0,y                               ; $1ED5F4 |
  STA $0783,x                               ; $1ED5F7 |
  LDY $05                                   ; $1ED5FA |
  LDA $05E0,y                               ; $1ED5FC |
  STA $07D3,x                               ; $1ED5FF |
  INC $03                                   ; $1ED602 |
  INC $04                                   ; $1ED604 |
  INC $05                                   ; $1ED606 |
  DEC $07                                   ; $1ED608 |
  BNE code_1ED5F0                           ; $1ED60A |
  PLA                                       ; $1ED60C |
  STA $05                                   ; $1ED60D |
  PLA                                       ; $1ED60F |
  STA $04                                   ; $1ED610 |
  LDA $25                                   ; $1ED612 |
  AND #$03                                  ; $1ED614 |
  LSR                                       ; $1ED616 |
  TAY                                       ; $1ED617 |
  LDX $22                                   ; $1ED618 |
  LDA $0640,x                               ; $1ED61A |
  AND $D6A0,y                               ; $1ED61D |
  STA $00                                   ; $1ED620 |
  LDA $10                                   ; $1ED622 |
  AND $D6A2,y                               ; $1ED624 |
  ORA $00                                   ; $1ED627 |
  STA $0640,x                               ; $1ED629 |
  LDX $06                                   ; $1ED62C |
  STA $07A6,x                               ; $1ED62E |
  STA $07F6,x                               ; $1ED631 |
  INC $06                                   ; $1ED634 |
  INC $22                                   ; $1ED636 |
  LDA $22                                   ; $1ED638 |
  AND #$07                                  ; $1ED63A |
  BNE code_1ED5E3                           ; $1ED63C |
  DEC $22                                   ; $1ED63E |
  LDA $22                                   ; $1ED640 |
  AND #$38                                  ; $1ED642 |
  STA $22                                   ; $1ED644 |
  LDY $24                                   ; $1ED646 |
  INY                                       ; $1ED648 |
  JSR code_1ED7A3                           ; $1ED649 |
  JSR code_1ED6C0                           ; $1ED64C |
  LDY $04                                   ; $1ED64F |
  LDA $05E0,y                               ; $1ED651 |
  STA $0783                                 ; $1ED654 |
  LDY $05                                   ; $1ED657 |
  LDA $05E0,y                               ; $1ED659 |
  STA $07D3                                 ; $1ED65C |
  LDA $28                                   ; $1ED65F |
  AND #$04                                  ; $1ED661 |
  LSR                                       ; $1ED663 |
  LSR                                       ; $1ED664 |
  TAX                                       ; $1ED665 |
  LDY $D6AC,x                               ; $1ED666 |
  LDA #$FF                                  ; $1ED669 |
  STA $0780,y                               ; $1ED66B |
  STA $19                                   ; $1ED66E |
  STA $07D0,y                               ; $1ED670 |
  RTS                                       ; $1ED673 |

code_1ED674:
  LDY #$2E                                  ; $1ED674 |
code_1ED676:
  LDA $07D0,y                               ; $1ED676 |
  STA $0780,y                               ; $1ED679 |
  DEY                                       ; $1ED67C |
  BPL code_1ED676                           ; $1ED67D |
  LDA $0781                                 ; $1ED67F |
  EOR #$20                                  ; $1ED682 |
  STA $0781                                 ; $1ED684 |
  LDA #$23                                  ; $1ED687 |
  STA $07A3                                 ; $1ED689 |
  LDA $28                                   ; $1ED68C |
  AND #$04                                  ; $1ED68E |
  LSR                                       ; $1ED690 |
  LSR                                       ; $1ED691 |
  EOR #$01                                  ; $1ED692 |
  TAX                                       ; $1ED694 |
  LDY $D6AC,x                               ; $1ED695 |
  LDA #$FF                                  ; $1ED698 |
  STA $0780,y                               ; $1ED69A |
  STA $19                                   ; $1ED69D |
  RTS                                       ; $1ED69F |

  db $F0, $0F, $0F, $F0, $00, $04, $08, $0C ; $1ED6A0 |
  db $00, $20, $40, $60, $23, $2E, $2A, $1F ; $1ED6A8 |
  db $00, $80, $00, $80, $00, $80, $00, $80 ; $1ED6B0 |
  db $20, $20, $21, $21, $22, $22, $23, $23 ; $1ED6B8 |

code_1ED6C0:
  JSR code_1ED758                           ; $1ED6C0 |
  LDY #$03                                  ; $1ED6C3 |
  STY $02                                   ; $1ED6C5 |
  LDA #$00                                  ; $1ED6C7 |
  STA $10                                   ; $1ED6C9 |
code_1ED6CB:
  LDY $02                                   ; $1ED6CB |
  LDX $D78B,y                               ; $1ED6CD |
  LDA ($00),y                               ; $1ED6D0 |
  JSR code_1ED703                           ; $1ED6D2 |
  TAY                                       ; $1ED6D5 |
  LDA $AD00,y                               ; $1ED6D6 |
  STA $05E0,x                               ; $1ED6D9 |
  LDA $AE00,y                               ; $1ED6DC |
  STA $05E1,x                               ; $1ED6DF |
  LDA $AF00,y                               ; $1ED6E2 |
  STA $05E4,x                               ; $1ED6E5 |
  LDA $B000,y                               ; $1ED6E8 |
  STA $05E5,x                               ; $1ED6EB |
  LDA $B100,y                               ; $1ED6EE |
  AND #$03                                  ; $1ED6F1 |
  ORA $10                                   ; $1ED6F3 |
  STA $10                                   ; $1ED6F5 |
  DEC $02                                   ; $1ED6F7 |
  BMI code_1ED702                           ; $1ED6F9 |
  ASL $10                                   ; $1ED6FB |
  ASL $10                                   ; $1ED6FD |
  JMP code_1ED6CB                           ; $1ED6FF |

code_1ED702:
  RTS                                       ; $1ED702 |

code_1ED703:
  PHA                                       ; $1ED703 |
  TAY                                       ; $1ED704 |
  LDA $59                                   ; $1ED705 |
  BNE code_1ED756                           ; $1ED707 |
  LDY $43                                   ; $1ED709 |
  BEQ code_1ED72D                           ; $1ED70B |
code_1ED70D:
  LDA $06BC,y                               ; $1ED70D |
  CMP $47                                   ; $1ED710 |
  BNE code_1ED727                           ; $1ED712 |
  LDA $06BD,y                               ; $1ED714 |
  CMP $22                                   ; $1ED717 |
  BNE code_1ED727                           ; $1ED719 |
  LDA $06BE,y                               ; $1ED71B |
  CMP $02                                   ; $1ED71E |
  BNE code_1ED727                           ; $1ED720 |
  PLA                                       ; $1ED722 |
  LDA $06BF,y                               ; $1ED723 |
  RTS                                       ; $1ED726 |

code_1ED727:
  DEY                                       ; $1ED727 |
  DEY                                       ; $1ED728 |
  DEY                                       ; $1ED729 |
  DEY                                       ; $1ED72A |
  BNE code_1ED70D                           ; $1ED72B |
code_1ED72D:
  LDA $1E                                   ; $1ED72D |
  BNE code_1ED756                           ; $1ED72F |
  LDA $22                                   ; $1ED731 |
  AND #$01                                  ; $1ED733 |
  ASL                                       ; $1ED735 |
  ASL                                       ; $1ED736 |
  ORA $02                                   ; $1ED737 |
  TAY                                       ; $1ED739 |
  LDA $F2B2,y                               ; $1ED73A |
  STA $E6                                   ; $1ED73D |
  LDA $47                                   ; $1ED73F |
  AND #$01                                  ; $1ED741 |
  TAY                                       ; $1ED743 |
  LDA $22                                   ; $1ED744 |
  LSR                                       ; $1ED746 |
  ORA $F2C2,y                               ; $1ED747 |
  TAY                                       ; $1ED74A |
  LDA $0680,y                               ; $1ED74B |
  AND $E6                                   ; $1ED74E |
  BEQ code_1ED756                           ; $1ED750 |
  PLA                                       ; $1ED752 |
  LDA #$00                                  ; $1ED753 |
  PHA                                       ; $1ED755 |
code_1ED756:
  PLA                                       ; $1ED756 |
  RTS                                       ; $1ED757 |

code_1ED758:
  LDA $26                                   ; $1ED758 |
  CMP #$0E                                  ; $1ED75A |
  BNE code_1ED768                           ; $1ED75C |
  LDY $47                                   ; $1ED75E |
  LDA $D793,y                               ; $1ED760 |
  STA $27                                   ; $1ED763 |
  JMP code_1ED76A                           ; $1ED765 |

code_1ED768:
  LDA $27                                   ; $1ED768 |
code_1ED76A:
  CMP $F6                                   ; $1ED76A |
  BEQ code_1ED773                           ; $1ED76C |
  STA $F6                                   ; $1ED76E |
  JSR select_PRG_banks                      ; $1ED770 |
code_1ED773:
  LDA #$00                                  ; $1ED773 |
  STA $01                                   ; $1ED775 |
  LDY $22                                   ; $1ED777 |
  LDA ($20),y                               ; $1ED779 |
  ASL                                       ; $1ED77B |
  ROL $01                                   ; $1ED77C |
  ASL                                       ; $1ED77E |
  ROL $01                                   ; $1ED77F |
  STA $00                                   ; $1ED781 |
  LDA $01                                   ; $1ED783 |
  CLC                                       ; $1ED785 |
  ADC #$B2                                  ; $1ED786 |
  STA $01                                   ; $1ED788 |
  RTS                                       ; $1ED78A |

  db $00, $02, $08, $0A, $FC, $F3, $CF, $3F ; $1ED78B |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $1ED793 |
  db $00, $01, $02, $03, $04, $05, $06, $07 ; $1ED79B |

code_1ED7A3:
  LDA $26                                   ; $1ED7A3 |
  CMP $F6                                   ; $1ED7A5 |
  BEQ code_1ED7AE                           ; $1ED7A7 |
  STA $F6                                   ; $1ED7A9 |
  JSR select_PRG_banks                      ; $1ED7AB |
code_1ED7AE:
  CPY #$80                                  ; $1ED7AE |
  BCC code_1ED7B4                           ; $1ED7B0 |
  LDY #$00                                  ; $1ED7B2 |
code_1ED7B4:
  LDA $A900,y                               ; $1ED7B4 |
  STY $47                                   ; $1ED7B7 |
  PHA                                       ; $1ED7B9 |
  LDA #$00                                  ; $1ED7BA |
  STA $00                                   ; $1ED7BC |
  PLA                                       ; $1ED7BE |
  ASL                                       ; $1ED7BF |
  ROL $00                                   ; $1ED7C0 |
  ASL                                       ; $1ED7C2 |
  ROL $00                                   ; $1ED7C3 |
  ASL                                       ; $1ED7C5 |
  ROL $00                                   ; $1ED7C6 |
  ASL                                       ; $1ED7C8 |
  ROL $00                                   ; $1ED7C9 |
  ASL                                       ; $1ED7CB |
  ROL $00                                   ; $1ED7CC |
  ASL                                       ; $1ED7CE |
  ROL $00                                   ; $1ED7CF |
  STA $20                                   ; $1ED7D1 |
  LDA $00                                   ; $1ED7D3 |
  CLC                                       ; $1ED7D5 |
  ADC #$B6                                  ; $1ED7D6 |
  STA $21                                   ; $1ED7D8 |
  RTS                                       ; $1ED7DA |

code_1ED7DB:
  LDA #$08                                  ; $1ED7DB |
  STA $07D0                                 ; $1ED7DD |
  LDA {y_position_low},x                    ; $1ED7E0 |
  AND #$F0                                  ; $1ED7E3 |
  ASL                                       ; $1ED7E5 |
  ROL $07D0                                 ; $1ED7E6 |
  ASL                                       ; $1ED7E9 |
  ROL $07D0                                 ; $1ED7EA |
  STA $07D1                                 ; $1ED7ED |
  LDA {x_position_low},x                    ; $1ED7F0 |
  AND #$F0                                  ; $1ED7F3 |
  LSR                                       ; $1ED7F5 |
  LSR                                       ; $1ED7F6 |
  LSR                                       ; $1ED7F7 |
  ORA $07D1                                 ; $1ED7F8 |
  STA $07D1                                 ; $1ED7FB |
  JSR code_1ED829                           ; $1ED7FE |
  LDA #$FF                                  ; $1ED801 |
  STA $1C                                   ; $1ED803 |
  RTS                                       ; $1ED805 |

code_1ED806:
  LDA #$08                                  ; $1ED806 |
  STA $07D0                                 ; $1ED808 |
  LDA {y_position_low},x                    ; $1ED80B |
  AND #$F0                                  ; $1ED80E |
  ASL                                       ; $1ED810 |
  ROL $07D0                                 ; $1ED811 |
  ASL                                       ; $1ED814 |
  ROL $07D0                                 ; $1ED815 |
  STA $07D1                                 ; $1ED818 |
  LDA {x_position_low},x                    ; $1ED81B |
  AND #$F0                                  ; $1ED81E |
  LSR                                       ; $1ED820 |
  LSR                                       ; $1ED821 |
  LSR                                       ; $1ED822 |
  ORA $07D1                                 ; $1ED823 |
  STA $07D1                                 ; $1ED826 |
code_1ED829:
  LDA $F6                                   ; $1ED829 |
  PHA                                       ; $1ED82B |
  LDA $27                                   ; $1ED82C |
  STA $F6                                   ; $1ED82E |
  JSR select_PRG_banks                      ; $1ED830 |
  LDA $07D0                                 ; $1ED833 |
  STA $07D5                                 ; $1ED836 |
  LDA $07D1                                 ; $1ED839 |
  ORA #$20                                  ; $1ED83C |
  STA $07D6                                 ; $1ED83E |
  LDA #$01                                  ; $1ED841 |
  STA $07D2                                 ; $1ED843 |
  STA $07D7                                 ; $1ED846 |
  LDA $AD00,y                               ; $1ED849 |
  STA $07D3                                 ; $1ED84C |
  LDA $AE00,y                               ; $1ED84F |
  STA $07D4                                 ; $1ED852 |
  LDA $AF00,y                               ; $1ED855 |
  STA $07D8                                 ; $1ED858 |
  LDA $B000,y                               ; $1ED85B |
  STA $07D9                                 ; $1ED85E |
  LDA $B100,y                               ; $1ED861 |
  AND #$03                                  ; $1ED864 |
  STA $00                                   ; $1ED866 |
  LDY $10                                   ; $1ED868 |
  BEQ code_1ED873                           ; $1ED86A |
code_1ED86C:
  ASL $00                                   ; $1ED86C |
  ASL $00                                   ; $1ED86E |
  DEY                                       ; $1ED870 |
  BNE code_1ED86C                           ; $1ED871 |
code_1ED873:
  LDY $10                                   ; $1ED873 |
  LDA $D78F,y                               ; $1ED875 |
  LDY $22                                   ; $1ED878 |
  AND $0640,y                               ; $1ED87A |
  ORA $00                                   ; $1ED87D |
  STA $07DD                                 ; $1ED87F |
  STA $0640,y                               ; $1ED882 |
  LDA #$23                                  ; $1ED885 |
  STA $07DA                                 ; $1ED887 |
  LDA $22                                   ; $1ED88A |
  ORA #$C0                                  ; $1ED88C |
  STA $07DB                                 ; $1ED88E |
  LDA #$00                                  ; $1ED891 |
  STA $07DC                                 ; $1ED893 |
  LDA #$FF                                  ; $1ED896 |
  STA $07DE                                 ; $1ED898 |
  PLA                                       ; $1ED89B |
  STA $F6                                   ; $1ED89C |
  JSR select_PRG_banks                      ; $1ED89E |
  RTS                                       ; $1ED8A1 |

code_1ED8A2:
  LDA {x_position_low},x                    ; $1ED8A2 |
  LSR                                       ; $1ED8A5 |
  LSR                                       ; $1ED8A6 |
  LSR                                       ; $1ED8A7 |
  LSR                                       ; $1ED8A8 |
  PHA                                       ; $1ED8A9 |
  AND #$01                                  ; $1ED8AA |
  STA $10                                   ; $1ED8AC |
  PLA                                       ; $1ED8AE |
  LSR                                       ; $1ED8AF |
  STA $22                                   ; $1ED8B0 |
  LDA {y_position_low},x                    ; $1ED8B2 |
  LSR                                       ; $1ED8B5 |
  LSR                                       ; $1ED8B6 |
  PHA                                       ; $1ED8B7 |
  AND #$38                                  ; $1ED8B8 |
  ORA $22                                   ; $1ED8BA |
  STA $22                                   ; $1ED8BC |
  PLA                                       ; $1ED8BE |
  LSR                                       ; $1ED8BF |
  AND #$02                                  ; $1ED8C0 |
  ORA $10                                   ; $1ED8C2 |
  STA $10                                   ; $1ED8C4 |
  RTS                                       ; $1ED8C6 |

code_1ED8C7:
  LDA $22                                   ; $1ED8C7 |
  AND #$01                                  ; $1ED8C9 |
  ASL                                       ; $1ED8CB |
  ASL                                       ; $1ED8CC |
  ORA $10                                   ; $1ED8CD |
  TAY                                       ; $1ED8CF |
  LDA $F2B2,y                               ; $1ED8D0 |
  STA $00                                   ; $1ED8D3 |
  LDA {x_position_high},x                   ; $1ED8D5 |
  AND #$01                                  ; $1ED8D8 |
  TAY                                       ; $1ED8DA |
  LDA $22                                   ; $1ED8DB |
  LSR                                       ; $1ED8DD |
  ORA $F2C2,y                               ; $1ED8DE |
  TAY                                       ; $1ED8E1 |
  LDA $0680,y                               ; $1ED8E2 |
  ORA $00                                   ; $1ED8E5 |
  STA $0680,y                               ; $1ED8E7 |
  RTS                                       ; $1ED8EA |

code_1ED8EB:
  LDA $46                                   ; $1ED8EB |
  BEQ code_1ED934                           ; $1ED8ED |
  LDA $F9                                   ; $1ED8EF |
  AND #$01                                  ; $1ED8F1 |
  TAY                                       ; $1ED8F3 |
  LDA $F2C2,y                               ; $1ED8F4 |
  STA $00                                   ; $1ED8F7 |
  LDA $FC                                   ; $1ED8F9 |
  LSR                                       ; $1ED8FB |
  LSR                                       ; $1ED8FC |
  LSR                                       ; $1ED8FD |
  LSR                                       ; $1ED8FE |
  LSR                                       ; $1ED8FF |
  AND #$07                                  ; $1ED900 |
  CLC                                       ; $1ED902 |
  ADC #$04                                  ; $1ED903 |
  CMP #$08                                  ; $1ED905 |
  AND #$07                                  ; $1ED907 |
  STA $01                                   ; $1ED909 |
  BCS code_1ED913                           ; $1ED90B |
  LDA $00                                   ; $1ED90D |
  EOR #$20                                  ; $1ED90F |
  STA $00                                   ; $1ED911 |
code_1ED913:
  LDA $01                                   ; $1ED913 |
  AND #$01                                  ; $1ED915 |
  TAY                                       ; $1ED917 |
  LDA $D935,y                               ; $1ED918 |
  STA $02                                   ; $1ED91B |
  LDA $01                                   ; $1ED91D |
  LSR                                       ; $1ED91F |
  ORA $00                                   ; $1ED920 |
  TAY                                       ; $1ED922 |
  LDX #$08                                  ; $1ED923 |
code_1ED925:
  LDA $0680,y                               ; $1ED925 |
  AND $02                                   ; $1ED928 |
  STA $0680,y                               ; $1ED92A |
  INY                                       ; $1ED92D |
  INY                                       ; $1ED92E |
  INY                                       ; $1ED92F |
  INY                                       ; $1ED930 |
  DEX                                       ; $1ED931 |
  BNE code_1ED925                           ; $1ED932 |
code_1ED934:
  RTS                                       ; $1ED934 |

  db $F0, $0F                               ; $1ED935 |

  LDA $19                                   ; $1ED937 |
  ORA $1A                                   ; $1ED939 |
  BNE code_1ED934                           ; $1ED93B |
  LDA $1D                                   ; $1ED93D |
  BPL code_1ED934                           ; $1ED93F |
  AND #$7F                                  ; $1ED941 |
  STA $1D                                   ; $1ED943 |
  AND #$3F                                  ; $1ED945 |
  STA $22                                   ; $1ED947 |
  LDY #$00                                  ; $1ED949 |
  LDA $1D                                   ; $1ED94B |
  AND #$40                                  ; $1ED94D |
  BEQ code_1ED95B                           ; $1ED94F |
  LDY #$04                                  ; $1ED951 |
  LDA $29                                   ; $1ED953 |
  AND #$20                                  ; $1ED955 |
  BEQ code_1ED95B                           ; $1ED957 |
  LDY #$08                                  ; $1ED959 |
code_1ED95B:
  STY $10                                   ; $1ED95B |
code_1ED95D:
  LDA $22                                   ; $1ED95D |
  PHA                                       ; $1ED95F |
  AND #$07                                  ; $1ED960 |
  ASL                                       ; $1ED962 |
  ASL                                       ; $1ED963 |
  STA $0781                                 ; $1ED964 |
  LDA #$02                                  ; $1ED967 |
  STA $0780                                 ; $1ED969 |
  PLA                                       ; $1ED96C |
  AND #$F8                                  ; $1ED96D |
  ASL                                       ; $1ED96F |
  ROL $0780                                 ; $1ED970 |
  ASL                                       ; $1ED973 |
  ROL $0780                                 ; $1ED974 |
  ASL                                       ; $1ED977 |
  ROL $0780                                 ; $1ED978 |
  ASL                                       ; $1ED97B |
  ROL $0780                                 ; $1ED97C |
  ORA $0781                                 ; $1ED97F |
  STA $0781                                 ; $1ED982 |
  CLC                                       ; $1ED985 |
  ADC #$20                                  ; $1ED986 |
  STA $0788                                 ; $1ED988 |
  ADC #$20                                  ; $1ED98B |
  STA $078F                                 ; $1ED98D |
  ADC #$20                                  ; $1ED990 |
  STA $0796                                 ; $1ED992 |
  LDA $22                                   ; $1ED995 |
  ORA #$C0                                  ; $1ED997 |
  STA $079D                                 ; $1ED999 |
  LDA $0780                                 ; $1ED99C |
  ORA $10                                   ; $1ED99F |
  STA $0780                                 ; $1ED9A1 |
  STA $0787                                 ; $1ED9A4 |
  STA $078E                                 ; $1ED9A7 |
  STA $0795                                 ; $1ED9AA |
  ORA #$03                                  ; $1ED9AD |
  STA $079C                                 ; $1ED9AF |
  LDA #$03                                  ; $1ED9B2 |
  STA $0782                                 ; $1ED9B4 |
  STA $0789                                 ; $1ED9B7 |
  STA $0790                                 ; $1ED9BA |
  STA $0797                                 ; $1ED9BD |
  LDA #$00                                  ; $1ED9C0 |
  STA $079E                                 ; $1ED9C2 |
  LDY $23                                   ; $1ED9C5 |
  JSR code_1ED7A3                           ; $1ED9C7 |
  JSR code_1ED6C0                           ; $1ED9CA |
  LDX #$03                                  ; $1ED9CD |
code_1ED9CF:
  LDA $05E0,x                               ; $1ED9CF |
  STA $0783,x                               ; $1ED9D2 |
  LDA $05E4,x                               ; $1ED9D5 |
  STA $078A,x                               ; $1ED9D8 |
  LDA $05E8,x                               ; $1ED9DB |
  STA $0791,x                               ; $1ED9DE |
  LDA $05EC,x                               ; $1ED9E1 |
  STA $0798,x                               ; $1ED9E4 |
  DEX                                       ; $1ED9E7 |
  BPL code_1ED9CF                           ; $1ED9E8 |
  LDA $10                                   ; $1ED9EA |
  STA $079F                                 ; $1ED9EC |
  STX $07A0                                 ; $1ED9EF |
  LDA $22                                   ; $1ED9F2 |
  AND #$3F                                  ; $1ED9F4 |
  CMP #$38                                  ; $1ED9F6 |
  BCC code_1EDA05                           ; $1ED9F8 |
  LDX #$04                                  ; $1ED9FA |
code_1ED9FC:
  LDA $079C,x                               ; $1ED9FC |
  STA $078E,x                               ; $1ED9FF |
  DEX                                       ; $1EDA02 |
  BPL code_1ED9FC                           ; $1EDA03 |
code_1EDA05:
  STX $19                                   ; $1EDA05 |
  RTS                                       ; $1EDA07 |

code_1EDA08:
  LDA #$00                                  ; $1EDA08 |
  STA $1E                                   ; $1EDA0A |
  LDA $10                                   ; $1EDA0C |
  ORA #$03                                  ; $1EDA0E |
  STA $0780                                 ; $1EDA10 |
  LDA #$C0                                  ; $1EDA13 |
  STA $0781                                 ; $1EDA15 |
  LDY #$3F                                  ; $1EDA18 |
  STY $0782                                 ; $1EDA1A |
code_1EDA1D:
  LDA $0680,y                               ; $1EDA1D |
  STA $0783,y                               ; $1EDA20 |
  LDA #$00                                  ; $1EDA23 |
  STA $0680,y                               ; $1EDA25 |
  DEY                                       ; $1EDA28 |
  BPL code_1EDA1D                           ; $1EDA29 |
  STY $07C3                                 ; $1EDA2B |
  STY $19                                   ; $1EDA2E |
code_1EDA30:
  RTS                                       ; $1EDA30 |

code_1EDA31:
  LDA #$04                                  ; $1EDA31 |
  STA $10                                   ; $1EDA33 |
  LDA $2C                                   ; $1EDA35 |
  BEQ code_1EDA3B                           ; $1EDA37 |
  ASL $10                                   ; $1EDA39 |
code_1EDA3B:
  LDA $10                                   ; $1EDA3B |
  ORA #$20                                  ; $1EDA3D |
  STA $10                                   ; $1EDA3F |
  LDA $19                                   ; $1EDA41 |
  ORA $1A                                   ; $1EDA43 |
  BNE code_1EDA30                           ; $1EDA45 |
code_1EDA47:
  LDA $1E                                   ; $1EDA47 |
  BEQ code_1EDA30                           ; $1EDA49 |
  CMP #$40                                  ; $1EDA4B |
  BEQ code_1EDA08                           ; $1EDA4D |
  AND #$7F                                  ; $1EDA4F |
  STA $1E                                   ; $1EDA51 |
  LDY $23                                   ; $1EDA53 |
  JSR code_1ED7A3                           ; $1EDA55 |
  LDA $1E                                   ; $1EDA58 |
  STA $22                                   ; $1EDA5A |
  PHA                                       ; $1EDA5C |
  AND #$07                                  ; $1EDA5D |
  ASL                                       ; $1EDA5F |
  ASL                                       ; $1EDA60 |
  STA $0781                                 ; $1EDA61 |
  LDA #$02                                  ; $1EDA64 |
  STA $0780                                 ; $1EDA66 |
  PLA                                       ; $1EDA69 |
  AND #$F8                                  ; $1EDA6A |
  ASL                                       ; $1EDA6C |
  ROL $0780                                 ; $1EDA6D |
  ASL                                       ; $1EDA70 |
  ROL $0780                                 ; $1EDA71 |
  ASL                                       ; $1EDA74 |
  ROL $0780                                 ; $1EDA75 |
  ASL                                       ; $1EDA78 |
  ROL $0780                                 ; $1EDA79 |
  ORA $0781                                 ; $1EDA7C |
  STA $0781                                 ; $1EDA7F |
  CLC                                       ; $1EDA82 |
  ADC #$20                                  ; $1EDA83 |
  STA $0794                                 ; $1EDA85 |
  ADC #$20                                  ; $1EDA88 |
  STA $07A7                                 ; $1EDA8A |
  ADC #$20                                  ; $1EDA8D |
  STA $07BA                                 ; $1EDA8F |
  LDA $0780                                 ; $1EDA92 |
  ORA $10                                   ; $1EDA95 |
  STA $0780                                 ; $1EDA97 |
  STA $0793                                 ; $1EDA9A |
  STA $07A6                                 ; $1EDA9D |
  STA $07B9                                 ; $1EDAA0 |
  LDA #$0F                                  ; $1EDAA3 |
  STA $0782                                 ; $1EDAA5 |
  STA $0795                                 ; $1EDAA8 |
  STA $07A8                                 ; $1EDAAB |
  STA $07BB                                 ; $1EDAAE |
code_1EDAB1:
  JSR code_1ED6C0                           ; $1EDAB1 |
  LDA $22                                   ; $1EDAB4 |
  AND #$03                                  ; $1EDAB6 |
  TAX                                       ; $1EDAB8 |
  LDY $DAF8,x                               ; $1EDAB9 |
  LDX #$00                                  ; $1EDABC |
code_1EDABE:
  LDA $05E0,x                               ; $1EDABE |
  STA $0780,y                               ; $1EDAC1 |
  INY                                       ; $1EDAC4 |
  INX                                       ; $1EDAC5 |
  TXA                                       ; $1EDAC6 |
  AND #$03                                  ; $1EDAC7 |
  BNE code_1EDABE                           ; $1EDAC9 |
  TYA                                       ; $1EDACB |
  CLC                                       ; $1EDACC |
  ADC #$0F                                  ; $1EDACD |
  PHA                                       ; $1EDACF |
  LDY $22                                   ; $1EDAD0 |
  LDA $10                                   ; $1EDAD2 |
  STA $0680,y                               ; $1EDAD4 |
  PLA                                       ; $1EDAD7 |
  TAY                                       ; $1EDAD8 |
  CPY #$4C                                  ; $1EDAD9 |
  BCC code_1EDABE                           ; $1EDADB |
  INC $1E                                   ; $1EDADD |
  INC $22                                   ; $1EDADF |
  LDA $22                                   ; $1EDAE1 |
  AND #$03                                  ; $1EDAE3 |
  BNE code_1EDAB1                           ; $1EDAE5 |
  LDA #$FF                                  ; $1EDAE7 |
  STA $07CC                                 ; $1EDAE9 |
  LDY $22                                   ; $1EDAEC |
  CPY #$39                                  ; $1EDAEE |
  BCC code_1EDAF5                           ; $1EDAF0 |
  STA $07A6                                 ; $1EDAF2 |
code_1EDAF5:
  STA $19                                   ; $1EDAF5 |
  RTS                                       ; $1EDAF7 |

  db $03, $07, $0B, $0F                     ; $1EDAF8 |

code_1EDAFC:
  LDA $F5                                   ; $1EDAFC |
  PHA                                       ; $1EDAFE |
  LDA $F6                                   ; $1EDAFF |
  PHA                                       ; $1EDB01 |
  LDA #$3F                                  ; $1EDB02 |
  STA $22                                   ; $1EDB04 |
code_1EDB06:
  LDA $10                                   ; $1EDB06 |
  PHA                                       ; $1EDB08 |
  JSR code_1ED95D                           ; $1EDB09 |
  PLA                                       ; $1EDB0C |
  STA $10                                   ; $1EDB0D |
  JSR code_1EC298                           ; $1EDB0F |
  DEC $22                                   ; $1EDB12 |
  BPL code_1EDB06                           ; $1EDB14 |
  LDA #$00                                  ; $1EDB16 |
  STA $22                                   ; $1EDB18 |
  PLA                                       ; $1EDB1A |
  STA $F6                                   ; $1EDB1B |
  PLA                                       ; $1EDB1D |
  STA $F5                                   ; $1EDB1E |
  JMP select_PRG_banks                      ; $1EDB20 |

code_1EDB23:
  LDA $F5                                   ; $1EDB23 |
  PHA                                       ; $1EDB25 |
  LDA $F6                                   ; $1EDB26 |
  PHA                                       ; $1EDB28 |
  LDA #$80                                  ; $1EDB29 |
  STA $1E                                   ; $1EDB2B |
code_1EDB2D:
  LDA $10                                   ; $1EDB2D |
  PHA                                       ; $1EDB2F |
  JSR code_1EDA47                           ; $1EDB30 |
  PLA                                       ; $1EDB33 |
  STA $10                                   ; $1EDB34 |
  JSR async_next_frame                      ; $1EDB36 |
  LDA $1E                                   ; $1EDB39 |
  BNE code_1EDB2D                           ; $1EDB3B |
  PLA                                       ; $1EDB3D |
  STA $F6                                   ; $1EDB3E |
  PLA                                       ; $1EDB40 |
  STA $F5                                   ; $1EDB41 |
  JMP select_PRG_banks                      ; $1EDB43 |

; subsystem 1, global
; never is turned off or changed
; handles some miscellaneous junk
; like RNG
subsystem_1:
  LDX #$AF                                  ; $1EDB46 | stack hack
  TXS                                       ; $1EDB48 |
.loop:
  LDX #$00                                  ; $1EDB49 | RNG index
  LDY #$04                                  ; $1EDB4B | RNG loop counter
  LDA $E4,x                                 ; $1EDB4D |\
  AND #$02                                  ; $1EDB4F | | take second to lowest bit
  STA $00                                   ; $1EDB51 | | of $E4 and $E5
  LDA $E5,x                                 ; $1EDB53 | | XOR them together
  AND #$02                                  ; $1EDB55 | |
  EOR $00                                   ; $1EDB57 |/
  CLC                                       ; $1EDB59 |\  if both bits are on or both off,
  BEQ .loop_RNG                             ; $1EDB5A | | carry cleared for rotate
  SEC                                       ; $1EDB5C |/  else carry set for rotate
.loop_RNG:
  ROR $E4,x                                 ; $1EDB5D | rotate right with random carry
  INX                                       ; $1EDB5F |\
  DEY                                       ; $1EDB60 | | rotate all 4 RNG addresses
  BNE .loop_RNG                             ; $1EDB61 |/  $E4~$E7
  JSR code_1EDB6C                           ; $1EDB63 |
  JSR async_next_frame                      ; $1EDB66 |\ async gameloop
  JMP .loop                                 ; $1EDB69 |/

code_1EDB6C:
  LDA $19                                   ; $1EDB6C |
  ORA $1A                                   ; $1EDB6E |
  ORA $1B                                   ; $1EDB70 |
  BNE code_1EDBD0                           ; $1EDB72 |
  LDA #$03                                  ; $1EDB74 |
  STA $AB                                   ; $1EDB76 |
  LDA $18                                   ; $1EDB78 |
  AND #$01                                  ; $1EDB7A |
  STA $01                                   ; $1EDB7C |
  LDA #$00                                  ; $1EDB7E |
  STA $18                                   ; $1EDB80 |
code_1EDB82:
  LDX $AB                                   ; $1EDB82 |
  LDA $05F0,x                               ; $1EDB84 |
  BPL code_1EDB8F                           ; $1EDB87 |
  AND #$7F                                  ; $1EDB89 |
  TAY                                       ; $1EDB8B |
  JSR code_1EDBD1                           ; $1EDB8C |
code_1EDB8F:
  DEC $AB                                   ; $1EDB8F |
  BPL code_1EDB82                           ; $1EDB91 |
  LDA $01                                   ; $1EDB93 |
  STA $18                                   ; $1EDB95 |
  LDA $05D0                                 ; $1EDB97 |
  BPL code_1EDBD0                           ; $1EDB9A |
  AND #$7F                                  ; $1EDB9C |
  TAX                                       ; $1EDB9E |
  LDY $DDB3,x                               ; $1EDB9F |
  LDA $05D2                                 ; $1EDBA2 |
  INC $05D2                                 ; $1EDBA5 |
  CMP $DDBC,y                               ; $1EDBA8 |
  BNE code_1EDBD0                           ; $1EDBAB |
  LDA #$00                                  ; $1EDBAD |
  STA $05D2                                 ; $1EDBAF |
  LDA $05D1                                 ; $1EDBB2 |
  INC $05D1                                 ; $1EDBB5 |
  CMP $DDBB,y                               ; $1EDBB8 |
  BNE code_1EDBC2                           ; $1EDBBB |
  LDA #$00                                  ; $1EDBBD |
  STA $05D1                                 ; $1EDBBF |
code_1EDBC2:
  LDX $DDBD,y                               ; $1EDBC2 |
  TYA                                       ; $1EDBC5 |
  CLC                                       ; $1EDBC6 |
  ADC $05D1                                 ; $1EDBC7 |
  TAY                                       ; $1EDBCA |
  LDA $DDBE,y                               ; $1EDBCB |
  STA $EA,x                                 ; $1EDBCE |
code_1EDBD0:
  RTS                                       ; $1EDBD0 |

code_1EDBD1:
  LDA $DD01,y                               ; $1EDBD1 |
  TAY                                       ; $1EDBD4 |
  LDA $05F8,x                               ; $1EDBD5 |
  INC $05F8,x                               ; $1EDBD8 |
  CMP $DD22,y                               ; $1EDBDB |
  BNE code_1EDC1F                           ; $1EDBDE |
  LDA #$00                                  ; $1EDBE0 |
  STA $05F8,x                               ; $1EDBE2 |
  LDA $05F4,x                               ; $1EDBE5 |
  INC $05F4,x                               ; $1EDBE8 |
  CMP $DD21,y                               ; $1EDBEB |
  BNE code_1EDBF5                           ; $1EDBEE |
  LDA #$00                                  ; $1EDBF0 |
  STA $05F4,x                               ; $1EDBF2 |
code_1EDBF5:
  TYA                                       ; $1EDBF5 |
  CLC                                       ; $1EDBF6 |
  ADC $05F4,x                               ; $1EDBF7 |
  TAX                                       ; $1EDBFA |
  LDA $DD23,x                               ; $1EDBFB |
  BEQ code_1EDC20                           ; $1EDBFE |
  ASL                                       ; $1EDC00 |
  ADC $DD23,x                               ; $1EDC01 |
  TAX                                       ; $1EDC04 |
  LDA $AB                                   ; $1EDC05 |
  ASL                                       ; $1EDC07 |
  ASL                                       ; $1EDC08 |
  TAY                                       ; $1EDC09 |
  LDA #$03                                  ; $1EDC0A |
  STA $00                                   ; $1EDC0C |
code_1EDC0E:
  LDA $DC26,x                               ; $1EDC0E |
  STA $0601,y                               ; $1EDC11 |
  STA $0621,y                               ; $1EDC14 |
  INY                                       ; $1EDC17 |
  INX                                       ; $1EDC18 |
  DEC $00                                   ; $1EDC19 |
  BNE code_1EDC0E                           ; $1EDC1B |
  INC $01                                   ; $1EDC1D |
code_1EDC1F:
  RTS                                       ; $1EDC1F |

code_1EDC20:
  LDX $AB                                   ; $1EDC20 |
  STA $05F0,x                               ; $1EDC22 |
  RTS                                       ; $1EDC25 |

  db $00, $00, $00, $06, $1B, $0B, $16, $1B ; $1EDC26 |
  db $0B, $26, $1B, $0B, $20, $01, $15, $30 ; $1EDC2E |
  db $3C, $2C, $30, $30, $3C, $30, $30, $30 ; $1EDC36 |
  db $20, $01, $01, $20, $1C, $11, $20, $01 ; $1EDC3E |
  db $1C, $20, $11, $25, $0F, $14, $04, $17 ; $1EDC46 |
  db $14, $04, $27, $14, $04, $29, $19, $09 ; $1EDC4E |
  db $19, $09, $29, $09, $29, $19, $20, $11 ; $1EDC56 |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $1EDC5E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1EDC66 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1EDC6E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1EDC76 |
  db $00, $00, $20, $2C, $1C, $2C, $20, $1C ; $1EDC7E |
  db $20, $10, $11, $10, $00, $01, $00, $0F ; $1EDC86 |
  db $0F, $20, $1C, $21, $10, $0C, $11, $00 ; $1EDC8E |
  db $0F, $01, $10, $1C, $0C, $00, $0C, $0F ; $1EDC96 |
  db $0F, $0F, $0F, $21, $11, $01, $11, $01 ; $1EDC9E |
  db $21, $01, $21, $11, $11, $31, $21, $31 ; $1EDCA6 |
  db $21, $11, $21, $11, $31, $13, $01, $0F ; $1EDCAE |
  db $13, $01, $0A, $36, $1B, $0B, $37, $18 ; $1EDCB6 |
  db $08, $27, $18, $08, $07, $18, $08, $13 ; $1EDCBE |
  db $01, $1A, $0F, $21, $09, $06, $0F, $29 ; $1EDCC6 |
  db $30, $00, $05, $30, $00, $0F, $31, $1C ; $1EDCCE |
  db $27, $31, $1C, $0F, $26, $11, $0F, $27 ; $1EDCD6 |
  db $26, $06, $26, $06, $27, $06, $27, $26 ; $1EDCDE |
  db $3C, $2C, $20, $20, $3C, $2C, $2C, $20 ; $1EDCE6 |
  db $3C, $1C, $10, $2C, $2C, $1C, $10, $10 ; $1EDCEE |
  db $2C, $1C, $25, $04, $0F, $04, $0F, $25 ; $1EDCF6 |
  db $0F, $25, $04, $00, $06, $0C, $12, $18 ; $1EDCFE |
  db $1E, $1E, $1E, $1E, $1E, $22, $29, $30 ; $1EDD06 |
  db $36, $3D, $44, $4A, $4F, $54, $5A, $5F ; $1EDD0E |
  db $65, $69, $6D, $73, $78, $7D, $82, $87 ; $1EDD16 |
  db $8C, $92, $92, $03, $08, $01, $02, $03 ; $1EDD1E |
  db $31, $03, $08, $05, $06, $07, $06, $03 ; $1EDD26 |
  db $08, $08, $12, $09, $0A, $03, $08, $0C ; $1EDD2E |
  db $0D, $0E, $0D, $03, $08, $09, $0A, $08 ; $1EDD36 |
  db $12, $01, $0B, $1E, $1F, $04, $08, $20 ; $1EDD3E |
  db $21, $22, $28, $00, $04, $08, $23, $24 ; $1EDD46 |
  db $25, $28, $00, $03, $08, $26, $27, $28 ; $1EDD4E |
  db $00, $04, $08, $28, $22, $21, $20, $00 ; $1EDD56 |
  db $04, $08, $28, $25, $24, $23, $00, $03 ; $1EDD5E |
  db $08, $28, $27, $26, $00, $02, $06, $29 ; $1EDD66 |
  db $2A, $2B, $02, $04, $2C, $2D, $2E, $03 ; $1EDD6E |
  db $08, $2F, $30, $35, $30, $02, $08, $32 ; $1EDD76 |
  db $33, $34, $03, $08, $04, $0B, $09, $0A ; $1EDD7E |
  db $01, $08, $38, $39, $01, $08, $3A, $3B ; $1EDD86 |
  db $03, $08, $09, $0A, $04, $0B, $02, $08 ; $1EDD8E |
  db $0F, $10, $11, $02, $08, $36, $37, $3C ; $1EDD96 |
  db $02, $08, $3D, $3E, $3F, $02, $08, $40 ; $1EDD9E |
  db $41, $42, $02, $08, $43, $44, $45, $03 ; $1EDDA6 |
  db $08, $46, $47, $48, $47, $00, $06, $0B ; $1EDDAE |
  db $11, $16, $1C, $21, $26, $02, $04, $01 ; $1EDDB6 |
  db $8E, $FC, $FE, $01, $04, $01, $8E, $FC ; $1EDDBE |
  db $02, $04, $00, $A4, $70, $72, $01, $04 ; $1EDDC6 |
  db $00, $B0, $6C, $02, $04, $00, $A4, $70 ; $1EDDCE |
  db $72, $01, $10, $01, $9A, $6E, $01, $08 ; $1EDDD6 |
  db $01, $EE, $6A, $03, $05, $00, $80, $F4 ; $1EDDDE |
  db $F6, $F2                               ; $1EDDE6 |

  LDX #$8F                                  ; $1EDDE8 |
  TXS                                       ; $1EDDEA |
  LDA #$40                                  ; $1EDDEB |
  STA $A1                                   ; $1EDDED |
  CLI                                       ; $1EDDEF |
  LDA #$01                                  ; $1EDDF0 |
  STA $96                                   ; $1EDDF2 |
  LDA #subsystem_1>>8                       ; $1EDDF4 |\
  STA $94                                   ; $1EDDF6 | | init global subsystem 1
  LDA #subsystem_1                          ; $1EDDF8 | |
  STA $93                                   ; $1EDDFA | |
  LDA #$01                                  ; $1EDDFC | |
  JSR init_subsystem                        ; $1EDDFE |/
  LDA #$00                                  ; $1EDE01 |
  STA $F9                                   ; $1EDE03 |
  STA $29                                   ; $1EDE05 |
  STA {x_position_low}                      ; $1EDE07 |
  STA {x_position_high}                     ; $1EDE0A |
  STA {y_position_low}                      ; $1EDE0D |
  STA {y_position_high}                     ; $1EDE10 |
  STA $95                                   ; $1EDE13 |
  LDA #$17                                  ; $1EDE15 |
  STA $F5                                   ; $1EDE17 |
  LDA #$0C                                  ; $1EDE19 |
  STA $F6                                   ; $1EDE1B |
  JSR select_PRG_banks                      ; $1EDE1D |
  JSR $8000                                 ; $1EDE20 |
  LDX #$00                                  ; $1EDE23 |
  STX $14                                   ; $1EDE25 |
  STX $15                                   ; $1EDE27 |
  STX $16                                   ; $1EDE29 |
  STX $17                                   ; $1EDE2B |
  LDA #$1A                                  ; $1EDE2D |
  JSR code_1FEA98                           ; $1EDE2F |
  JSR reset_vertical_speed                  ; $1EDE32 |
  LDA #$01                                  ; $1EDE35 |
  STA {entity_type}                         ; $1EDE37 |
  LDA #$80                                  ; $1EDE3A |
  STA {entity_display_flags}                ; $1EDE3C |
  STA {x_position_low}                      ; $1EDE3F |
  STA {y_position_low}                      ; $1EDE42 |
  JSR code_1ED311                           ; $1EDE45 |
  LDA $BD                                   ; $1EDE48 |
  ORA #$80                                  ; $1EDE4A |
  STA $BD                                   ; $1EDE4C |
  LDA $BE                                   ; $1EDE4E |
  ORA #$80                                  ; $1EDE50 |
  STA $BE                                   ; $1EDE52 |
  LDA #$80                                  ; $1EDE54 |
  STA $2D                                   ; $1EDE56 |
  LDA #$9C                                  ; $1EDE58 |
  STA $B0                                   ; $1EDE5A |
  LDA #$08                                  ; $1EDE5C |
  STA $30                                   ; $1EDE5E |
  LDA #$DE                                  ; $1EDE60 |
  STA $94                                   ; $1EDE62 |
  LDA #$70                                  ; $1EDE64 |
  STA $93                                   ; $1EDE66 |
  LDA #$00                                  ; $1EDE68 |
  JSR init_subsystem                        ; $1EDE6A |
  JMP kill_current_subsystem                ; $1EDE6D |

  LDX #$DF                                  ; $1EDE70 |
  TXS                                       ; $1EDE72 |
code_1EDE73:
  LDA $15                                   ; $1EDE73 |
  AND #$02                                  ; $1EDE75 |
  BEQ code_1EDE7F                           ; $1EDE77 |
  LDA $A0                                   ; $1EDE79 |
  EOR #$01                                  ; $1EDE7B |
  STA $A0                                   ; $1EDE7D |
code_1EDE7F:
  LDA $A0                                   ; $1EDE7F |
  BEQ code_1EDE89                           ; $1EDE81 |
  JSR async_next_frame                      ; $1EDE83 |
  JMP code_1EDE73                           ; $1EDE86 |

code_1EDE89:
  LDA $30                                   ; $1EDE89 |
  CMP #$04                                  ; $1EDE8B |
  BCS code_1EDEAC                           ; $1EDE8D |
  LDA $54                                   ; $1EDE8F |
  BNE code_1EDEAC                           ; $1EDE91 |
  LDA $14                                   ; $1EDE93 |
  AND #$10                                  ; $1EDE95 |
  BEQ code_1EDEAC                           ; $1EDE97 |
  LDA #$01                                  ; $1EDE99 |
  STA $F5                                   ; $1EDE9B |
  LDA #$08                                  ; $1EDE9D |
  STA $F6                                   ; $1EDE9F |
  JSR select_PRG_banks                      ; $1EDEA1 |
  LDA #$29                                  ; $1EDEA4 |
  JSR code_1FEC5D                           ; $1EDEA6 |
  JSR $8000                                 ; $1EDEA9 |
code_1EDEAC:
  LDA #$1B                                  ; $1EDEAC |
  JSR select_PRG_banks_A                    ; $1EDEAE |
  JSR $8000                                 ; $1EDEB1 |
  LDA #$1C                                  ; $1EDEB4 |
  JSR select_PRG_banks_A                    ; $1EDEB6 |
  JSR $8000                                 ; $1EDEB9 |
  LDA $26                                   ; $1EDEBC |
  STA $F6                                   ; $1EDEBE |
  JSR select_PRG_banks                      ; $1EDEC0 |
  JSR code_1EC9DD                           ; $1EDEC3 |
  LDA #$1B                                  ; $1EDEC6 |
  STA $F5                                   ; $1EDEC8 |
  LDA $26                                   ; $1EDECA |
  STA $F6                                   ; $1EDECC |
  JSR select_PRG_banks                      ; $1EDECE |
  JSR $988A                                 ; $1EDED1 |
  JSR code_1EDA31                           ; $1EDED4 |
  LDA $FC                                   ; $1EDED7 |
  STA $44                                   ; $1EDED9 |
  LDA $FA                                   ; $1EDEDB |
  STA $45                                   ; $1EDEDD |
  LDA {y_position_low}                      ; $1EDEDF |
  STA $3E                                   ; $1EDEE2 |
  LDA {y_position_high}                     ; $1EDEE4 |
  STA $3F                                   ; $1EDEE7 |
  LDA {x_position_low}                      ; $1EDEE9 |
  STA $3C                                   ; $1EDEEC |
  LDA {x_position_high}                     ; $1EDEEE |\ store "live" screen number
  STA $3D                                   ; $1EDEF1 |/ -> current screen number
  CMP $69                                   ; $1EDEF3 |
  BCC code_1EDEF9                           ; $1EDEF5 |
  STA $69                                   ; $1EDEF7 |
code_1EDEF9:
  LDA $26                                   ; $1EDEF9 |
  BNE code_1EDF1A                           ; $1EDEFB |
  LDA $FC                                   ; $1EDEFD |
  LSR                                       ; $1EDEFF |
  AND #$03                                  ; $1EDF00 |
  TAY                                       ; $1EDF02 |
  LDA $29                                   ; $1EDF03 |
  AND #$1F                                  ; $1EDF05 |
  TAX                                       ; $1EDF07 |
  LDA $DF53,x                               ; $1EDF08 |
  BNE code_1EDF15                           ; $1EDF0B |
  LDA $9D                                   ; $1EDF0D |
  LSR                                       ; $1EDF0F |
  LSR                                       ; $1EDF10 |
  LSR                                       ; $1EDF11 |
  AND #$03                                  ; $1EDF12 |
  TAY                                       ; $1EDF14 |
code_1EDF15:
  LDA $DF4F,y                               ; $1EDF15 |
  STA $EA                                   ; $1EDF18 |
code_1EDF1A:
  LDA #$04                                  ; $1EDF1A |
  STA $9F                                   ; $1EDF1C |
  JSR code_1EC38F                           ; $1EDF1E |
  JSR code_1EDF5E                           ; $1EDF21 |
  LDA #$00                                  ; $1EDF24 |
  STA $95                                   ; $1EDF26 |
  STA $73                                   ; $1EDF28 |
  LDA $15                                   ; $1EDF2A |
  AND #$01                                  ; $1EDF2C |
  BEQ code_1EDF47                           ; $1EDF2E |
  LDA $EC                                   ; $1EDF30 |
  PHA                                       ; $1EDF32 |
  LDA $ED                                   ; $1EDF33 |
  PHA                                       ; $1EDF35 |
  LDA #$C2                                  ; $1EDF36 |
  STA $EC                                   ; $1EDF38 |
  LDA #$C3                                  ; $1EDF3A |
  STA $ED                                   ; $1EDF3C |
  JSR code_1FE4A6                           ; $1EDF3E |
  PLA                                       ; $1EDF41 |
  STA $ED                                   ; $1EDF42 |
  PLA                                       ; $1EDF44 |
  STA $EC                                   ; $1EDF45 |
code_1EDF47:
  JSR async_next_frame                      ; $1EDF47 |
  INC $95                                   ; $1EDF4A |
  JMP code_1EDE73                           ; $1EDF4C |

  db $80, $F4, $F6, $F2, $00, $00, $FF, $FF ; $1EDF4F |
  db $00, $00, $00, $00, $00, $00, $00      ; $1EDF57 |

code_1EDF5E:
  LDA #$FF                                  ; $1EDF5E |
  STA $EC                                   ; $1EDF60 |
  STA $EE                                   ; $1EDF62 |
  STA $EF                                   ; $1EDF64 |
  LDA $74                                   ; $1EDF66 |
  BEQ code_1EDF71                           ; $1EDF68 |
  JSR code_1FE2E7                           ; $1EDF6A |
  LDA #$28                                  ; $1EDF6D |
  STA $EE                                   ; $1EDF6F |
code_1EDF71:
  INC $9D                                   ; $1EDF71 |
  LDA $9D                                   ; $1EDF73 |
  LSR                                       ; $1EDF75 |
  BCS code_1EDF91                           ; $1EDF76 |
  JSR code_1FE260                           ; $1EDF78 |
  LDX #$00                                  ; $1EDF7B |
  STX $9E                                   ; $1EDF7D |
code_1EDF7F:
  LDA {entity_type},x                       ; $1EDF7F |
  BEQ code_1EDF87                           ; $1EDF82 |
  JSR code_1EDFC3                           ; $1EDF84 |
code_1EDF87:
  INC $9E                                   ; $1EDF87 |
  LDX $9E                                   ; $1EDF89 |
  CPX #$18                                  ; $1EDF8B |
  BNE code_1EDF7F                           ; $1EDF8D |
  BEQ code_1EDFB8                           ; $1EDF8F |
code_1EDF91:
  LDX $56                                   ; $1EDF91 |
  LDA {entity_type},x                       ; $1EDF93 |
  PHA                                       ; $1EDF96 |
  CMP #$6E                                  ; $1EDF97 |
  BNE code_1EDF9E                           ; $1EDF99 |
  JSR code_1FE260                           ; $1EDF9B |
code_1EDF9E:
  LDX #$17                                  ; $1EDF9E |
  STX $9E                                   ; $1EDFA0 |
code_1EDFA2:
  LDA {entity_type},x                       ; $1EDFA2 |
  BEQ code_1EDFAA                           ; $1EDFA5 |
  JSR code_1EDFC3                           ; $1EDFA7 |
code_1EDFAA:
  DEC $9E                                   ; $1EDFAA |
  LDX $9E                                   ; $1EDFAC |
  BPL code_1EDFA2                           ; $1EDFAE |
  PLA                                       ; $1EDFB0 |
  CMP #$6E                                  ; $1EDFB1 |
  BEQ code_1EDFB8                           ; $1EDFB3 |
  JSR code_1FE270                           ; $1EDFB5 |
code_1EDFB8:
  LDA $EF                                   ; $1EDFB8 |
  BPL code_1EDFC2                           ; $1EDFBA |
  LDA $EE                                   ; $1EDFBC |
  STA $EF                                   ; $1EDFBE |
  INC $EF                                   ; $1EDFC0 |
code_1EDFC2:
  RTS                                       ; $1EDFC2 |

code_1EDFC3:
  LDA {entity_display_flags},x              ; $1EDFC3 |
  AND #$7F                                  ; $1EDFC6 |
  STA {entity_display_flags},x              ; $1EDFC8 |
  LDA {x_position_low},x                    ; $1EDFCB |
  SEC                                       ; $1EDFCE |
  SBC $FC                                   ; $1EDFCF |
  STA $13                                   ; $1EDFD1 |
  LDA {x_position_high},x                   ; $1EDFD3 |
  SBC $F9                                   ; $1EDFD6 |
  BEQ code_1EDFF9                           ; $1EDFD8 |
  LDA {entity_display_flags},x              ; $1EDFDA |
  AND #$08                                  ; $1EDFDD |
  BEQ $76                                   ; $1EDFDF |
  LDA $13                                   ; $1EDFE1 |
  BCS code_1EDFE9                           ; $1EDFE3 |
  EOR #$FF                                  ; $1EDFE5 |
  ADC #$01                                  ; $1EDFE7 |
code_1EDFE9:
  CMP #$30                                  ; $1EDFE9 |
  BCS $2A                                   ; $1EDFEB |
  LDA {y_position_high},x                   ; $1EDFED |
  BEQ code_1EDFF6                           ; $1EDFF0 |
  BPL $23                                   ; $1EDFF2 |
  BMI $17                                   ; $1EDFF4 |
code_1EDFF6:
  JMP code_1FE08F                           ; $1EDFF6 |

code_1EDFF9:
  LDA {y_position_low},x                    ; $1EDFF9 |
  STA $12                                   ; $1EDFFC |
  LDA {y_position_high},x                   ; $1EDFFE |

bank $1F
org $E000

  db $03
  BEQ code_1FE082                           ; $1FC001 |
  BPL code_1FE017                           ; $1FE003 |
  CPX #$00                                  ; $1FE005 |
  BNE code_1FE00D                           ; $1FE007 |
  LDA $AF                                   ; $1FE009 |
  BNE code_1FE01F                           ; $1FE00B |
code_1FE00D:
  LDA $12                                   ; $1FE00D |
  CMP #$80                                  ; $1FE00F |
  BCS code_1FE08F                           ; $1FE011 |
  CPX #$00                                  ; $1FE013 |
  BEQ code_1FE08F                           ; $1FE015 |
code_1FE017:
  CPX #$00                                  ; $1FE017 |
  BNE code_1FE057                           ; $1FE019 |
  LDA $AF                                   ; $1FE01B |
  BNE code_1FE08E                           ; $1FE01D |
code_1FE01F:
  LDA $17                                   ; $1FE01F |
  AND #$40                                  ; $1FE021 |
  BNE code_1FE042                           ; $1FE023 |
  LDA #$07                                  ; $1FE025 |
  CMP $30                                   ; $1FE027 |
  BEQ code_1FE08E                           ; $1FE029 |
  STA $30                                   ; $1FE02B |
  LDA #$2C                                  ; $1FE02D |
  STA {entity_var_a}                        ; $1FE02F |
  LDA #$01                                  ; $1FE032 |
  STA {entity_var_b}                        ; $1FE034 |
  LDA #$F0                                  ; $1FE037 |
  JSR code_1FEC5B                           ; $1FE039 |
  LDA #$1D                                  ; $1FE03C |
  JSR code_1FEC5D                           ; $1FE03E |
  RTS                                       ; $1FE041 |

code_1FE042:
  LDA #$00                                  ; $1FE042 |
  STA {y_speed_frac}                        ; $1FE044 |
  LDA $AF                                   ; $1FE047 |
  BNE code_1FE051                           ; $1FE049 |
  LDA #$0C                                  ; $1FE04B |
  STA {y_speed}                             ; $1FE04D |
  RTS                                       ; $1FE050 |

code_1FE051:
  LDA #$F4                                  ; $1FE051 |
  STA {y_speed}                             ; $1FE053 |
  RTS                                       ; $1FE056 |

code_1FE057:
  LDA {entity_type},x                       ; $1FE057 |
  CMP #$4A                                  ; $1FE05A |
  BEQ code_1FE08F                           ; $1FE05C |
  CMP #$4B                                  ; $1FE05E |
  BEQ code_1FE08F                           ; $1FE060 |
  CMP #$78                                  ; $1FE062 |
  BEQ code_1FE08F                           ; $1FE064 |
  CMP #$AB                                  ; $1FE066 |
  BEQ code_1FE08F                           ; $1FE068 |
  CMP #$BA                                  ; $1FE06A |
  BEQ code_1FE08F                           ; $1FE06C |
  LDA #$00                                  ; $1FE06E |
  STA {entity_handler_high},x               ; $1FE070 |
  STA {entity_type},x                       ; $1FE073 |
  STA {entity_flash_counter},x              ; $1FE076 |
  STA {entity_life},x                       ; $1FE079 |
  LDA #$FF                                  ; $1FE07C |
  STA $0438,x                               ; $1FE07E |
  RTS                                       ; $1FE081 |

code_1FE082:
  LDA {entity_display_flags},x              ; $1FE082 |
  ORA #$80                                  ; $1FE085 |
  STA {entity_display_flags},x              ; $1FE087 |
  AND #$04                                  ; $1FE08A |
  BEQ code_1FE08F                           ; $1FE08C |
code_1FE08E:
  RTS                                       ; $1FE08E |

code_1FE08F:
  LDY {entity_type},x                       ; $1FE08F |
  LDA $E33B,y                               ; $1FE092 |
  CMP $F5                                   ; $1FE095 |
  BEQ code_1FE09C                           ; $1FE097 |
  JSR select_PRG_banks_A                    ; $1FE099 |
code_1FE09C:
  LDA {entity_display_flags},x              ; $1FE09C |
  AND #$70                                  ; $1FE09F |
  ASL                                       ; $1FE0A1 |
  PHA                                       ; $1FE0A2 |
  AND #$C0                                  ; $1FE0A3 |
  STA $10                                   ; $1FE0A5 |
  PLA                                       ; $1FE0A7 |
  AND #$20                                  ; $1FE0A8 |
  STA $11                                   ; $1FE0AA |
  LDY {animation_index},x                   ; $1FE0AC |
  BEQ code_1FE08E                           ; $1FE0AF |
  LDA $8600,y                               ; $1FE0B1 |
  STA $00                                   ; $1FE0B4 |
  LDA $8700,y                               ; $1FE0B6 |
  STA $01                                   ; $1FE0B9 |
  LDY #$00                                  ; $1FE0BB |
  LDA ($00),y                               ; $1FE0BD |
  STA $02                                   ; $1FE0BF |
  AND #$7F                                  ; $1FE0C1 |
  STA $03                                   ; $1FE0C3 |
  LDA {entity_flash_counter},x              ; $1FE0C5 |
  BMI code_1FE0F0                           ; $1FE0C8 |
  LDA $5A                                   ; $1FE0CA |
  BNE code_1FE0F0                           ; $1FE0CC |
  LDA {animation_timer},x                   ; $1FE0CE |
  INC {animation_timer},x                   ; $1FE0D1 |
  LDY #$01                                  ; $1FE0D4 |
  CMP ($00),y                               ; $1FE0D6 |
  BNE code_1FE0F0                           ; $1FE0D8 |
  LDA #$00                                  ; $1FE0DA |
  STA {animation_timer},x                   ; $1FE0DC |
  LDA {animation_frame},x                   ; $1FE0DF |
  AND #$7F                                  ; $1FE0E2 |
  INC {animation_frame},x                   ; $1FE0E4 |
  CMP $03                                   ; $1FE0E7 |
  BNE code_1FE0F0                           ; $1FE0E9 |
  LDA #$00                                  ; $1FE0EB |
  STA {animation_frame},x                   ; $1FE0ED |
code_1FE0F0:
  LDA {entity_flash_counter},x              ; $1FE0F0 |
  AND #$7F                                  ; $1FE0F3 |
  STA {entity_flash_counter},x              ; $1FE0F5 |
  BEQ code_1FE133                           ; $1FE0F8 |
  DEC {entity_flash_counter},x              ; $1FE0FA |
  LDY {entity_type},x                       ; $1FE0FD |
  CPY #$44                                  ; $1FE100 |
  BEQ code_1FE128                           ; $1FE102 |
  CPY #$4F                                  ; $1FE104 |
  BEQ code_1FE128                           ; $1FE106 |
  CPY #$7C                                  ; $1FE108 |
  BEQ code_1FE128                           ; $1FE10A |
  CPY #$A0                                  ; $1FE10C |
  BEQ code_1FE128                           ; $1FE10E |
  CPY #$A5                                  ; $1FE110 |
  BEQ code_1FE128                           ; $1FE112 |
  CPY #$AA                                  ; $1FE114 |
  BEQ code_1FE128                           ; $1FE116 |
  CPX $56                                   ; $1FE118 |
  BNE code_1FE12F                           ; $1FE11A |
  LDY $2F                                   ; $1FE11C |
  BPL code_1FE12F                           ; $1FE11E |
  LSR                                       ; $1FE120 |
  LSR                                       ; $1FE121 |
  BCC code_1FE133                           ; $1FE122 |
  LDY #$54                                  ; $1FE124 |
  BNE code_1FE14E                           ; $1FE126 |
code_1FE128:
  LSR                                       ; $1FE128 |
  LSR                                       ; $1FE129 |
  JSR code_1FE208                           ; $1FE12A |
  BMI code_1FE133                           ; $1FE12D |
code_1FE12F:
  LSR                                       ; $1FE12F |
  LSR                                       ; $1FE130 |
  BCS code_1FE143                           ; $1FE131 |
code_1FE133:
  LDA {animation_frame},x                   ; $1FE133 |
  AND #$7F                                  ; $1FE136 |
  CLC                                       ; $1FE138 |
  ADC #$02                                  ; $1FE139 |
  TAY                                       ; $1FE13B |
  LDA ($00),y                               ; $1FE13C |
  BNE code_1FE144                           ; $1FE13E |
  JMP code_1FE057                           ; $1FE140 |

code_1FE143:
  RTS                                       ; $1FE143 |

code_1FE144:
  TAY                                       ; $1FE144 |
  LDA {entity_display_flags},x              ; $1FE145 |
  BPL code_1FE143                           ; $1FE148 |
  LDA $02                                   ; $1FE14A |
  BMI code_1FE15B                           ; $1FE14C |
code_1FE14E:
  LDA $8000,y                               ; $1FE14E |
  STA $02                                   ; $1FE151 |
  LDA $8200,y                               ; $1FE153 |
  STA $03                                   ; $1FE156 |
  JMP code_1FE165                           ; $1FE158 |

code_1FE15B:
  LDA $8100,y                               ; $1FE15B |
  STA $02                                   ; $1FE15E |
  LDA $8300,y                               ; $1FE160 |
  STA $03                                   ; $1FE163 |
code_1FE165:
  LDY #$03                                  ; $1FE165 |
  LDA ($02),y                               ; $1FE167 |
  ROL                                       ; $1FE169 |
  ROL                                       ; $1FE16A |
  ROL                                       ; $1FE16B |
  AND #$03                                  ; $1FE16C |
  CMP #$01                                  ; $1FE16E |
  BEQ code_1FE182                           ; $1FE170 |
  TAX                                       ; $1FE172 |
  LDY #$00                                  ; $1FE173 |
  LDA $EC,x                                 ; $1FE175 |
  BMI code_1FE17E                           ; $1FE177 |
  CMP ($02),y                               ; $1FE179 |
  BEQ code_1FE182                           ; $1FE17B |
  RTS                                       ; $1FE17D |

code_1FE17E:
  LDA ($02),y                               ; $1FE17E |
  STA $EC,x                                 ; $1FE180 |
code_1FE182:
  LDY #$01                                  ; $1FE182 |
  LDA ($02),y                               ; $1FE184 |
  STA $04                                   ; $1FE186 |
  INY                                       ; $1FE188 |
  LDA ($02),y                               ; $1FE189 |
  TAX                                       ; $1FE18B |
  LDA $8400,x                               ; $1FE18C |
  SEC                                       ; $1FE18F |
  SBC #$03                                  ; $1FE190 |
  STA $05                                   ; $1FE192 |
  LDA $8500,x                               ; $1FE194 |
  SBC #$00                                  ; $1FE197 |
  STA $06                                   ; $1FE199 |
  LDX $9F                                   ; $1FE19B |
  BEQ code_1FE1FF                           ; $1FE19D |
code_1FE19F:
  INY                                       ; $1FE19F |
  LDA ($02),y                               ; $1FE1A0 |
  STA $0201,x                               ; $1FE1A2 |
  LDA ($05),y                               ; $1FE1A5 |
  STA $07                                   ; $1FE1A7 |
  LDA $10                                   ; $1FE1A9 |
  BPL code_1FE1B4                           ; $1FE1AB |
  LDA #$F8                                  ; $1FE1AD |
  SEC                                       ; $1FE1AF |
  SBC $07                                   ; $1FE1B0 |
  STA $07                                   ; $1FE1B2 |
code_1FE1B4:
  LDA $12                                   ; $1FE1B4 |
  CLC                                       ; $1FE1B6 |
  ADC $07                                   ; $1FE1B7 |
  STA $0200,x                               ; $1FE1B9 |
  LDA $07                                   ; $1FE1BC |
  BMI code_1FE1C4                           ; $1FE1BE |
  BCC code_1FE1C6                           ; $1FE1C0 |
  BCS code_1FE200                           ; $1FE1C2 |
code_1FE1C4:
  BCC code_1FE200                           ; $1FE1C4 |
code_1FE1C6:
  INY                                       ; $1FE1C6 |
  LDA ($02),y                               ; $1FE1C7 |
  EOR $10                                   ; $1FE1C9 |
  ORA $11                                   ; $1FE1CB |
  STA $0202,x                               ; $1FE1CD |
  LDA ($05),y                               ; $1FE1D0 |
  STA $07                                   ; $1FE1D2 |
  LDA $10                                   ; $1FE1D4 |
  AND #$40                                  ; $1FE1D6 |
  BEQ code_1FE1E1                           ; $1FE1D8 |
  LDA #$F8                                  ; $1FE1DA |
  SEC                                       ; $1FE1DC |
  SBC $07                                   ; $1FE1DD |
  STA $07                                   ; $1FE1DF |
code_1FE1E1:
  LDA $13                                   ; $1FE1E1 |
  CLC                                       ; $1FE1E3 |
  ADC $07                                   ; $1FE1E4 |
  STA $0203,x                               ; $1FE1E6 |
  LDA $07                                   ; $1FE1E9 |
  BMI code_1FE1F1                           ; $1FE1EB |
  BCC code_1FE1F3                           ; $1FE1ED |
  BCS code_1FE201                           ; $1FE1EF |
code_1FE1F1:
  BCC code_1FE201                           ; $1FE1F1 |
code_1FE1F3:
  INX                                       ; $1FE1F3 |
  INX                                       ; $1FE1F4 |
  INX                                       ; $1FE1F5 |
  INX                                       ; $1FE1F6 |
  STX $9F                                   ; $1FE1F7 |
  BEQ code_1FE1FF                           ; $1FE1F9 |
code_1FE1FB:
  DEC $04                                   ; $1FE1FB |
  BPL code_1FE19F                           ; $1FE1FD |
code_1FE1FF:
  RTS                                       ; $1FE1FF |

code_1FE200:
  INY                                       ; $1FE200 |
code_1FE201:
  LDA #$F8                                  ; $1FE201 |
  STA $0200,x                               ; $1FE203 |
  BNE code_1FE1FB                           ; $1FE206 |
code_1FE208:
  ROR $05                                   ; $1FE208 |
  CPY #$4F                                  ; $1FE20A |
  BCS code_1FE237                           ; $1FE20C |
  LDY #$02                                  ; $1FE20E |
code_1FE210:
  LDA $0621,y                               ; $1FE210 |
  STA $0601,y                               ; $1FE213 |
  LDA $0625,y                               ; $1FE216 |
  STA $0605,y                               ; $1FE219 |
  LDA $0629,y                               ; $1FE21C |
  STA $0609,y                               ; $1FE21F |
  LDA $05                                   ; $1FE222 |
  BPL code_1FE231                           ; $1FE224 |
  LDA #$30                                  ; $1FE226 |
  STA $0601,y                               ; $1FE228 |
  STA $0605,y                               ; $1FE22B |
  STA $0609,y                               ; $1FE22E |
code_1FE231:
  DEY                                       ; $1FE231 |
  BPL code_1FE210                           ; $1FE232 |
  STY $18                                   ; $1FE234 |
  RTS                                       ; $1FE236 |

code_1FE237:
  LDY #$02                                  ; $1FE237 |
code_1FE239:
  LDA $0625,y                               ; $1FE239 |
  STA $0605,y                               ; $1FE23C |
  LDA $0629,y                               ; $1FE23F |
  STA $0609,y                               ; $1FE242 |
  LDA $062D,y                               ; $1FE245 |
  STA $060D,y                               ; $1FE248 |
  LDA $05                                   ; $1FE24B |
  BPL code_1FE25A                           ; $1FE24D |
  LDA #$30                                  ; $1FE24F |
  STA $0605,y                               ; $1FE251 |
  STA $0609,y                               ; $1FE254 |
  STA $060D,y                               ; $1FE257 |
code_1FE25A:
  DEY                                       ; $1FE25A |
  BPL code_1FE239                           ; $1FE25B |
  STY $18                                   ; $1FE25D |
  RTS                                       ; $1FE25F |

code_1FE260:
  LDX #$00                                  ; $1FE260 |
  STX $10                                   ; $1FE262 |
code_1FE264:
  JSR code_1FE27E                           ; $1FE264 |
  INC $10                                   ; $1FE267 |
  LDX $10                                   ; $1FE269 |
  CPX #$03                                  ; $1FE26B |
  BNE code_1FE264                           ; $1FE26D |
  RTS                                       ; $1FE26F |

code_1FE270:
  LDX #$02                                  ; $1FE270 |
  STX $10                                   ; $1FE272 |
code_1FE274:
  JSR code_1FE27E                           ; $1FE274 |
  DEC $10                                   ; $1FE277 |
  LDX $10                                   ; $1FE279 |
  BPL code_1FE274                           ; $1FE27B |
code_1FE27D:
  RTS                                       ; $1FE27D |

code_1FE27E:
  LDA $2D,x                                 ; $1FE27E |
  BPL code_1FE27D                           ; $1FE280 |
  AND #$7F                                  ; $1FE282 |
  TAY                                       ; $1FE284 |
  LDA $00B0,y                               ; $1FE285 |
  AND #$7F                                  ; $1FE288 |
  STA $00                                   ; $1FE28A |
  CPX #$02                                  ; $1FE28C |
  BNE code_1FE297                           ; $1FE28E |
  LDY $56                                   ; $1FE290 |
  LDA {entity_life},y                       ; $1FE292 |
  STA $00                                   ; $1FE295 |
code_1FE297:
  LDA $E2E1,x                               ; $1FE297 |
  STA $01                                   ; $1FE29A |
  LDA $E2E4,x                               ; $1FE29C |
  STA $02                                   ; $1FE29F |
  LDX $9F                                   ; $1FE2A1 |
  BEQ code_1FE2DE                           ; $1FE2A3 |
  LDA #$48                                  ; $1FE2A5 |
  STA $03                                   ; $1FE2A7 |
code_1FE2A9:
  LDA $03                                   ; $1FE2A9 |
  STA $0200,x                               ; $1FE2AB |
  LDA $02                                   ; $1FE2AE |
  STA $0203,x                               ; $1FE2B0 |
  LDA $01                                   ; $1FE2B3 |
  STA $0202,x                               ; $1FE2B5 |
  LDY #$04                                  ; $1FE2B8 |
  LDA $00                                   ; $1FE2BA |
  SEC                                       ; $1FE2BC |
  SBC #$04                                  ; $1FE2BD |
  BCS code_1FE2C5                           ; $1FE2BF |
  LDY $00                                   ; $1FE2C1 |
  LDA #$00                                  ; $1FE2C3 |
code_1FE2C5:
  STA $00                                   ; $1FE2C5 |
  TYA                                       ; $1FE2C7 |
  ORA #$60                                  ; $1FE2C8 |
  STA $0201,x                               ; $1FE2CA |
  INX                                       ; $1FE2CD |
  INX                                       ; $1FE2CE |
  INX                                       ; $1FE2CF |
  INX                                       ; $1FE2D0 |
  BEQ code_1FE2DE                           ; $1FE2D1 |
  LDA $03                                   ; $1FE2D3 |
  SEC                                       ; $1FE2D5 |
  SBC #$08                                  ; $1FE2D6 |
  STA $03                                   ; $1FE2D8 |
  CMP #$10                                  ; $1FE2DA |
  BNE code_1FE2A9                           ; $1FE2DC |
code_1FE2DE:
  STX $9F                                   ; $1FE2DE |
  RTS                                       ; $1FE2E0 |

  db $01, $00, $02, $18, $10, $28           ; $1FE2E1 |

code_1FE2E7:
  LDX #$00                                  ; $1FE2E7 |
code_1FE2E9:
  LDA $E313,x                               ; $1FE2E9 |
  SEC                                       ; $1FE2EC |
  SBC $76                                   ; $1FE2ED |
  BCS code_1FE2F3                           ; $1FE2EF |
  SBC #$0F                                  ; $1FE2F1 |
code_1FE2F3:
  STA $0200,x                               ; $1FE2F3 |
  LDA $E314,x                               ; $1FE2F6 |
  STA $0201,x                               ; $1FE2F9 |
  LDA $E315,x                               ; $1FE2FC |
  STA $0202,x                               ; $1FE2FF |
  LDA $E316,x                               ; $1FE302 |
  STA $0203,x                               ; $1FE305 |
  INX                                       ; $1FE308 |
  INX                                       ; $1FE309 |
  INX                                       ; $1FE30A |
  INX                                       ; $1FE30B |
  CPX #$28                                  ; $1FE30C |
  BNE code_1FE2E9                           ; $1FE30E |
  STX $9F                                   ; $1FE310 |
  RTS                                       ; $1FE312 |

  db $28, $A8, $21, $04, $58, $A8, $21, $04 ; $1FE313 |
  db $88, $A8, $21, $04, $B8, $A8, $21, $04 ; $1FE31B |
  db $E8, $A8, $21, $04, $28, $A8, $21, $F4 ; $1FE323 |
  db $58, $A8, $21, $F4, $88, $A8, $21, $F4 ; $1FE32B |
  db $B8, $A8, $21, $F4, $E8, $A8, $21, $F4 ; $1FE333 |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE33B |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE343 |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE34B |
  db $12, $12, $12, $12, $12, $12, $16, $12 ; $1FE353 |
  db $12, $12, $16, $12, $12, $12, $12, $12 ; $1FE35B |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE363 |
  db $12, $16, $16, $12, $12, $12, $16, $12 ; $1FE36B |
  db $12, $12, $12, $12, $12, $16, $12, $12 ; $1FE373 |
  db $12, $12, $16, $12, $12, $12, $12, $14 ; $1FE37B |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE383 |
  db $12, $12, $12, $12, $12, $12, $12, $14 ; $1FE38B |
  db $16, $14, $12, $12, $12, $12, $14, $12 ; $1FE393 |
  db $12, $12, $14, $16, $14, $14, $12, $12 ; $1FE39B |
  db $12, $14, $14, $14, $14, $14, $14, $14 ; $1FE3A3 |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE3AB |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE3B3 |
  db $14, $14, $14, $14, $14, $14, $14, $14 ; $1FE3BB |
  db $14, $14, $14, $14, $12, $14, $14, $14 ; $1FE3C3 |
  db $14, $14, $14, $14, $14, $14, $14, $14 ; $1FE3CB |
  db $14, $14, $14, $14, $14, $14, $14, $14 ; $1FE3D3 |
  db $14, $12, $12, $12, $12, $14, $14, $14 ; $1FE3DB |
  db $14, $14, $12, $14, $14, $12, $12, $12 ; $1FE3E3 |
  db $14, $12, $12, $14, $14, $14, $14, $14 ; $1FE3EB |
  db $12, $14, $14, $14, $12, $14, $14, $12 ; $1FE3F3 |
  db $12, $12, $12, $14, $12, $12, $12, $14 ; $1FE3FB |
  db $16, $12, $12, $12, $12, $12, $12, $12 ; $1FE403 |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE40B |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE413 |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE41B |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE423 |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE42B |
  db $12, $12, $12, $12, $12, $12, $12, $12 ; $1FE433 |

  LDX #$6F                                  ; $1FE43B |
  TXS                                       ; $1FE43D |
code_1FE43E:
  LDA $15                                   ; $1FE43E |
  AND #$04                                  ; $1FE440 |
  BEQ code_1FE455                           ; $1FE442 |
  LDA {entity_display_flags}                ; $1FE444 |
  EOR #$40                                  ; $1FE447 |
  STA {entity_display_flags}                ; $1FE449 |
  LDA $AF                                   ; $1FE44C |
  EOR #$01                                  ; $1FE44E |
  STA $AF                                   ; $1FE450 |
  JMP code_1FE490                           ; $1FE452 |

code_1FE455:
  LDA $15                                   ; $1FE455 |
  AND #$80                                  ; $1FE457 |
  BEQ code_1FE48A                           ; $1FE459 |
  LDY $26                                   ; $1FE45B |
  LDA $E496,y                               ; $1FE45D |
  STA $26                                   ; $1FE460 |
  STA $6C                                   ; $1FE462 |
  LDA #$00                                  ; $1FE464 |
  STA $24                                   ; $1FE466 |
  STA $25                                   ; $1FE468 |
  STA $AD                                   ; $1FE46A |
  STA $AE                                   ; $1FE46C |
  LDA #$DD                                  ; $1FE46E |
  STA $94                                   ; $1FE470 |
  LDA #$E8                                  ; $1FE472 |
  STA $93                                   ; $1FE474 |
  LDA #$02                                  ; $1FE476 |
  JSR init_subsystem                        ; $1FE478 |
  LDA #$00                                  ; $1FE47B |
  JSR kill_subsystem                        ; $1FE47D |
  LDA #$01                                  ; $1FE480 |
  JSR kill_subsystem                        ; $1FE482 |
  LDA #$03                                  ; $1FE485 | pointless LDA, gets overwritten
  JMP kill_current_subsystem                ; $1FE487 |

code_1FE48A:
  LDA $15                                   ; $1FE48A |
  AND #$01                                  ; $1FE48C |
  BEQ code_1FE490                           ; $1FE48E |
code_1FE490:
  JSR async_next_frame                      ; $1FE490 |
  JMP code_1FE43E                           ; $1FE493 |

  db $01, $02, $03, $04, $05, $06, $07, $08 ; $1FE496 |
  db $09, $0A, $0B, $0C, $0D, $0E, $0F, $00 ; $1FE49E |

code_1FE4A6:
  JSR code_1EC38F                           ; $1FE4A6 |
  LDY #$00                                  ; $1FE4A9 |
  LDX #$00                                  ; $1FE4AB |
  STX $95                                   ; $1FE4AD |
  STX $9F                                   ; $1FE4AF |
  STX $77                                   ; $1FE4B1 |
code_1FE4B3:
  LDA $E614,x                               ; $1FE4B3 |
  STA $0200,y                               ; $1FE4B6 |
  LDA $E615,x                               ; $1FE4B9 |
  STA $0203,y                               ; $1FE4BC |
  INX                                       ; $1FE4BF |
  INX                                       ; $1FE4C0 |
  INY                                       ; $1FE4C1 |
  INY                                       ; $1FE4C2 |
  INY                                       ; $1FE4C3 |
  INY                                       ; $1FE4C4 |
  CPX #$64                                  ; $1FE4C5 |
  BNE code_1FE4B3                           ; $1FE4C7 |
  LDY #$06                                  ; $1FE4C9 |
code_1FE4CB:
  LDA $E678,y                               ; $1FE4CB |
  STA $0611,y                               ; $1FE4CE |
  DEY                                       ; $1FE4D1 |
  BPL code_1FE4CB                           ; $1FE4D2 |
code_1FE4D4:
  LDA $14                                   ; $1FE4D4 |
  AND #$20                                  ; $1FE4D6 |
  BEQ code_1FE501                           ; $1FE4D8 |
  LDY #$0F                                  ; $1FE4DA |
code_1FE4DC:
  LDA $0600,y                               ; $1FE4DC |
  STA $0620,y                               ; $1FE4DF |
  LDA $0630,y                               ; $1FE4E2 |
  STA $0610,y                               ; $1FE4E5 |
  DEY                                       ; $1FE4E8 |
  BPL code_1FE4DC                           ; $1FE4E9 |
  LDA $0600                                 ; $1FE4EB |
  STA $0610                                 ; $1FE4EE |
  STA $0630                                 ; $1FE4F1 |
  STY $18                                   ; $1FE4F4 |
  LDY #$0C                                  ; $1FE4F6 |
  LDA #$9C                                  ; $1FE4F8 |
code_1FE4FA:
  STA $00B0,y                               ; $1FE4FA |
  DEY                                       ; $1FE4FD |
  BPL code_1FE4FA                           ; $1FE4FE |
  RTS                                       ; $1FE500 |

code_1FE501:
  LDA $14                                   ; $1FE501 |
  AND #$0F                                  ; $1FE503 |
  BEQ code_1FE537                           ; $1FE505 |
  AND #$03                                  ; $1FE507 |
  BNE code_1FE524                           ; $1FE509 |
  LDA $14                                   ; $1FE50B |
  AND #$08                                  ; $1FE50D |
  BEQ code_1FE51B                           ; $1FE50F |
  LDA $77                                   ; $1FE511 |
  SEC                                       ; $1FE513 |
  SBC #$04                                  ; $1FE514 |
  STA $77                                   ; $1FE516 |
  JMP code_1FE52E                           ; $1FE518 |

code_1FE51B:
  LDA $77                                   ; $1FE51B |
  CLC                                       ; $1FE51D |
  ADC #$04                                  ; $1FE51E |
  STA $77                                   ; $1FE520 |
  BNE code_1FE52E                           ; $1FE522 |
code_1FE524:
  AND #$01                                  ; $1FE524 |
  BEQ code_1FE52C                           ; $1FE526 |
  INC $77                                   ; $1FE528 |
  BNE code_1FE52E                           ; $1FE52A |
code_1FE52C:
  DEC $77                                   ; $1FE52C |
code_1FE52E:
  LDA $77                                   ; $1FE52E |
  AND #$0F                                  ; $1FE530 |
  STA $77                                   ; $1FE532 |
  JMP code_1FE584                           ; $1FE534 |

code_1FE537:
  LDY $77                                   ; $1FE537 |
  LDA $0600,y                               ; $1FE539 |
  STA $10                                   ; $1FE53C |
  LDA $14                                   ; $1FE53E |
  AND #$C0                                  ; $1FE540 |
  BEQ code_1FE584                           ; $1FE542 |
  AND #$80                                  ; $1FE544 |
  BEQ code_1FE54D                           ; $1FE546 |
  INC $10                                   ; $1FE548 |
  JMP code_1FE54F                           ; $1FE54A |

code_1FE54D:
  DEC $10                                   ; $1FE54D |
code_1FE54F:
  LDA $10                                   ; $1FE54F |
  CMP #$0F                                  ; $1FE551 |
  BEQ code_1FE57C                           ; $1FE553 |
  LDA $10                                   ; $1FE555 |
  AND #$3F                                  ; $1FE557 |
  STA $10                                   ; $1FE559 |
  AND #$0F                                  ; $1FE55B |
  CMP #$0D                                  ; $1FE55D |
  BCC code_1FE57C                           ; $1FE55F |
  LDA $14                                   ; $1FE561 |
  AND #$80                                  ; $1FE563 |
  BEQ code_1FE574                           ; $1FE565 |
  LDA $10                                   ; $1FE567 |
  AND #$30                                  ; $1FE569 |
  ADC #$10                                  ; $1FE56B |
  AND #$30                                  ; $1FE56D |
  STA $10                                   ; $1FE56F |
  JMP code_1FE57C                           ; $1FE571 |

code_1FE574:
  LDA $10                                   ; $1FE574 |
  AND #$30                                  ; $1FE576 |
  ORA #$0C                                  ; $1FE578 |
  STA $10                                   ; $1FE57A |
code_1FE57C:
  LDA $10                                   ; $1FE57C |
  STA $0600,y                               ; $1FE57E |
  STA $0620,y                               ; $1FE581 |
code_1FE584:
  LDA $77                                   ; $1FE584 |
  STA $00                                   ; $1FE586 |
  LDX #$00                                  ; $1FE588 |
  LDY #$00                                  ; $1FE58A |
code_1FE58C:
  LDA $0600,y                               ; $1FE58C |
  PHA                                       ; $1FE58F |
  AND #$F0                                  ; $1FE590 |
  LSR                                       ; $1FE592 |
  LSR                                       ; $1FE593 |
  LSR                                       ; $1FE594 |
  LSR                                       ; $1FE595 |
  STY $01                                   ; $1FE596 |
  TAY                                       ; $1FE598 |
  LDA $E67F,y                               ; $1FE599 |
  LDY $01                                   ; $1FE59C |
  STA $0201,x                               ; $1FE59E |
  LDA #$00                                  ; $1FE5A1 |
  CPY $00                                   ; $1FE5A3 |
  BNE code_1FE5A9                           ; $1FE5A5 |
  LDA #$01                                  ; $1FE5A7 |
code_1FE5A9:
  STA $0202,x                               ; $1FE5A9 |
  STA $0206,x                               ; $1FE5AC |
  PLA                                       ; $1FE5AF |
  AND #$0F                                  ; $1FE5B0 |
  STY $01                                   ; $1FE5B2 |
  TAY                                       ; $1FE5B4 |
  LDA $E67F,y                               ; $1FE5B5 |
  LDY $01                                   ; $1FE5B8 |
  STA $0205,x                               ; $1FE5BA |
  TXA                                       ; $1FE5BD |
  CLC                                       ; $1FE5BE |
  ADC #$08                                  ; $1FE5BF |
  TAX                                       ; $1FE5C1 |
  INY                                       ; $1FE5C2 |
  CPY #$20                                  ; $1FE5C3 |
  BEQ code_1FE5CF                           ; $1FE5C5 |
  CPY #$10                                  ; $1FE5C7 |
  BNE code_1FE58C                           ; $1FE5C9 |
  LDY #$18                                  ; $1FE5CB |
  BNE code_1FE58C                           ; $1FE5CD |
code_1FE5CF:
  LDA {x_position_high}                     ; $1FE5CF |
  PHA                                       ; $1FE5D2 |
  AND #$0F                                  ; $1FE5D3 |
  STA $00                                   ; $1FE5D5 |
  PLA                                       ; $1FE5D7 |
  LSR                                       ; $1FE5D8 |
  LSR                                       ; $1FE5D9 |
  LSR                                       ; $1FE5DA |
  LSR                                       ; $1FE5DB |
  TAY                                       ; $1FE5DC |
  LDA $E67F,y                               ; $1FE5DD |
  STA $0201,x                               ; $1FE5E0 |
  LDY $00                                   ; $1FE5E3 |
  LDA $E67F,y                               ; $1FE5E5 |
  STA $0205,x                               ; $1FE5E8 |
  LDA #$00                                  ; $1FE5EB |
  STA $0202,x                               ; $1FE5ED |
  STA $0206,x                               ; $1FE5F0 |
  JSR code_1FE68F                           ; $1FE5F3 |
  LDA #$FF                                  ; $1FE5F6 |
  STA $18                                   ; $1FE5F8 |
  LDA $0600                                 ; $1FE5FA |
  STA $0610                                 ; $1FE5FD |
  LDA #$00                                  ; $1FE600 |
  STA $05F8                                 ; $1FE602 |
  STA $05F9                                 ; $1FE605 |
  STA $05FA                                 ; $1FE608 |
  STA $05FB                                 ; $1FE60B |
  JSR async_next_frame                      ; $1FE60E |
  JMP code_1FE4D4                           ; $1FE611 |

  db $28, $80, $28, $88, $28, $98, $28, $A0 ; $1FE614 |
  db $28, $B0, $28, $B8, $28, $C8, $28, $D0 ; $1FE61C |
  db $38, $80, $38, $88, $38, $98, $38, $A0 ; $1FE624 |
  db $38, $B0, $38, $B8, $38, $C8, $38, $D0 ; $1FE62C |
  db $48, $80, $48, $88, $48, $98, $48, $A0 ; $1FE634 |
  db $48, $B0, $48, $B8, $48, $C8, $48, $D0 ; $1FE63C |
  db $58, $80, $58, $88, $58, $98, $58, $A0 ; $1FE644 |
  db $58, $B0, $58, $B8, $58, $C8, $58, $D0 ; $1FE64C |
  db $88, $80, $88, $88, $88, $98, $88, $A0 ; $1FE654 |
  db $88, $B0, $88, $B8, $88, $C8, $88, $D0 ; $1FE65C |
  db $98, $80, $98, $88, $98, $98, $98, $A0 ; $1FE664 |
  db $98, $B0, $98, $B8, $98, $C8, $98, $D0 ; $1FE66C |
  db $78, $80, $78, $88, $30, $30, $30, $0F ; $1FE674 |
  db $16, $16, $16, $30, $31, $32, $33, $34 ; $1FE67C |
  db $35, $36, $37, $38, $39, $41, $42, $43 ; $1FE684 |
  db $44, $45, $46                          ; $1FE68C |

code_1FE68F:
  LDA #$9C                                  ; $1FE68F |
  SEC                                       ; $1FE691 |
  SBC $B0                                   ; $1FE692 |
  PHA                                       ; $1FE694 |
  AND #$10                                  ; $1FE695 |
  LSR                                       ; $1FE697 |
  LSR                                       ; $1FE698 |
  LSR                                       ; $1FE699 |
  LSR                                       ; $1FE69A |
  TAY                                       ; $1FE69B |
  LDA $E67F,y                               ; $1FE69C |
  STA $02F9                                 ; $1FE69F |
  LDA #$20                                  ; $1FE6A2 |
  STA $02F8                                 ; $1FE6A4 |
  STA $02FC                                 ; $1FE6A7 |
  LDA #$30                                  ; $1FE6AA |
  STA $02FB                                 ; $1FE6AC |
  LDA #$00                                  ; $1FE6AF |
  STA $02FA                                 ; $1FE6B1 |
  STA $02FE                                 ; $1FE6B4 |
  PLA                                       ; $1FE6B7 |
  AND #$0F                                  ; $1FE6B8 |
  TAY                                       ; $1FE6BA |
  LDA $E67F,y                               ; $1FE6BB |
  STA $02FD                                 ; $1FE6BE |
  LDA #$38                                  ; $1FE6C1 |
  STA $02FF                                 ; $1FE6C3 |
  RTS                                       ; $1FE6C6 |

code_1FE6C7:
  LDA {entity_display_flags},x              ; $1FE6C7 |
  ORA #$20                                  ; $1FE6CA |
  STA {entity_display_flags},x              ; $1FE6CC |
  CPX #$00                                  ; $1FE6CF |
  BNE code_1FE6DD                           ; $1FE6D1 |
  LDA {x_position_low}                      ; $1FE6D3 |
  STA $02                                   ; $1FE6D6 |
  LDA {x_position_high}                     ; $1FE6D8 |
  STA $03                                   ; $1FE6DB |
code_1FE6DD:
  JSR code_1FE8E6                           ; $1FE6DD |
  CPX #$00                                  ; $1FE6E0 |
  BNE code_1FE6F9                           ; $1FE6E2 |
  JSR code_1FEDF6                           ; $1FE6E4 |
  BCC code_1FE6F9                           ; $1FE6E7 |
  JSR code_1FEF15                           ; $1FE6E9 |
  JSR code_1FE6F1                           ; $1FE6EC |
  SEC                                       ; $1FE6EF |
  RTS                                       ; $1FE6F0 |

code_1FE6F1:
  BCC code_1FE6F9                           ; $1FE6F1 |
  BEQ code_1FE6F9                           ; $1FE6F3 |
  INY                                       ; $1FE6F5 |
  JMP code_1FE738                           ; $1FE6F6 |

code_1FE6F9:
  JSR code_1EC5AA                           ; $1FE6F9 |
  CLC                                       ; $1FE6FC |
  LDA $10                                   ; $1FE6FD |
  AND #$10                                  ; $1FE6FF |
  BEQ code_1FE707                           ; $1FE701 |
  JSR code_1FEEAF                           ; $1FE703 |
  SEC                                       ; $1FE706 |
code_1FE707:
  RTS                                       ; $1FE707 |

code_1FE708:
  LDA {entity_display_flags},x              ; $1FE708 |
  AND #$DF                                  ; $1FE70B |
  STA {entity_display_flags},x              ; $1FE70D |
  CPX #$00                                  ; $1FE710 |
  BNE code_1FE71E                           ; $1FE712 |
  LDA {x_position_low}                      ; $1FE714 |
  STA $02                                   ; $1FE717 |
  LDA {x_position_high}                     ; $1FE719 |
  STA $03                                   ; $1FE71C |
code_1FE71E:
  JSR code_1FE90C                           ; $1FE71E |
  CPX #$00                                  ; $1FE721 |
  BNE code_1FE738                           ; $1FE723 |
  JSR code_1FEDF6                           ; $1FE725 |
  BCC code_1FE738                           ; $1FE728 |
  JSR code_1FEF29                           ; $1FE72A |
  JSR code_1FE732                           ; $1FE72D |
  SEC                                       ; $1FE730 |
  RTS                                       ; $1FE731 |

code_1FE732:
  BCS code_1FE738                           ; $1FE732 |
  DEY                                       ; $1FE734 |
  JMP code_1FE6F9                           ; $1FE735 |

code_1FE738:
  JSR code_1EC5AA                           ; $1FE738 |
  CLC                                       ; $1FE73B |
  LDA $10                                   ; $1FE73C |
  AND #$10                                  ; $1FE73E |
  BEQ code_1FE746                           ; $1FE740 |
  JSR code_1FEEC7                           ; $1FE742 |
  SEC                                       ; $1FE745 |
code_1FE746:
  RTS                                       ; $1FE746 |

code_1FE747:
  CPX #$00                                  ; $1FE747 |
  BNE code_1FE755                           ; $1FE749 |
  LDA {y_position_low}                      ; $1FE74B |
  STA $02                                   ; $1FE74E |
  LDA {y_position_high}                     ; $1FE750 |
  STA $03                                   ; $1FE753 |
code_1FE755:
  JSR apply_vertical_speed_down_alt         ; $1FE755 |
  CPX #$00                                  ; $1FE758 |
  BNE code_1FE771                           ; $1FE75A |
  JSR code_1FED8F                           ; $1FE75C |
  BCC code_1FE771                           ; $1FE75F |
  JSR code_1FEF4A                           ; $1FE761 |
  JSR code_1FE769                           ; $1FE764 |
  SEC                                       ; $1FE767 |
  RTS                                       ; $1FE768 |

code_1FE769:
  BCC code_1FE771                           ; $1FE769 |
  BEQ code_1FE771                           ; $1FE76B |
  INY                                       ; $1FE76D |
  JMP code_1FE7A8                           ; $1FE76E |

code_1FE771:
  JSR code_1EC4A1                           ; $1FE771 |
  CLC                                       ; $1FE774 |
  LDA $10                                   ; $1FE775 |
  AND #$10                                  ; $1FE777 |
  BEQ code_1FE77F                           ; $1FE779 |
  JSR code_1FEEF7                           ; $1FE77B |
  SEC                                       ; $1FE77E |
code_1FE77F:
  RTS                                       ; $1FE77F |

code_1FE780:
  CPX #$00                                  ; $1FE780 |
  BNE code_1FE78E                           ; $1FE782 |
  LDA {y_position_low}                      ; $1FE784 |
  STA $02                                   ; $1FE787 |
  LDA {y_position_high}                     ; $1FE789 |
  STA $03                                   ; $1FE78C |
code_1FE78E:
  JSR apply_vertical_speed_up_alt           ; $1FE78E |
  CPX #$00                                  ; $1FE791 |
  BNE code_1FE7A8                           ; $1FE793 |
  JSR code_1FED8F                           ; $1FE795 |
  BCC code_1FE7A8                           ; $1FE798 |
  JSR code_1FEF60                           ; $1FE79A |
  JSR code_1FE7A2                           ; $1FE79D |
  SEC                                       ; $1FE7A0 |
  RTS                                       ; $1FE7A1 |

code_1FE7A2:
  BCS code_1FE7A8                           ; $1FE7A2 |
  DEY                                       ; $1FE7A4 |
  JMP code_1FE771                           ; $1FE7A5 |

code_1FE7A8:
  JSR code_1EC4A1                           ; $1FE7A8 |
  CLC                                       ; $1FE7AB |
  LDA $10                                   ; $1FE7AC |
  AND #$10                                  ; $1FE7AE |
  BEQ code_1FE7B6                           ; $1FE7B0 |
  JSR code_1FEEDD                           ; $1FE7B2 |
  SEC                                       ; $1FE7B5 |
code_1FE7B6:
  RTS                                       ; $1FE7B6 |

code_1FE7B7:
  CPX #$00                                  ; $1FE7B7 |
  BNE code_1FE7CF                           ; $1FE7B9 |
  STX {entity_var_e}                        ; $1FE7BB |
  LDA {y_position_low}                      ; $1FE7BE |
  STA $02                                   ; $1FE7C1 |
  LDA {y_position_high}                     ; $1FE7C3 |
  STA $03                                   ; $1FE7C6 |
  LDA $AF                                   ; $1FE7C8 |
  BEQ code_1FE7CF                           ; $1FE7CA |
  JMP code_1FE872                           ; $1FE7CC |

code_1FE7CF:
  LDA {y_speed},x                           ; $1FE7CF |
  BPL code_1FE840                           ; $1FE7D2 |
  JSR apply_vertical_speed_down             ; $1FE7D4 |
  CPX #$00                                  ; $1FE7D7 |
  BNE code_1FE81C                           ; $1FE7D9 |
  JSR code_1FED8F                           ; $1FE7DB |
  BCC code_1FE81C                           ; $1FE7DE |
  JSR code_1FEF4A                           ; $1FE7E0 |
  JSR code_1FE814                           ; $1FE7E3 |
  LDY $73                                   ; $1FE7E6 |
  LDA {entity_type},y                       ; $1FE7E8 |
  CMP #$45                                  ; $1FE7EB |
  BNE code_1FE7F4                           ; $1FE7ED |
  STY {entity_var_e}                        ; $1FE7EF |
  BEQ code_1FE83C                           ; $1FE7F2 |
code_1FE7F4:
  LDA {y_speed},y                           ; $1FE7F4 |
  BPL code_1FE808                           ; $1FE7F7 |
  STA {y_speed}                             ; $1FE7F9 |
  DEC {y_speed}                             ; $1FE7FC |
  LDA {y_speed_frac},y                      ; $1FE7FF |
  STA {y_speed_frac}                        ; $1FE802 |
  JMP code_1FE83C                           ; $1FE805 |

code_1FE808:
  LDA #$00                                  ; $1FE808 |
  STA {y_speed_frac},x                      ; $1FE80A |
  LDA #$FD                                  ; $1FE80D |
  STA {y_speed},x                           ; $1FE80F |
  BNE code_1FE83C                           ; $1FE812 |
code_1FE814:
  BCC code_1FE81C                           ; $1FE814 |
  BEQ code_1FE81C                           ; $1FE816 |
  INY                                       ; $1FE818 |
  JMP code_1FE7A8                           ; $1FE819 |

code_1FE81C:
  JSR apply_gravity                         ; $1FE81C |
  JSR code_1EC4A1                           ; $1FE81F |
  LDA $42                                   ; $1FE822 |
  CMP #$40                                  ; $1FE824 |
  BNE code_1FE830                           ; $1FE826 |
  LDA $11                                   ; $1FE828 |
  AND #$0F                                  ; $1FE82A |
  CMP #$08                                  ; $1FE82C |
  BCC code_1FE836                           ; $1FE82E |
code_1FE830:
  LDA $10                                   ; $1FE830 |
  AND #$10                                  ; $1FE832 |
  BEQ code_1FE870                           ; $1FE834 |
code_1FE836:
  JSR code_1FEEF7                           ; $1FE836 |
  JSR reset_vertical_speed                  ; $1FE839 |
code_1FE83C:
  LDA #$00                                  ; $1FE83C |
  SEC                                       ; $1FE83E |
  RTS                                       ; $1FE83F |

code_1FE840:
  INY                                       ; $1FE840 |
  JSR apply_vertical_speed_up               ; $1FE841 |
  CPX #$00                                  ; $1FE844 |
  BNE code_1FE85C                           ; $1FE846 |
  JSR code_1FED8F                           ; $1FE848 |
  BCC code_1FE85C                           ; $1FE84B |
  JSR code_1FEF60                           ; $1FE84D |
  JSR code_1FE856                           ; $1FE850 |
  JMP code_1FE86B                           ; $1FE853 |

code_1FE856:
  BCS code_1FE85C                           ; $1FE856 |
  DEY                                       ; $1FE858 |
  JMP code_1FE771                           ; $1FE859 |

code_1FE85C:
  JSR apply_gravity                         ; $1FE85C |
  JSR code_1EC4A1                           ; $1FE85F |
  LDA $10                                   ; $1FE862 |
  AND #$10                                  ; $1FE864 |
  BEQ code_1FE870                           ; $1FE866 |
  JSR code_1FEEDD                           ; $1FE868 |
code_1FE86B:
  JSR reset_vertical_speed                  ; $1FE86B |
  LDA #$FF                                  ; $1FE86E |
code_1FE870:
  CLC                                       ; $1FE870 |
  RTS                                       ; $1FE871 |

code_1FE872:
  LDA {y_speed},x                           ; $1FE872 |
  BPL code_1FE8A4                           ; $1FE875 |
  JSR apply_vertical_speed_down             ; $1FE877 |
  JSR code_1FED8F                           ; $1FE87A |
  BCC code_1FE890                           ; $1FE87D |
  JSR code_1FEF4A                           ; $1FE87F |
  JSR code_1FE888                           ; $1FE882 |
  JMP code_1FE89F                           ; $1FE885 |

code_1FE888:
  BCC code_1FE890                           ; $1FE888 |
  BEQ code_1FE890                           ; $1FE88A |
  INY                                       ; $1FE88C |
  JMP code_1FE7A8                           ; $1FE88D |

code_1FE890:
  JSR apply_gravity_upwards                 ; $1FE890 |
  JSR code_1EC4A1                           ; $1FE893 |
  LDA $10                                   ; $1FE896 |
  AND #$10                                  ; $1FE898 |
  BEQ code_1FE8A2                           ; $1FE89A |
  JSR code_1FEEF7                           ; $1FE89C |
code_1FE89F:
  JSR code_1FEA29                           ; $1FE89F |
code_1FE8A2:
  CLC                                       ; $1FE8A2 |
  RTS                                       ; $1FE8A3 |

code_1FE8A4:
  INY                                       ; $1FE8A4 |
  JSR apply_vertical_speed_up               ; $1FE8A5 |
  JSR code_1FED8F                           ; $1FE8A8 |
  BCC code_1FE8BC                           ; $1FE8AB |
  JSR code_1FEF60                           ; $1FE8AD |
  JSR code_1FE8B6                           ; $1FE8B0 |
  JMP code_1FE8D9                           ; $1FE8B3 |

code_1FE8B6:
  BCS code_1FE8BC                           ; $1FE8B6 |
  DEY                                       ; $1FE8B8 |
  JMP code_1FE771                           ; $1FE8B9 |

code_1FE8BC:
  JSR apply_gravity_upwards                 ; $1FE8BC |
  JSR code_1EC4A1                           ; $1FE8BF |
  LDA $42                                   ; $1FE8C2 |
  CMP #$40                                  ; $1FE8C4 |
  BNE code_1FE8D0                           ; $1FE8C6 |
  LDA $11                                   ; $1FE8C8 |
  AND #$0F                                  ; $1FE8CA |
  CMP #$08                                  ; $1FE8CC |
  BCS code_1FE8D6                           ; $1FE8CE |
code_1FE8D0:
  LDA $10                                   ; $1FE8D0 |
  AND #$10                                  ; $1FE8D2 |
  BEQ code_1FE8A2                           ; $1FE8D4 |
code_1FE8D6:
  JSR code_1FEEDD                           ; $1FE8D6 |
code_1FE8D9:
  JSR code_1FEA29                           ; $1FE8D9 |
  SEC                                       ; $1FE8DC |
  RTS                                       ; $1FE8DD |

code_1FE8DE:
  LDA {entity_display_flags},x              ; $1FE8DE |
  ORA #$20                                  ; $1FE8E1 |
  STA {entity_display_flags},x              ; $1FE8E3 |
code_1FE8E6:
  LDA {x_position_frac},x                   ; $1FE8E6 |
  CLC                                       ; $1FE8E9 |
  ADC {x_speed_frac},x                      ; $1FE8EA |
  STA {x_position_frac},x                   ; $1FE8ED |
  LDA {x_position_low},x                    ; $1FE8F0 |
  ADC {x_speed},x                           ; $1FE8F3 |
  STA {x_position_low},x                    ; $1FE8F6 |
  BCC code_1FE903                           ; $1FE8F9 |
  LDA {x_position_high},x                   ; $1FE8FB |
  ADC #$00                                  ; $1FE8FE |
  STA {x_position_high},x                   ; $1FE900 |
code_1FE903:
  RTS                                       ; $1FE903 |

code_1FE904:
  LDA {entity_display_flags},x              ; $1FE904 |
  AND #$DF                                  ; $1FE907 |
  STA {entity_display_flags},x              ; $1FE909 |
code_1FE90C:
  LDA {x_position_frac},x                   ; $1FE90C |
  SEC                                       ; $1FE90F |
  SBC {x_speed_frac},x                      ; $1FE910 |
  STA {x_position_frac},x                   ; $1FE913 |
  LDA {x_position_low},x                    ; $1FE916 |
  SBC {x_speed},x                           ; $1FE919 |
  STA {x_position_low},x                    ; $1FE91C |
  BCS code_1FE929                           ; $1FE91F |
  LDA {x_position_high},x                   ; $1FE921 |
  SBC #$00                                  ; $1FE924 |
  STA {x_position_high},x                   ; $1FE926 |
code_1FE929:
  RTS                                       ; $1FE929 |

; Apply vertical speed for current entity, and cross into the screen below if boundary is crossed.
; Alternate version where positive speed = move down, negative speed = move up
; Parameters:
; X - entity index
apply_vertical_speed_down_alt:
  LDA {y_position_frac},x                   ; $1FE92A | Load entity Y fraction
  CLC                                       ; $1FE92D |
  ADC {y_speed_frac},x                      ; $1FE92E | Add vertical speed fraction
  STA {y_position_frac},x                   ; $1FE931 | Store back into entity Y fraction
  LDA {y_position_low},x                    ; $1FE934 | Load entity Y
  ADC {y_speed},x                           ; $1FE937 | Add vertical speed, with carry from fraction addition
  STA {y_position_low},x                    ; $1FE93A | Store back into entity Y
  CMP #$F0                                  ; $1FE93D | Is our Y in the current screen >= 240?
  BCC code_1FE949                           ; $1FE93F | 
  ADC #$0F                                  ; $1FE941 | If so, increase Y by 16 and increase our Y screen
  STA {y_position_low},x                    ; $1FE943 | The Y will wrap around, putting the entity at the top of the screen below
  INC {y_position_high},x                   ; $1FE946 |
code_1FE949:
  RTS                                       ; $1FE949 |

; Same as apply_vertical_speed_up
; Apply vertical speed for current entity, and cross into the screen above if boundary is crossed.
; Positive speed = move up, negative speed = move down
; Parameters:
; X - entity index
apply_vertical_speed_up_alt:
  LDA {y_position_frac},x                   ; $1FE94A | Load entity Y fraction
  SEC                                       ; $1FE94D |
  SBC {y_speed_frac},x                      ; $1FE94E | Subtract vertical speed fraction
  STA {y_position_frac},x                   ; $1FE951 | Store back into entity Y fraction
  LDA {y_position_low},x                    ; $1FE954 | Load entity Y
  SBC {y_speed},x                           ; $1FE957 | Subtract vertical speed, with carry from fraction subtraction
  STA {y_position_low},x                    ; $1FE95A | Store back into entity Y 
  BCS code_1FE967                           ; $1FE95D | Did we go into the negatives?
  SBC #$0F                                  ; $1FE95F | If so, decrease Y by 16 and decrease our Y screen.
  STA {y_position_low},x                    ; $1FE961 | The Y will wrap around, putting the entity at the bottom of the screen above.
  DEC {y_position_high},x                   ; $1FE964 |
code_1FE967:
  RTS                                       ; $1FE967 |

; Apply vertical speed for current entity.
; It will call one of the appropriate subroutines below, depending on if the vertical speed is positive or negative.
; Positive speed = move up, negative speed = move down
; Parameters:
; X - entity index
entity_gravity_process:
  LDA {y_speed},x                           ; $1FE968 | Load entity vertical speed
  BPL code_1FE973                           ; $1FE96B | Check if positive
  JSR apply_vertical_speed_down             ; $1FE96D | If negative, apply downwards movement
  JMP apply_gravity                         ; $1FE970 | Apply gravity

code_1FE973:
  JSR apply_vertical_speed_up               ; $1FE973 | If positive, apply upwards movement
  JMP apply_gravity                         ; $1FE976 | Apply gravity

; Apply vertical speed for current entity, and cross into the screen below if boundary is crossed.
; Positive speed = move up, negative speed = move down
; Parameters:
; X - entity index
apply_vertical_speed_down:
  LDA {y_position_frac},x                   ; $1FE979 | Load entity Y fraction
  SEC                                       ; $1FE97C |
  SBC {y_speed_frac},x                      ; $1FE97D | Subtract vertical speed fraction
  STA {y_position_frac},x                   ; $1FE980 | Store back into entity Y fraction
  LDA {y_position_low},x                    ; $1FE983 | Load entity Y
  SBC {y_speed},x                           ; $1FE986 | Subtract vertical speed, with carry from fraction subtraction
  STA {y_position_low},x                    ; $1FE989 | Store back into entity Y
  CMP #$F0                                  ; $1FE98C | Is our Y in the current screen >= 240?
  BCC code_1FE998                           ; $1FE98E |
  ADC #$0F                                  ; $1FE990 | If so, increase Y by 16 and increase our Y screen
  STA {y_position_low},x                    ; $1FE992 | The Y will wrap around, putting the entity at the top of the screen below.
  INC {y_position_high},x                   ; $1FE995 |
code_1FE998:
  RTS                                       ; $1FE998 |

; Apply vertical speed for current entity, and cross into the screen above if boundary is crossed.
; Positive speed = move up, negative speed = move down
; Parameters:
; X - entity index
apply_vertical_speed_up:
  LDA {y_position_frac},x                   ; $1FE999 | Load entity Y fraction
  SEC                                       ; $1FE99C |
  SBC {y_speed_frac},x                      ; $1FE99D | Subtract vertical speed fraction
  STA {y_position_frac},x                   ; $1FE9A0 | Store back into entity Y fraction
  LDA {y_position_low},x                    ; $1FE9A3 | Load entity Y
  SBC {y_speed},x                           ; $1FE9A6 | Subtract vertical speed, with carry from fraction subtraction
  STA {y_position_low},x                    ; $1FE9A9 | Store back into entity Y
  BCS code_1FE9B6                           ; $1FE9AC | Did we go into the negatives?
  SBC #$0F                                  ; $1FE9AE | If so, decrease Y by 16 and decrease our Y screen.
  STA {y_position_low},x                    ; $1FE9B0 | The Y will wrap around, putting the entity at the bottom of the screen above.
  DEC {y_position_high},x                   ; $1FE9B3 |
code_1FE9B6:
  RTS                                       ; $1FE9B6 |

; Apply gravity to current entity.
; Parameters:
; X - entity index
apply_gravity:
  LDA $52                                   ; $1FE9B7 | Is gravity upside-down?
  BEQ code_1FE9BF                           ; $1FE9B9 | If not ($52 = 0), proceed to apply the gravity
  CPX #$00                                  ; $1FE9BB | If upside down, check if current entity is the player
  BEQ code_1FE9E0                           ; $1FE9BD | If yes, skip this process (upside-down gravity will be applied in a different sub-routine)
code_1FE9BF:
  LDA {y_speed_frac},x                      ; $1FE9BF | \
  SEC                                       ; $1FE9C2 | | Subtract gravity value from vertical speed fraction
  SBC $A1                                   ; $1FE9C3 | |
  STA {y_speed_frac},x                      ; $1FE9C5 | /
  LDA {y_speed},x                           ; $1FE9C8 | \
  SBC #$00                                  ; $1FE9CB | | If we crossed over, subtract vertical speed
  STA {y_speed},x                           ; $1FE9CD | /
  BPL code_1FE9E0                           ; $1FE9D0 | \
  CMP #$F9                                  ; $1FE9D2 | |
  BCS code_1FE9E0                           ; $1FE9D4 | | 
  LDA #$F9                                  ; $1FE9D6 | | If moving downwards, cap speed to 8 pixels per frame
  STA {y_speed},x                           ; $1FE9D8 | |
  LDA #$00                                  ; $1FE9DB | |
  STA {y_speed_frac},x                      ; $1FE9DD | /
code_1FE9E0:
  RTS                                       ; $1FE9E0 |

; Apply upside-down gravity to current entity.
; Parameters:
; X - entity index
apply_gravity_upwards:
  LDA {y_speed_frac},x                      ; $1FE9E1 | \
  CLC                                       ; $1FE9E4 | | Add gravity value to vertical speed fraction
  ADC $A1                                   ; $1FE9E5 | |
  STA {y_speed_frac},x                      ; $1FE9E7 | /
  LDA {y_speed},x                           ; $1FE9EA | \
  ADC #$00                                  ; $1FE9ED | | If we crossed over, increase vertical speed
  STA {y_speed},x                           ; $1FE9EF | /
  BMI code_1FEA02                           ; $1FE9F2 | \
  CMP #$07                                  ; $1FE9F4 | |
  BCC code_1FEA02                           ; $1FE9F6 | |
  LDA #$07                                  ; $1FE9F8 | | If moving upwards, cap speed to 8 pixels per frame
  STA {y_speed},x                           ; $1FE9FA | |
  LDA #$00                                  ; $1FE9FD | |
  STA {y_speed_frac},x                      ; $1FE9FF | /
code_1FEA02:
  RTS                                       ; $1FEA02 |

; Apply vertical velocity increase for teleporting effects (aka Megaman, Rush, etc. warping in).
; Parameters:
; X - entity index
apply_teleport_vertical_speedup:
  LDA {y_speed_frac},x                      ; $1FEA03 | \
  CLC                                       ; $1FEA06 | | Add constant value to vertical speed fraction
  ADC #$40                                  ; $1FEA07 | |
  STA {y_speed_frac},x                      ; $1FEA09 | /
  LDA {y_speed},x                           ; $1FEA0C | \
  ADC #$00                                  ; $1FEA0F | | If we crossed over, increase vertical speed
  STA {y_speed},x                           ; $1FEA11 | /
  CMP #$0F                                  ; $1FEA14 | \
  BNE code_1FEA1D                           ; $1FEA16 | | Cap speed to 16 pixels per frame
  LDA #$00                                  ; $1FEA18 | |
  STA {y_speed_frac},x                      ; $1FEA1A | /
code_1FEA1D:
  RTS                                       ; $1FEA1D |

; Reset entity's vertical speed.
reset_vertical_speed:
  LDA #$00                                  ; $1FEA1E |
  STA {y_speed_frac},x                      ; $1FEA20 | Set vertical speed fraction to 0.
  LDA #$FF                                  ; $1FEA23 |
  STA {y_speed},x                           ; $1FEA25 | Set vertical speed to $FF (0 pixels per frame for entities which use standard gravity functions).
  RTS                                       ; $1FEA28 |

code_1FEA29:
  LDA #$00                                  ; $1FEA29 |
  STA {y_speed_frac},x                      ; $1FEA2B |
  LDA #$01                                  ; $1FEA2E |
  STA {y_speed},x                           ; $1FEA30 |
  RTS                                       ; $1FEA33 |

code_1FEA34:
  LDA #$C0                                  ; $1FEA34 |
  STA {y_speed_frac},y                      ; $1FEA36 |
  LDA #$FF                                  ; $1FEA39 |
  STA {y_speed},y                           ; $1FEA3B |
  RTS                                       ; $1FEA3E |

code_1FEA3F:
  LDA {entity_direction},x                  ; $1FEA3F |
  CLC                                       ; $1FEA42 |
  AND #$03                                  ; $1FEA43 |
  BEQ code_1FEA97                           ; $1FEA45 |
  AND #$01                                  ; $1FEA47 |
  BEQ code_1FEA4E                           ; $1FEA49 |
  JMP code_1FE6C7                           ; $1FEA4B |

code_1FEA4E:
  INY                                       ; $1FEA4E |
  JMP code_1FE708                           ; $1FEA4F |

code_1FEA52:
  CLC                                       ; $1FEA52 |
  LDA {entity_direction},x                  ; $1FEA53 |
  AND #$0C                                  ; $1FEA56 |
  BEQ code_1FEA97                           ; $1FEA58 |
  AND #$04                                  ; $1FEA5A |
  BEQ code_1FEA61                           ; $1FEA5C |
  JMP code_1FE747                           ; $1FEA5E |

code_1FEA61:
  INY                                       ; $1FEA61 |
  JMP code_1FE780                           ; $1FEA62 |

code_1FEA65:
  LDA {entity_direction},x                  ; $1FEA65 |
  AND #$03                                  ; $1FEA68 |
  BEQ code_1FEA97                           ; $1FEA6A |
  AND #$01                                  ; $1FEA6C |
  BEQ code_1FEA7B                           ; $1FEA6E |
  LDA {entity_display_flags},x              ; $1FEA70 |
  ORA #$20                                  ; $1FEA73 |
  STA {entity_display_flags},x              ; $1FEA75 |
  JMP code_1FE8E6                           ; $1FEA78 |

code_1FEA7B:
  LDA {entity_display_flags},x              ; $1FEA7B |
  AND #$DF                                  ; $1FEA7E |
  STA {entity_display_flags},x              ; $1FEA80 |
  JMP code_1FE90C                           ; $1FEA83 |

code_1FEA86:
  LDA {entity_direction},x                  ; $1FEA86 |
  AND #$0C                                  ; $1FEA89 |
  BEQ code_1FEA97                           ; $1FEA8B |
  AND #$04                                  ; $1FEA8D |
  BEQ code_1FEA94                           ; $1FEA8F |
  JMP apply_vertical_speed_down_alt         ; $1FEA91 |

code_1FEA94:
  JMP apply_vertical_speed_up_alt           ; $1FEA94 |

code_1FEA97:
  RTS                                       ; $1FEA97 |

code_1FEA98:
  STA {animation_index},x                   ; $1FEA98 |
  LDA #$00                                  ; $1FEA9B |
  STA {animation_frame},x                   ; $1FEA9D |
  STA {animation_timer},x                   ; $1FEAA0 |
  RTS                                       ; $1FEAA3 |

code_1FEAA4:
  PHA                                       ; $1FEAA4 |
  LDA {x_position_low},x                    ; $1FEAA5 |
  STA {x_position_low},y                    ; $1FEAA8 |
  LDA {x_position_high},x                   ; $1FEAAB |
  STA {x_position_high},y                   ; $1FEAAE |
  LDA {y_position_low},x                    ; $1FEAB1 |
  STA {y_position_low},y                    ; $1FEAB4 |
  LDA {y_position_high},x                   ; $1FEAB7 |
  STA {y_position_high},y                   ; $1FEABA |
code_1FEABD:
  LDA {entity_display_flags},x              ; $1FEABD |
  AND #$60                                  ; $1FEAC0 |
  STA {entity_display_flags},y              ; $1FEAC2 |
  LDA #$00                                  ; $1FEAC5 |
  STA {x_position_frac},y                   ; $1FEAC7 |
  STA {y_position_frac},y                   ; $1FEACA |
  STA {entity_flash_counter},y              ; $1FEACD |
  STA {entity_var_a},y                      ; $1FEAD0 |
  STA {entity_var_b},y                      ; $1FEAD3 |
  STA {entity_var_c},y                      ; $1FEAD6 |
  STA {entity_var_d},y                      ; $1FEAD9 |
  STA {entity_var_e},y                      ; $1FEADC |
  STA {entity_var_f},y                      ; $1FEADF |
  STA {entity_var_g},y                      ; $1FEAE2 |
  STA {entity_var_h},y                      ; $1FEAE5 |
  PLA                                       ; $1FEAE8 |
code_1FEAE9:
  STA {animation_index},y                   ; $1FEAE9 |
  LDA #$00                                  ; $1FEAEC |
  STA {animation_frame},y                   ; $1FEAEE |
  STA {animation_timer},y                   ; $1FEAF1 |
  RTS                                       ; $1FEAF4 |

code_1FEAF5:
  PHA                                       ; $1FEAF5 |
  STX $00                                   ; $1FEAF6 |
  LDX $10                                   ; $1FEAF8 |
  LDA #$00                                  ; $1FEAFA |
  STA $02                                   ; $1FEAFC |
  LDA $EB62,x                               ; $1FEAFE |
  STA $01                                   ; $1FEB01 |
  BPL code_1FEB07                           ; $1FEB03 |
  DEC $02                                   ; $1FEB05 |
code_1FEB07:
  LDA $EBBC,x                               ; $1FEB07 |
  STA $03                                   ; $1FEB0A |
  LDX $00                                   ; $1FEB0C |
  LDA {x_position_low},x                    ; $1FEB0E |
  CLC                                       ; $1FEB11 |
  ADC $01                                   ; $1FEB12 |
  STA {x_position_low},y                    ; $1FEB14 |
  LDA {x_position_high},x                   ; $1FEB17 |
  ADC $02                                   ; $1FEB1A |
  STA {x_position_high},y                   ; $1FEB1C |
  LDA {y_position_high},x                   ; $1FEB1F |
  STA {y_position_high},y                   ; $1FEB22 |
  LDA {y_position_low},x                    ; $1FEB25 |
  CLC                                       ; $1FEB28 |
  ADC $03                                   ; $1FEB29 |
  STA {y_position_low},y                    ; $1FEB2B |
  LDA $03                                   ; $1FEB2E |
  BPL code_1FEB48                           ; $1FEB30 |
  BCS code_1FEABD                           ; $1FEB32 |
  LDA {y_position_low},y                    ; $1FEB34 |
  SBC #$10                                  ; $1FEB37 |
  STA {y_position_low},y                    ; $1FEB39 |
  LDA {y_position_high},y                   ; $1FEB3C |
  SEC                                       ; $1FEB3F |
  SBC #$01                                  ; $1FEB40 |
  STA {y_position_high},y                   ; $1FEB42 |
  JMP code_1FEABD                           ; $1FEB45 |

code_1FEB48:
  LDA {y_position_low},y                    ; $1FEB48 |
  BCS code_1FEB51                           ; $1FEB4B |
  CMP #$F0                                  ; $1FEB4D |
  BCC code_1FEB5F                           ; $1FEB4F |
code_1FEB51:
  ADC #$0F                                  ; $1FEB51 |
  STA {y_position_low},y                    ; $1FEB53 |
  LDA {y_position_high},y                   ; $1FEB56 |
  CLC                                       ; $1FEB59 |
  ADC #$01                                  ; $1FEB5A |
  STA {y_position_high},y                   ; $1FEB5C |
code_1FEB5F:
  JMP code_1FEABD                           ; $1FEB5F |

  db $F1, $10, $F4, $0C, $10, $0A, $00, $F6 ; $1FEB62 |
  db $F0, $00, $F0, $10, $00, $00, $F4, $0C ; $1FEB6A |
  db $00, $0C, $F4, $F0, $10, $F4, $0C, $00 ; $1FEB72 |
  db $00, $F0, $10, $EC, $0C, $00, $F9, $07 ; $1FEB7A |
  db $FC, $F8, $04, $08, $FC, $F8, $04, $08 ; $1FEB82 |
  db $F4, $0C, $EC, $14, $F4, $F8, $02, $0C ; $1FEB8A |
  db $0E, $0E, $0C, $02, $F8, $F4, $EC, $14 ; $1FEB92 |
  db $E8, $18, $FC, $04, $E0, $20, $F1, $10 ; $1FEB9A |
  db $E8, $18, $E2, $1E, $E8, $18, $F8, $08 ; $1FEBA2 |
  db $10, $00, $F0, $00, $00, $E8, $18, $F8 ; $1FEBAA |
  db $08, $E4, $1C, $F4, $0C, $FC, $04, $10 ; $1FEBB2 |
  db $F0, $10, $FF, $FF, $08, $08, $0E, $14 ; $1FEBBA |
  db $18, $14, $0E, $00, $08, $08, $14, $EC ; $1FEBC2 |
  db $04, $04, $00, $F4, $0C, $00, $00, $F4 ; $1FEBCA |
  db $0C, $F0, $10, $10, $F4, $F0, $10, $00 ; $1FEBD2 |
  db $00, $00, $FC, $04, $FC, $04, $04, $FC ; $1FEBDA |
  db $04, $FC, $FC, $FC, $FC, $FC, $02, $FA ; $1FEBE2 |
  db $F4, $F8, $02, $FE, $08, $0C, $06, $FE ; $1FEBEA |
  db $FF, $FF, $04, $04, $E0, $E0, $FA, $FA ; $1FEBF2 |
  db $08, $08, $00, $00, $00, $00, $0C, $0C ; $1FEBFA |
  db $F8, $F8, $F0, $F0, $F0, $F0, $E0, $10 ; $1FEC02 |
  db $10, $E8, $E8, $FA, $FA, $FE, $FE, $F4 ; $1FEC0A |
  db $F4, $04, $FA, $FA                     ; $1FEC12 |

; Set entity's direction to face the player.
; Parameters:
; X - entity index
face_player: 
  LDA #$01                                  ; $1FEC16 |
  STA {entity_direction},x                  ; $1FEC18 | Set direction to 1 (right)
  LDA {x_position_low},x                    ; $1FEC1B | \
  SEC                                       ; $1FEC1E | |
  SBC {x_position_low}                      ; $1FEC1F | | Get X difference from entity to player
  LDA {x_position_high},x                   ; $1FEC22 | |
  SBC {x_position_high}                     ; $1FEC25 | /
  BCC code_1FEC2F                           ; $1FEC28 | \ 
  LDA #$02                                  ; $1FEC2A | | If positive, i.e. if entity is to the right of the player, set direction to 2 (left)
  STA {entity_direction},x                  ; $1FEC2C | /
code_1FEC2F:
  RTS                                       ; $1FEC2F |

code_1FEC30:
  LDA {entity_direction},x                  ; $1FEC30 |
  AND #$03                                  ; $1FEC33 |
  BEQ code_1FEC49                           ; $1FEC35 |
  ROR                                       ; $1FEC37 |
  ROR                                       ; $1FEC38 |
  ROR                                       ; $1FEC39 |
  ROR                                       ; $1FEC3A |
  AND #$20                                  ; $1FEC3B |
  STA $00                                   ; $1FEC3D |
  LDA {entity_display_flags},x              ; $1FEC3F |
  AND #$DF                                  ; $1FEC42 |
  ORA $00                                   ; $1FEC44 |
  STA {entity_display_flags},x              ; $1FEC46 |
code_1FEC49:
  RTS                                       ; $1FEC49 |

code_1FEC4A:
  LDA {entity_direction},x                  ; $1FEC4A |
  EOR #$03                                  ; $1FEC4D |
  STA {entity_direction},x                  ; $1FEC4F |
  LDA {entity_display_flags},x              ; $1FEC52 |
  EOR #$20                                  ; $1FEC55 |
  STA {entity_display_flags},x              ; $1FEC57 |
  RTS                                       ; $1FEC5A |

code_1FEC5B:
  STA $D9                                   ; $1FEC5B |
code_1FEC5D:
  STX $00                                   ; $1FEC5D |
  LDX $DA                                   ; $1FEC5F |
  STA $01                                   ; $1FEC61 |
  LDA $DC,x                                 ; $1FEC63 |
  CMP #$88                                  ; $1FEC65 |
  BNE code_1FEC73                           ; $1FEC67 |
  LDA $01                                   ; $1FEC69 |
  STA $DC,x                                 ; $1FEC6B |
  INX                                       ; $1FEC6D |
  TXA                                       ; $1FEC6E |
  AND #$07                                  ; $1FEC6F |
  STA $DA                                   ; $1FEC71 |
code_1FEC73:
  LDX $00                                   ; $1FEC73 |
  RTS                                       ; $1FEC75 |

; Calculates vertical distance from entity to the player and stores it into the accumulator.
; Parameters:
; X - entity index
vertical_distance_to_player:
  LDA {y_position_low}                      ; $1FEC76 | \
  SEC                                       ; $1FEC79 | | Subtract entity's Y from player's Y
  SBC {y_position_low},x                    ; $1FEC7A | /
  BCS code_1FEC84                           ; $1FEC7D | \
  EOR #$FF                                  ; $1FEC7F | | If negative, invert to get absolute value
  ADC #$01                                  ; $1FEC81 | |
  CLC                                       ; $1FEC83 | /
code_1FEC84:
  RTS                                       ; $1FEC84 |

; Calculates vertical distance between two entities and stores it into the accumulator.
; Parameters:
; X - source entity index
; Y - target entity index
vertical_distance_to_entity:
  LDA {y_position_low},y                    ; $1FEC85 | \
  SEC                                       ; $1FEC88 | | Subtract source's Y from target's Y
  SBC {y_position_low},x                    ; $1FEC89 | /
  BCS code_1FEC93                           ; $1FEC8C | \
  EOR #$FF                                  ; $1FEC8E | | If negative, invert to get absolute value
  ADC #$01                                  ; $1FEC90 | |
  CLC                                       ; $1FEC92 | /
code_1FEC93:
  RTS                                       ; $1FEC93 |

; Calculates horizontal distance from entity to the player and stores it into the accumulator.
; Parameters:
; X - entity index
distance_to_player:
  LDA {x_position_low}                      ; $1FEC94 | \
  SEC                                       ; $1FEC97 | | Subtract entity's X from player's X 
  SBC {x_position_low},x                    ; $1FEC98 | /
  PHA                                       ; $1FEC9B | \
  LDA {x_position_high}                     ; $1FEC9C | | Subtract entity's X screen from player's X screen
  SBC {x_position_high},x                   ; $1FEC9F | | Affects carry for the next check, inverting the result if they are on different ones
  PLA                                       ; $1FECA2 | /
  BCS code_1FECAA                           ; $1FECA3 | \
  EOR #$FF                                  ; $1FECA5 | | If negative, invert to get absolute value
  ADC #$01                                  ; $1FECA7 | |
  CLC                                       ; $1FECA9 | /
code_1FECAA:
  RTS                                       ; $1FECAA |

; Calculates horizontal distance between two entities and stores it into the accumulator.
; Parameters:
; X - source entity index
; Y - target entity index
distance_to_entity:
  LDA {x_position_low},y                    ; $1FECAB | \
  SEC                                       ; $1FECAE | | Subtract source X from target X
  SBC {x_position_low},x                    ; $1FECAF | /
  PHA                                       ; $1FECB2 | \
  LDA {x_position_high},y                   ; $1FECB3 | | Subtract source's X screen from target's X screen
  SBC {x_position_high},x                   ; $1FECB6 | | Affects carry for the next check, inverting the result if they are on different ones
  PLA                                       ; $1FECB9 | /
  BCS code_1FECC1                           ; $1FECBA | \
  EOR #$FF                                  ; $1FECBC | | If negative, invert to get absolute value
  ADC #$01                                  ; $1FECBE | |
  CLC                                       ; $1FECC0 | /
code_1FECC1:
  RTS                                       ; $1FECC1 |

get_angle_to_player:
  LDY #$00                                  ; $1FECC2 |  Sets Y to 0, then proceeds to angleFunc

; Calculates angle from one entity to another and stores it in the accumulator.
; Angle values go from 0 to 15, clockwise starting North.
; Angle is obtained by calculating the slope using horizontal and vertical distances, and using that info + quadrant of the angle to get the proper angle value from a lookup table.
; Parameters:
; X - Source entity
; Y - Target entity
get_angle_to_entity:
  LDA {y_position_low},y                    ; $1FECC4 | \
  STA $00                                   ; $1FECC7 | | Load source entity Y into $00, X into $01 and X screen into $02.
  LDA {x_position_low},y                    ; $1FECC9 | |
  STA $01                                   ; $1FECCC | |
  LDA {x_position_high},y                   ; $1FECCE | |
  STA $02                                   ; $1FECD1 | /
  LDY #$00                                  ; $1FECD3 | We got the data we need from the source entity. From now on, the Y register serves as offset into angle table.
  LDA $00                                   ; $1FECD5 | \
  SEC                                       ; $1FECD7 | | Subtract target entity's Y from ours.
  SBC {y_position_low},x                    ; $1FECD8 | / 
  LDY #$00                                  ; $1FECDB | 
  BCS code_1FECE5                           ; $1FECDD | \ 
  EOR #$FF                                  ; $1FECDF | | 
  ADC #$01                                  ; $1FECE1 | | If Y distance is negative, set offset to 4, and set distance to absolute value.
  LDY #$04                                  ; $1FECE3 | | $00 is now absolute Y distance.
code_1FECE5:                                ;           |
  STA $00                                   ; $1FECE5 | /
  LDA $01                                   ; $1FECE7 | \
  SEC                                       ; $1FECE9 | | Subtract target entity's X from ours.
  SBC {x_position_low},x                    ; $1FECEA | |
  PHA                                       ; $1FECED | \
  LDA $02                                   ; $1FECEE | | Subtract target entity's X screen from ours. 
  SBC {x_position_high},x                   ; $1FECF0 | | Will affect the carry flag for the next comparison, as a result the distance will be inverted if the two entities are on different screens.
  PLA                                       ; $1FECF3 | /
  BCS code_1FECFC                           ; $1FECF4 | \
  EOR #$FF                                  ; $1FECF6 | |
  ADC #$01                                  ; $1FECF8 | |
  INY                                       ; $1FECFA | | If X distance is negative, increase offset by 2 and set distance to absolute value.
  INY                                       ; $1FECFB | | $01 is now absolute X distance.
code_1FECFC:                                ;           |
  STA $01                                   ; $1FECFC | /
  CMP $00                                   ; $1FECFE | \
  BCS code_1FED0B                           ; $1FED00 | |
  PHA                                       ; $1FED02 | |
  LDA $00                                   ; $1FED03 | | If $01 is less than $00, swap them and increase offset by 1.
  STA $01                                   ; $1FED05 | | From now on, $01 will be the bigger distance, and $00 the smaller one.
  PLA                                       ; $1FED07 | |
  STA $00                                   ; $1FED08 | |
  INY                                       ; $1FED0A | /
code_1FED0B:
  LDA #$00                                  ; $1FED0B |
  STA $02                                   ; $1FED0D | $02 will now be used to represent the angle's slope.
  LDA $01                                   ; $1FED0F | \
  LSR                                       ; $1FED11 | | Check if bigDistance/4 > smallDistance
  LSR                                       ; $1FED12 | | If so, angle's slope value is left at 0 - cardinal direction
  CMP $00                                   ; $1FED13 | | If not, increase slope steepness
  BCS code_1FED20                           ; $1FED15 | | 
  INC $02                                   ; $1FED17 | /
  ASL                                       ; $1FED19 | \ 
  CMP $00                                   ; $1FED1A | | Check if bigDistance/2 > smallDistance
  BCS code_1FED20                           ; $1FED1C | | If not, increase slope steepness
  INC $02                                   ; $1FED1E | /
code_1FED20:
  TYA                                       ; $1FED20 | \
  ASL                                       ; $1FED21 | | 4 slope value entries per table region, so multiply offset by 4
  ASL                                       ; $1FED22 | | Slope value 3 is never used, but probably done for performance reasons
  CLC                                       ; $1FED23 | /
  ADC $02                                   ; $1FED24 | Add slope value to offset
  TAY                                       ; $1FED26 |
  LDA get_angle_table,y                     ; $1FED27 | Load appropriate value from table 
  RTS                                       ; $1FED2A |

;Used by get_angle_to_entity
get_angle_table:
  db $04, $05, $06, $04, $08, $07, $06, $04 ; $1FED2B |
  db $0C, $0B, $0A, $04, $08, $09, $0A, $04 ; $1FED33 |
  db $04, $03, $02, $04, $00, $01, $02, $04 ; $1FED3B |
  db $0C, $0D, $0E, $04, $00, $0F, $0E, $04 ; $1FED43 |
  db $08, $09, $09, $09, $01, $05, $05, $05 ; $1FED4B |
  db $04, $06, $06, $06, $02, $0A, $0A, $0A ; $1FED53 |

code_1FED5B:
  LDY #$00                                  ; $1FED5B |
code_1FED5D:
  JSR get_angle_to_entity                   ; $1FED5D |
  STA $00                                   ; $1FED60 |
  TAY                                       ; $1FED62 |
  LDA {entity_var_d},x                      ; $1FED63 |
  CLC                                       ; $1FED66 |
  ADC #$08                                  ; $1FED67 |
  AND #$0F                                  ; $1FED69 |
  SEC                                       ; $1FED6B |
  SBC $00                                   ; $1FED6C |
  AND #$0F                                  ; $1FED6E |
  SEC                                       ; $1FED70 |
  SBC #$08                                  ; $1FED71 |
  BEQ code_1FED7F                           ; $1FED73 |
  BCS code_1FED7C                           ; $1FED75 |
  INC {entity_var_d},x                      ; $1FED77 |
  BNE code_1FED7F                           ; $1FED7A |
code_1FED7C:
  DEC {entity_var_d},x                      ; $1FED7C |
code_1FED7F:
  LDA {entity_var_d},x                      ; $1FED7F |
  AND #$0F                                  ; $1FED82 |
  STA {entity_var_d},x                      ; $1FED84 |
  TAY                                       ; $1FED87 |
  LDA $ED4B,y                               ; $1FED88 |
  STA {entity_direction},x                  ; $1FED8B |
  RTS                                       ; $1FED8E |

code_1FED8F:
  LDA {entity_display_flags},x              ; $1FED8F |
  BPL code_1FEDF4                           ; $1FED92 |
  LDA {y_position_high},x                   ; $1FED94 |
  BNE code_1FEDF4                           ; $1FED97 |
  STY $00                                   ; $1FED99 |
  LDY #$17                                  ; $1FED9B |
  STY $73                                   ; $1FED9D |
code_1FED9F:
  LDA {entity_type},y                       ; $1FED9F |
  BEQ code_1FEDEC                           ; $1FEDA2 |
  LDA {y_position_high},y                   ; $1FEDA4 |
  BNE code_1FEDEC                           ; $1FEDA7 |
  LDA {entity_display_flags},y              ; $1FEDA9 |
  AND #$04                                  ; $1FEDAC |
  BNE code_1FEDEC                           ; $1FEDAE |
  LDA {entity_display_flags},y              ; $1FEDB0 |
  AND #$03                                  ; $1FEDB3 |
  BEQ code_1FEDEC                           ; $1FEDB5 |
  AND #$01                                  ; $1FEDB7 |
  BEQ code_1FEDC0                           ; $1FEDB9 |
  LDA {y_speed},x                           ; $1FEDBB |
  BPL code_1FEDEC                           ; $1FEDBE |
code_1FEDC0:
  JSR code_1FEE4F                           ; $1FEDC0 |
  BNE code_1FEDEC                           ; $1FEDC3 |
  JSR code_1FEE70                           ; $1FEDC5 |
  BCC code_1FEDD1                           ; $1FEDC8 |
  LDA {entity_display_flags},y              ; $1FEDCA |
  AND #$01                                  ; $1FEDCD |
  BNE code_1FEDEC                           ; $1FEDCF |
code_1FEDD1:
  LDA $10                                   ; $1FEDD1 |
  CMP $13                                   ; $1FEDD3 |
  BCS code_1FEDEC                           ; $1FEDD5 |
  LDA $12                                   ; $1FEDD7 |
  SEC                                       ; $1FEDD9 |
  SBC $11                                   ; $1FEDDA |
  BCC code_1FEDEC                           ; $1FEDDC |
  STA $11                                   ; $1FEDDE |
  CMP #$08                                  ; $1FEDE0 |
  BCC code_1FEDE8                           ; $1FEDE2 |
  LDA #$08                                  ; $1FEDE4 |
  STA $11                                   ; $1FEDE6 |
code_1FEDE8:
  LDY $00                                   ; $1FEDE8 |
  SEC                                       ; $1FEDEA |
  RTS                                       ; $1FEDEB |

code_1FEDEC:
  DEC $73                                   ; $1FEDEC |
  LDY $73                                   ; $1FEDEE |
  BNE code_1FED9F                           ; $1FEDF0 |
  LDY $00                                   ; $1FEDF2 |
code_1FEDF4:
  CLC                                       ; $1FEDF4 |
  RTS                                       ; $1FEDF5 |

code_1FEDF6:
  LDA {entity_display_flags},x              ; $1FEDF6 |
  BPL code_1FEE4D                           ; $1FEDF9 |
  LDA {y_position_high},x                   ; $1FEDFB |
  BNE code_1FEE4D                           ; $1FEDFE |
  STY $00                                   ; $1FEE00 |
  LDY #$17                                  ; $1FEE02 |
  STY $01                                   ; $1FEE04 |
code_1FEE06:
  LDA {entity_type},y                       ; $1FEE06 |
  BEQ code_1FEE45                           ; $1FEE09 |
  CMP #$02                                  ; $1FEE0B |
  BEQ code_1FEE45                           ; $1FEE0D |
  LDA {y_position_high},y                   ; $1FEE0F |
  BNE code_1FEE45                           ; $1FEE12 |
  LDA {entity_display_flags},y              ; $1FEE14 |
  AND #$04                                  ; $1FEE17 |
  BNE code_1FEE45                           ; $1FEE19 |
  LDA {entity_display_flags},y              ; $1FEE1B |
  AND #$02                                  ; $1FEE1E |
  BEQ code_1FEE45                           ; $1FEE20 |
  JSR code_1FEE4F                           ; $1FEE22 |
  BNE code_1FEE45                           ; $1FEE25 |
  JSR code_1FEE70                           ; $1FEE27 |
  LDA $11                                   ; $1FEE2A |
  CMP $12                                   ; $1FEE2C |
  BCS code_1FEE45                           ; $1FEE2E |
  LDA $13                                   ; $1FEE30 |
  SEC                                       ; $1FEE32 |
  SBC $10                                   ; $1FEE33 |
  BCC code_1FEE45                           ; $1FEE35 |
  STA $10                                   ; $1FEE37 |
  CMP #$08                                  ; $1FEE39 |
  BCC code_1FEE41                           ; $1FEE3B |
  LDA #$08                                  ; $1FEE3D |
  STA $10                                   ; $1FEE3F |
code_1FEE41:
  LDY $00                                   ; $1FEE41 |
  SEC                                       ; $1FEE43 |
  RTS                                       ; $1FEE44 |

code_1FEE45:
  DEC $01                                   ; $1FEE45 |
  LDY $01                                   ; $1FEE47 |
  BNE code_1FEE06                           ; $1FEE49 |
  LDY $00                                   ; $1FEE4B |
code_1FEE4D:
  CLC                                       ; $1FEE4D |
  RTS                                       ; $1FEE4E |

code_1FEE4F:
  LDA {x_position_low}                      ; $1FEE4F |
  SEC                                       ; $1FEE52 |
  SBC {x_position_low},y                    ; $1FEE53 |
  STA $10                                   ; $1FEE56 |
  LDA {x_position_high}                     ; $1FEE58 |
  SBC {x_position_high},y                   ; $1FEE5B |
  BCS code_1FEE6F                           ; $1FEE5E |
  PHA                                       ; $1FEE60 |
  LDA $10                                   ; $1FEE61 |
  EOR #$FF                                  ; $1FEE63 |
  ADC #$01                                  ; $1FEE65 |
  STA $10                                   ; $1FEE67 |
  PLA                                       ; $1FEE69 |
  EOR #$FF                                  ; $1FEE6A |
  ADC #$00                                  ; $1FEE6C |
  CLC                                       ; $1FEE6E |
code_1FEE6F:
  RTS                                       ; $1FEE6F |

code_1FEE70:
  LDA {sprite_flags},y                      ; $1FEE70 |
  AND #$3F                                  ; $1FEE73 |
  TAX                                       ; $1FEE75 |
  LDA $F0B1,x                               ; $1FEE76 |
  STA $12                                   ; $1FEE79 |
  LDA $F0F1,x                               ; $1FEE7B |
  STA $13                                   ; $1FEE7E |
  LDA $30                                   ; $1FEE80 |
  CMP #$02                                  ; $1FEE82 |
  BNE code_1FEE8C                           ; $1FEE84 |
  LDA $12                                   ; $1FEE86 |
  SBC #$02                                  ; $1FEE88 |
  STA $12                                   ; $1FEE8A |
code_1FEE8C:
  LDA {y_position_low}                      ; $1FEE8C |
  SEC                                       ; $1FEE8F |
  SBC {y_position_low},y                    ; $1FEE90 |
  BCS code_1FEE9A                           ; $1FEE93 |
  EOR #$FF                                  ; $1FEE95 |
  ADC #$01                                  ; $1FEE97 |
  CLC                                       ; $1FEE99 |
code_1FEE9A:
  STA $11                                   ; $1FEE9A |
  PHP                                       ; $1FEE9C |
  BCC code_1FEEAB                           ; $1FEE9D |
  LDA $30                                   ; $1FEE9F |
  CMP #$02                                  ; $1FEEA1 |
  BNE code_1FEEAB                           ; $1FEEA3 |
  LDA $12                                   ; $1FEEA5 |
  SBC #$04                                  ; $1FEEA7 |
  STA $12                                   ; $1FEEA9 |
code_1FEEAB:
  LDX #$00                                  ; $1FEEAB |
  PLP                                       ; $1FEEAD |
  RTS                                       ; $1FEEAE |

code_1FEEAF:
  LDA $12                                   ; $1FEEAF |
  AND #$0F                                  ; $1FEEB1 |
  STA $12                                   ; $1FEEB3 |
  LDA {x_position_low},x                    ; $1FEEB5 |
  SEC                                       ; $1FEEB8 |
  SBC $12                                   ; $1FEEB9 |
  STA {x_position_low},x                    ; $1FEEBB |
  LDA {x_position_high},x                   ; $1FEEBE |
  SBC #$00                                  ; $1FEEC1 |
  STA {x_position_high},x                   ; $1FEEC3 |
  RTS                                       ; $1FEEC6 |

code_1FEEC7:
  LDA $12                                   ; $1FEEC7 |
  AND #$0F                                  ; $1FEEC9 |
  EOR #$0F                                  ; $1FEECB |
  SEC                                       ; $1FEECD |
  ADC {x_position_low},x                    ; $1FEECE |
  STA {x_position_low},x                    ; $1FEED1 |
  LDA {x_position_high},x                   ; $1FEED4 |
  ADC #$00                                  ; $1FEED7 |
  STA {x_position_high},x                   ; $1FEED9 |
  RTS                                       ; $1FEEDC |

code_1FEEDD:
  LDA $11                                   ; $1FEEDD |
  AND #$0F                                  ; $1FEEDF |
  EOR #$0F                                  ; $1FEEE1 |
  CLC                                       ; $1FEEE3 |
  ADC {y_position_low},x                    ; $1FEEE4 |
  STA {y_position_low},x                    ; $1FEEE7 |
  CMP #$F0                                  ; $1FEEEA |
  BCC code_1FEEF6                           ; $1FEEEC |
  ADC #$0F                                  ; $1FEEEE |
  STA {y_position_low},x                    ; $1FEEF0 |
  INC {y_position_high},x                   ; $1FEEF3 |
code_1FEEF6:
  RTS                                       ; $1FEEF6 |

code_1FEEF7:
  LDA $11                                   ; $1FEEF7 |
  PHA                                       ; $1FEEF9 |
  AND #$0F                                  ; $1FEEFA |
  STA $11                                   ; $1FEEFC |
  LDA {y_position_low},x                    ; $1FEEFE |
  SEC                                       ; $1FEF01 |
  SBC $11                                   ; $1FEF02 |
  STA {y_position_low},x                    ; $1FEF04 |
  BCS code_1FEF11                           ; $1FEF07 |
  SBC #$0F                                  ; $1FEF09 |
  STA {y_position_low},x                    ; $1FEF0B |
  DEC {y_position_high},x                   ; $1FEF0E |
code_1FEF11:
  PLA                                       ; $1FEF11 |
  STA $11                                   ; $1FEF12 |
  RTS                                       ; $1FEF14 |

code_1FEF15:
  SEC                                       ; $1FEF15 |
  LDA {x_position_low},x                    ; $1FEF16 |
  SBC $10                                   ; $1FEF19 |
  STA {x_position_low},x                    ; $1FEF1B |
  LDA {x_position_high},x                   ; $1FEF1E |
  SBC #$00                                  ; $1FEF21 |
  STA {x_position_high},x                   ; $1FEF23 |
  JMP code_1FEF3A                           ; $1FEF26 |

code_1FEF29:
  CLC                                       ; $1FEF29 |
  LDA {x_position_low},x                    ; $1FEF2A |
  ADC $10                                   ; $1FEF2D |
  STA {x_position_low},x                    ; $1FEF2F |
  LDA {x_position_high},x                   ; $1FEF32 |
  ADC #$00                                  ; $1FEF35 |
  STA {x_position_high},x                   ; $1FEF37 |
code_1FEF3A:
  SEC                                       ; $1FEF3A |
  LDA $02                                   ; $1FEF3B |
  SBC {x_position_low},x                    ; $1FEF3D |
  STA $02                                   ; $1FEF40 |
  LDA $03                                   ; $1FEF42 |
  SBC {x_position_high},x                   ; $1FEF44 |
  ORA $02                                   ; $1FEF47 |
  RTS                                       ; $1FEF49 |

code_1FEF4A:
  SEC                                       ; $1FEF4A |
  LDA {y_position_low},x                    ; $1FEF4B |
  SBC $11                                   ; $1FEF4E |
  STA {y_position_low},x                    ; $1FEF50 |
  BCS code_1FEF77                           ; $1FEF53 |
  SBC #$0F                                  ; $1FEF55 |
  STA {y_position_low},x                    ; $1FEF57 |
  DEC {y_position_high},x                   ; $1FEF5A |
  JMP code_1FEF77                           ; $1FEF5D |

code_1FEF60:
  CLC                                       ; $1FEF60 |
  LDA {y_position_low},x                    ; $1FEF61 |
  ADC $11                                   ; $1FEF64 |
  STA {y_position_low},x                    ; $1FEF66 |
  BCS code_1FEF74                           ; $1FEF69 |
  CMP #$F0                                  ; $1FEF6B |
  BCC code_1FEF77                           ; $1FEF6D |
  ADC #$0F                                  ; $1FEF6F |
  STA {y_position_low},x                    ; $1FEF71 |
code_1FEF74:
  INC {y_position_high},x                   ; $1FEF74 |
code_1FEF77:
  SEC                                       ; $1FEF77 |
  LDA $02                                   ; $1FEF78 |
  SBC {y_position_low},x                    ; $1FEF7A |
  STA $02                                   ; $1FEF7D |
  LDA $03                                   ; $1FEF7F |
  SBC {y_position_high},x                   ; $1FEF81 |
  ORA $02                                   ; $1FEF84 |
  RTS                                       ; $1FEF86 |

code_1FEF87:
  SEC                                       ; $1FEF87 |
  LDA {entity_display_flags}                ; $1FEF88 |
  BPL code_1FEFF7                           ; $1FEF8B |
  LDA {y_position_high}                     ; $1FEF8D |
  ORA {y_position_high},x                   ; $1FEF90 |
  BNE code_1FEFF7                           ; $1FEF93 |
  LDA {entity_display_flags},x              ; $1FEF95 |
  BPL code_1FEFF7                           ; $1FEF98 |
  AND #$04                                  ; $1FEF9A |
  BNE code_1FEFF7                           ; $1FEF9C |
  LDA {sprite_flags},x                      ; $1FEF9E |
  AND #$3F                                  ; $1FEFA1 |
  TAY                                       ; $1FEFA3 |
  LDA {x_position_low}                      ; $1FEFA4 |
  SEC                                       ; $1FEFA7 |
  SBC {x_position_low},x                    ; $1FEFA8 |
  PHA                                       ; $1FEFAB |
  LDA {x_position_high}                     ; $1FEFAC |
  SBC {x_position_high},x                   ; $1FEFAF |
  STA $00                                   ; $1FEFB2 |
  PLA                                       ; $1FEFB4 |
  BCS code_1FEFC5                           ; $1FEFB5 |
  EOR #$FF                                  ; $1FEFB7 |
  ADC #$01                                  ; $1FEFB9 |
  PHA                                       ; $1FEFBB |
  LDA $00                                   ; $1FEFBC |
  EOR #$FF                                  ; $1FEFBE |
  ADC #$00                                  ; $1FEFC0 |
  STA $00                                   ; $1FEFC2 |
  PLA                                       ; $1FEFC4 |
code_1FEFC5:
  CMP $F0F1,y                               ; $1FEFC5 |
  BCS code_1FEFF7                           ; $1FEFC8 |
  SEC                                       ; $1FEFCA |
  LDA $00                                   ; $1FEFCB |
  BNE code_1FEFF7                           ; $1FEFCD |
  LDA $F0B1,y                               ; $1FEFCF |
  STA $00                                   ; $1FEFD2 |
  LDA {animation_index}                     ; $1FEFD4 |
  CMP #$14                                  ; $1FEFD7 |
  BEQ code_1FEFE1                           ; $1FEFD9 |
  LDA $30                                   ; $1FEFDB |
  CMP #$02                                  ; $1FEFDD |
  BNE code_1FEFE8                           ; $1FEFDF |
code_1FEFE1:
  LDA $00                                   ; $1FEFE1 |
  SEC                                       ; $1FEFE3 |
  SBC #$07                                  ; $1FEFE4 |
  STA $00                                   ; $1FEFE6 |
code_1FEFE8:
  LDA {y_position_low}                      ; $1FEFE8 |
  SEC                                       ; $1FEFEB |
  SBC {y_position_low},x                    ; $1FEFEC |
  BCS code_1FEFF5                           ; $1FEFEF |
  EOR #$FF                                  ; $1FEFF1 |
  ADC #$01                                  ; $1FEFF3 |
code_1FEFF5:
  CMP $00                                   ; $1FEFF5 |
code_1FEFF7:
  RTS                                       ; $1FEFF7 |

code_1FEFF8:
  SEC                                       ; $1FEFF8 |
  LDA #$01                                  ; $1FEFF9 |
  STA $10                                   ; $1FEFFB |
  LDA {entity_type},x                       ; $1FEFFD |
  BEQ code_1FEFF7                           ; $1FF000 |
  LDA {entity_display_flags},x              ; $1FF002 |
  BPL code_1FEFF7                           ; $1FF005 |
  AND #$04                                  ; $1FF007 |
  BNE code_1FEFF7                           ; $1FF009 |
  LDA {y_position_high},x                   ; $1FF00B |
  BNE code_1FEFF7                           ; $1FF00E |
  LDY #$03                                  ; $1FF010 |
code_1FF012:
  LDA {entity_type},y                       ; $1FF012 |
  BEQ code_1FF068                           ; $1FF015 |
  LDA {entity_display_flags},y              ; $1FF017 |
  BPL code_1FF068                           ; $1FF01A |
  LDA {y_position_high},y                   ; $1FF01C |
  BNE code_1FF068                           ; $1FF01F |
  LDA {entity_type},y                       ; $1FF021 |
  CMP #$70                                  ; $1FF024 |
  BCC code_1FF068                           ; $1FF026 |
  JSR code_1FF06D                           ; $1FF028 |
  LDA {x_position_low},y                    ; $1FF02B |
  SEC                                       ; $1FF02E |
  SBC {x_position_low},x                    ; $1FF02F |
  PHA                                       ; $1FF032 |
  LDA {x_position_high},y                   ; $1FF033 |
  SBC {x_position_high},x                   ; $1FF036 |
  STA $02                                   ; $1FF039 |
  PLA                                       ; $1FF03B |
  BCS code_1FF04C                           ; $1FF03C |
  EOR #$FF                                  ; $1FF03E |
  ADC #$01                                  ; $1FF040 |
  PHA                                       ; $1FF042 |
  LDA $02                                   ; $1FF043 |
  EOR #$FF                                  ; $1FF045 |
  ADC #$00                                  ; $1FF047 |
  STA $02                                   ; $1FF049 |
  PLA                                       ; $1FF04B |
code_1FF04C:
  CMP $01                                   ; $1FF04C |
  BCS code_1FF068                           ; $1FF04E |
  LDA $02                                   ; $1FF050 |
  BNE code_1FF068                           ; $1FF052 |
  LDA {y_position_low},y                    ; $1FF054 |
  SEC                                       ; $1FF057 |
  SBC {y_position_low},x                    ; $1FF058 |
  BCS code_1FF061                           ; $1FF05B |
  EOR #$FF                                  ; $1FF05D |
  ADC #$01                                  ; $1FF05F |
code_1FF061:
  CMP $00                                   ; $1FF061 |
  BCS code_1FF068                           ; $1FF063 |
  STY $10                                   ; $1FF065 |
  RTS                                       ; $1FF067 |

code_1FF068:
  DEY                                       ; $1FF068 |
  BNE code_1FF012                           ; $1FF069 |
  SEC                                       ; $1FF06B |
  RTS                                       ; $1FF06C |

code_1FF06D:
  STY $02                                   ; $1FF06D |
  LDA {sprite_flags},x                      ; $1FF06F |
  AND #$3F                                  ; $1FF072 |
  TAY                                       ; $1FF074 |
  LDA $F0B1,y                               ; $1FF075 |
  STA $00                                   ; $1FF078 |
  LDA $F0F1,y                               ; $1FF07A |
  STA $01                                   ; $1FF07D |
  LDY $02                                   ; $1FF07F |
  LDA $32                                   ; $1FF081 |
  CMP #$01                                  ; $1FF083 |
  BEQ code_1FF092                           ; $1FF085 |
  LDA {entity_type},y                       ; $1FF087 |
  CMP #$C2                                  ; $1FF08A |
  BNE code_1FF09C                           ; $1FF08C |
  LDY #$13                                  ; $1FF08E |
  BNE code_1FF09E                           ; $1FF090 |
code_1FF092:
  LDA {animation_frame},y                   ; $1FF092 |
  TAY                                       ; $1FF095 |
  LDA $F159,y                               ; $1FF096 |
  TAY                                       ; $1FF099 |
  BNE code_1FF09E                           ; $1FF09A |
code_1FF09C:
  LDY $5B                                   ; $1FF09C |
code_1FF09E:
  LDA $00                                   ; $1FF09E |
  SEC                                       ; $1FF0A0 |
  SBC $F131,y                               ; $1FF0A1 |
  STA $00                                   ; $1FF0A4 |
  LDA $01                                   ; $1FF0A6 |
  SEC                                       ; $1FF0A8 |
  SBC $F145,y                               ; $1FF0A9 |
  STA $01                                   ; $1FF0AC |
  LDY $02                                   ; $1FF0AE |
  RTS                                       ; $1FF0B0 |

  db $14, $12, $74, $14, $3C, $10, $0F, $0E ; $1FF0B1 |
  db $16, $1C, $0E, $18, $18, $14, $12, $20 ; $1FF0B9 |
  db $18, $10, $1A, $1C, $20, $24, $12, $1C ; $1FF0C1 |
  db $28, $24, $0E, $12, $18, $14, $14, $14 ; $1FF0C9 |
  db $14, $1C, $10, $0E, $1C, $34, $1C, $4C ; $1FF0D1 |
  db $20, $1C, $18, $54, $54, $24, $24, $20 ; $1FF0D9 |
  db $14, $14, $1C, $1C, $0C, $0C, $0C, $0C ; $1FF0E1 |
  db $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C ; $1FF0E9 |
  db $10, $0E, $10, $78, $10, $0C, $0B, $0A ; $1FF0F1 |
  db $12, $14, $0E, $14, $12, $14, $10, $14 ; $1FF0F9 |
  db $0E, $10, $10, $0E, $0E, $0E, $0C, $12 ; $1FF101 |
  db $0E, $14, $10, $0A, $0A, $38, $30, $28 ; $1FF109 |
  db $0B, $20, $14, $0B, $18, $18, $48, $30 ; $1FF111 |
  db $0C, $38, $28, $10, $28, $20, $18, $1C ; $1FF119 |
  db $0E, $20, $24, $28, $08, $08, $08, $08 ; $1FF121 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $1FF129 |
  db $0A, $08, $08, $04, $08, $0A, $04, $94 ; $1FF131 |
  db $0A, $F8, $0A, $0A, $08, $06, $00, $08 ; $1FF139 |
  db $04, $00, $FC, $00, $05, $06, $FC, $05 ; $1FF141 |
  db $00, $FC, $00, $88, $05, $F4, $05, $05 ; $1FF149 |
  db $04, $02, $00, $04, $06, $06, $06, $FC ; $1FF151 |
  db $01, $10, $11, $12, $11, $10           ; $1FF159 |

code_1FF15F:
  LDX #$08                                  ; $1FF15F |
code_1FF161:
  LDA {entity_type},x                       ; $1FF161 |
  BEQ code_1FF16D                           ; $1FF164 |
  INX                                       ; $1FF166 |
  CPX #$18                                  ; $1FF167 |
  BNE code_1FF161                           ; $1FF169 |
  SEC                                       ; $1FF16B |
  RTS                                       ; $1FF16C |

code_1FF16D:
  CLC                                       ; $1FF16D |
  RTS                                       ; $1FF16E |

code_1FF16F:
  LDY #$08                                  ; $1FF16F |
code_1FF171:
  LDA {entity_type},y                       ; $1FF171 |
  BEQ code_1FF17D                           ; $1FF174 |
  INY                                       ; $1FF176 |
  CPY #$18                                  ; $1FF177 |
  BNE code_1FF171                           ; $1FF179 |
  SEC                                       ; $1FF17B |
  RTS                                       ; $1FF17C |

code_1FF17D:
  CLC                                       ; $1FF17D |
  RTS                                       ; $1FF17E |

  JSR distance_to_player                    ; $1FF17F |
  STA $0A                                   ; $1FF182 |
  LDA #$01                                  ; $1FF184 |
  BCS code_1FF18A                           ; $1FF186 |
  LDA #$02                                  ; $1FF188 |
code_1FF18A:
  STA $0C                                   ; $1FF18A |
  JSR vertical_distance_to_player           ; $1FF18C |
  STA $0B                                   ; $1FF18F |
  LDA #$04                                  ; $1FF191 |
  BCS code_1FF197                           ; $1FF193 |
  LDA #$08                                  ; $1FF195 |
code_1FF197:
  ORA $0C                                   ; $1FF197 |
  STA $0C                                   ; $1FF199 |
  LDA $0B                                   ; $1FF19B |
  CMP $0A                                   ; $1FF19D |
  BCS code_1FF1D4                           ; $1FF19F |
  LDA $02                                   ; $1FF1A1 |
  STA {x_speed_frac},x                      ; $1FF1A3 |
  LDA $03                                   ; $1FF1A6 |
  STA {x_speed},x                           ; $1FF1A8 |
  LDA $0A                                   ; $1FF1AB |
  STA $01                                   ; $1FF1AD |
  LDA #$00                                  ; $1FF1AF |
  STA $00                                   ; $1FF1B1 |
  JSR code_1FF22D                           ; $1FF1B3 |
  LDA $04                                   ; $1FF1B6 |
  STA $02                                   ; $1FF1B8 |
  LDA $05                                   ; $1FF1BA |
  STA $03                                   ; $1FF1BC |
  LDA $0B                                   ; $1FF1BE |
  STA $01                                   ; $1FF1C0 |
  LDA #$00                                  ; $1FF1C2 |
  STA $00                                   ; $1FF1C4 |
  JSR code_1FF22D                           ; $1FF1C6 |
  LDA $04                                   ; $1FF1C9 |
  STA {y_speed_frac},x                      ; $1FF1CB |
  LDA $05                                   ; $1FF1CE |
  STA {y_speed},x                           ; $1FF1D0 |
  RTS                                       ; $1FF1D3 |

code_1FF1D4:
  LDA $02                                   ; $1FF1D4 |
  STA {y_speed_frac},x                      ; $1FF1D6 |
  LDA $03                                   ; $1FF1D9 |
  STA {y_speed},x                           ; $1FF1DB |
  LDA $0B                                   ; $1FF1DE |
  STA $01                                   ; $1FF1E0 |
  LDA #$00                                  ; $1FF1E2 |
  STA $00                                   ; $1FF1E4 |
  JSR code_1FF22D                           ; $1FF1E6 |
  LDA $04                                   ; $1FF1E9 |
  STA $02                                   ; $1FF1EB |
  LDA $05                                   ; $1FF1ED |
  STA $03                                   ; $1FF1EF |
  LDA $0A                                   ; $1FF1F1 |
  STA $01                                   ; $1FF1F3 |
  LDA #$00                                  ; $1FF1F5 |
  STA $00                                   ; $1FF1F7 |
  JSR code_1FF22D                           ; $1FF1F9 |
  LDA $04                                   ; $1FF1FC |
  STA {x_speed_frac},x                      ; $1FF1FE |
  LDA $05                                   ; $1FF201 |
  STA {x_speed},x                           ; $1FF203 |
  RTS                                       ; $1FF206 |

code_1FF207:
  LDA #$00                                  ; $1FF207 |
  STA $02                                   ; $1FF209 |
  STA $03                                   ; $1FF20B |
  LDA $00                                   ; $1FF20D |
  ORA $01                                   ; $1FF20F |
  BNE code_1FF216                           ; $1FF211 |
  STA $02                                   ; $1FF213 |
  RTS                                       ; $1FF215 |

code_1FF216:
  LDY #$08                                  ; $1FF216 |
code_1FF218:
  ASL $02                                   ; $1FF218 |
  ROL $00                                   ; $1FF21A |
  ROL $03                                   ; $1FF21C |
  SEC                                       ; $1FF21E |
  LDA $03                                   ; $1FF21F |
  SBC $01                                   ; $1FF221 |
  BCC code_1FF229                           ; $1FF223 |
  STA $03                                   ; $1FF225 |
  INC $02                                   ; $1FF227 |
code_1FF229:
  DEY                                       ; $1FF229 |
  BNE code_1FF218                           ; $1FF22A |
  RTS                                       ; $1FF22C |

code_1FF22D:
  LDA #$00                                  ; $1FF22D |
  STA $06                                   ; $1FF22F |
  STA $07                                   ; $1FF231 |
  LDA $00                                   ; $1FF233 |
  ORA $01                                   ; $1FF235 |
  ORA $02                                   ; $1FF237 |
  ORA $03                                   ; $1FF239 |
  BNE code_1FF242                           ; $1FF23B |
  STA $04                                   ; $1FF23D |
  STA $05                                   ; $1FF23F |
  RTS                                       ; $1FF241 |

code_1FF242:
  STX $09                                   ; $1FF242 |
  LDY #$10                                  ; $1FF244 |
code_1FF246:
  ASL $06                                   ; $1FF246 |
  ROL $00                                   ; $1FF248 |
  ROL $01                                   ; $1FF24A |
  ROL $07                                   ; $1FF24C |
  SEC                                       ; $1FF24E |
  LDA $01                                   ; $1FF24F |
  SBC $02                                   ; $1FF251 |
  TAX                                       ; $1FF253 |
  LDA $07                                   ; $1FF254 |
  SBC $03                                   ; $1FF256 |
  BCC code_1FF260                           ; $1FF258 |
  STX $01                                   ; $1FF25A |
  STA $07                                   ; $1FF25C |
  INC $06                                   ; $1FF25E |
code_1FF260:
  DEY                                       ; $1FF260 |
  BNE code_1FF246                           ; $1FF261 |
  LDA $06                                   ; $1FF263 |
  STA $04                                   ; $1FF265 |
  LDA $00                                   ; $1FF267 |
  STA $05                                   ; $1FF269 |
  LDX $09                                   ; $1FF26B |
  RTS                                       ; $1FF26D |

  STA $00                                   ; $1FF26E |
  STY $01                                   ; $1FF270 |
  LDA #$00                                  ; $1FF272 |
  STA $02                                   ; $1FF274 |
  STA $03                                   ; $1FF276 |
  STA $04                                   ; $1FF278 |
  LDY #$08                                  ; $1FF27A |
code_1FF27C:
  LSR $01                                   ; $1FF27C |
  BCC code_1FF28D                           ; $1FF27E |
  CLC                                       ; $1FF280 |
  LDA $00                                   ; $1FF281 |
  ADC $02                                   ; $1FF283 |
  STA $02                                   ; $1FF285 |
  LDA $04                                   ; $1FF287 |
  ADC $03                                   ; $1FF289 |
  STA $03                                   ; $1FF28B |
code_1FF28D:
  ASL $00                                   ; $1FF28D |
  ROR $04                                   ; $1FF28F |
  DEY                                       ; $1FF291 |
  BNE code_1FF27C                           ; $1FF292 |
  LDA $02                                   ; $1FF294 |
  RTS                                       ; $1FF296 |

code_1FF297:
  LDA $0438,x                               ; $1FF297 |
  AND #$07                                  ; $1FF29A |
  TAY                                       ; $1FF29C |
  LDA $F2B2,y                               ; $1FF29D |
  STA $00                                   ; $1FF2A0 |
  LDA $0438,x                               ; $1FF2A2 |
  LSR                                       ; $1FF2A5 |
  LSR                                       ; $1FF2A6 |
  LSR                                       ; $1FF2A7 |
  TAY                                       ; $1FF2A8 |
  LDA $0100,y                               ; $1FF2A9 |
  ORA $00                                   ; $1FF2AC |
  STA $0100,y                               ; $1FF2AE |
  RTS                                       ; $1FF2B1 |

  db $01, $02, $04, $08, $10, $20, $40, $80 ; $1FF2B2 |
  db $FE, $FD, $FB, $F7, $EF, $DF, $BF, $7F ; $1FF2BA |
  db $00, $20                               ; $1FF2C2 |

code_1FF2C4:
  LDA #$FF                                  ; $1FF2C4 |
  STA $0438,x                               ; $1FF2C6 |
  LDA #$00                                  ; $1FF2C9 |
  STA {entity_handler_high},x               ; $1FF2CB |
  STA {entity_type},x                       ; $1FF2CE |
  STA {entity_flash_counter},x              ; $1FF2D1 |
  STA {entity_life},x                       ; $1FF2D4 |
  STA {sprite_flags},x                      ; $1FF2D7 |
  STA {entity_var_a},x                      ; $1FF2DA |
  STA {entity_var_b},x                      ; $1FF2DD |
  STA {entity_var_c},x                      ; $1FF2E0 |
  STA {entity_var_d},x                      ; $1FF2E3 |
  STA {entity_var_e},x                      ; $1FF2E6 |
  STA {entity_var_f},x                      ; $1FF2E9 |
  STA {entity_var_g},x                      ; $1FF2EC |
  STA {entity_var_h},x                      ; $1FF2EF |
  RTS                                       ; $1FF2F2 |

code_1FF2F3:
  LDA {entity_type},y                       ; $1FF2F3 |
  CMP #$C5                                  ; $1FF2F6 |
  BEQ code_1FF32C                           ; $1FF2F8 |
  CMP #$79                                  ; $1FF2FA |
  BEQ code_1FF32C                           ; $1FF2FC |
code_1FF2FE:
  LDA #$FF                                  ; $1FF2FE |
  STA $0438,y                               ; $1FF300 |
  LDA #$00                                  ; $1FF303 |
  STA {entity_handler_high},y               ; $1FF305 |
  STA {entity_type},y                       ; $1FF308 |
  STA {entity_flash_counter},y              ; $1FF30B |
  STA {entity_life},y                       ; $1FF30E |
  STA {sprite_flags},y                      ; $1FF311 |
  STA {entity_var_a},y                      ; $1FF314 |
  STA {entity_var_b},y                      ; $1FF317 |
  STA {entity_var_c},y                      ; $1FF31A |
  STA {entity_var_d},y                      ; $1FF31D |
  STA {entity_var_e},y                      ; $1FF320 |
  STA {entity_var_f},y                      ; $1FF323 |
  STA {entity_var_g},y                      ; $1FF326 |
  STA {entity_var_h},y                      ; $1FF329 |
code_1FF32C:
  RTS                                       ; $1FF32C |

code_1FF32D:
  LDA $F5                                   ; $1FF32D |
  PHA                                       ; $1FF32F |
  LDA $F6                                   ; $1FF330 |
  PHA                                       ; $1FF332 |
  LDA #$00                                  ; $1FF333 |
  STA $F5                                   ; $1FF335 |
  LDA $26                                   ; $1FF337 |
  STA $F6                                   ; $1FF339 |
  JSR select_PRG_banks                      ; $1FF33B |
  JSR $8000                                 ; $1FF33E |
  PLA                                       ; $1FF341 |
  STA $F6                                   ; $1FF342 |
  PLA                                       ; $1FF344 |
  STA $F5                                   ; $1FF345 |
  JMP select_PRG_banks                      ; $1FF347 |

code_1FF34A:
  LDA $F5                                   ; $1FF34A |
  PHA                                       ; $1FF34C |
  LDA $F6                                   ; $1FF34D |
  PHA                                       ; $1FF34F |
  LDA #$04                                  ; $1FF350 |
  STA $9F                                   ; $1FF352 |
  JSR code_1EC38F                           ; $1FF354 |
  JSR code_1EDF5E                           ; $1FF357 |
  PLA                                       ; $1FF35A |
  STA $F6                                   ; $1FF35B |
  PLA                                       ; $1FF35D |
  STA $F5                                   ; $1FF35E |
  JMP select_PRG_banks                      ; $1FF360 |

code_1FF363:
  INC $95                                   ; $1FF363 |
  JSR code_1FF34A                           ; $1FF365 |
  LDA #$00                                  ; $1FF368 |
  STA $95                                   ; $1FF36A |
  JMP async_next_frame                      ; $1FF36C |

code_1FF36F:
  LDA $F5                                   ; $1FF36F |
  PHA                                       ; $1FF371 |
  LDA $F6                                   ; $1FF372 |
  PHA                                       ; $1FF374 |
  INC $95                                   ; $1FF375 |
  LDX #$44                                  ; $1FF377 |
  STX $9F                                   ; $1FF379 |
  JSR code_1EC391                           ; $1FF37B |
  JSR code_1EDF5E                           ; $1FF37E |
  LDA #$00                                  ; $1FF381 |
  STA $95                                   ; $1FF383 |
  PLA                                       ; $1FF385 |
  STA $F6                                   ; $1FF386 |
  PLA                                       ; $1FF388 |
  STA $F5                                   ; $1FF389 |
  JSR select_PRG_banks                      ; $1FF38B |
  JMP async_next_frame                      ; $1FF38E |

code_1FF391:
  LDA $F5                                   ; $1FF391 |
  PHA                                       ; $1FF393 |
  LDA $F6                                   ; $1FF394 |
  PHA                                       ; $1FF396 |
  INC $95                                   ; $1FF397 |
  LDX #$00                                  ; $1FF399 |
  LDA #$F8                                  ; $1FF39B |
code_1FF39D:
  STA $0200,x                               ; $1FF39D |
  INX                                       ; $1FF3A0 |
  INX                                       ; $1FF3A1 |
  INX                                       ; $1FF3A2 |
  INX                                       ; $1FF3A3 |
  CPX #$C0                                  ; $1FF3A4 |
  BNE code_1FF39D                           ; $1FF3A6 |
  LDX #$04                                  ; $1FF3A8 |
  STX $9F                                   ; $1FF3AA |
  JSR code_1EDF5E                           ; $1FF3AC |
  LDA #$00                                  ; $1FF3AF |
  STA $95                                   ; $1FF3B1 |
  PLA                                       ; $1FF3B3 |
  STA $F6                                   ; $1FF3B4 |
  PLA                                       ; $1FF3B6 |
  STA $F5                                   ; $1FF3B7 |
  JSR select_PRG_banks                      ; $1FF3B9 |
  JMP async_next_frame                      ; $1FF3BC |

code_1FF3BF:
  LDY #$03                                  ; $1FF3BF |
code_1FF3C1:
  LDA $32                                   ; $1FF3C1 |
  BEQ code_1FF3D4                           ; $1FF3C3 |
  LDA $0630,y                               ; $1FF3C5 |
  STA $0610,y                               ; $1FF3C8 |
  LDA $0634,y                               ; $1FF3CB |
  STA $0614,y                               ; $1FF3CE |
  JMP code_1FF3E6                           ; $1FF3D1 |

code_1FF3D4:
  LDA $D4B2,y                               ; $1FF3D4 |
  STA $0630,y                               ; $1FF3D7 |
  STA $0610,y                               ; $1FF3DA |
  LDA $D4B6,y                               ; $1FF3DD |
  STA $0634,y                               ; $1FF3E0 |
  STA $0614,y                               ; $1FF3E3 |
code_1FF3E6:
  DEY                                       ; $1FF3E6 |
  BPL code_1FF3C1                           ; $1FF3E7 |
  LDA $0600                                 ; $1FF3E9 |
  STA $0610                                 ; $1FF3EC |
  STY $18                                   ; $1FF3EF |
  RTS                                       ; $1FF3F1 |

code_1FF3F2:
  LDA $30                                   ; $1FF3F2 |
  STA $00                                   ; $1FF3F4 |
  LDA $2D                                   ; $1FF3F6 |
  STA $01                                   ; $1FF3F8 |
  LDA $2E                                   ; $1FF3FA |
  STA $02                                   ; $1FF3FC |
  LDA $32                                   ; $1FF3FE |
  STA $03                                   ; $1FF400 |
  LDA $50                                   ; $1FF402 |
  STA $04                                   ; $1FF404 |
  LDA #$00                                  ; $1FF406 |
  LDY #$0F                                  ; $1FF408 |
code_1FF40A:
  STA $0030,y                               ; $1FF40A |
  STA $0050,y                               ; $1FF40D |
  DEY                                       ; $1FF410 |
  BPL code_1FF40A                           ; $1FF411 |
  STA $25                                   ; $1FF413 |
  STA $AF                                   ; $1FF415 |
  STA $52                                   ; $1FF417 |
  STA $43                                   ; $1FF419 |
  STA $FC                                   ; $1FF41B |
  STA $FD                                   ; $1FF41D |
  STA $FA                                   ; $1FF41F |
  STA $FB                                   ; $1FF421 |
  STA $05F0                                 ; $1FF423 |
  STA $05F1                                 ; $1FF426 |
  STA $05F2                                 ; $1FF429 |
  STA $05F3                                 ; $1FF42C |
  STA $05D0                                 ; $1FF42F |
  STA $2D                                   ; $1FF432 |
  STA $2E                                   ; $1FF434 |
  STA $2F                                   ; $1FF436 |
  LDY #$3F                                  ; $1FF438 |
code_1FF43A:
  STA $06C0,y                               ; $1FF43A |
  CPY #$1F                                  ; $1FF43D |
  BCS code_1FF444                           ; $1FF43F |
  STA $0680,y                               ; $1FF441 |
code_1FF444:
  DEY                                       ; $1FF444 |
  BPL code_1FF43A                           ; $1FF445 |
  LDA $00                                   ; $1FF447 |
  STA $30                                   ; $1FF449 |
  CMP #$16                                  ; $1FF44B |
  BEQ code_1FF454                           ; $1FF44D |
  CMP #$17                                  ; $1FF44F |
  BEQ code_1FF454                           ; $1FF451 |
  RTS                                       ; $1FF453 |

code_1FF454:
  LDA $01                                   ; $1FF454 |
  STA $2D                                   ; $1FF456 |
  LDA $02                                   ; $1FF458 |
  STA $2E                                   ; $1FF45A |
  LDA $03                                   ; $1FF45C |
  STA $32                                   ; $1FF45E |
  LDA $04                                   ; $1FF460 |
  STA $50                                   ; $1FF462 |
  RTS                                       ; $1FF464 |

code_1FF465:
  LDY #$1F                                  ; $1FF465 |
  LDA #$00                                  ; $1FF467 |
code_1FF469:
  STA $0100,y                               ; $1FF469 |
  DEY                                       ; $1FF46C |
  BPL code_1FF469                           ; $1FF46D |
  RTS                                       ; $1FF46F |

code_1FF470:
  STY $00                                   ; $1FF470 |
  STA $01                                   ; $1FF472 |
  LDA $ED4B,y                               ; $1FF474 |
  STA {entity_direction},x                  ; $1FF477 |
  LDA $00                                   ; $1FF47A |
  AND #$07                                  ; $1FF47C |
  ORA $01                                   ; $1FF47E |
  TAY                                       ; $1FF480 |
  LDA $F49E,y                               ; $1FF481 |
  STA {x_speed_frac},x                      ; $1FF484 |
  LDA $F4EE,y                               ; $1FF487 |
  STA {x_speed},x                           ; $1FF48A |
  TYA                                       ; $1FF48D |
  EOR #$04                                  ; $1FF48E |
  TAY                                       ; $1FF490 |
  LDA $F49E,y                               ; $1FF491 |
  STA {y_speed_frac},x                      ; $1FF494 |
  LDA $F4EE,y                               ; $1FF497 |
  STA {y_speed},x                           ; $1FF49A |
  RTS                                       ; $1FF49D |

  db $00, $18, $2D, $3B, $40, $3B, $2D, $18 ; $1FF49E |
  db $00, $C3, $6A, $D9, $00, $D9, $6A, $C3 ; $1FF4A6 |
  db $00, $87, $D4, $B2, $00, $B2, $D4, $87 ; $1FF4AE |
  db $00, $9C, $21, $7A, $99, $7A, $21, $9C ; $1FF4B6 |
  db $00, $61, $B5, $EC, $00, $EC, $B5, $61 ; $1FF4BE |
  db $00, $25, $1F, $C5, $00, $C5, $1F, $25 ; $1FF4C6 |
  db $00, $E9, $89, $9E, $00, $9E, $89, $E9 ; $1FF4CE |
  db $00, $30, $5A, $76, $80, $76, $5A, $30 ; $1FF4D6 |
  db $00, $F4, $C4, $4F, $80, $4F, $C4, $F4 ; $1FF4DE |
  db $00, $0F, $A8, $64, $00, $64, $A8, $0F ; $1FF4E6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF4EE |
  db $00, $00, $01, $01, $02, $01, $01, $00 ; $1FF4F6 |
  db $00, $01, $02, $03, $04, $03, $02, $01 ; $1FF4FE |
  db $00, $00, $01, $01, $01, $01, $01, $00 ; $1FF506 |
  db $00, $00, $00, $00, $01, $00, $00, $00 ; $1FF50E |
  db $00, $01, $02, $02, $03, $02, $02, $01 ; $1FF516 |
  db $00, $01, $03, $04, $05, $04, $03, $01 ; $1FF51E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF526 |
  db $00, $00, $01, $02, $02, $02, $01, $00 ; $1FF52E |
  db $00, $03, $05, $07, $08, $07, $05, $03 ; $1FF536 |
  db $FF, $75, $FF, $55, $FF, $D5, $FF, $55 ; $1FF53E |
  db $FF, $DF, $F7, $FD, $FB, $55, $FF, $77 ; $1FF546 |
  db $FE, $5D, $FF, $D5, $EF, $45, $FF, $CD ; $1FF54E |
  db $FF, $D5, $FF, $D5, $FF, $D5, $FA, $7B ; $1FF556 |
  db $FF, $7F, $FF, $75, $FF, $F7, $FF, $D5 ; $1FF55E |
  db $FF, $D3, $FE, $75, $DF, $F7, $FB, $D7 ; $1FF566 |
  db $FF, $55, $FF, $55, $FE, $C5, $F7, $77 ; $1FF56E |
  db $FE, $75, $FE, $7D, $7F, $5D, $7F, $DD ; $1FF576 |
  db $F7, $75, $7F, $7B, $FF, $DD, $FF, $41 ; $1FF57E |
  db $FF, $55, $FB, $55, $FB, $95, $FE, $7D ; $1FF586 |
  db $FF, $75, $FF, $CF, $FF, $F3, $FF, $5D ; $1FF58E |
  db $FF, $F5, $FF, $67, $FF, $D7, $DF, $55 ; $1FF596 |
  db $FF, $5F, $FF, $75, $FF, $D5, $F7, $DD ; $1FF59E |
  db $9D, $DF, $FF, $55, $7F, $55, $FF, $5D ; $1FF5A6 |
  db $77, $35, $FF, $5F, $F2, $5D, $FF, $CD ; $1FF5AE |
  db $F7, $D7, $FF, $55, $7F, $55, $7F, $D5 ; $1FF5B6 |
  db $FB, $F7, $7F, $4D, $FF, $7D, $FE, $77 ; $1FF5BE |
  db $FF, $FF, $FF, $7D, $FF, $55, $BF, $5D ; $1FF5C6 |
  db $FF, $57, $F9, $D5, $FF, $75, $7F, $55 ; $1FF5CE |
  db $FD, $57, $FF, $45, $FF, $77, $FF, $75 ; $1FF5D6 |
  db $EF, $F5, $FF, $35, $DF, $5F, $FF, $7D ; $1FF5DE |
  db $FB, $D7, $FF, $65, $FB, $DD, $BF, $B5 ; $1FF5E6 |
  db $FF, $7D, $FF, $7F, $FB, $DD, $FB, $5F ; $1FF5EE |
  db $FF, $D7, $FF, $75, $FF, $57, $FF, $D5 ; $1FF5F6 |
  db $FF, $75, $07, $01, $FF, $D1, $FF, $5D ; $1FF5FE |
  db $FF, $53, $FF, $DD, $FD, $77, $D7, $5F ; $1FF606 |
  db $F7, $FF, $F7, $77, $FF, $57, $FF, $34 ; $1FF60E |
  db $FF, $55, $7F, $75, $DF, $57, $BF, $59 ; $1FF616 |
  db $F7, $F1, $FD, $5D, $FB, $D5, $FF, $95 ; $1FF61E |
  db $DD, $D5, $FF, $75, $FF, $55, $FF, $FD ; $1FF626 |
  db $FF, $77, $BD, $DD, $FF, $FF, $FF, $55 ; $1FF62E |
  db $7F, $7D, $DF, $55, $FF, $D5, $FF, $75 ; $1FF636 |
  db $FF, $55, $DF, $51, $BF, $5F, $FF, $77 ; $1FF63E |
  db $BF, $5D, $BF, $57, $7F, $5D, $FF, $5F ; $1FF646 |
  db $7F, $63, $FF, $57, $FE, $5F, $FF, $56 ; $1FF64E |
  db $FF, $D5, $FF, $77, $DF, $75, $FF, $7D ; $1FF656 |
  db $FB, $75, $FF, $F7, $DF, $F5, $FF, $5D ; $1FF65E |
  db $FF, $57, $FF, $5D, $FF, $5B, $FF, $7F ; $1FF666 |
  db $FF, $57, $FF, $37, $DF, $57, $DF, $55 ; $1FF66E |
  db $FF, $D7, $FF, $77, $FF, $D7, $FF, $77 ; $1FF676 |
  db $FD, $DD, $FE, $5D, $FF, $DC, $F7, $7D ; $1FF67E |
  db $FF, $55, $FD, $55, $F6, $F5, $FF, $57 ; $1FF686 |
  db $FE, $55, $FF, $57, $FE, $D7, $FF, $55 ; $1FF68E |
  db $7F, $73, $F7, $55, $FF, $D5, $DF, $4F ; $1FF696 |
  db $FF, $71, $EB, $E5, $FF, $55, $FF, $75 ; $1FF69E |
  db $FF, $D7, $FF, $57, $FF, $D5, $FF, $FD ; $1FF6A6 |
  db $7F, $D5, $FF, $75, $FF, $C7, $FD, $5D ; $1FF6AE |
  db $FA, $5D, $FF, $55, $FD, $55, $DF, $7D ; $1FF6B6 |
  db $F7, $FD, $FF, $78, $FB, $57, $F9, $75 ; $1FF6BE |
  db $FF, $75, $FF, $55, $F7, $77, $FF, $5D ; $1FF6C6 |
  db $F7, $77, $FE, $D7, $FF, $D7, $FF, $5D ; $1FF6CE |
  db $FF, $45, $EE, $4D, $FF, $DD, $FF, $57 ; $1FF6D6 |
  db $FB, $D5, $FF, $7F, $FF, $45, $FD, $65 ; $1FF6DE |
  db $FF, $C5, $FF, $57, $FF, $75, $FF, $5D ; $1FF6E6 |
  db $FF, $77, $FF, $75, $FF, $C7, $FD, $DF ; $1FF6EE |
  db $7D, $75, $FF, $75, $F4, $59, $7F, $D5 ; $1FF6F6 |
  db $FF, $77, $FF, $55, $BF, $5D, $FF, $5D ; $1FF6FE |
  db $FB, $5F, $77, $F3, $FF, $55, $FF, $7D ; $1FF706 |
  db $EF, $57, $FF, $57, $FF, $57, $F7, $5F ; $1FF70E |
  db $FF, $57, $FF, $F5, $F9, $01, $DF, $D5 ; $1FF716 |
  db $7D, $01, $FF, $5D, $FF, $77, $FF, $5D ; $1FF71E |
  db $FF, $94, $EF, $DD, $FF, $7D, $FF, $54 ; $1FF726 |
  db $FF, $57, $FF, $5F, $BE, $7D, $EF, $75 ; $1FF72E |
  db $FF, $55, $FF, $FF, $FD, $55, $DF, $71 ; $1FF736 |
  db $FF, $55, $FF, $75, $FF, $67, $EF, $55 ; $1FF73E |
  db $FF, $75, $FF, $5D, $FF, $51, $F7, $55 ; $1FF746 |
  db $FF, $DF, $FF, $75, $FD, $7F, $FF, $7D ; $1FF74E |
  db $FF, $D5, $FF, $55, $FF, $5F, $DF, $5D ; $1FF756 |
  db $FD, $F5, $FF, $DD, $FF, $95, $FF, $57 ; $1FF75E |
  db $FF, $7D, $DF, $D5, $DB, $5F, $FF, $5F ; $1FF766 |
  db $FF, $7D, $FF, $5F, $FE, $55, $FF, $5D ; $1FF76E |
  db $7E, $5F, $FF, $DF, $BF, $7D, $F7, $B7 ; $1FF776 |
  db $BB, $F5, $FF, $7D, $FF, $75, $FF, $CD ; $1FF77E |
  db $FF, $75, $FF, $15, $FF, $55, $FF, $65 ; $1FF786 |
  db $EF, $C5, $EF, $57, $FF, $7E, $FF, $C5 ; $1FF78E |
  db $3F, $75, $FF, $D1, $FF, $FF, $FF, $7D ; $1FF796 |
  db $BF, $F5, $FF, $79, $FF, $5D, $FF, $D5 ; $1FF79E |
  db $FE, $F5, $FF, $31, $FF, $37, $FF, $57 ; $1FF7A6 |
  db $FF, $75, $FF, $7D, $BF, $77, $FF, $7D ; $1FF7AE |
  db $EF, $F5, $FB, $5D, $EF, $DD, $FF, $73 ; $1FF7B6 |
  db $FF, $FD, $FB, $79, $DF, $D6, $FF, $55 ; $1FF7BE |
  db $FF, $FD, $FF, $5F, $FF, $55, $FE, $59 ; $1FF7C6 |
  db $7F, $55, $FF, $57, $FF, $7E, $FF, $D7 ; $1FF7CE |
  db $DF, $FF, $DF, $D7, $FF, $D3, $FF, $57 ; $1FF7D6 |
  db $FF, $75, $FF, $5D, $FF, $D5, $FF, $5D ; $1FF7DE |
  db $5F, $5D, $E7, $7D, $FF, $55, $FF, $F5 ; $1FF7E6 |
  db $FF, $5D, $FF, $55, $FF, $55, $F7, $5F ; $1FF7EE |
  db $FF, $F5, $F7, $55, $FF, $55, $FF, $71 ; $1FF7F6 |
  db $FF, $F5, $00, $00, $00, $00, $00, $00 ; $1FF7FE |
  db $00, $00, $00, $00, $00, $00, $00, $40 ; $1FF806 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF80E |
  db $00, $01, $00, $00, $00, $00, $00, $20 ; $1FF816 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF81E |
  db $00, $00, $00, $00, $00, $20, $00, $00 ; $1FF826 |
  db $00, $00, $00, $00, $00, $40, $00, $00 ; $1FF82E |
  db $02, $22, $00, $00, $00, $00, $00, $00 ; $1FF836 |
  db $00, $10, $00, $00, $00, $00, $00, $10 ; $1FF83E |
  db $00, $00, $00, $00, $20, $40, $80, $00 ; $1FF846 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF84E |
  db $00, $00, $00, $02, $00, $00, $00, $00 ; $1FF856 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF85E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF866 |
  db $00, $00, $00, $00, $00, $00, $00, $08 ; $1FF86E |
  db $00, $49, $00, $80, $00, $00, $82, $04 ; $1FF876 |
  db $10, $00, $00, $00, $00, $00, $00, $00 ; $1FF87E |
  db $00, $00, $00, $00, $80, $00, $00, $00 ; $1FF886 |
  db $80, $00, $00, $00, $00, $00, $00, $00 ; $1FF88E |
  db $00, $40, $00, $00, $00, $00, $00, $10 ; $1FF896 |
  db $00, $00, $00, $00, $00, $00, $02, $10 ; $1FF89E |
  db $00, $00, $80, $00, $00, $00, $00, $00 ; $1FF8A6 |
  db $02, $00, $00, $00, $00, $80, $00, $00 ; $1FF8AE |
  db $80, $00, $00, $00, $00, $20, $00, $00 ; $1FF8B6 |
  db $00, $01, $80, $00, $00, $00, $00, $00 ; $1FF8BE |
  db $00, $04, $00, $00, $00, $80, $00, $00 ; $1FF8C6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF8CE |
  db $00, $10, $00, $00, $00, $00, $00, $00 ; $1FF8D6 |
  db $00, $00, $20, $00, $00, $00, $00, $00 ; $1FF8DE |
  db $00, $00, $00, $80, $00, $01, $00, $01 ; $1FF8E6 |
  db $02, $00, $02, $00, $00, $48, $00, $04 ; $1FF8EE |
  db $01, $48, $08, $00, $00, $A0, $00, $10 ; $1FF8F6 |
  db $00, $44, $00, $00, $00, $00, $00, $00 ; $1FF8FE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF906 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF90E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF916 |
  db $00, $00, $00, $00, $00, $01, $00, $10 ; $1FF91E |
  db $00, $00, $00, $0A, $00, $00, $00, $00 ; $1FF926 |
  db $00, $00, $00, $00, $02, $00, $08, $00 ; $1FF92E |
  db $00, $00, $02, $00, $08, $20, $00, $00 ; $1FF936 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF93E |
  db $00, $20, $00, $00, $00, $00, $00, $00 ; $1FF946 |
  db $00, $00, $00, $00, $00, $10, $00, $00 ; $1FF94E |
  db $00, $40, $00, $00, $00, $80, $00, $00 ; $1FF956 |
  db $00, $00, $00, $00, $08, $40, $00, $00 ; $1FF95E |
  db $08, $00, $00, $00, $00, $00, $00, $00 ; $1FF966 |
  db $00, $00, $08, $0C, $02, $00, $00, $80 ; $1FF96E |
  db $80, $00, $00, $40, $00, $80, $20, $20 ; $1FF976 |
  db $00, $40, $00, $00, $00, $00, $00, $00 ; $1FF97E |
  db $00, $00, $00, $01, $00, $00, $00, $00 ; $1FF986 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF98E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF996 |
  db $00, $00, $00, $00, $00, $02, $00, $08 ; $1FF99E |
  db $20, $00, $00, $80, $00, $00, $00, $04 ; $1FF9A6 |
  db $00, $02, $00, $00, $00, $00, $00, $08 ; $1FF9AE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF9B6 |
  db $00, $10, $00, $10, $00, $00, $00, $00 ; $1FF9BE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FF9C6 |
  db $00, $00, $02, $81, $00, $00, $00, $00 ; $1FF9CE |
  db $00, $08, $00, $00, $08, $02, $08, $00 ; $1FF9D6 |
  db $00, $10, $00, $00, $00, $00, $00, $00 ; $1FF9DE |
  db $00, $00, $00, $00, $00, $20, $00, $81 ; $1FF9E6 |
  db $00, $08, $00, $00, $00, $14, $00, $10 ; $1FF9EE |
  db $00, $80, $00, $02, $00, $00, $22, $40 ; $1FF9F6 |
  db $00, $04, $00, $00, $00, $00, $00, $00 ; $1FF9FE |
  db $00, $00, $00, $40, $00, $00, $00, $00 ; $1FFA06 |
  db $00, $40, $00, $00, $00, $00, $00, $00 ; $1FFA0E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFA16 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFA1E |
  db $08, $00, $00, $00, $00, $44, $00, $80 ; $1FFA26 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFA2E |
  db $00, $00, $00, $00, $00, $00, $20, $80 ; $1FFA36 |
  db $08, $00, $00, $00, $00, $00, $00, $00 ; $1FFA3E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFA46 |
  db $00, $00, $00, $20, $00, $00, $08, $00 ; $1FFA4E |
  db $00, $00, $00, $00, $00, $00, $00, $41 ; $1FFA56 |
  db $00, $08, $00, $01, $08, $10, $00, $02 ; $1FFA5E |
  db $00, $40, $08, $00, $00, $00, $00, $40 ; $1FFA66 |
  db $00, $40, $00, $00, $00, $00, $00, $00 ; $1FFA6E |
  db $00, $C1, $00, $00, $00, $00, $00, $00 ; $1FFA76 |
  db $20, $10, $20, $00, $00, $00, $00, $00 ; $1FFA7E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFA86 |
  db $00, $00, $00, $04, $00, $00, $00, $02 ; $1FFA8E |
  db $20, $00, $00, $01, $00, $00, $00, $00 ; $1FFA96 |
  db $00, $00, $00, $C1, $02, $20, $00, $20 ; $1FFA9E |
  db $00, $10, $00, $00, $00, $20, $00, $00 ; $1FFAA6 |
  db $08, $00, $00, $01, $00, $20, $00, $00 ; $1FFAAE |
  db $00, $00, $00, $02, $20, $00, $00, $00 ; $1FFAB6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFABE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFAC6 |
  db $00, $00, $00, $04, $00, $00, $00, $00 ; $1FFACE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFAD6 |
  db $00, $00, $00, $04, $02, $04, $00, $04 ; $1FFADE |
  db $00, $00, $00, $02, $00, $68, $20, $00 ; $1FFAE6 |
  db $00, $10, $00, $00, $00, $00, $00, $00 ; $1FFAEE |
  db $00, $00, $80, $10, $20, $20, $00, $00 ; $1FFAF6 |
  db $00, $02, $00, $00, $08, $00, $00, $00 ; $1FFAFE |
  db $00, $00, $00, $00, $00, $00, $00, $08 ; $1FFB06 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFB0E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFB16 |
  db $00, $00, $00, $04, $00, $00, $00, $00 ; $1FFB1E |
  db $00, $00, $00, $08, $00, $00, $00, $90 ; $1FFB26 |
  db $00, $00, $00, $00, $00, $08, $80, $00 ; $1FFB2E |
  db $00, $00, $00, $00, $00, $03, $00, $40 ; $1FFB36 |
  db $00, $40, $00, $00, $00, $00, $00, $00 ; $1FFB3E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFB46 |
  db $00, $00, $00, $02, $00, $00, $00, $10 ; $1FFB4E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFB56 |
  db $08, $00, $08, $00, $00, $00, $00, $01 ; $1FFB5E |
  db $00, $00, $00, $81, $00, $80, $00, $08 ; $1FFB66 |
  db $00, $20, $00, $00, $00, $00, $00, $00 ; $1FFB6E |
  db $00, $58, $00, $00, $00, $20, $00, $00 ; $1FFB76 |
  db $02, $00, $00, $02, $00, $00, $00, $00 ; $1FFB7E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFB86 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFB8E |
  db $00, $21, $00, $00, $00, $00, $00, $00 ; $1FFB96 |
  db $00, $00, $00, $00, $00, $00, $00, $02 ; $1FFB9E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFBA6 |
  db $00, $00, $00, $04, $08, $00, $00, $40 ; $1FFBAE |
  db $80, $00, $00, $00, $00, $8C, $02, $60 ; $1FFBB6 |
  db $20, $00, $00, $00, $00, $00, $00, $00 ; $1FFBBE |
  db $00, $20, $00, $00, $00, $00, $00, $00 ; $1FFBC6 |
  db $00, $00, $00, $08, $00, $02, $00, $80 ; $1FFBCE |
  db $00, $00, $00, $10, $80, $80, $A0, $00 ; $1FFBD6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFBDE |
  db $80, $00, $00, $00, $00, $00, $00, $00 ; $1FFBE6 |
  db $00, $00, $00, $00, $00, $00, $02, $08 ; $1FFBEE |
  db $02, $00, $00, $00, $00, $00, $00, $00 ; $1FFBF6 |
  db $48, $D3, $00, $00, $00, $00, $00, $00 ; $1FFBFE |
  db $00, $00, $00, $00, $02, $00, $00, $00 ; $1FFC06 |
  db $00, $00, $40, $00, $00, $00, $00, $00 ; $1FFC0E |
  db $00, $00, $00, $00, $80, $00, $00, $00 ; $1FFC16 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFC1E |
  db $00, $00, $00, $04, $03, $00, $00, $00 ; $1FFC26 |
  db $04, $00, $00, $00, $20, $04, $00, $01 ; $1FFC2E |
  db $00, $00, $02, $01, $10, $00, $00, $00 ; $1FFC36 |
  db $00, $01, $00, $00, $00, $00, $00, $00 ; $1FFC3E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFC46 |
  db $84, $00, $00, $00, $00, $00, $00, $00 ; $1FFC4E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFC56 |
  db $00, $00, $01, $10, $08, $00, $00, $00 ; $1FFC5E |
  db $08, $00, $01, $00, $00, $44, $0E, $00 ; $1FFC66 |
  db $00, $41, $00, $00, $00, $00, $00, $00 ; $1FFC6E |
  db $48, $00, $C0, $40, $00, $40, $00, $00 ; $1FFC76 |
  db $1A, $00, $04, $00, $00, $00, $00, $00 ; $1FFC7E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFC86 |
  db $10, $00, $10, $00, $00, $00, $00, $14 ; $1FFC8E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFC96 |
  db $00, $00, $02, $14, $00, $00, $08, $00 ; $1FFC9E |
  db $04, $00, $41, $40, $00, $00, $00, $00 ; $1FFCA6 |
  db $B0, $00, $00, $00, $00, $00, $00, $04 ; $1FFCAE |
  db $42, $00, $08, $00, $20, $44, $80, $00 ; $1FFCB6 |
  db $00, $41, $00, $00, $00, $00, $00, $00 ; $1FFCBE |
  db $00, $00, $01, $00, $80, $00, $00, $00 ; $1FFCC6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFCCE |
  db $00, $01, $00, $00, $00, $00, $00, $40 ; $1FFCD6 |
  db $00, $00, $04, $40, $80, $00, $00, $00 ; $1FFCDE |
  db $80, $10, $42, $00, $09, $04, $80, $00 ; $1FFCE6 |
  db $00, $00, $20, $00, $01, $00, $40, $00 ; $1FFCEE |
  db $40, $44, $00, $00, $10, $00, $00, $00 ; $1FFCF6 |
  db $40, $50, $00, $00, $00, $00, $00, $00 ; $1FFCFE |
  db $00, $00, $00, $00, $10, $00, $00, $00 ; $1FFD06 |
  db $02, $00, $00, $00, $00, $00, $00, $00 ; $1FFD0E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFD16 |
  db $00, $00, $02, $00, $00, $00, $00, $00 ; $1FFD1E |
  db $80, $00, $00, $00, $00, $00, $00, $40 ; $1FFD26 |
  db $80, $00, $08, $00, $12, $00, $44, $00 ; $1FFD2E |
  db $00, $40, $20, $00, $00, $00, $40, $04 ; $1FFD36 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFD3E |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $1FFD46 |
  db $00, $00, $00, $01, $00, $00, $00, $00 ; $1FFD4E |
  db $00, $00, $00, $00, $00, $00, $10, $00 ; $1FFD56 |
  db $20, $00, $02, $01, $00, $04, $84, $00 ; $1FFD5E |
  db $03, $00, $00, $00, $00, $00, $00, $00 ; $1FFD66 |
  db $21, $04, $00, $00, $04, $04, $00, $50 ; $1FFD6E |
  db $00, $00, $00, $00, $00, $01, $00, $04 ; $1FFD76 |
  db $00, $01, $00, $00, $00, $00, $00, $00 ; $1FFD7E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFD86 |
  db $00, $04, $00, $00, $00, $00, $00, $00 ; $1FFD8E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1FFD96 |
  db $00, $01, $00, $00, $00, $01, $01, $40 ; $1FFD9E |
  db $00, $00, $00, $00, $01, $01, $00, $01 ; $1FFDA6 |
  db $08, $00, $00, $00, $80, $01, $00, $00 ; $1FFDAE |
  db $20, $00, $00, $00, $00, $00, $02, $00 ; $1FFDB6 |
  db $00, $00, $00, $00, $00, $00, $80, $00 ; $1FFDBE |
  db $00, $04, $00, $00, $00, $00, $00, $00 ; $1FFDC6 |
  db $01, $00, $00, $00, $00, $00, $14, $00 ; $1FFDCE |
  db $00, $00, $00, $00, $90, $00, $00, $00 ; $1FFDD6 |
  db $00, $10, $00, $00, $00, $00, $10, $00 ; $1FFDDE |
  db $44, $04, $C4, $00, $00, $00, $00, $00 ; $1FFDE6 |
  db $00, $40, $00, $00, $40, $00, $0A, $00 ; $1FFDEE |
  db $08, $00, $2E, $00, $09, $00, $10, $00 ; $1FFDF6 |
  db $00, $11                               ; $1FFDFE |

RESET:
  SEI                                       ; $1FFE00 |
  CLD                                       ; $1FFE01 |
  LDA #$08                                  ; $1FFE02 |
  STA $2000                                 ; $1FFE04 |
  LDA #$40                                  ; $1FFE07 |
  STA $4017                                 ; $1FFE09 |
  LDX #$00                                  ; $1FFE0C |
  STX $2001                                 ; $1FFE0E |
  STX $4010                                 ; $1FFE11 |
  STX $4015                                 ; $1FFE14 |
  DEX                                       ; $1FFE17 |
  TXS                                       ; $1FFE18 |
  LDX #$04                                  ; $1FFE19 |
.code_1FFE1B:
  LDA $2002                                 ; $1FFE1B |
  BPL .code_1FFE1B                          ; $1FFE1E |
.code_1FFE20:
  LDA $2002                                 ; $1FFE20 |
  BMI .code_1FFE20                          ; $1FFE23 |
  DEX                                       ; $1FFE25 |
  BNE .code_1FFE1B                          ; $1FFE26 |
  LDA $2002                                 ; $1FFE28 |
  LDA #$10                                  ; $1FFE2B |
  TAY                                       ; $1FFE2D |
.code_1FFE2E:
  STA $2006                                 ; $1FFE2E |
  STA $2006                                 ; $1FFE31 |
  EOR #$10                                  ; $1FFE34 |
  DEY                                       ; $1FFE36 |
  BNE .code_1FFE2E                          ; $1FFE37 |
  TYA                                       ; $1FFE39 |
.code_1FFE3A:
  STA $0000,y                               ; $1FFE3A |
  STA $0100,y                               ; $1FFE3D |
  STA $0200,y                               ; $1FFE40 |
  STA {entity_type},y                       ; $1FFE43 |
  STA $0400,y                               ; $1FFE46 |
  STA $0500,y                               ; $1FFE49 |
  STA $0600,y                               ; $1FFE4C |
  STA $0700,y                               ; $1FFE4F |
  DEY                                       ; $1FFE52 |
  BNE .code_1FFE3A                          ; $1FFE53 |
  LDX #$07                                  ; $1FFE55 |
  LDA #$88                                  ; $1FFE57 |
.code_1FFE59:
  STA $DC,x                                 ; $1FFE59 |
  DEX                                       ; $1FFE5B |
  BPL .code_1FFE59                          ; $1FFE5C |
  LDA #$18                                  ; $1FFE5E |
  STA $FE                                   ; $1FFE60 |
  LDA #$01                                  ; $1FFE62 |
  JSR code_1FFFB7                           ; $1FFE64 |
  LDX #$05                                  ; $1FFE67 |
  LDA #$00                                  ; $1FFE69 |
.code_1FFE6B:
  STX $8000                                 ; $1FFE6B |
  STA $8001                                 ; $1FFE6E |
  DEX                                       ; $1FFE71 |
  BPL .code_1FFE6B                          ; $1FFE72 |
  JSR code_1EC38F                           ; $1FFE74 |
  LDA #$20                                  ; $1FFE77 |
  LDX #$00                                  ; $1FFE79 |
  LDY #$00                                  ; $1FFE7B |
  JSR code_1EC343                           ; $1FFE7D |
  LDA #$28                                  ; $1FFE80 |
  LDX #$00                                  ; $1FFE82 |
  LDY #$00                                  ; $1FFE84 |
  JSR code_1EC343                           ; $1FFE86 |
  LDA #$DD                                  ; $1FFE89 |
  STA $94                                   ; $1FFE8B |
  LDA #$E8                                  ; $1FFE8D |
  STA $93                                   ; $1FFE8F |
  LDA #$02                                  ; $1FFE91 |
  JSR init_subsystem                        ; $1FFE93 |
  LDA #$88                                  ; $1FFE96 |
  STA $E4                                   ; $1FFE98 |
  STA $9B                                   ; $1FFE9A |
  STA $FF                                   ; $1FFE9C |
  STA $2000                                 ; $1FFE9E |
  LDA #$02                                  ; $1FFEA1 |
  STA $BF                                   ; $1FFEA3 |
  LDA #$9C                                  ; $1FFEA5 |
  STA $B0                                   ; $1FFEA7 |
  STA $BA                                   ; $1FFEA9 |
.check_subsystems:
  LDX #$FF                                  ; $1FFEAB |
  TXS                                       ; $1FFEAD |
.init_subsystem_loop:
  LDX #$00                                  ; $1FFEAE |
  STX $90                                   ; $1FFEB0 |
  LDY #$04                                  ; $1FFEB2 | loop counter: 4 subsystems
.subsystem_loop:
  LDA $80,x                                 ; $1FFEB4 |\  if subsystem status is
  CMP #$04                                  ; $1FFEB6 | | needs processing or needs init,
  BCS .process_subsystem                    ; $1FFEB8 |/  go ahead and process it
  INX                                       ; $1FFEBA |\
  INX                                       ; $1FFEBB | | next subsystem
  INX                                       ; $1FFEBC | |
  INX                                       ; $1FFEBD |/
  DEY                                       ; $1FFEBE | dec loop counter
  BNE .subsystem_loop                       ; $1FFEBF |
  JMP .init_subsystem_loop                  ; $1FFEC1 | just keep looping and checking
.process_subsystem:
  LDA $90                                   ; $1FFEC4 |
  BNE .init_subsystem_loop                  ; $1FFEC6 |
  DEY                                       ; $1FFEC8 |\
  TYA                                       ; $1FFEC9 | | Y was subsystem loop counter
  EOR #$03                                  ; $1FFECA | | Y - 1 flipped (loops count down)
  STA $91                                   ; $1FFECC |/  -> current index
  LDY $80,x                                 ; $1FFECE |
  LDA #$02                                  ; $1FFED0 |\ flag as currently processing
  STA $80,x                                 ; $1FFED2 |/ this subsystem
  CPY #$08                                  ; $1FFED4 |\ $08 means init, $04 main
  BNE .main_subsystem                       ; $1FFED6 |/
  LDA $82,x                                 ; $1FFED8 |\  else init
  STA $93                                   ; $1FFEDA | | store init address
  LDA $83,x                                 ; $1FFEDC | | -> $93-$94
  STA $94                                   ; $1FFEDE | | and jump to it to start off
  JMP ($0093)                               ; $1FFEE0 |/  subsystem loop
.main_subsystem:
  LDA $82,x                                 ; $1FFEE3 |\
  TAX                                       ; $1FFEE5 | | restore stack pointer
  TXS                                       ; $1FFEE6 |/
  LDA $91                                   ; $1FFEE7 |\  for index $00
  BNE .ret_subsystem                        ; $1FFEE9 | | (first one, main gameplay)
  JSR code_1EC2E5                           ; $1FFEEB |/  call ???
.ret_subsystem:
  PLA                                       ; $1FFEEE |\
  TAY                                       ; $1FFEEF | | restore X & Y
  PLA                                       ; $1FFEF0 | |
  TAX                                       ; $1FFEF1 |/
  RTS                                       ; $1FFEF2 | return to subsystem code

; marks a subsystem as needs initialization
; and sets init address for it
; parameters:
; A: subsystem index
; $93-$94: init address for subsystem
init_subsystem:
  JSR subsystem_offset.a                    ; $1FFEF3 | grab offset from index
  LDA $93                                   ; $1FFEF6 |\
  STA $82,x                                 ; $1FFEF8 | | store init address
  LDA $94                                   ; $1FFEFA | | in subsystem table
  STA $83,x                                 ; $1FFEFC |/  from params
  LDA #$08                                  ; $1FFEFE |\ mark as needs initialization
  STA $80,x                                 ; $1FFF00 |/
  RTS                                       ; $1FFF02 |

; turns a subsystem inactive
; parameters:
; A: subsystem index
kill_subsystem:
  JSR subsystem_offset.a                    ; $1FFF03 | grab offset from index
  LDA #$00                                  ; $1FFF06 |\ mark as inactive
  STA $80,x                                 ; $1FFF08 |/ KILL
  RTS                                       ; $1FFF0A |

kill_current_subsystem:
  JSR subsystem_offset                      ; $1FFF0B | grab current offset
  LDA #$00                                  ; $1FFF0E |\ mark as inactive
  STA $80,x                                 ; $1FFF10 |/ KILL
  JMP RESET.check_subsystems                ; $1FFF12 | also go on to subsystem processing

; converts subsystem index to usable offset
; parameters:
; $91 (or A, see below): index
; returns:
; X: offset (index * 4)
subsystem_offset:
  LDA $91                                   ; $1FFF15 |
; for using your own A rather than $91
.a:
  ASL                                       ; $1FFF17 |\ structure is 4 bytes per entry
  ASL                                       ; $1FFF18 |/ so left shift twice to get offset
  TAX                                       ; $1FFF19 | return in X
  RTS                                       ; $1FFF1A |

code_1FFF1B:
  JSR async_next_frame                      ; $1FFF1B |
  DEX                                       ; $1FFF1E |
  BNE code_1FFF1B                           ; $1FFF1F |
  RTS                                       ; $1FFF21 |

; main "asynchronous" call to handle
; multiple subsystems simultaneously per frame
; call this at the end of your subsystem's loop
; this will just do anything else that still needs
; processing and then return on the next frame, fresh
async_next_frame:
  LDA #$01                                  ; $1FFF22 |
; use A instead of $01 as parameter
.a:
  STA $93                                   ; $1FFF24 |
  TXA                                       ; $1FFF26 |\
  PHA                                       ; $1FFF27 | | preserve X & Y
  TYA                                       ; $1FFF28 | |
  PHA                                       ; $1FFF29 |/
  JSR subsystem_offset                      ; $1FFF2A | grab offset from subsystem index
  LDA $93                                   ; $1FFF2D |\ update delay timer
  STA $81,x                                 ; $1FFF2F |/ current -> table
  LDA #$01                                  ; $1FFF31 |\ flag current subsystem byte 1
  STA $80,x                                 ; $1FFF33 |/ as "already processed"
  TXA                                       ; $1FFF35 |\
  TAY                                       ; $1FFF36 | | preserve subsystem stack pointer
  TSX                                       ; $1FFF37 | | in byte 3 of table
  STX $82,y                                 ; $1FFF38 |/
  JMP RESET.check_subsystems                ; $1FFF3A |

; convenience: use A
select_PRG_banks_A:
  STA $F5                                   ; $1FFF3D |\  convenience: use A as parameter
  STA $F6                                   ; $1FFF3F | | $8000-$9FFF will select bank A
  INC $F6                                   ; $1FFF41 |/  $A000-$BFFF will select A+1
; selects PRG banks based on $F5 and $F6
select_PRG_banks:
  INC $F7                                   ; $1FFF43 | flag on "selecting PRG bank"
  LDA #$06                                  ; $1FFF45 |\
  STA $F2                                   ; $1FFF47 | |
  STA $8000                                 ; $1FFF49 | | select the bank in $F5
  LDA $F5                                   ; $1FFF4C | | as $8000-$9FFF
  STA $F3                                   ; $1FFF4E | | also mirror in $F3
  STA $8001                                 ; $1FFF50 |/
  LDA #$07                                  ; $1FFF53 |\
  STA $F2                                   ; $1FFF55 | |
  STA $8000                                 ; $1FFF57 | | select the bank in $F6
  LDA $F6                                   ; $1FFF5A | | as $A000-$BFFF
  STA $F4                                   ; $1FFF5C | | also mirror in $F4
  STA $8001                                 ; $1FFF5E |/
  DEC $F7                                   ; $1FFF61 | flag selecting back off (done)
  LDA $F8                                   ; $1FFF63 |\ if NMI and non-NMI race condition
  BNE code_1FFF68                           ; $1FFF65 |/ we still need to play sounds
  RTS                                       ; $1FFF67 | else just return

code_1FFF68:
  LDA $F7                                   ; $1FFF68 |
  BNE code_1FFFB4                           ; $1FFF6A |
  LDA #$06                                  ; $1FFF6C |
  STA $F2                                   ; $1FFF6E |
  STA $8000                                 ; $1FFF70 |
  LDA #$18                                  ; $1FFF73 |
  STA $8001                                 ; $1FFF75 |
  LDA #$07                                  ; $1FFF78 |
  STA $F2                                   ; $1FFF7A |
  STA $8000                                 ; $1FFF7C |
  LDA #$19                                  ; $1FFF7F |
  STA $8001                                 ; $1FFF81 |
code_1FFF84:
  STX $A7                                   ; $1FFF84 |
  STY $A8                                   ; $1FFF86 |
  LDX $DB                                   ; $1FFF88 |
  LDA $DC,x                                 ; $1FFF8A |
  CMP #$88                                  ; $1FFF8C |
  BEQ code_1FFFA6                           ; $1FFF8E |
  PHA                                       ; $1FFF90 |
  LDA #$88                                  ; $1FFF91 |
  STA $DC,x                                 ; $1FFF93 |
  INX                                       ; $1FFF95 |
  TXA                                       ; $1FFF96 |
  AND #$07                                  ; $1FFF97 |
  STA $DB                                   ; $1FFF99 |
  PLA                                       ; $1FFF9B |
  JSR $8003                                 ; $1FFF9C |
  LDX $A7                                   ; $1FFF9F |
  LDY $A8                                   ; $1FFFA1 |
  JMP code_1FFF84                           ; $1FFFA3 |

code_1FFFA6:
  JSR $8000                                 ; $1FFFA6 |
  LDA #$00                                  ; $1FFFA9 |
  STA $F8                                   ; $1FFFAB |
  LDX $A7                                   ; $1FFFAD |
  LDY $A8                                   ; $1FFFAF |
  JMP select_PRG_banks                      ; $1FFFB1 |

code_1FFFB4:
  INC $F8                                   ; $1FFFB4 |
  RTS                                       ; $1FFFB6 |

code_1FFFB7:
  STA $A000                                 ; $1FFFB7 |
  STA $2C                                   ; $1FFFBA |
  RTS                                       ; $1FFFBC |

  db $00, $40, $01, $C0, $00, $00, $00, $00 ; $1FFFBD |
  db $00, $00, $00, $00, $00, $81, $00, $00 ; $1FFFC5 |
  db $00, $00, $01, $00, $01, $00, $40, $00 ; $1FFFCD |
  db $04, $00, $01, $00, $00, $00, $40, $00 ; $1FFFD5 |
  db $00, $00, $00, $00, $00, $00, $00, $01 ; $1FFFDD |
  db $00, $00, $00, $04, $00, $00, $00, $00 ; $1FFFE5 |
  db $00, $10, $00, $6B, $3F, $A6, $15, $44 ; $1FFFED |
  db $04, $00, $00, $08, $F5                ; $1FFFF5 |

; interrupt vectors
  dw NMI                                    ; $1FFFFA |
  dw RESET                                  ; $1FFFFC |
  dw IRQ                                    ; $1FFFFE |
