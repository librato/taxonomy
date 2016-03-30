# Stackdriver

## Monitor and manage instances on AWS or Google Cloud

### What is it? 
Stackdriver (recently purchased by Google) is a monitoring and management suite
for cloud instances that reside on either AWS or Google cloud. It's a bit like
new-egg except that it actually works on more than one cloud provider. The
concept is to pull together data from a few different sources, Uptime data from
their own network of remote-pollers, Cloudwatch metrics, CloudTrail events and
logs, agent data from their collectd-based agent, and custom metrics, which
customers may emit to Stackdriver's custom statsd back-end.

All of this data goes into stack-driver's API endpoint, where it is mostly just
re-displayed in ways that are far more useful. My point is there is no fancy
machine learning here, StackDriver just puts the events next to each other and
lets you draw your own conclusions, which is actually what pretty much everyone
needs with respect to systems monitoring. You'll get, for example, an alert
that a system is failing it's uptime check, and you can open up StackDriver,
click on the event and get a page that shows you all the system-level
utilization graphs, and the event log (which includes every AWS API call that
affected the instance). 

Also offered are some simple instance automations (reboot instance etc..) which
may be fired from an event notification. 

### push, pull, both, or neither?
Stack-driver is mostly a pull-based system. The preponderant quantity of the
data it uses comes from your IaaS providers API. 

### Measurement resolution 
The system works mostly on a 60-second tick (event data is obviously aperiodic,
and some data can't be polled as often as every 60 seconds (cloud-watch free
tier is 5min for example)). Metrics are stored in raw resolution and are kept
for a maximum of 6 weeks depending on the package you sign up for.

### Data Storage 
The primary back-end datastore is cassandra. The stackdriver team has spoken a
little bit about running cassandra in the context of their system. See: 
http://www.slideshare.net/planetcassandra/running-cassandra-in-aws

### Analysis capabilities
Stackdriver does a fantastic job delivering on its promise of making it easy to
detect problems with individual cloud instances and cross-correlate outages
with promising leads like an overabundance of inbound queries or recent
modifications to security policies. 

It's not a terribly great system for ad-hoc data analysis and detecting the
sorts of imbalance or periodic oddities that a more general-purpose data
processing system works well for. There is a dashboard feature and you can
group multiple instances in a single graph, but you can't visualize more than
one metric in the same graph with a split-y axis for example. The system is
built around dealing with problems in individual instances, (and it's
lightyears ahead of anything the IaaS providers can offer), but it's just a
little difficult to model anything larger than a single instance.

### Notification Capabilities
Notification capabilities are excellent, the preview visualization when I'm
setting a threshold on a metric is greatly appreciated. All the notification
targets you would expect are supported. 

### Integration capabilities
Integration support is good within the spectrum of AWS products (ebs,
beanstalk, rds, etc..). There is some fledgling support for non IaaS hosts via
their collectd-based agent, and there's a statsd back-end you can emit metrics
to. Beyond that, there aren't really any integrations to be had.

### Scaling Model
Stackdriver has written about their architecture, mostly in the context of
their excellent post-mortem reports, see for example: 
http://www.stackdriver.com/post-mortem-october-23-stackdriver-outage/

The system was initially built-out on AWS using horizontally scalable
architecture, and is presumably also running on Google cloud given the
acquisition. 
