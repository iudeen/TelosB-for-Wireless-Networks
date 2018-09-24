

#include "Timer.h"

module MyTimerC @safe()
{
  uses interface Timer<TMilli> as Timer0;
  uses interface Timer<TMilli> as Timer1;
  uses interface Leds;
  uses interface Boot;
}
implementation
{
  uint8_t counter = 0;
  uint8_t time = 0;
  event void Boot.booted()
  {
    dbg("MyTimerC", "Telos B Boot at: @ %s \n", sim_time_string());
    call Timer0.startOneShot( 5120 );
    call Timer1.startPeriodic( 2048 );
 }


  task void TogLed0()
  {
    dbg("MyTimerC", "LED 0 Toggle \n");
    call Leds.led0Toggle();

  }
  task void TogLed1()
  {
    dbg("MyTimerC", "LED 1 Toggle \n");
    call Leds.led1Toggle();

  }

  event void Timer0.fired()
  { 
    if(counter < 3){
    counter++;
    dbg("MyTimerC", "One shot Timer 0 fired @ %s \n", sim_time_string());
    call Leds.led2Toggle();
    dbg("MyTimerC", "Led2 Toggle \n");
    call Timer0.startOneShot( 2048 );
    }    
  }
  

  event void Timer1.fired()
  {
    dbg("MyTimerC", "Periodic Timer 1 fired @ %s.\n", sim_time_string());
    post TogLed0();
    post TogLed1();
    time++;
    if(time >= 5){
      dbg("MyTimerC", "Timer1 Stops \n");
      call Timer1.stop();
    }
  }
  
  
  
  
}

