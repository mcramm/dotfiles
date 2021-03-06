" Vim syntax file
" Language:    Arduino
" Maintainer:  Johannes Hoff <johannes@johanneshoff.com>
" Last Change: 2010 November 21
" License:     VIM license (:help license, replace vim by arduino.vim)

" Syntax highlighting like in the Arduino IDE
" Keywords extracted from <arduino>/build/shared/lib/keywords.txt (arduino
" version 0021)

" Thanks to Rik, Erik Nomitch and Adam Obeng for helpful feedback!

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  so <sfile>:p:h/cpp.vim
else
  runtime! syntax/cpp.vim
endif

syn keyword arduinoConstant HIGH LOW INPUT OUTPUT
syn keyword arduinoConstant DEC BIN HEX OCT BYTE
syn keyword arduinoConstant PI HALF_PI TWO_PI
syn keyword arduinoConstant LSBFIRST MSBFIRST 
syn keyword arduinoConstant CHANGE FALLING RISING 
syn keyword arduinoConstant SERIAL DISPLAY
syn keyword arduinoConstant DEFAULT EXTERNAL INTERAL INTERNAL1V1 INTERNAL2V56

syn keyword arduinoStdFunc abs acos asin atan atan2 ceil constrain
syn keyword arduinoStdFunc cos degrees exp floor log
syn keyword arduinoStdFunc map max min radians 
syn keyword arduinoStdFunc round sin sq sqrt tan
syn keyword arduinoStdFunc randomSeed random

syn keyword arduinoFunc analogReference analogRead analogWrite 
syn keyword arduinoFunc attachInterrupt detachInterrupt interrupts noInterrupts 
syn keyword arduinoFunc lowByte highByte bitRead bitWrite bitSet bitClear
syn keyword arduinoFunc millis micros delay delayMicroseconds 
syn keyword arduinoFunc pinMode digitalWrite digitalRead 
syn keyword arduinoFunc tone noTone pulseIn shiftOut 

syn keyword arduinoMethod setup loop
syn keyword arduinoMethod begin end available read flush print println write peek

syn keyword arduinoModule Serial Serial1 Serial2 Serial3

hi def link arduinoConstant Constant
hi def link arduinoStdFunc Function
hi def link arduinoFunc Function
hi def link arduinoMethod Function
hi def link arduinoModule Identifier
