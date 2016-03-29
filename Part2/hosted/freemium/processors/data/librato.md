# Librato

## Simple, elegant, hosted telemetry.

### What is it? 
(full disclosure, I work for Librato) Librato is an elegant, flexible hosted
telemetry system. It is similar to graphite but has a more reliable, scalable
persistence layer and a far more elegant and useful UI. It supports arbitrary
metrics tagging, and includes a functional DSL for doing things like comparing
metrics week-over-week and creating new metrics by transforming existing
signals.

Librato does a great job of interoperating with the toolchain you're already
using, augmenting engineering knowhow, and otherwise staying out of the way.
It works especially well with with ephemeral entities like threads, and
short-lived server instances, showing them as they appear in existing graphs on
existing dashboards without you having to reconfigure anything.  The overall UI
experience is well engineered and easy to navigate. Librato gives you a simple,
scalable, web-accessable metrics infrastructure without getting in your way,
forcing you to install anything, or trying to replace toolchain you're
comfortable with.

### push, pull, both, or neither?
Librato runs a publicly accesable endpoint that accepts JSON over HTTP. You can
push metrics to this manually, use a combination of the myriad open-source
tools that support librato as a back-end like collectd, statsd and etc.., or
you can run Librato's in-house agent.

In every case the system is push via HTTP/JSON. 

### Measurement resolution 

Librato stores: 2 days at the raw resolution of the metric source, 1 week at 1
minute resolution, 1 month at 15 minute resolution, and 1 year at 1 hour
resolution.

After 1 year the data is deleted from the system.

### Data Storage 

Librato uses a custom-developed persistence layer that consists of a fast
in-memory cache backed by several Cassandra rings.  It should be mentioned that
Librato doesn't store naieve date/value tuples like most other TSDB's but
instead uses summarized data points which include the sum, min, max, average
and sum-of-squares for every measurement accepted. 

The persistence layer has been spoken about publicly here: 
https://www.youtube.com/watch?v=uJvLiPQah3c

And the data storage format has been written about here:
http://blog.librato.com/posts/time-series-data

### Analysis capabilities
Librato's UI is excellent, enabling users to combine and compare data from any
combination of sources. It supports multiple y-axis graphs, logarithimic axis,
data annotations, and a functional domain-specific-language that enables
advanced users to create new data by performing computations on existing
metrics.

### Notification Capabilities
Librato allows end users to craft very specific alert's from critera that can
span sources as well as metrics. SMS, Email myriad third party integrations and
Custom Webhooks are all supported.  Unlimited notifications are included free.

### Integration capabilities

Librato has worked closely with the open-source monitoring community for years,
helping to develop and commit back features in many popular open source
monitoring tools. Today, all open-source monitoring tools that generally can
emit metric data, can do so with Librato as a back-end target, and open-source
librato-api language bindings exist in every popular programming language.

Additionally, Librato internally maintains a slew of turn-key collection-based
integrations that install by running a one-line shell script. These all work in
tandem with the Librato-Agent, and will auto-detect and report metrics on a
wide-range of web-servers, databases, in-memory cache systems, and operating
systems.

Finally Librato exists as a turn-key option for several IaaS and Paas providers
including AWS, Heroku, and AppHarbor.

### Scaling Model
Librato was designed to scale horizontally to meet the needs of customers who
run large-scale distributed systems. It currently injests over a million
measurements per second from over 1000 customers and is the monitoring system
used internally by the engineers running the Heroku PaaS. 
