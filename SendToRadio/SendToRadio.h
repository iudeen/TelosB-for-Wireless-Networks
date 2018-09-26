#ifndef SENDTORADIO_H
#define SENDTORADIO_H

enum{
    AM_SENDTORADIO = 6,
    TIMER_PERIOD_MILLI = 1024
};

typedef nx_struct SendToRadioMsg{
    nx_uint16_t nodeid;
    nx_uint16_t counter;
} SendToRadioMsg;

#endif
