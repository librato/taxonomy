# Sensu

## Nagios reimagined 

### What is it? 
Sensu is a centralized poller that that brings modern distributed-systems
engineering tools and techniques to bear in order to overcome some of the
limitations inherent in the centralized-poller design.  The foremost of these
is problably scalability. Sensu introduces a pub/sub system and centralized
message queue to remove SPOF's and distribute the monitoring load across many
systems. 

Sensu-server acts as the centralized orchistration point, keeping track of the
schedule and publishing service checks as job-feeds, to which the sensu-clients
subscribe. Client systems push their check results on to a queue in the form of
events, which are processed by systems configured as sensu event handlers. 

The system uses json configuration syntax and IPC, interacts very well with
Configuration management engines, and although it's nagios-plugin compatible,
includes a built-in means of easily installing ad-hoc check plug-ins from it's
own extensive collection of plugins from the command line (via bundler). There
are a lot of moving parts, but it is a wonderful system to work with once
you've wrapped your head around it.

### push, pull, both, or neither?

Sensu is best described as a hybrid push/pull system. It's worth noting that
the centralized queue keeps all of the cpu-intensive work distributed, so even
when the system is polling it's polling the queue rather than individual client
systems individually. 

### Measurement resolution 
Sensu was designed to collect measurements on the order of seconds (overcoming
another limitation normally encountered with traditional pollers). The polling
interval is set per-check and most of the boilerplate configuration uses a
10-second polling interval.

### Data Storage 
As mentioned, Sensu relies on a centralized queue for inter-system
communication as well as a Redis KV store to house state data. You can use
Redis for both of these purposes or RabbitMQ for the queue and Redis for the
state store. 

### Analysis capabilities
Sensu very intentionally relegates itself to the role of distributed, scalable
data collector and assumes your use of specialized, 3rd party tools for data
analysis. This is, in the authors opinion, a wise, and very welcome decision.

### Notification Capabilities
Alerts are implemented as events. They're passed to handlers process to
process, and Sensu assume's the handler knows what to do with it. Handlers come
in a few types, one of which is the "pipe" handler, which simply pipes the
json-encoded event into the program you specify (there are many
community-provided handlers you can use, you don't have to write them
yourself). An event will fire on any check that returns a non-zero exit code.
That Event will be handleled either by the default event handler, or the
handler(s) you specify in the check configuration. 

This is, by the way exactly the same way Sensu handles performance data export;
the check fires an eent containing performance data which is picked up by the
handler you specify in the check configuration. 

### Integration capabilities
Sensu is heavily invested in being a fantastic distributed data collector and
therefore has fantastic integration features (it is certainly king amoung the
centralized pollers in this regard). Apart from the wide-open event framework
it boasts myriad web-based API's that can be used for state and service
introspection. 

### Scaling Model
Sensu is heavily invested in being scalable. It's sole limitation being its
reliance on Redis for state data. For detailed information see Sensu's own
scaling page: https://sensuapp.org/docs/0.16/scaling_strategies
