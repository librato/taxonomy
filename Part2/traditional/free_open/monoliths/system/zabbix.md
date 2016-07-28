# Zabbix

## A Nagios replacement aimed at "Enterprise" businesses

Zabbix is a centralized poller designed with the needs of Enterprise business
customers. It is a well documented system that configures via Web forms, and
features first-class support services. It is comprised of the Zabbix server
process, which schedules checks, reaps results and emits notifications, 0 or
more Zabbix Proxies which distribute the check-processing load, a database
instance, and the Web-UI. 

These parts may be run on separate systems or on the same system, which makes
Zabbix a bit more scalable than its direct competitors but also arguably a
little more difficult to install and reason about. 

### push, pull, both, or neither?
Zabbix agent's run on every system you want to monitor. The agents may either
actively run their own checks on the monitored systems or perform one-off
checks at the direction of the Zabbix server. In either case the system is
predominantly pull-based, though it scales slightly better than other pollers
like Nagios because of it's proxy services and affinity for pushing check-logic
out to the monitored hosts.

### Measurement resolution 
The default polling interval in most cases is 1-minute, however Zabbix makes it
easier than most centralized pollers to specify sub 1-minute polling intervals. 

### Data Storage 
All data is stored in a centralized SQL Database (Microsoft SQL, MySQL and
PostgreSQL are all supported). Zabbix stores raw resolution data (history) for 30
days and summarized data (trends) for 90 days by default. 

### Analysis capabilities
Analysis capabilities in Zabbix are better than most of its centralized-poller
brethren (which is not a particularly high bar). Many of the basic UI
deficiencies one expects in RRDTool-based UI's exist in Zabbix (multiple-y
axis, depicting several different metrics in the same graph), but the API can
make up for many of these (see, for example:
https://dzone.com/articles/escaping-zabbix-ui-pain-how)

### Notification Capabilities
Zabbix has very strong alert and notification criteria and supports basic
repeat-notification and dependency-based message squelching. Add-on support for
Pagerduty and VictorOps is available but more difficult to install than many
other systems.

### Integration capabilities
Zabbix has strong integration capabilities which center around its REST API and
SQL underpinnings. See: http://www.zabbix.com/third_party_tools.php for a list
of third-party add-ons.

### Scaling Model
Zabbix relies on a SPOF SQL Database back-end, so it is generally DB I/O bound.
Typical production systems service on the order of 4-6k hosts.  See:
https://www.zabbix.com/forum/showthread.php?t=25349 for tips on scaling over
10k nodes.
