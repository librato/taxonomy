# Datadog

## The most popular hosted monitoring system amoungst Ops

### What is it? 
Datadog makes it very quick and easy to get started monitoring hosts running a
dizzying array of often-used applications like databases, web servers, and even
other monitoring systems. In my opinion the depth of out-of-the-box integration
support is really what makes Datadog so popular. It really couldn't be easier
to bootstrap a monitoring infrastructure from scratch. 

The agent collects metric data which is sent to Datadog's publicly accessable
API. Data can be either numeric or "event" data (somewhat of a cross between
log data and annotations). Customers then log into data-dog's Web-UI to
interact with the data, configure dashboards and craft alerts. Datadog also
supports arbitrary "tags" enabling users to tag the same metric several
different ways for ease of lookup later.

The agent also comes with a built-in statsd listener to which you can emit
custom metrics. As of this writing custom metrics are limited to 100 metrics
per instance. 

### push, pull, both, or neither?
The Datadog Agent pushes to Datadog HQ via HTTPS

### Measurement resolution 
Datadog internally stores data at a 1-second resolution, but it is rarely
displayed this way. The graphing UI, has an upper-level cap on the number of
data points per metric it is allowed to display (300). This effectively means
that the data displayed in the UI is summarized depending on the length of time
depicted by the X-Axis. Whether you ask for two 5 minutes of data or 5 days,
you'll have the same 300-point cap to display it, so the 5-day graph will be
very aggressively summarized in comparison. 

### Data Storage 
Metric and event data are sent to Kafka, which is backed by a hodge-podge of
different databases for perminent storage and query. Details are available
at: http://blog.underdog.io/post/107602021862/inside-datadogs-tech-stack

### Analysis capabilities
Datadog's UI is snappy and elegant. Arbitrary data tags make it quick and easy
to locate and compare metrics against each other, and there are myriad
visualization types to choose from. 

### Notification Capabilities
Datadog has excellent notification capabilities. Alert critera can be defined
for any metric you send including the textual contents inside event data.
Criteria includes host-grouping by tag, alerting on absent data, user-defined
static thresholds and some simple outlier detection (where one metric source is
reporting differently from the others in the same group)

### Integration capabilities
Datadog has excellent integration capabilities, enabling new users to get up
and running in a very short amount of time. 

### Scaling Model
Datadog is an enterprise SaaS tool that was built to scale to suit the needs of
customers who run large-scale distributed systems. It currently processes over
a million datapoints per second. 
