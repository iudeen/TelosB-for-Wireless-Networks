#include<Timer.h>
#include "SendToRadio.h"

configuration SendToRadioAppC{ 
}
implementation {
    components MainC, LedsC;
    components SendToRadioC as App;
    components new TimerMilliC() as TimerPeriodic;
    components ActiveMessageC;
    components new AMSenderC(AM_SENDTORADIO);
    components new AMReceiverC(AM_SENDTORADIO);

    App.Boot -> MainC;
    App.TimerPeriodic -> TimerPeriodic;
    App.Packet -> AMSenderC;
    App.AMSend -> AMSenderC;
    App.AMControl -> ActiveMessageC;
    App.Receive -> AMReceiverC;
    App.Leds -> LedsC;

}