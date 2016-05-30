# Xymon

## Bigger Big-Brother

### What is it? 
Xymon grew out of the bbgen toolkit for Big-Brother. It is basically a
higher-performance clone of Big-Brother, and aside from some performance-based
changes like centralized configuration, looks and feels very similar.  Xymon is
a classic centralized poller, written in C. There is a unix-only agent called
Xymon Client, and Xymon Server. The server has native support for monitoring
network sockets, SNMP, and polling it's own agent.

### push, pull, both, or neither?
Xymon is pull based.

### Measurement resolution 
Default polling interval is 5 minutes

### Data Storage 
Xymon stores metrics data in RRDTool locally on the server.

### Analysis capabilities
Analysis capabilities are nascent. Apart from some pre-fab reports the Web-UI is
very hierarchal, you click down into individual hosts until you're given
RRDTool graphs that depict individual services on individual hosts.

### Notification Capabilities
Xymon provides email-based, or ad-hoc script alerting on simple thresholds on
individual service or host problems. Acknowledgments are supported but
time-period squelching is not.

### Integration capabilities
Xymon is a pretty strictly monolithic system. You may interact directly with the
RRD's it writes but otherwise there is no built-in means of import/export.

### Scaling Model
Xymon server is a single host with RRDTool storage. There is no H/A
configuration. 
