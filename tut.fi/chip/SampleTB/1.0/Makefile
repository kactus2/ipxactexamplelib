_INCLUDES= ../../../soc/SampleHW/1.0/  ../../../chip/SampleTB/1.0/ ../../../ip.hw/TestIntitializer/1.0/ ../../../ip.hw/master/1.0/ ../../../ip.hw/wb_slave/1.0/ ../../../ip.hw/hierarchical_wb_slave/1.0/ ../../../ip.com/wishbone_bus/1.0/
INCLUDES=$(patsubst %, -I%, $(_INCLUDES))

DEPS= Makefile

ENAME= SampleTBSimulation
EFLAGS= $(INCLUDES) $(DEBUG_FLAGS) $(PROFILE_FLAGS) -DhwB -L$(SYSTEMC_HOME)/lib-linux -lsystemc
EBUILDER= g++
_OBJ= main.cpp.o TestIntitializer.cpp.o wb_master.cpp.o wb_slave.cpp.o
ODIR= obj
OBJ= $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ENAME): $(OBJ)
	$(EBUILDER) -o $(ENAME) $(OBJ) $(EFLAGS)

clean:
	rm -f $(OBJ:%.o=%.d);
	rm -f $(OBJ);

all: $(OBJ)

$(OBJ): | $(ODIR)

$(ODIR):
	mkdir -p $(ODIR)

DEBUG_FLAGS +=
debug: DEBUG_FLAGS += -ggdb -fno-omit-frame-pointer -fno-inline-functions -fno-inline-functions-called-once -fno-optimize-sibling-calls
debug: $(ENAME)

PROFILE_FLAGS +=
profile: PROFILE_FLAGS += -pg -fno-omit-frame-pointer -fno-inline-functions -fno-inline-functions-called-once -fno-optimize-sibling-calls
profile: $(ENAME)

-include $(OBJ:%.o=%.d)

$(ODIR)/main.cpp.o: $(DEPS) main.cpp
	g++ -MMD -MP -c -o $(ODIR)/main.cpp.o main.cpp $(INCLUDES) $(DEBUG_FLAGS) $(PROFILE_FLAGS)  -I$(SYSTEMC_HOME)/include -L$(SYSTEMC_HOME)/lib-linux -lsystemc -DhwB

$(ODIR)/TestIntitializer.cpp.o: $(DEPS) ../../../ip.hw/TestIntitializer/1.0/TestIntitializer.cpp
	g++ -MMD -MP -c -o $(ODIR)/TestIntitializer.cpp.o ../../../ip.hw/TestIntitializer/1.0/TestIntitializer.cpp $(INCLUDES) $(DEBUG_FLAGS) $(PROFILE_FLAGS)  -I$(SYSTEMC_HOME)/include -L$(SYSTEMC_HOME)/lib-linux -lsystemc -DhwB

$(ODIR)/wb_master.cpp.o: $(DEPS) ../../../ip.hw/master/1.0/wb_master.cpp
	g++ -MMD -MP -c -o $(ODIR)/wb_master.cpp.o ../../../ip.hw/master/1.0/wb_master.cpp $(INCLUDES) $(DEBUG_FLAGS) $(PROFILE_FLAGS)  -I$(SYSTEMC_HOME)/include -L$(SYSTEMC_HOME)/lib-linux -lsystemc -DhwB

$(ODIR)/wb_slave.cpp.o: $(DEPS) ../../../ip.hw/wb_slave/1.0/wb_slave.cpp
	g++ -MMD -MP -c -o $(ODIR)/wb_slave.cpp.o ../../../ip.hw/wb_slave/1.0/wb_slave.cpp $(INCLUDES) $(DEBUG_FLAGS) $(PROFILE_FLAGS)  -I$(SYSTEMC_HOME)/include -L$(SYSTEMC_HOME)/lib-linux -lsystemc -DhwB
