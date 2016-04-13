# <Name>

## The open-source systems monitoring toolkit

### What is it? 

Prometheus is an open-source systems monitoring and alerting solution. It is community-driven and now a standalone open source project.

### push, pull, both, or neither?

Prometheus offers a push gateway for pushing time series and utilizes a pull model over HTTP for time series collection.
The Prometheus Pushgateway allows you to push time series to an intermediary job which Prometheus can scrape. You can also simply use a command-line HTTP tool like curl.

### Measurement resolution 

If Prometheus cannot get any samples for a metric in 5min, it will behave as if that metric does not exist anymore. Preventing that is actually one of the reasons to use a push gateway. The push gateway will make the metrics of your ephemeral job scrapable at any time. Attaching the time of pushing as a timestamp would defeat that purpose because 5min after the last push, your metric will look as stale to Prometheus as if it could not be scraped at all anymore. (Prometheus knows only one timestamp per sample, there is no way to distinguish a 'time of pushing' and a 'time of scraping'.)

### Data Storage 

Prometheus has a sophisticated local storage subsystem. For indexes, it uses LevelDB. For the bulk sample data, it has its own custom storage layer, which organizes sample data in chunks of constant size (1024 bytes payload). These chunks are then stored on disk in one file per time series.

### Analysis capabilities

Prometheus works best for recording any purely numeric time series, fitting both machine-centric monitoring as well as monitoring of highly dynamic service-oriented architectures. It allows you to quickly diagnose problems during an outage. Each Prometheus server is standalone, not depending on network storage or other remote services. Its support for multi-dimensional data collection and querying is a particular strength.

### Notification Capabilities

Alerting with Prometheus is separated into two parts. Alerting rules in Prometheus servers send alerts to an Alertmanager. The Alertmanager then manages those alerts, including silencing, inhibition, aggregation and sending out notifications via methods such as email, PagerDuty and HipChat.

### Integration capabilities

There are various libraries and servers which assist with exporting existing metrics from third-party systems as Prometheus metrics.

Official and independently maintained third-party exporters include metrics support for:

AWS CloudWatch, Collectd, Graphite, HAProxy, InfluxDB, Statsd, JMX, MySQL server, Apache, BIND, Memcached, MongoDB, Nginx, Redis and more.

### Scaling Model

Prometheus basically stores all data as time series: streams of timestamped values belonging to the same metric and the same set of labeled dimensions. Besides stored time series, Prometheus may generate temporary derived time series as the result of queries.
