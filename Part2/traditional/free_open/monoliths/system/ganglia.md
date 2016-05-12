# Ganglia

## Large scale, high-resolution metrics collection

### What is it? 
Ganglia is a metrics-oriented monitoring system designed for HPC clusters. It
is able to efficiently collect metrics from thousands of hosts at ~10 second
resolutions. 

It works by using a C-based agent (gmond) that employs a multicast gossip
protocol to collect and summarize metric data from groups of proximate hosts.
These summaries are then polled by one or more central collectors (gmetad)
which may or may not in turn be polled by other collectors. Ganglia is one of
the few systems that uses the *rollup* pattern described in Chapter 2.

### push, pull, both, or neither?
Individual Gmond systems in the same cluster multicast their metrics to each
other on a set interval (push). Gmetad systems then collect the cluster-wide
metrics summary from a single host in each cluster (pull). This arrangement
minimizes the polling of individual hosts, and scales quite well.

### Measurement resolution 
Ganglia runs on a 15 second tick by default. 

### Data Storage 
Each node in the cluster keeps an in-memory copy of the entire cluster state.
Metrics themselves are persisted in RRDTool on the Top-most Gmetad server.

### Analysis capabilities
Gweb, Ganglia's web interface is, in this author's opinion the very best
RRDTool Web-front-end. It's probably the best achievable analysis system for
data that resides in RRDTool databases. 

### Notification Capabilities
Ganglia has no built-in alerting functionality, but Gmetad does run a queryable
REST API, and the project ships with a Nagios plugin that makes it fairly
trivial to use Nagios as an alerting system for Ganglia (check the contrib
directory).

### Integration capabilities
Ganglia is a fairly tightly-integrated system which was, for the most part
designed to be used with HPC clusters (the configuration requires that you
organize systems into clusters for example). Gmetad has built-in support for
exporing metrics to a listening Carbon daemon (Graphite), and as with any
RRDTool-based tool, you can interact with the RRD's directly.

### Scaling Model

Ganglia was built to scale by using the compute resources of the monitored
hosts to bear most of the brunt of the collection and aggregation work-load.
The system is capable of handling millions of metrics from tens of thousands of
hosts on a per-second scale. It does a fantastic job of remaining reslient to
failure to individual nodes and Gmetad is effectively stateless, so you can run
multiple parallel instances without incurring any measurable load on the
monitored hosts. You can also stack Gmetad's to further scale the rollup
burden, but given the RRDTool storage the system is ultimately not horizontally
scalable and you will eventually be limited by either the size of the
filesystem that holds the RRD's or the I/O capabilities of the disk that holds
the RRD's.

