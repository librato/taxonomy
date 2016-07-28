# Check_MK

## Making Nagios Easier 

Check_MK began life as an easier-to-use remote execution framework for Nagios
(read: agent), but it is usable today as a stand-alone tool. It would be a
straightforward agent were it not for the various complications inherent in
integrating with a pre-existing Nagios system. These mostly include the typical
configuration Nagios needs before it can accept check results for hosts and
services. 

To work around Nagios' configuration complexities, Check_MK embeds a
fully-fledged service discovery system and Nagios configuration generator,
enabling you the user to scan for new hosts and add them to your pre-existing
Nagios configuration with a few CLI commands. Check_MK then follows up by
adding a queriable state socket for the Nagios daemon, a replacement UI, and
even a web-based Nagios configuration service, making it an extremely popular
one-stop Nagios simplification system.

### push, pull, both, or neither?
Depending on how you configure it, Check_MK can proxy active checks (pull) or
it can operate passively (push). Even if you configure it for active checking
however, Check_MK is a far more efficient poller than Nagios core is,
interacting once with each remote system it monitors per polling interval
rather than once per configured service check as Nagios+NRPE would.

### Measurement resolution 
Check_MK inherits its polling interval from Nagios.

### Data Storage 
Check_MK is a pass-through system, gathering state information and providing it
upstream to Nagios Core. It doesn't have a data-storage framework of its own.

### Analysis capabilities
Check_MK doesn't add any analysis capabilities to Nagios that don't already
exist. It does support and generate configuration compatible with Pnp4Nagios,
which is the de-facto RRDTool-based graphing framework of choice. 

### Notification Capabilities
Check_MK ships with a notification system for Nagios, which mostly effects how
individual users are notified rather than if they are notified. See
http://mathias-kettner.com/checkmk_flexible_notifications.html for detail.

### Integration capabilities
Check_MK adds a Nagios Event-Broker Module called "Livestatus", which greatly
enhances Nagios' already world-class integration support.

### Scaling Model
Check_MK arguably increases the performance of a single-instance Nagios host by
more effectively polling remote hosts. Otherwise, its scaling model remains
Nagios' scaling model.
