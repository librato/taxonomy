# SmokePing

## Ping. With Graphs.

### What is it? 
SmokePing is a Perl script designed to ping your network components and
visualize their latency and packet-loss. It is simple in both concept and
execution, and takes a novel approach to visualization by taking multiple
samples per measurement interval (10 by default). The samples are then sorted
by latency and the median latency is plotted as the *actual* value, while the
actual samples are plotted in grey as deviation. The shade of grey is selected
as a function of the distance from median, and this gives the resulting charts
a "smokey" appearance (hence the tool's moniker) with darker shades of grey
close to the median value, and lighter shades as the deviance increases.  The
median value itself is also colorized as a function of packet-loss.

### push, pull, both, or neither?
A single-instance SmokePing system is wholly pull-based, however, when multiple
systems are employed, the "slave" nodes do their own polling and push the
result to the "master" system.

### Measurement resolution 
The default tick (referred to as a "step" in the docs) is 60 seconds.

### Data Storage 
SmokePing was written by the author of RRDTool and uses RRDTool for storage and
visualization.

### Analysis capabilities
SmokePing line-graphs do a very nice job of depicting the latency of individual
network hops as well as the sigma latency of individual nodes.  

### Notification Capabilities
SmokePing has excellent alert definition syntax. You can, for example, craft
alerts that fire when the RTT is >X for Y sampling periods, or even based on
historic average median latency over several measurement rounds.  The
notifications themselves however are restricted to email targets only.

### Integration capabilities
SmokePing can be extended with plug-ins that add new protocols of service
checks (curl instead of ping for example), or those that fire alerts based on
new types of criteria (exponential weighted average of packet loss for
example). 

Otherwise the system has a few hooks for other monitoring systems to interact
with it. One option is the RRDTool files themselves, and another is the
included *smokeinfo* script, which provides a handy command-line-based wrapper
to the RRDTool data. 

### Scaling Model
SmokePing masters can orchestrate many distributed nodes in order to take
samples from different perspectives on the network, but there is no H/A
configuration for the master node itself, so the Master is an SPOF. If it dies
all monitoring stops.

Further, the RRDTool-based storage can't be distributed off a single host, so
SmokePing is I/O bound, and scales as far as you can scale RRDTool-based
storage on a single node.
