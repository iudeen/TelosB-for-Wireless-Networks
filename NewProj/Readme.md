# TelosB-for-Wireless-Networks
# Lab 1 Tasks
1. Create new module, name it MyTimerC.nc. Create also
the relevant configuration file and Makefile. Test compile,
simulate, and flash your module on mote
2. Create two instances of TimerMilliC, name it ShotTimer
and PeriodicTimer
3. Boot the module (mote) using MainC component
In an implementation of your module, program a TinyOS codes to fire
the Timers and Leds based on the following algorithms:
Fire PeriodicTimer every 2 sec
If PeriodicTimer fires
Toggle Led0
Toggle Led1
If PeriodicTimer had fired for 10 seconds, stop the timer
Fire ShotTimer at the fifth, seventh, and ninth second after the mote booted
If ShotTimer fires
Turn on Led2
If ShotTimer had fired, after certain time
Turn off Led2
5. Show the results in micaz simulation and TelosB implementation
