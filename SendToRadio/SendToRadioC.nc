#include<Timer.h>
#include "SendToRadio.h"
module SendToRadioC {
    uses interface Boot;
    uses interface Timer<TMilli> as TimerPeriodic;
    uses interface Packet; //Create Packet
    uses interface AMSend; //Sending Task
    uses interface SplitControl as AMControl; //Split control interface
    uses interface Receive; //To receive 
    uses interface Leds;
}
implementation{
    uint16_t counter;
    message_t pkt;
    bool busy = FALSE;

    event void Boot.booted(){
        call AMControl.start();
    }
event void AMControl.startDone(error_t err){
    if(err == SUCCESS){
        call TimerPeriodic.startPeriodic(TIMER_PERIOD_MILLI);
    }
    else {
        call AMControl.start();
    }
}
event void AMControl.stopDone(error_t err){

}
event void TimerPeriodic.fired(){
    counter++;
    if(!busy){
        SendToRadioMsg* btrpkt = (SendToRadioMsg*)(call Packet.getPayload(&pkt, sizeof(SendToRadioMsg)));
        btrpkt->counter = counter;
        btrpkt->nodeid = TOS_NODE_ID;
        call AMSend.send(AM_BROADCAST_ADDR, &pkt, sizeof(SendToRadioMsg));
        dbg("SendToRadio", "%s %d have sent packet %d\n",__FUNCTION__,btrpkt->nodeid = TOS_NODE_ID,btrpkt->counter);
    }
    //btrpkt->nodeid = TOS_NODE_ID;
     if (call AMSend.send(AM_BROADCAST_ADDR, 
          &pkt, sizeof(SendToRadioMsg)) == SUCCESS) {
        busy = TRUE;
      }
}
event void AMSend.sendDone(message_t* msg, error_t error) {
    if (&pkt == msg) {
      busy = FALSE;
    }
    call Leds.led1Toggle();

}
event message_t* Receive.receive(message_t* msg, void* payload, uint8_t len){
    if (len == sizeof(SendToRadioMsg)) {
      SendToRadioMsg* btrpkt = (SendToRadioMsg*)payload;
      
      if ((btrpkt->nodeid == 24) || (btrpkt->nodeid == 25)){
        call Leds.led2Toggle();
      }
      else
      {
        call Leds.led0Toggle();
      }
    }
    //call Leds.led0Toggle();
    return msg;
}
}
