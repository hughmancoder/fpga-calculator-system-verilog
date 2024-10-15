# System Verilog Calculator

A calculator for basys3 board implemented in System Verilog. It can perform addition and subtraction of 4-bit binary numbers and displays the result on the seven-segment display in either hex or decimal.

## Inputs

- sw[3:0] are used for inputting 4-bit binary values (operand1, operand2)
- sw4 is used for the selecting operator (1 for addition and 0 for subtraction)
- BTNL is used for resetting at any time
- BTNU is used to confirm operand values
- Seven-segment display is used to display values
- BTND is used for changing the display mode (hex or decimal)

## Operation procedures

i. Select operand 1, then confirm. While selecting, the value of operand 1 needs to be displayed on the sevensegment display.
Page 1 of 2
ii. Select operand 2, then confirm. While selecting, the value of operand 2 needs to be displayed on the sevensegment display.
iii. Display result on the seven-segment display

## Modules Diagram

### Top Level module

![calculator](Diagrams/calculator.png)

### control_logic module

![control_logic](Diagrams/control_logic.png)

### display_control module

![display](Diagrams/display_control.png)
