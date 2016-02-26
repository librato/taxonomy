# Librato

## Simple, elegant, hosted telemetry.

### What is it? 
(full disclosure, I work for Librato) If you've ever wished you could outsource
your metrics infrastructure so you could get back to work, or if you've wished
you could get every engineering team together using the same metrics tool,
Librato should be the first demo you try. Simply put; Librato catches metrics.
It's a hosted telemetry system that can accept metrics from anything that can
emit metrics, and will work well with anything you're already running in-house. 

Librato does a fantastic job of interoperating with the toolchain you're
already using, so it does very well in shops where Ops is using one collection
tool and several other engineering teams are using something else. It's a
reliable, data-oriented monitoring system that doesn't try to replace the tools
you're already happy with. It also does a fantastic job of detecting and
dealing with ephemeral entities like threads, and short-lived server instances.
These appear as lines in existing graphs without you having to reconfigure
anything or touch the monitoring system at all, and the overall UI experience
is elegant, well engineered and easy to work with. Librato gives you a simple,
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
and sum-of-squares for every measurement accepted. This makes it possible for
Librato to accept data at arbitrary frequencies from end-users (including
faster than 1-second samples) and then persist the distribution of those
measurements at the resolution the customer has chosen to pay for. For some
types of data (single instance counters for example) this results in lossless
resolution for the life of the data (because for +1 counters, count == value).
In every case, summary data of this kind is preferable to singlar values (eg..
it's always preferable to have the distribution of 60 samples that arrived in 1
minute vs a single value that summarizes the minute).

### Analysis capabilities
Librato's UI is elegant, responsive and easy to use. Engineers with no
experience with monitoring system can visualize new metrics that are important
to them in a matter of minutes. Multiple y-axis graphs, data annotations, and a
functional domain-specific-language that enables advanced users to create new
data by performing computations on existing metrics are all available.

### Notification Capabilities
Librato allows end users to craft very specific alert's from critera that can
span sources as well as metrics. SMS, Email and Custom Webhooks are supported.
Unlimited notifications are included free, and push-button integrations exist
for every popular third-party notification service (Victor-Ops, Papertrail et
al..). 

### Integration capabilities

Librato has worked closely with the open-source monitoring community for years,
helping to develop and commit back features. Today, all open-source monitoring
tools that generally can emit metric data, can do so with Librato as a back-end
target, and open-source librato-api language bindings exist in every popular
programming language.

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
