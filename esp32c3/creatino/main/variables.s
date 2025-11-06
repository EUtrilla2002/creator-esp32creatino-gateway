## CREATINO variables.s

## Coppied from esp32-hal-gpio.h

.equ LED_BUILTIN , 30

# DigitalWrite values
.equ HIGH        , 0x1
.equ LOW         , 0x0

# Pin modes
.equ INPUT       , 0x01
.equ OUTPUT      , 0x03
.equ INPUT_PULLUP, 0x05
.equ PULLDOWN, 0x08
.equ INPUT_PULLDOWN, 0x09
.equ INPUT_ANALOG, 0x04
.equ OUTPUT_OPEN_DRAIN, 0x05

# Interrupt Modes
.equ DISABLED    , 0x00
.equ RISING     , 0x01
.equ FALLING    , 0x02
.equ CHANGE     , 0x03
.equ ONLOW      , 0x04
.equ ONHIGH     , 0x05
.equ ONLOW_WE   , 0x06
.equ ONHIGH_WE  , 0x07
