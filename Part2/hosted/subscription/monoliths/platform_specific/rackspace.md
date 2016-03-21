# Rackspace Cloud Monitoring

## Free availablilty monitoring for Rackspace Customers

### What is it? 
Rackspace cloud monitoring is the somewhat blandly-named monitoring component
of Rackspaces' managed cloud infrastructure suite. It uses a combination of
geographically dispersed pollers and a lightweight agent to monitor basic
system statistics (cpu,memory,port availability, ping latency, etc..) on your
rackspace cloud instances. 

The agent is internally referred to as 'virgo' and is available as open source
here: https://github.com/virgo-agent-toolkit/virgo-base-agent. It is a
lua-scriptable agent, written in C, and it's installed by default in "managed
cloud" instances. Customers working with "core cloud" instances must install it
themselves, but in either case the agent and the functionality it provides are
free. 

I say the agent is lua scriptable, but the practical reality is that end-users
are confined to a finite set of service and host checks that Rackspace defines.
See:
https://developer.rackspace.com/docs/rackspace-monitoring/v1/developer-guide/#agent-check-types
for a list of these. Compared to AWS Cloudwatch, Rackspace is more focused on
individual system availability, rather than ad-hoc metrics -- at least from a
UI perspective (and certainly from a notification and alerting perspective),
which is a somewhat disappointing focus for a cloud-provider. Depending on your
use case however, their partnership with New-Relic might make up for that. 

### push, pull, both, or neither?
Rackspace monitoring is pull-based, with pollers externally checking service
availability and ping latency, as well as pulling in agent-data via https. 

### Measurement resolution 
The best granularity available is 30 seconds. Raw resolution storage is kept
for 48 hours at which point data summarization begins. The schedule is: 

RAW	      2 days
5-minute	   10 days
20-minute	20 days
1-hour	   155 days
4-hour    	300 days
24-hour  	5 years

### Data Storage 
Rackspace uses an internally developed system called Blueflood to process and
store metrics data internally. The system is written in java and relies on ZK
for data processing and Cassandra for storage. It has been written and spoken
about, publicly and is available as open source software. See: 

https://developer.rackspace.com/blog/blueflood-announcement/
http://blog.librato.com/posts/sf-metrics-meetup-blueflood-grafana

### Analysis capabilities
Although the monitoring data provided by the agent is seamlessly integrated
into the Rackspace server management UI, it's analysis capaibilites are
naescent. In fact, Rackspace shares many of the same deficiencies as AWS
cloudwatch in terms of actual analysis capabilities. They lack any real metrics
analysis UI or dashboard, and there is no easy means to perform simple actions
like looking at data from multiple systems on the same graph, or labeling an
axis and etc...

### Notification Capabilities
Rackspace has a fairly complex set of configuration criteria that rigidly
define checks which report to alarms which report to notification policies.
Alerts are based on Nagios-like states (OK, Warning, Error). This generally
makes setting up notification on new types of ephemeral entities a pain, and
doesn't allow the user to model anything larger than a single server (ie there
is no way to notify on criteria like 10% of the web servers going offline)

### Integration capabilities
A recently announced partnership between Rackspace and New Relic gives
customers of the former a free account to the latter. If you are a rackspace
customer and you have not signed up for this, you should close this book and go
do so before they change their minds. 

The Rackspace API is good, and integrations from meta-server management
companies like Server Density and CopperEgg, as well as the usual suspects in
the notification space (Pagerduty, VictorOps etc..) rely on it heavily.

### Scaling Model
Rackspace Monitoring scales linerally with their cloud, so effectively from the
end-user standpoint it's infinately scalable. As long as you can still
instantiate Rackspace instances and services, you'll be able to use Rackspace
Monitoring to watch them.
