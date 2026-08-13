# System Verilog Calculator

A calculator for basys3 board implemented in `System Verilog` and `Xilinix Vivado`. It can perform addition and subtraction of 4-bit binary numbers and displays the result on the seven-segment display in either hex or decimal.

## Inputs

- `sw[3:0]` are used for inputting 4-bit binary values (operand1, operand2)
- `sw4` is used for the selecting operator (1 for addition and 0 for subtraction)
- `BTNL` is used for resetting at any time
- `BTNU` is used to confirm operand values
- Seven-segment display is used to display values
- `BTND` is used for changing the display mode (hex or decimal)

## Operating procedure

1. Set the first 4-bit operand with `SW[3:0]`, then press `BTNU` to confirm it. The selected value is shown on the seven-segment display.
2. Select the operation with `SW4` (`1` for addition; `0` for subtraction).
3. Set the second 4-bit operand with `SW[3:0]`, then press `BTNU` to confirm it. The selected value is shown on the seven-segment display.
4. The calculated result is shown on the seven-segment display.
5. Press `BTND` to switch the result display between hexadecimal and decimal.
6. Press `BTNL` at any time to reset the calculator.

## Modules 

### Top Level module

![calculator](Diagrams/calculator.png)

### control_logic module

![control_logic](Diagrams/control_logic.png)

### display_control module

![display](Diagrams/display_control.png)
