# Signal Fx

## We put some analytics in your monitoring

### What is it? 
SignalFx is a hosted telemetry system with a strong focus on analytics. The
system is quite similar to Graphite or Librato, except the UI is designed to
enable users to easily apply ad-hoc filters and transforms to real-time
signals. 

The system supports ad-hoc metrics tagging and presents drop-down menues for
the filters and transforms it knows how to compute. You can, for example begin
with a very messy latency graph, and quickly transform it to a single-line 90th
percentile overall latency, then break it back out by customer ID by AWS region
(assuming you've tagged your metrics to allow this).

### push, pull, both, or neither?
SignalFx runs and HTTP API endpoint to which you as a customer, emit. They
recommend collectd as the primary means of collecting data from your systems
and provide curated configurations on their support site to get you up and
running quickly. They also maintain a metrics proxy daemon which supports
Statsd, Carbon and Signal Fx's API protocol, enabling users to "tee" existing
metrics streams to various back-ends, and/or emit metrics from systems that
support the statsd or carbon protocols into Signal Fx. 

### Measurement resolution 
1 second resolution is available and raw resolution data is stored for 8 days.
SignalFX is one of the metrics systems with an upper-level limit on the number
of datapoints it will display in a graph, capping at 500 datatpoints. If you
adjust the time-period depicted on the graph larger than that, the system will
automatically switch to a courser resolution, which either averages the data or
computes a rate/sum depending on whether you've configured the data as a
"gauge" type or a "counter" type.

### Data Storage
Signal Fx uses a combination of elastisearch and Cassandra for back-end data
storage. They have a prolific engineering blog and have written about their use
of both of these tools there: 

https://signalfx.com/making-cassandra-perform-as-a-tsdb/
https://signalfx.com/how-we-monitor-and-run-elasticsearch-at-scale/

### Analysis capabilities
Signal Fx's primary focus is modernizing operational telemetry by enabling
end-users to apply analytics to real-time data streams, and the product does
this very well. As a user, you click the 'new graph' button, and a UI beneath
an empty chart gives you the ability to quickly grab a signal and perform all
kinds of add-hoc transformation to it. The experience is somewhat like Grafana
but with more powerful capabilities.

### Notification Capabilities
Signal Fx has good notification support, allowing you to create 'detectors'
that match conditions you've defined. Notification types include email,
PagerDuty, Hipchat, Slack, and custom-webhooks.

### Integration capabilities
Their integration story is not as strong as DataDog or Librato. For the most
part, you are expected to manually install collectd and/or their metrics proxy
daemon. 

### Scaling Model
Signalfx runs a modern, microservices infrastructure backed by a
horizontally-scalable distributed datastore (Cassandra). Individual parts of
their infrastructure have been documented in-depth. See: eg.
https://signalfx.com/efficiency-over-speed-getting-more-performance-out-of-kafka/
