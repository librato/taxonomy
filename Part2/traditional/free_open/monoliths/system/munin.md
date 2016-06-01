# Munin

## Cacti for servers

### What is it? 
Munin is a metrics-centric centralized poller written in Perl. It uses an agent
(called *munin-node*) to collect stats on every system you want to monitor.
Those are periodically scraped by the munin server and persisted in RRD's.
Munin-node collects metrics by running one or more *plugins*. The plugins that
ship with Munin as well as those available from their Github repo are almost
entirely written in shell and follow simple design criteria described here:
http://guide.munin-monitoring.org/en/latest/plugin/writing.html

### push, pull, both, or neither?
Munin is a centralized poller with a dedicated agent of its own. 

### Measurement resolution 
The default polling interval is 5-minutes and Munin has for years had no way to
change this hard-coded default. As of the 2.0 branch the as-of-yet undocumented
*update_rate* parameter allows different measurement resolutions. YMMV.

### Data Storage 
Munin stores all data locally to RRD's.

### Analysis capabilities
Capabilities are pretty much what you'd expect for an RRDTool-based system. You
get statically configured line graphs of statically configured hosts and
services.

### Notification Capabilities
Although Munin has nascent notification support of it's own, the preferred
mechanism is to alert via Nagios using Munin's built-in support for
emitting Nagios-compatible passive-checks to a running NRPE daemon.

### Integration capabilities
Munin is, for the most part a monolithic replacement for Cacti with better
support for general-purpose computational entities (as opposed to Cacti's SNMP
focus). It does have excellent built-in support for emitting Nagios passive
check results. 

### Scaling Model
Munin server is a single-node system with no built-in support for fail-over. It
is primarily I/O and storage bound due to it's dependence on RRDTool. 
