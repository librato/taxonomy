# <Name>

## The system statistics collection daemon

### What is it?

collectd is a Unix daemon that collects, transfers and stores performance data of computers and network equipment. The acquired data is meant to help system administrators maintain an overview over available resources to detect existing or looming bottlenecks.

### push, pull, both, or neither?

The collectd agent pushes via multicast or unicast UDP (depending on the configuration). It can also poll over TCP with additional plugins (i.e. cURL plugin).

### Measurement resolution

The collectd daemon reports every 10 seconds by default, and can be configured to sample at any rate (in seconds).

### Data Storage

The daemon provides infrastructure for filtering and delaying data, but does not store any data alone. Data acquisition and storage is handled by plug-ins which utilize shared libraries.

### Analysis capabilities

collectd collects performance data of system resources, including CPU utilization, memory utilization, and network traffic. This is useful for finding current performance bottlenecks and predict future system load.

There are over 90 plugins supported which allow you to collect additional data for services and technologies (i.e. Java, virtual memory, hardware sensors, etc).

### Notification Capabilities

Notifications can be configured by setting a severity and a time. This is useful for informing users about a noticeable condition such as high CPU load. When a notification is triggered it is dispatched the same way that the performance metrics are.

Various plugins can send or receive notifications. For instance the LogFile plugin will write notifications to the log file, while the Network plugin and send and receive notifications.

### Integration capabilities

collectd uses a modular design, and can be installed on Linux, Solaris, Mac OS X, AIX, FreeBSD, NetBSD, OpenBSD, and OpenWrt-powered devices. Support for Microsoft Windows is provided by SSC Serv, a native Windows service that implements collectd's network protocol.

The vast library of 90+ plugins allows for additional integrations with tools and services, including various web servers, interpreters, databases, and applications.

### Scaling Model

collectd uses a modular design: The daemon itself only implements infrastructure for filtering and relaying data as well as auxiliary functions and requires very few resources.