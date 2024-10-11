# System Verilog Calculator

A calculator for basys3 board implemented in System Verilog

## Inputs

- sw[3:0] are used for inputting 4-bit binary values.
- sw4 is used for the selecting operator (1 for addition and 0 for subtraction)
- BTNL is used for resetting at any time
- BTNU is used to confirm operand values
- Seven-segment display is used to display values
- BTND is used for changing the display mod

## Modules

## States

Idle State: Waiting for the first operand. (IDLE)
Operand1 Input State: Capturing operand 1. (OPERAND1_INPUT)
Operand2 Input State: Capturing operand 2. (OPERAND2_INPUT)
Calculation State: Performing the operation. (CALCULATE)
Reset State: Returning to Idle. (RESET)
