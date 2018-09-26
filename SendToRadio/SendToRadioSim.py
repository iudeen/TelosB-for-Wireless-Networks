from TOSSIM import *
from tinyos.tossim.TossimApp import *
from random import *
import sys

t = Tossim([])
r = t.radio()

for i in range(0, 5):
  
  m = t.getNode(i);
  time = randint(t.ticksPerSecond(), 10 * t.ticksPerSecond())
  m.bootAtTime(time)
  print "Booting ", i, " at time ", time

print "Starting simulation."

t.addChannel("SendToRadio", sys.stdout)

while (t.time() < 10 * t.ticksPerSecond()):
  t.runNextEvent()

print "Completed simulation."
