# Dataloop

## Replace your Nagios without replacing your Nagios

### What is it?

Dataloop.io is a system-oriented monitoring tool aimed squarely at existing
Nagios users. Their agent runs nagios-style plugins that are, for the most part
written in python and may be edited directly from the primary UI. It also ships
with a local statsd instance that you can push custom metrics into.  All
availability and performance data is shipped to Dataloop's publicly accessible
data collectors. 

Dataloop has put a lot of work into making the installation of their agent easy
on unix hosts vi a one-liner shell command you can use directly or inject into
the most popular configuration management systems like Ansible, Chef, and etc..
Silent install on Windows hosts is possible (albeit not as easy) via powershell
scripts.  

Host types (eg "default", "nginx host") are then configured centrally and
applied to various hosts in your infrastructure based on criteria you specify.
These roles then enable various plug-ins on individual hosts. Dataloop attempts
to make this process less arduous with a UI that relies heavily on drag and
drop (creating a role makes a green circle in the UI. Assign checks to the role
by dragging check objects into it from the right. Assign hosts to it by
dragging hosts into it from the left, and etc..)

### push, pull, both, or neither?
The dataloop agent pushes data to their centralized collectors via https.

### Measurement resolution 
Dataloop runs Nagios checks on individual hosts every 30 seconds and flushes
the local statsd cache every second. The retention policy is as follows:

 1 & 30 second resolution: 48 hours
 1 minute resolution: 60 days
 1 hour resolution: 10 years

### Data Storage 
The primary metrics data store is Riak, and dataloop has spoken publicly about
their persistence layer here: https://www.youtube.com/watch?v=5q_dnDHTbtc

### Analysis capabilities
Analysis capabilities are on par with what you'd expect from a host-oriented
system. Line graphs and big numbers show you the status of individual services
on individual or groups of hosts. You won't find the more advanced analysis
features (composite metrics, logarithmic axis, time-shifted comparisons etc..)
common amoung the more data-oriented tools.

### Notification Capabilities

Dataloop builds on simple Nagios-style event criteria, allowing you to craft
alerts that combine checks across hosts, but the notification logic itself is
still a work in progress and has some room for improvement. The UI draws pretty
clear lines between alerts on statsd-delivered metrics vs plug-in derived
status codes and there are no push-button notification integrations available
(you can set up manual web-hooks for pagerduty et.al.. to get around this)

### Integration capabilities
Dataloop has a read-only web API you can use to extract data. 

### Scaling Model
Dataloop is still a fairly new player to the space and hasn't talked widely
about their system architecture beyond their data-processing tier with Riak.
Current utilization numbers are unknown. 
