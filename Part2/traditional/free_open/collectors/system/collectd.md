# CollectD

## The system statistics collection daemon

### What is it?

CollectD is a Unix daemon that collects, transfers and stores performance data of computers and network equipment. The acquired data is meant to help system administrators maintain an overview over available resources to detect existing or looming bottlenecks.

### push, pull, both, or neither?

The CollectD agent pushes via multicast or unicast UDP (depending on the configuration). It can also poll over TCP with additional plug-ins (i.e. cURL plug-in).

### Measurement resolution

The CollectD daemon reports every 10 seconds by default, and can be configured to sample at any rate (in seconds).

### Data Storage

The daemon provides infrastructure for filtering and delaying data, but does not store any data alone. Data acquisition and storage is handled by plug-ins which utilize shared libraries.

### Analysis capabilities

CollectD collects performance data of system resources, including CPU utilization, memory utilization, and network traffic. This is useful for finding current performance bottlenecks and predict future system load.

There are over 90 plug-ins supported which allow you to collect additional data for services and technologies (i.e. Java, virtual memory, hardware sensors, etc).

### Notification Capabilities

Notifications can be configured by setting a severity and a time. This is useful for informing users about a noticeable condition such as high CPU load. When a notification is triggered it is dispatched the same way that the performance metrics are.

Various plug-ins can send or receive notifications. For instance the LogFile plug-in will write notifications to the log file, while the Network plug-in and send and receive notifications.

### Integration capabilities

CollectD uses a modular design, and can be installed on Linux, Solaris, Mac OS X, AIX, FreeBSD, NetBSD, OpenBSD, and OpenWrt-powered devices. Support for Microsoft Windows is provided by SSC Serv, a native Windows service that implements CollectD's network protocol.

The vast library of 90+ plug-ins allows for additional integrations with tools and services, including various web servers, interpreters, databases, and applications.

### Scaling Model

CollectD uses a modular design: The daemon itself only implements infrastructure for filtering and relaying data as well as auxiliary functions and requires very few resources.
