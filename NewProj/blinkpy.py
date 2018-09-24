from TOSSIM import *
from tinyos.tossim.TossimApp import *
from random import *
import sys

t = Tossim([])
r = t.radio()

#for i in range(0, 1):
i = 24
m = t.getNode(i);
time = randint(t.ticksPerSecond(), 40 * t.ticksPerSecond())
m.bootAtTime(time)
print "Booting ", i, " at time ", time

print "Starting simulation."

t.addChannel("MyTimerC", sys.stdout)

while (t.time() < 40 * t.ticksPerSecond()):
  t.runNextEvent()

print "Completed simulation."
