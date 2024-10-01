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

## Display

We must quickly cycle through display elements (multiplexing)

an = 4'b1110: The first digit (rightmost) is active.
an = 4'b1101: The second digit is active.
an = 4'b1011: The third digit is active.
an = 4'b0111: The fourth digit is active.

## Constraints

TODO: Add constraints

## Switches

set_property PACKAGE_PIN V17 [get_ports {sw[0]}] # SW0 -> operand input
set_property PACKAGE_PIN V16 [get_ports {sw[1]}] # SW1 -> operand input
set_property PACKAGE_PIN W16 [get_ports {sw[2]}] # SW2 -> operand input
set_property PACKAGE_PIN W17 [get_ports {sw[3]}] # SW3 -> operand input
set_property PACKAGE_PIN U17 [get_ports sw4] # SW4 -> operator selection (add/sub)

## Buttons

set_property PACKAGE_PIN U18 [get_ports reset] # BTNL -> Reset button
set_property PACKAGE_PIN P17 [get_ports confirm] # BTNU -> Confirm operand
set_property PACKAGE_PIN M17 [get_ports mode_change] # BTND -> Change display mode

## Seven-segment display

set_property PACKAGE_PIN U14 [get_ports {an[0]}] # AN0 -> Seven-segment anode control
set_property PACKAGE_PIN U13 [get_ports {an[1]}] # AN1 -> Seven-segment anode control
set_property PACKAGE_PIN T13 [get_ports {an[2]}] # AN2 -> Seven-segment anode control
set_property PACKAGE_PIN T14 [get_ports {an[3]}] # AN3 -> Seven-segment anode control

## Seven-segment display segments

set_property PACKAGE_PIN W7 [get_ports {seg[0]}] # CA -> Segment A control
set_property PACKAGE_PIN W6 [get_ports {seg[1]}] # CB -> Segment B control
set_property PACKAGE_PIN U8 [get_ports {seg[2]}] # CC -> Segment C control
set_property PACKAGE_PIN V8 [get_ports {seg[3]}] # CD -> Segment D control
set_property PACKAGE_PIN U5 [get_ports {seg[4]}] # CE -> Segment E control
set_property PACKAGE_PIN V5 [get_ports {seg[5]}] # CF -> Segment F control
set_property PACKAGE_PIN U7 [get_ports {seg[6]}] # CG -> Segment G control
