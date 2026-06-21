## Clock Divider

Basic Verilog clock divider.

### Module

`clock_divider #(parameter divider = 10)`

### Ports

- `clk`: input clock
- `clk_out`: divided clock output

### Behavior

The output clock toggles after half of the divider count.

For `divider = 10`, `clk_out` toggles every 5 input clock cycles.

### Testbench

The testbench in `tb_clockdivider.v` uses `divider = 10`, creates a clock with `always #5 clk = ~clk;`, and dumps a waveform to `dump.vcd`.
