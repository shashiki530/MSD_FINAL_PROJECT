# Makefile for Questa Sim

# Set the design and testbench files

TESTBENCH_FILES = checkpoint4.sv

# Set the simulation options
SIM_OPTIONS = -sv

# Set the simulation top module
SIM_TOP_MODULE = parsing_tb

# Set the simulation time
SIM_TIME = 12000ns

# Define the default target
all: sim

# Simulation target
sim: compile
    vsim -c $(SIM_OPTIONS) $(SIM_TOP_MODULE) -do "run $(SIM_TIME); quit"

# Compilation target
compile:  $(TESTBENCH_FILES)
    vlog  $(TESTBENCH_FILES)

# Clean target
clean:
    rm -rf work transcript vsim.wlf

.PHONY: all sim compile clean
