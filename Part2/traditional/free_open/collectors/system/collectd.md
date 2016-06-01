# CollectD

## Everybody's Favorite Monitoring Agent

### What is it?
CollectD is a Unix daemon that collects, and transfers performance data from
your hosts. You can think of it as a stand-alone open-source agent. You install
it on every system you want to monitor. It collects metrics from your systems
and emits them to other monitoring systems for processing.

CollectD was written in C and is extremely fast and modular. Myriad plug-ins
exist that enable it to collect metrics on just about any off-the-shelf
software you might be running from Apache to Zookeeper. 

### push, pull, both, or neither?
CollectD is a push-based system.

### Measurement resolution
The CollectD daemon reports every 10 seconds by default.

### Data Storage
None. Data acquisition and storage is handled by plug-ins.

### Analysis capabilities
None. Collectd is a stand-alone agent, designed to interact with other
monitoring systems for analysis. 

### Notification Capabilities
Notifications can be configured by setting a severity and a time. This is
useful for informing users about a noticeable condition such as high CPU load.
When a notification is triggered it is dispatched the same way that the
performance metrics are.

Various plug-ins can send or receive notifications. For instance the LogFile
plug-in will write notifications to the log file, while the Network plug-in and
send and receive notifications.

### Integration capabilities
CollectD uses a modular design, and can be installed on Linux, Solaris, Mac OS
X, AIX, FreeBSD, NetBSD, OpenBSD, and OpenWrt-powered devices. Support for
Microsoft Windows is provided by SSC Serv, a native Windows service that
implements CollectD's network protocol.

The vast library of 90+ plug-ins allows for additional integrations with tools
and services, including various web servers, interpreters, databases, and
applications.

### Scaling Model
Collectd is stateless, it will scale linerally WRT your instances.
