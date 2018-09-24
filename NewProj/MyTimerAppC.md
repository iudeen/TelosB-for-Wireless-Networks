configuration MyTimerAppC
{
}
implementation
{
  components MainC, MyTimerC, LedsC;
  components new TimerMilliC() as Timer0;
  components new TimerMilliC() as Timer1;
  

  MyTimerC -> MainC.Boot;

  MyTimerC.Timer0 -> Timer0;
  MyTimerC.Timer1 -> Timer1;
  MyTimerC.Leds -> LedsC;
}

