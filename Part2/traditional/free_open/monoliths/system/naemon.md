# Naemon

## The new Nagios

### What is it? 
Naemon is a [centralized-polling](/Part1/2.md) system that was forked from
Nagios in 2013. It executes stand-alone monitoring scripts on a rotating
schedule just like Nagios and is compatible with Nagios plug-ins, Nagios add-ons, and . 

### push, pull, both, or neither? 
In it’s default mode, Nagios is a pull-based system, but it can be configured
to accept “passive check results” as well, which implement push-based status
updates via HTTPS.

### Measurement resolution
Nagios is designed to operate on the order of Minutes. By default it launches
active service checks every 5 minutes.

### Data Storage 
Nagios stores state change events only, logging whenever a service changes from
one state (like 'OK') to another state (like 'warning'). These are written to a
log file located on the local filesystem. There is naescent built-in support
for collecting performance data, and there are third-party addons which emit
this performance data to external processors like
[Graphite](/Part2/traditional/free_open/processors/data/graphite.md/ and
[Librato](/Part2/hosted/freemium/processors/data/librato.md).  Other
third-party add-ons exist to replace the state log file with mysql and postgres
databases.

### Analysis capabilities 
The default Nagios UI supports basic real-time red/yellow/green style
availability data with limited historical analysis capabilities. Third-party
and commercial UI’s exist that enable some performance data in the form of
line-graphs. 

### Notification Capabilities 
By default Nagios supports email notifications, UI-based alert
acknowledgements, and highly configurable escalations.  It is moderately easy
but not trivial to define alternate notification protocols, and third party
add-ons exist to extend it to support services like [PagerDuty]() and
[VictorOps]().

### Integration capabilities 
In some contexts, Nagios was designed with excellent “hooks” to support
end-user extensions and add ons. It is easy, for example, to create new service
checks, and re-define notification commands.  In other context Nagios is quite
difficult to extend, for example it is not easy to export performance data from
Nagios into telemetry analysis systems like
[Graphite](/Part2/traditional/free_open/processors/data/graphite.md). Tools exist to
accomplish this, but the configuration will take a first-time user several
hours at a minimum.  In still other contexts, Nagios was not designed for
integration at all, for example there is no API or other means to query the
Nagios Daemon for realtime status updates on arbitrary hosts. Integrations that
provide this functionality exist but are non-trivial to install. DIY solutions
must be written in C in order to communicate with the nagios internal event
broker interface.

### Scaling Model 
Nagios scales well into the tens of thousands of active service checks on
modern hardware depending on the configured polling interval. With passive
checks, it scales into the range of half a million service checks depending on
the configured polling interval. Beyond that, multi-daemon setups can be
designed and maintained by knowledgeable, dedicated telemetry teams using
third-party addons
