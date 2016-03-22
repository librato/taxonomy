# CopperEgg

## All the IaaS in one SaaS

### What is it? 
CopperEgg, is an Austin startup who was recently acquired by Idera, a company
that makes more traditional on-premise DB and infrastructure monitoring
software. It has become the cloud-component of the Idera suite.

CopperEgg's initial focus was to integrate with Iaas API's like Cloudwatch and
Rackspace Monitoring, extracting the data and augmenting it in ways that are
more helpful to systems administrators than the native IaaS tools (A pretty low
bar which CopperEgg easily achieves).

There is also an agent, called "reveal cloud" pre-acquisition and "Uptime
Cloud Monitor" post acquisition. It's written in Ruby and installs with a curl
one-liner on Linux and OSX (there is an installer app for Windows). 

The system also supports remote polling ("reveal uptime") from various locations
around the world, and custom metrics ("reveal metrics") via an API interface 

Regardless of how the data originated, the end-user is presented a tiled
interface where each tile represents a single entity the user has configured
the system to monitor (eg 1 host, 1 RDS instance, 1 website, 1 custom metric
etc..). System health is inferred using the Appdex standard, and the tiles are
color-coded to indicate system health. Each may be optionally tagged, so the
user can filter and sort them for large installations.

### push, pull, both, or neither?
CopperEgg uses a combination of pushing and pulling depending on the checks the
user configures. 

### Measurement resolution 
The CopperEgg agent runs on a 60 second tick, while the IaaS integrations will
run at the resolution of the IaaS. For AWS this is either 5-minutes or 1-minute
for premium users.

### Data Storage 
Copper Egg stores metric data for 30 days. 

### Analysis capabilities
The system meets it's goal as a Cloudwatch replacemnt. It is light-years better
in terms of presenting a sysadmin with an interface that enables her to see
instance and service health at a glance. That said, my entirely subjective
opionion of the tile-based interface is that it's clunky and amaturish,
especially in terms of information density. A lot of screen-realestate is
wasted on what amount to large square traffic signals that represent Nagios
state values (OK, Warning, Critical). In terms of actual data analysis it
shares many of Cloudwatch's deficiencies. Not allowing you to mix data from
more than one instance in the same graph for example.

### Notification Capabilities
You can only configure alerts for metrics measured by the agent ("reveal
cloud") or the remote poller data ("reveal uptime"). By default, any alert you
create applies to all systems. To create an alert that only applies to a few
systems you need to tag those systems and then specify that tag in the alert
definition. There is nicely integrated support for email, SMS, Pagerduty,
Twitter, Hipchat, and Campfire. Anything else is a manual web-hook. 

### Integration capabilities
CopperEgg boasts solid integration support for many common apps including Nginx,
Redis, Postgres and MySQL, details available at
https://www.idera.com/infrastructure-monitoring-as-a-service/devops-integration-tools

### Scaling Model
I couldn't find any published material that detail CopperEgg's internal
architecture. I sent an email asking for some details about the architecture
and I recieved this (pasted verbatim) response: 

```As per policy restrictions we are not allowed to disclose the architectural
details of the platform.  I will close the ticket now, but feel free to reopen
or submit a new one- if you need any assistance.```

