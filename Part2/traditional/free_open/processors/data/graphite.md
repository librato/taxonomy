# Graphite

## Everybody's favorite OSS Metrics tool

Graphite is a metrics storage and display system. It's conceptually similar to
RRDTool, storing metrics in ring-buffer databases locally on the filesystem.
Graphite makes some critically important design leaps by: 

1. Accepting metrics via a trivial text-based protocol over a network socket.
2. Automatically configuring and creating new add-hoc metrics with sane
defaults.

This allows operators to isolate the metrics processing burden from the rest of
the monitoring systems and enables anyone or anything that can speak the wire
protocol to create and work with new metrics with 0 configuration overhead.
Graphite has, as a result, become the most widely adopted metrics processing
system today.

### push, pull, both, or neither?
Graphite listens on a network socket with *carbon*, it's network listener daemon
or carbon-relay it's H/A sharding counterpart. The system is entirely
push-based, laying passively in wait for other systems to push metrics to it.

### Measurement resolution 
Graphite was designed to run with >= 1 second resolution metrics. Roll-ups and
summarizations are user-defined and performed in the persistence layer by
*Whisper* Graphite's custom-built TSDB. 

### Data Storage 
Graphite uses "Whisper", a simple ring-buffer metric-per-file TSDB that was
purpose-created for Graphite. It is conceptually similar to RRDTool's RRD's,
but implemented entirely in Python, and comes with a far more flexible
configuration design. You may, for example, set global default roll-up values
which are overridden by regex-matched metric names. Graphite's data storage
tier is modular, and a few other DB's (Ceres, Cassandra via Cyanite, and
KairosDB are also supported. 

### Analysis capabilities
Graphite (even without the myriad front-ends that augment it's analysis
capabilities) is an excellent choice for metrics aggregation and analysis. The
system was designed from the ground up to mix and match data from ad-hoc
sources into the same chart. It supports split and logarithmic axis and ships
with a huge number of data transformation plug-ins that enable you to, for
example compare a signal to itself week-over-week or display the top 10 of 100
given signals and etc..

### Notification Capabilities
None (best option is probably Bosun (https://bosun.org/))

### Integration capabilities
Graphite is so ubiquitous that even most of it's direct competitors have
integration support for it. Myriad front-ends and integrations exist that take
graphite data and embed it. Gweb's API is excellent, and obviously the system
can injest metrics from anything. 

### Scaling Model
Whisper DB's are a local-filesystem storage technology and this is the main
impediment to scaling Graphite. H/A, as well as something akin to horizontal
scaling can be achieved however with the use of carbon-relay and some common
web-scaling tools like haproxy and memcached. Federated Graphite installs do
run in the wild, however you'll probably need dedicated telemetry staff to
manage them. For more info see:
https://gist.github.com/obfuscurity/63399584ea4d95f921e4
