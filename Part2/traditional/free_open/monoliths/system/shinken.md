# Shinken

## Py-Nagios

### What is it? 
Shinken is a from-scratch rewrite of Nagios core in python. Unlike the other
Nagios forks, Shinken is committed to config-compatibility with Nagios core,
which means your existing Nagios configuration will work without modification
in Shinken, as will (obviously) your existing Nagios plug-ins.

Additionally, Shinken adds some much needed H/A and scaling options to the
Nagios architectures, allowing you to run schedulers and pollers across
multiple systems while centrally maintaining state. It also extends Nagios'
configuration syntax in interesting and useful ways (eg.. enabling you to
specify 'x out of y' logic for clusters inside the service check
configuration). Shinken also adds myriad easy-to-install turn-key integration
support for things like Graphite, and is in general easier to extract state
data from.

### push, pull, both, or neither?
Shinken supports both the active and passive check models Nagios administrators
will be familiar with (both).

### Measurement resolution 
Shinken is based on Nagios and therefore designed to run on a >1 minute tick.

### Data Storage 
Shinken is highly configurable with respect to storing state, logs and metrics
from the entities it monitors. This support is provided as a series of
easy-to-install modules the complete list is here:
http://shinken.io/browse/modules/updated 

### Analysis capabilities
Shinken ships with it's own stand-alone WebUI and boasts built-in support for
both RRDTool and Graphite, which is pretty great.

### Notification Capabilities
Shinken pretty much identically reimplements Nagios' notification framework, to
include all of the macros and command syntax. 

### Integration capabilities
Shinken has all of the integration potential of Nagios and much more. You can,
with the one-liner installation of some combination of modules, export data to
pretty much any system you might want to talk to. Further the native livestatus
support provides a queryable state socket which, in the author's opinion should
have been a standard feature in Nagios core 4. 

### Scaling Model 
Shinken is architected internally to be much more modular than Nagios, and
although some of these components can't be distributed (eg the Arbiter and
Broker daemons), the components that classicly represent scaling challanges to
Nagios' design can be horizontally scaled. See:
http://shinken.readthedocs.io/en/latest/09_architecture/the-shinken-architecture.html
for detailed scaling info.
