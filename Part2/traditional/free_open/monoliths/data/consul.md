# Consul

## Not what you probably meant by "Monitoring"

Consul is *mostly* a service discovery tool; by which I mean it is a service
you run that enables entities like web-servers to find other entities like
back-end API endpoints and Databases without the need for hard-coded IP's.  It
does this either via HTTP/GET requests or via it's own DNS service. Generally
speaking, you configure your thingy to ask for a node address that can service
requests of type foo, and consul responds with the address of the best node to
send requests of that type to.

Consul is, in fact, a very good and robust service discovery tool, by which I
mean, it works quite hard, when queried for a service, to respond with the best
possible node address in your infrastructure to handle requests of that type,
and especially to avoid responding with the address of a node that is
unreachable or overburdened.  In the pursuit of that highly accurate response,
Consul has it's own internal monitoring system, which works with it's own
gossip protocol and enables you to configure add-hoc service checks
(conceptually identical to Nagios checks, to include the return codes).

Therefore, although Consul is not a monitoring system, it does monitor the
hosts it's responsible for, and given its robust gossip and consensus
protocols, does a better job than most dedicated monitoring systems of
detecting host and service outages (usually detecting them on the order of
300-500 milliseconds). You may configure *node* checks or *service* checks. If
any single node check fails, every service on the host is marked down, and that
host's address will not appear in Consul service responses. If any service
check fails, the corresponding service on that host will be marked down and
that host's address will not appear in Consul responses for that service.

Consul also automatically tracks telemetry data (runtime metrics) for various
internal services. These are available from every running Agent by sending a
*SIGUSR1* to the consul service and may optionally be exported to a listening
StatsD daemon.

### push, pull, both, or neither?
In the context of monitoring, Consul is probably best described as a push-based
system. Every host in your infrastructure runs the Consul agent. Consul servers
are agents running in server-mode, and clients are agents running in client
mode. Individual clients run health-checks on themselves at the direction of
the Consul server, and individual clients also gossip with neighboring nodes in
their cluster group to maintain consensus on cluster-health. Clients interact
with the server on regular intervals or as necessary to report that a peer node
has become unavailable. 

### Measurement resolution 
Individual node and service health check ticks are configurable and normally run
on 10-30 second intervals. Consul telemetry data is aggregated at 10-second
intervals and stored in memory for 1 minute.

### Data Storage 
Cluster state data and other meta-data is stored locally on each node in the
*data-dir*. Various formats are employed. Telemetry data is retained in-memory
for 1 minute. Consul also ships with it's own KV Store, which is intended to
retain configuration and leader-election data but it isn't relevant in a
monitoring context.

### Analysis capabilities
Consul is not a monitoring system, so traditional, monitoring-centric analysis
capabilities are nascent at best. There is a Web-UI that depicts
red/yellow/green availability data, and every running agent has a /health API
endpoint from which the current health-state can be obtained. 

### Notification Capabilities
Consul is not a monitoring system, and therefore has no built-in notification
support, but there are several options for getting alerting working. Atlas,
which is Hashicorp's commercial product can provide turn-key alerts from
registered Consul-enabled datacenters. The built-in *watchers* feature can
monitor reconfigured *views* and export events to external handlers. And
finally the open-source tool: *consul-alerts* is a Golang-based service that
registers with a locally-running Consul agent and implements alerts. 

### Integration capabilities
Because it is not a monitoring system, Consul integrates very well with
monitoring systems in general, providing built-in telemetry hooks for StatsD as
well as easy-to-scrape API endpoints for health and availability data. 

### Scaling Model
Consul is a distributed, horizontally-scalable application.
