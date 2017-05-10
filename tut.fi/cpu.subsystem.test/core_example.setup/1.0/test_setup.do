echo "Adding files to the project"

project addfile core_example_0.v
project addfile test_setup.v
project addfile ../../../other.test/clock_generator/1.1/clock_generator.v
project addfile ../../../cpu.logic.test/instruction_memory/1.0/instruction_memory.v
project addfile ../../../cpu.logic/alu/1.0/alu.v
project addfile ../../../cpu.logic/clock/1.0/clock.v
project addfile ../../../cpu.logic/instruction_decoder/1.0/instruction_decoder.v
project addfile ../../../cpu.logic/memory_controller/1.0/memory_controller.v
project addfile ../../../cpu.logic/register_bank/1.0/register_bank.v

project compileall

echo "Script has been executed"
