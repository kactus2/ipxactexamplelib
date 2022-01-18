# Training material

This branch of the repository contains training material for the SoC Hub webinar on 26th January 2022.
It has been heavily modified from the master branch and does not function as an example library on its own.

## Instructions for the webinar tasks

The instructions in the following sections are for two common IP-XACT tasks: IP packaging and design creation. 
The task descriptions are deliberately on a high level. You can use the Help in Kactus2 toolbar for more information 
on basic usage and IP-XACT element descriptions.

Tip: If you cannot edit any of the component fields or the design, check the toolbar for a lock symbol. Unlocking 
(clicking on the lock symbol) the document allows editing.

## Task 1: IP packaging
Package IP defined in src/spi_controller.v in Kactus2. The IP should have at least parameters, file set(s), 
ports, bus interface(s) and registers. The full system memory map is given in doc/memory_map.md.


## Task 2: Design creation
Design a system with the following components: core_example, wb_master_cpu_slave, wishbone, wb_external_mem,
sum_buffer, and spi_controller (see Task 1). Component core_example functions as a CPU connected to
peripherals sum_buffer, and spi_controller, and memory component in wb_external_mem.
Check the system memory map (see Task 1) and generate Verilog file(s) for the design.
