# Digital Calculator SystemVerilog Assignment

## Modules

To make the design fully modular, we will break the implementation into the following modules:

### Top-Level Module (digital_calculator)

Orchestrates the operation, connecting all other modules.

### Input Handling Module (input_handler)

Manages operand inputs, button presses, and reset functionality.

### Arithmetic Module (arithmetic_unit)

Performs addition and subtraction.

### Display Control Module (display_control)

Handles the seven-segment display logic for both decimal and hexadecimal modes.

### Seven-Segment Display Decoder (seven_segment_display)

Decodes a 4-bit value into the seven-segment display format.

## State machine

Idle State: Waiting for the first operand. (IDLE)
Operand1 Input State: Capturing operand 1. (OPERAND1_INPUT)
Operand2 Input State: Capturing operand 2. (OPERAND2_INPUT)
Calculation State: Performing the operation. (CALCULATE)
Reset State: Returning to Idle. (RESET)

## Functional Requirements

1. Operations: Addition and subtraction of two 4-bit unsigned integers (0-15)
2. Inputs
   • sw[3:0] are used for inputting 4-bit binary values.
   • sw4 is used for the selecting operator (1 for addition and 0 for subtraction).
   • BTNL is used for resetting at any time.
   • BTNU is used to confirm operand values.
   • BTND is used for changing the display mode (Hexadecimal or Decimal)
3. Outputs
   • Seven-segment display showing operands for selected mode

## Additional notes

Clock Signal: Ensure you properly configure the clock signal for your design. The Basys3 FPGA has a 100 MHz onboard clock. You might need to create a clock divider if necessary.

Button Debouncing: Mechanical buttons can produce multiple transitions when pressed or released. The debounce module helps to filter out these unintended transitions.

Display Refreshing: The seven-segment display requires refreshing if you're displaying more than one digit. In this design, only one digit is active at a time, but you can extend the display driver to handle multiple digits.

Edge Cases: Be cautious with subtraction operations that might result in negative numbers since we're dealing with unsigned integers. The result might need to be adjusted or limited to prevent incorrect displays.

Testing: Simulate your design using a testbench before implementing it on the FPGA to ensure correctness.
