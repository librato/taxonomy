# Xymon

## Bigger Big-Brother

Xymon grew out of the bbgen toolkit for Big-Brother. It is a higher-performance
clone of Big-Brother, and aside from some performance-based changes like
centralized configuration, looks and feels very similar.  Xymon is a classic
centralized poller, written in C. It is composed of the unix-only agent called
Xymon Client, and the Xymon server process. Aside from its own agent, the
server also has native support for monitoring network sockets, and SNMP.

### push, pull, both, or neither?
Xymon is pull based.

### Measurement resolution 
Default polling interval is 5 minutes

### Data Storage 
Xymon stores metrics data in RRDTool locally on the server.

### Analysis capabilities
Analysis capabilities are nascent. Apart from the dozen or so pre-fab reports
the Web-UI is rigidly hierarchal. You click down into individual hosts until
you're given RRDTool graphs that depict individual services on those hosts.

### Notification Capabilities
Xymon provides email-based, or ad-hoc script based alerting on simple
thresholds on individual service or host problems. Acknowledgments are
supported but time-period squelching is not.

### Integration capabilities
Xymon is a strictly monolithic system. You may interact directly with the RRD's
it writes but otherwise there are no integration hooks.

### Scaling Model
Xymon server is a single host with RRDTool storage. There is no H/A
configuration. 
