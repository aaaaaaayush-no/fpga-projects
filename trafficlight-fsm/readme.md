## Traffic Light FSM

Basic Verilog traffic light controller.

### Module

`traffic`

### Ports

- `clk`: input clock
- `reset`: reset signal
- `light[2:0]`: traffic light output

### Behavior

The FSM cycles through three states:

- red
- green
- yellow

The light outputs are:

- red = `3'b100`
- green = `3'b001`
- yellow = `3'b010`

The default timing values in the design are:

- red = 5
- green = 3
- yellow = 1

### Testbench

The testbench in `tb_traffic.v` generates a clock, applies reset, and dumps a waveform to `dump.vcd`.