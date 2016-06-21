#include "TestIntitializer.hh"
#include "header.hh"

void TestIntitializer::init()
{
	start = 0;
	// Assert reset
	rst = 0;
	wait();
	// Deassert reset
	wait();
	wait();
	rst = 1;
	wait();
	start = 1;
	wait();
	wait();
	wait();
	start = 0;
	
	wait(WAIT_TIME);
	
	if ( done == 0 )
		printf("not done!");
	else
		printf("done high");
	sc_stop();
}