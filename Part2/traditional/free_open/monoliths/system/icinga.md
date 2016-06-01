# Icinga

## Nagios extended

### What is it? 
Icinga is a centralized-poller which was forked from Nagios core in 2007. Like
Nagios, it executes stand-alone monitoring scripts on a rotating schedule and
it remains plug-in compatible with Nagios. 

Currently there are two major version branches, Icinga v1 and v2, the primary
difference being that Icinga1 still uses Nagios configuration syntax while
Icinga2 uses a new, more programmatic configuration syntax that is capable of
tracking variables against base-objects and then assigning
services/notifications/etc.. based on those variables rather than statically
assigning them like Nagios does.  

### push, pull, both, or neither? 
In its default mode, Icinga, like Nagios is a pull-based system, but it can be
configured to accept *passive check results* as well, which implement
push-based status updates (usually via HTTPS).

### Measurement resolution
Icinga inherits its resolution form Nagios, which was designed to operate on
the order of Minutes. By default it launches active service checks every 5
minutes.

### Data Storage 
One primary reason for the fork was Nagios' steadfast resistance to replacing
the state file with a relational database, and predictably, Icinga made this
change pretty much immediately after the fork, providing "IDO" modules which can
store Icinga state data in either a MySQL or Postgres DB. The system does not
have a native means of storing and presenting performance data, but the various
Nagios Perfdata add-ons all remain compatible with Icinga.

### Analysis capabilities 
The default Icinga UI supports basic real-time red/yellow/green style
availability data with limited historical analysis capabilities. Third-party
and commercial UI add-ons exist that enable some performance data in the form
of line-graphs. 

### Notification Capabilities 
By default Nagios supports email notifications, UI-based alert
acknowledgments, and highly configurable escalations.  It is moderately easy
but not trivial to define alternate notification protocols, and third party
add-ons exist to extend it to support services like [PagerDuty]() and
[VictorOps]().

### Integration capabilities 
Icinga is generally identical to Nagios with respect to the set of hooks
typically employed by syadmin to extend Nagios to do things like implement new
notification types. It is missing some post-Nagios-Core v4 hooks like the
"Nagios event radio dispatch" interface, but the event broker interface remains
intact.

It also includes several powerful hooks, made possible by the use of a DB
state-store that Nagios lacks. These include the Query functionality of the DB
itself, as well a fully-functional Web API. 

### Scaling Model 
Icinga scales on par with Nagios into the rage the tens of thousands of active
service checks on modern hardware depending on the configured polling interval
(functionally it's not much different in this regard). It does, however add
native clustering support to achieve HA setups.
