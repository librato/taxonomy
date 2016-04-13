# StatsD

## Simple daemon for stats aggregation

### What is it?

StatsD is a network daemon that was developed by Esty to aggregate and summararize application metrics. It listens for statistics such as counters and timers sent over UDP or TCP and sends aggregates to one or more pluggable backend services.

### push, pull, both, or neither?

Client libraries sends individual calls to the StatsD server over UDP. The StatsD daemon picks up all UDP traffic from the libraries, aggregate over time and from there push statistics at the desired interval.

### Measurement resolution

StatsD can be configured to report over any measurement resolution. For example, data can be aggregated every 60 seconds into a set of summary metrics which include details on the minimum, maximum, median, 90th and 95th percentile over the interval.

### Data Storage

The StatsD daemon reports data to a [backend service](https://github.com/etsy/statsd/wiki/Backends) or a data store. StatsD includes a built-in backend for Graphite, although many plugins are available for third-party services which provide time-series databases and visualization statistics in graphs or tables. Third parties include AWS Cloudwatch, Librato, and more.

### Analysis capabilities

Applications are to be instrumented by developers with client libraries, which can be configured to report counters, timers, gauges, and sets.

There are over [50 client libraries](https://github.com/etsy/statsd/wiki#client-implementations) contributed which allow you to send individual calls from various application languages to the StatsD server. Some of the more popular client libraries include Java, Ruby, Python, Erlang, Node.js, Go, and Haskell.

### Notification Capabilities

In order to notify on metrics submitted by StatsD you will need to setup an alerts service with a backend service which supports this. For example, if data is being routed to Graphite then you could setup [Cabot](https://github.com/arachnys/cabot). Other third-party services such as Librato offer their own alert service.

### Integration capabilities

StatsD was written in Node, although there have been various [server implementations](https://github.com/etsy/statsd/wiki#server-implementations) for it to be installed on Go, C, Clojure, Ruby, and Perl.

StatsD supports backend modules which allow it to publish statistics from the daemon to a backend service or data store. It includes built-in [backends](https://github.com/etsy/statsd/blob/master/docs/backend.md#supported-backends) for Graphite, Console, and Repeater, while many third-party backends are also provided. There are over 25 [third-party](https://github.com/etsy/statsd/blob/master/docs/backend.md#available-third-party-backends) backends, including AWS Cloudwatch, Librato, Datadog, and Grafana.

### Scaling Model

You can run StatsD on individual monitored hosts, listening on the loopback device for metrics from a locally-resident application that you have instrumented, or you can run it centrally on a network, listening at a known UDP address for metrics from remote hosts.

Running a centralized StatsD on an internal network means that you can provide a simple common interface that anyone in the organization can use to inject new metrics into the visualization system. When StatsD internally aggregates metrics it will be able to calculate statistics, like percentiles, across all the requests made within your organization.

If you are able to bake a StatsD installation into your host configuration, then running an instance of the daemon per-monitored host also has advantages. Because StatsD uses UDP in the transport layer it is possible that you will lose metric data on the wire if you run a single, centralized StatsD.  The likelihood of data loss increases on WAN links, so centralized implementations should be carefully planned. Also, as your use of StatsD increases, you may find that one centralized instance becomes a single point of failure and a scaling bottleneck. An instance of the daemon per-monitored node can scale better as the number of nodes increases, at the trade off that some metrics must be aggregated at visualization time.