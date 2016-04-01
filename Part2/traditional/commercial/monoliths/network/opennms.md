# OpenNMS

## Java Nagios plus-plus

### What is it? 

I'm sure OpenNMS has it's reasons for referring to itself as a "Network
Management Platform" (I suspect it does this to differentiate itself from
Nagios), but in real life it's a pretty straightforward traditional
centralized-polling monitoring system, and it's a very good one. I've listed it
in the network category because that's what it wants, but IMO it's more
comparable to the tools in the system category like Nagios and Zenoss.

OpenNMS is written in Java and has built in support for polling systems via
WMI, SNMP, and JMX. In addition to actively polling service availability and
performance data, the system can passively accept logs and text-based "events",
parsing them for badness and alerting you if it finds any. It offers aggressive
auto-discovery and auto-provisioning to alleviate it's very burdensome
manual-configuration process. Compared to Nagios it "feels" less like a
framework and more like a purpose-built application (YMMV).

Many Nagios competitors attempt to simplify Nagios, but OpenNMS is not one of
them. It is a complex system, which depends on a not-imbedded Postgres DB and
obviously a working JDK. You'll have to install and mangage these componants
along with OpenNMS and the myriad daemons it installs (eg Provisiond, icmpd,
RTCd etc..).  Combine this with the hardcore telecom bent of the development
team and you often wind up with a system that out-Nagios's Nagios (at least in
terms of configuration complexity (Configuration files are XML, Polling and
retry intervals are configured in Milliseconds etc..)). If you enjoy
fine-grained control and wish Nagios had threadded multitasking, OpenNMS might
be your dream system. If, however, you think Nagios is stodgy and oldschool,
probaby look elsewhere.

### push, pull, both, or neither?
OpenNMS *mostly* pulls, but it also has support for log and event pushes.

### Measurement resolution 
The default polling interval is 5 minutes, but as is the case with most
centralized-pollers it can be changed on a per-service basis. With the
capability to move the primary Datastore to an external system and a poller
capable of threadding, OpenNMS is capable of much higher resolutions on the
same number of hosts compared with many of its competitors. 

### Data Storage 
The primary Datastore is a PostgreSQL database. This can run along-side OpenNMS
on the same system, or can be an external dedicated database server. 

### Analysis capabilities
The extremely responsive UI consists mostly of colorized HTML tables that
depict availability data.  It is well layed out and does a good job summarizing
current system state. The system stores and presents performance data in
RRDTool, though it could do a better job of integrating these graphs into the
rest of the UI. 

They have several highly-touted node-edge maps that do fancy things like
integrate with google-maps, that's all I've got to say about that.

There are myriad placate-your-manager style reports that you can generate in
all sorts of different formats; things like "top 10 misbehaving hosts" and the
like. Generally (as with many traditional centralized pollers) if you're
focused on SLA the UI is fantastic. If, however, you're focused on
understanding system behavior it's a wasteland. 

### Notification Capabilities
It's pretty much email out of the box. You can call custom scripts and there
are some third-party scripts that do things like forward notifications to the
PagerDuty API via Curl. 

### Integration capabilities
OpenNMS is a monolithic system, but it has several integration hooks you can
write custom code to interact with. Details are available
at: http://www.opennms.org/wiki/Integrating_with_OpenNMS 

### Scaling Model
OpenNMS is single-host, on-prem with a SPOF Database instance. HA
configurations are extremely hacky, and rely on various Opensource HA tools
like DRDB.
