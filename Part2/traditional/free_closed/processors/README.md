# Focus
## What sorts of things will your tool need to monitor?

### [System Availability](system)

These tools seek to answer the question: "Is it up?". Any tool that was
primarily designed to check for system or service availability at a one-minute
or greater resolution will be found here. Most classical operations-centric
monitoring tools like Nagios fall into this category. 

### [Application/DataBase Performance](apm)

APM Tools insert themselves into popular databases and language interpretors
for the purpose of analyzing their performance. This is usually done by
patching the interpretor or other binary with instrumentation code. These tools
can give very detailed performance data at a highly granular resolution on
databases like MySQL or even on custom apps by, for example, instrumenting the
JVM.  Examples include New Relic, Appneta, and Vivid Cortex.

### [Network Analysis](network)

A broad class of tools designed to monitor and analyze network availability,
performance, and content. Packet taps, SNMP collectors, Netflow, and and SFlow
related tools can be found herein.

### [Log and Metric Processing/Visualization/Analysis](data)

Tools in this category were designed to collect or accept ad-hoc metrics and
log data and do something useful with it, such as visualizing it (drawing
graphs), parsing it, transforming it, alerting on it, and possibly forwarding
it to other tools.  Examples include Splunk, Heka, Graphite, Riemann and
Librato.

### [Storage and persistence](storage)

These tools specialize in analyzing SAN's and other distributed storage
technologies.

### [Platform-Specific](platform_specific)
Tools in this category were created specifically to monitor a particular
platform, or a class of platforms. AWS/Heroku-centric monitoring
tools fall into this category. 
