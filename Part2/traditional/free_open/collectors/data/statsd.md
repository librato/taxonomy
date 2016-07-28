# StatsD

## Simple daemon for stats aggregation

StatsD is a cache-and-forward metrics summarization daemon. It listens for
metrics on a network socket, holds/aggregates them for some amount of time (10
seconds by default), and then emits a summary of the data (percentiles, sums,
averages etc..) to one or more (pluggable) backend metrics services like
Graphite or Librato.

Statsd is also a vast collection of clients for the Statsd server which, make
it trivial to emit metrics into a listening Statsd interface from pretty much
anything. These include command line tools as well as integrations for other
monitoring systems and language bindings for myriad programming languages.
Statsd is pretty much the de-facto means of wiring together metrics-centric
toolchain today.

### push, pull, both, or neither?
Statsd is a push based system.

### Measurement resolution
The standard tick is 10 seconds.

### Data Storage
Statsd is in-memory cache-and-forward, there is no data-storage requirement.

### Analysis capabilities
None. Statsd is intended to be pointed at the analysis tool of your choice.

### Notification Capabilities
None. Notification typically occurs before StatsD (at a monitoring system like
Nagios) or after StatsD hands off the metrics (in a processing system like
Riemann or Graphite/Bosun)

### Integration capabilities
Statsd integrates with everything you might ever want to get a metric from or
send a metric to.

### Scaling Model
Statsd is a small-footprint, stateless daemon with a very simple text-based
wire protocol. It is common practice to run a Statsd on every host system you
want to monitor and/or chain together multiple instances.
