# Naemon

## The new Nagios

Naemon is another Nagios fork, born in 2013. It executes stand-alone monitoring
scripts on a rotating schedule just like Nagios and is compatible with Nagios
plug-ins, add-ons, and configuration syntax.

### push, pull, both, or neither? 
In its default mode, Naemon is a pull-based system, but it can be configured to
accept *passive check results as well, which implement push-based status
updates via HTTPS.

### Measurement resolution
Like Nagios, Naemon is designed to operate on the order of Minutes. By default
it launches active service checks every 5 minutes.

### Data Storage 
Naemon inherits Nagios' statefile storage, but adds a built-in Livestatus
plugin to provide a query API to it's own in-memory state. 

### Analysis capabilities 
Naemon has replaced the Nagios core CGI's with Livestatus and Thruk. Analysis
capabilities remain about the same. See: http://www.thruk.org/ for more
information.

### Notification Capabilities 
Naemon inherits notification support unchanged from Nagios. It supports email
notifications, UI-based alert acknowledgments, and highly configurable
escalation.  It is moderately easy but not trivial to define alternate
notification protocols, and third party add-ons exist to extend it to support
services like [PagerDuty]() and [VictorOps]().

### Integration capabilities 
Naemon ships with Livestatus built-in but is otherwise unchanged from Nagios in
terms of integration capablities. 

### Scaling Model 
Naemon was forked by the team that implemented lightweight worker processes in
Nagios core 4, and they have continued their parallelization work in Naemon.
It's too soon to tell how much Naemon improves over Nagios' scaling story but
Naemon is generally expeted to surpass Nagios in this regard. 
