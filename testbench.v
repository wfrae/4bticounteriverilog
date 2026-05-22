`timescale 1ns / 1ps  // Sets the time unit to nanoseconds

module counter_tb;

    // 1. Inputs to the counter are regs in the testbench because we control them
    reg clk;
    reg rst_n;

    // 2. Outputs from the counter are wires because we just observe them
    wire [3:0] count;

    // 3. Instantiate (plug in) the counter module we want to test
    counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .count(count)
    );

    // 4. Generate the Clock Signal
    // This constantly toggles the clock every 5 nanoseconds, creating a square wave
    always begin
        #5 clk = ~clk;
    end

    // 5. The Test Sequence
    initial begin
        // Initialize our inputs
        clk = 0;
        rst_n = 0; // Start with reset active (0) to clear the counter

        #15;       // Wait 15 nanoseconds
        rst_n = 1; // Release reset (turn it off) so the counter can start

        #100;      // Let the simulation run for 100 nanoseconds to watch it count
        $finish;   // Stop the simulation
    end

    // 6. This tells the simulator to save the waveform data
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, counter_tb);
    end

endmodule