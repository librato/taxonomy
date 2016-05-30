# Cacti

## Bringing joy to NetOps since 1996

### What is it? 
Cacti is one of the first metrics-centric monolithic monitoring tools. It's a
centralized poller built inside a PHP app with old-school, static,
web-form-based configuration. Cacti has always been a bit inflexible and
unwieldy for systems administrators, but it's first-class support for SNMP and
RRDTool continues to make it extremely popular the Network-Operations crowd to
this day.

### push, pull, both, or neither?
Cacti is a centralized poller. It polls via Cron via an included PHP script.  

### Measurement resolution 
Being a cron-based poller, Cacti is only capable of >1 minute intervals. The
default polling interval is 5 minutes.

### Data Storage 
Cacti uses a MySQL database to house meta-data and RRDTool to store metrics.

### Analysis capabilities
Cacti's UI is based on RRDTool Graphs. It doesn't make the mistake of making
you dig to find graphs, and the UI is comparatively useful (vs systems like
Xymon or MRTG), but it suffers from the normal litany of RRDTool problems,
including required pre-configuration, no means of ad-hoc adjusting axis, no
ad-hoc data transformation support, and no easy means of plotting multiple
signals on the same chart. 

### Notification Capabilities
Cacti has nascent support for sending email alerts on static thresholds via
an external SNMP server.

### Integration capabilities
Cacti is a strictly monolithic system. You may interact with the RRD's it
writes. 

### Scaling Model
Cacti is a single-instance server with two SPOF data stores.
