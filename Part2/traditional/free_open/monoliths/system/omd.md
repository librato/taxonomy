# OMD

## Nagios made easy(er)

OMD is a repackaging of Nagios core along with several Add-ons and replacement
UI's. The packaging includes Nagios core, a fully-preconfigured Check_MK
installation to accomplish remote-execution of Nagios plug-ins on remote hosts,
Thruk (a popular replacement UI), MK-Multisite (IMO the best Nagios
user-interface in existence), WATO (a web-based Nagios configuration tool) and
more. If you are familiar with the Nagios add-on universe, you'll likely find
most, if not all of your favorite Nagios add-on's already preconfigured for you
in OMD. 

It is a large install, but it's arguably preferable to wiring up the tool-chain
manually. I say arguably because OMD itself somewhat ironically presents a few
management challenges that don't exist if you decide to just roll the tool-chain
yourself. You are constrained to the versions of the tools in it's current
package for example, and if you use WATO you'll have to manage the WATO
configuration against whatever manual configuration you or other admin make,
which can quickly result in a split-brained, extra layer of confusion atop an
already confusing Nagios core configuration. 

### push, pull, both, or neither? 
In it’s default mode, Nagios is a pull-based system, but it can be configured
to accept “passive check results” as well, which implement push-based status
updates via HTTPS.

### Measurement resolution
Nagios is designed to operate on the order of Minutes. By default it launches
active service checks every 5 minutes. OMD adds a pre-configured PNP4Nagios
implementation which stores Nagios performance data in RRDTool Databases
locally on the filesystem. 

By default you'll get the following data retention:
2880 entries with 1 minute step = 48 hours of 1-minute resolution data
2880 entries with 5 minute step = 10 days of 5-minute resolution data
4320 entries with 30 minute step = 90 days of 30-minute resolution data
5840 entries with 360 minute step = 4 years of 6-hour resolution data

PNP4Nagios will store 3 summarizations per roll-up, one averaged, one min and
one max.

### Data Storage 
Nagios stores state change events only, logging whenever a service changes from
one state (like 'OK') to another state (like 'warning'). These are written to a
log file located on the local filesystem. OMD adds a pre-configured PNP4Nagios
implementation which stores Nagios performance data in RRDTool Databases
locally on the filesystem. By default the data storage requirement is ~1.2MB
per metric. 

### Analysis capabilities 
The default Nagios UI supports basic real-time red/yellow/green style
availability data with limited historical analysis capabilities. OMD adds a
pre-configured PNP4Nagios implementation along with integrations with Thruk,
MK-Multisite and the core UI. This adds real-time RRDTool graphs in the Core UI,
and per-service "Fuel-gauge" visualizations for Thruk and MK-Multisite.

### Notification Capabilities 
By default Nagios supports email notifications, UI-based alert
acknowledgments, and highly configurable escalations.  It is moderately easy
but not trivial to define alternate notification protocols, and third party
add-ons exist to extend it to support services like [PagerDuty]() and
[VictorOps]().

### Integration capabilities 
In some contexts, Nagios was designed with excellent “hooks” to support
end-user extensions and add ons. It is easy, for example, to create new service
checks, and re-define notification commands.  In other contexts Nagios is quite
difficult to extend, for example it is not easy to export performance data from
Nagios into telemetry analysis systems like
[Graphite](/Part2/traditional/free_open/processors/data/graphite.md). Tools exist to
accomplish this, but the configuration will take a first-time user several
hours at a minimum.  In still other contexts, Nagios was not designed for
integration at all, for example there is no API or other means to query the
Nagios Daemon for real-time status updates on arbitrary hosts. 

OMD makes up for many of these deficiencies. It includes MK-Livestatus for
example, which provides real-time Nagios state data via a queryable network
socket. It's data exportation capabilities are limited to RRDTool however.

### Scaling Model 
Nagios scales well into the tens of thousands of active service checks on
modern hardware depending on the configured polling interval. With passive
checks, it scales into the range of half a million service checks depending on
the configured polling interval. 

OMD uses the Check_MK agent for remote checks, which uses passive checks by
default. It also includes a Mod-Gearman installation, which advanced users can
employ to build distributed and high-availability Nagios infrastructures.
