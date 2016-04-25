# PRTG (Paessler Router Traffic Grapher)

## A network monitoring software for Windows

### What is it? 
Paessler Router Traffic Grapher is a network and bandwidth monitoring software for server infrastructure. It can monitor and classify bandwidth usage in a network using SNMP, Packet Sniffing and Netflow. It supports Windows and Linux.

PRTG can run on a Windows machine within your network to collect statistics from hosts such as routers, servers, switches and other key devices or applications. It offers an user interface with point-and-click configuration. You can display and share data from it such as live graphs and custom reports. 

PRTG Network Monitor has over 200 'sensor' types for all common network services, including HTTP, SMTP/POP3 (email), FTP, etc. A 'sensor' within PRTG is one aspect that you monitor on a device. For example a specific URL, the traffic of a network connection, a port of a switch or the CPU load on a machine.

### push, pull, both, or neither?

Not 100% sure here (Thoughts?)

### Measurement resolution 

By default, the live graphs contain 120 monitored values, which cover 2 hours with a scanning interval of 60s.
PRTG stores each set of data with a time stamp with a precision of a millisecond. For performance reasons, PRTG automatically averages monitoring data when calculating data for large time spans. The original resolution is kept in the historic database. 

### Data Storage 

PRTG stores all monitoring data in its own custom built-in database which is systematically optimized for saving monitoring data. They claim that tests have shown their database was up to 100 times faster than an SQL server. Data regarding configuration, temporary files, etc are stored on several locations on the user's computer.

### Analysis capabilities

Using real time dashboards with live network performance and status data, PRTG helps users track system issues and provide early warnings. Analyze detailed graphs and data tables that report uptime/downtime (% and seconds), good/failed requests (% and totals), bandwidth usage, CPU usage, ping times, disk space and much more. Create reports in HTML or PDF format.

### Notification Capabilities

PRTG offers notifications such as email, SMS, starting an executable file, sending SYSLog-messages, playing sounds or adding entries to the Windows Event log, and more. Push notifications to Android and iOS devices are also supported. Configure alerts on a specific schedule, and define various conditions and thresholds for your sensors.

### Integration capabilities

PRTG's API enables users to access monitoring data and manipulate objects using HTTP requests, run custom written sensors and notifications, customize the web interface plus more. With over 200 'sensor' types, PRTG covers a lot of ground in terms of network monitoring.

### Scaling Model

Horizontal. Not 100% sure here (Thoughts?)
