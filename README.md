# Training material

This branch of the repository contains training material for the SoC Hub webinar on 26th January 2022.
It has been heavily modified from the master branch and does not function as an example library on its own.

## Instructions for the webinar tasks

The instructions in the following sections are for two common IP-XACT tasks: IP packaging and design creation. 
The task descriptions are deliberately on a high level. You can use the Help in Kactus2 toolbar for more information 
on basic usage and IP-XACT element descriptions.

Tip: If you cannot edit any of the component fields or the design, check the toolbar for a lock symbol. Unlocking 
the document (clicking on the lock symbol) allows editing.


## Task 1: IP packaging
Package IP defined in src/spi_controller.v in Kactus2. The IP should have at least parameters, file set(s), 
ports, bus interfaces and registers. The full system memory map is given in doc/memory_map.md.

Tip: All mandatory fields are marked in yellow color. 

Tip: Adding a row in a table (e.g. a file set) adds the new item in the navigation tree on the left. Click on the
item in the navigation tree to view and edit all the details of the item.

Tip: Components with errors are shown in red in the library. Right-click and select "View errors" to see what is wrong.
The same listing can be seen when saving a document and clicking "Show details..." in the error pop-up window.

## Task 2: Design creation
Create a hardware design with the following components: core_example, wb_master_cpu_slave, wishbone, wb_external_mem,
sum_buffer, and spi_controller (see Task 1). Component core_example functions as a CPU connected to
two peripherals, sum_buffer and spi_controller, and memory in wb_external_mem.
Check the system memory map matches the specification (see Task 1) and generate Verilog file(s) for the design.

Tip: Right-click on compnents in the library to select whether to open the component or the associated HW design.

Tip: Drag-drop items from library view on the left into design to instantiate components. Components can be dropped only to 
columns with matching type.
