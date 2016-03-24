# Logic Monitor

## Autodiscover all the things

### What is it? 
Logic monitor is an infrastructure monitoring tool with a strong focus on ease
of implementation. You install their collector software on systems inside your
network -- typically one collector system per network partition. These
collectors then use aggressive autodiscovery to find nearby nodes as well as
services running on those nodes. The collected data is then shipped back to
LogicMonitor's SaaS, which administrators can access via a Web Browswer. 

The architecture is agentless, so it relies heavily on WMI and SNMP. OS design
being what it is, this is accompanied by some troubling security practices.
Ergo, to monitor Windows hosts, install the collector on a Windows server with
local-admin credentials to every Windows host it monitors that never expire.
Linux hosts meanwhile are required to run the Net-SNMP daemon, and the Linux
collector daemon runs as root (ostensibly because /bin/ping is setuid root).
The logic monitor collectors are therefore like shiny pots of gold on your
network for anyone looking to get their hands on admin credentials and SNMP
community strings. 

If you can work with that, installing Logic monitor itself is almost an
afterthought and the system does a fantastic job of discovering interesting
things on your network to monitor.

### push, pull, both, or neither?
The on-premise collectors used by logic monitor poll your systems periodically
(pull), and then push the resulting data to LogicMonitor HQ via HTTPS. 

### Measurement resolution 
The system is capable of 1-minute resolution, although at the time I played
with it, the default polling interval varied widely (from 3 to 15 minutes)
depending on what I was pointing it at. The data retention schedule is as
follows: 

* 1 minute resolution for 5 hours
* 8 minute resolution for 1 week
* 3 hour resolution 1 month
* 12 hour resolution for 1 year

### Data Storage 
I couldn't find anything published around the specifics of Logic-monitor's data
storage infrastructure, but their job-openings suggest they store state and
time series data in a combination of MongoDB and MySQL. 

### Analysis capabilities
The UI relies heavily on Line-graphs arranged into context-specific Dashboards.
Maps and pie-charts are available but kept to a minimum (none are enabled by
default). The UI is snappy and responsive, and mouse-over context is available
pretty much everywhere. Unless you dig, the system provides you with
single-entity graphs (IE ram utilization on a single instance). There is custom
graph constructor that allows you to combine data from multiple entities, but
they are locked to a single Y-axis. Overall it does an excellent job of
providing an Operations team what they probably want to see, but developers
wanting to work with custom metrics data will probably be frustrated. 

### Notification Capabilities
The notification and Alerting UI are well designed and simple to work with. You
can alert on any data the system can collect and display. It includes a well
designed escalation system, has good support for notification types and even
ships with it's own text-to-speech notify-by-phone-call feature, which
depending on how you use PagerDuty or VictorOps, might save you some money. 

### Integration capabilities
The system is monolithic, but it boasts a deep collection of plug-ins (dubbed
"logic modules"), which enable the it to monitor any popular Application,
database, or network device out there. There is also an API from which
Time-Series data may be extracted. 

### Scaling Model
I couldn't find anything published around the specifics of Logic-monitor's data
systems architecture, but their job-openings suggest they are implemented on
AWS, and employ stream-processing technogolies that are horizontally scalable. 
