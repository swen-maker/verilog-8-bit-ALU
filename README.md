8-Bit Arithmetic Logic Unit (ALU) in Verilog

Overview

This project implements an 8-bit Arithmetic Logic Unit (ALU) using Verilog HDL. The ALU performs arithmetic and bitwise logical operations on two 8-bit inputs and produces an 8-bit result.

The design was developed as a digital logic learning project to practise RTL coding, modular design, and functional verification using simulation.

Features

8-bit input operands

Addition and subtraction

Bitwise AND, OR, and XOR operations

Equality comparison

Zero flag indicating whether the registered result is zero

Clocked result output

Modular adder implementation using Verilog generate constructs

Supported Operations

Opcode

Operation

Description

000

Addition

Adds operands A and B

001

Subtraction

Subtracts B from A

010

AND

Bitwise AND

011

OR

Bitwise OR

100

XOR

Bitwise XOR

101

Equality

Returns 1 if A equals B, otherwise 0

110–111

Default

Returns zero



Design Structure

alu.v — Contains the ALU module and a reusable 1-bit full-adder module.

alu_testbench.v — Testbench that applies input combinations and checks expected results.

GTK Wave.jpeg — Simulation waveform screenshot.



Tools Used

Verilog HDL — RTL design

Icarus Verilog — Compilation and simulation

GTKWave — Waveform inspection


Learning Outcomes

Through this project, I practised:

Writing and organizing Verilog RTL

Implementing arithmetic and combinational logic

Developing a testbench with expected-output checks

Compiling, simulating, and inspecting digital designs

Future Improvements

Refine the testbench and automate pass/fail reporting

Explore RTL synthesis using Yosys

Investigate timing and hardware resource estimates after synthesis
