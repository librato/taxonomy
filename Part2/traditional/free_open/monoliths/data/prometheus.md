# Prometheus

## Graphite re-imagined

### What is it? 

Prometheus is a metrics-savvy open source monitoring tool with a purpose-built
TSDB, it's own agent suite, multi-dimensionality, and first-class alerting
support. It works by centrally polling an HTTP Port on the things you want to
monitor, which means the things you want to monitor need to be running one of
the various Prometheus Agents (called exporters).

Exporters collect and expose metrics for various entities (System metrics,
DB's, etc..), or ingest and re-export metrics from other daemons like StatsD.
All of this data is made available via HTTP, and the Prometheus server is then
configured to scrape these ports every so often. 

### push, pull, both, or neither?

Prometheus is entirely a Pull-based system, using Prometheus-specific
"Exporters" to collect metrics client-side and expose them via HTTP. There is
an optional push gateway you can use to inject metrics, but does not implement
pushes to the server, rather it is a daemon that accepts metrics via HTTP POST
and re-exposes them for Prometheus server to scrape via HTTP. 

### Measurement resolution 

By default Prometheus operates on a 15 second tick. This is configurable on a
per/host per/metric basis.

### Data Storage 

Prometheus has a sophisticated custom-built local storage system which relies
on LevelDB for tag indexing.  Sample data is organized in chunks of constant
size (1024 bytes payload). These chunks are then persisted on disk in one file
per time series. 

As mentioned in the intro above, Prometheus is one of the newer class of TSDB's
that support multi-dimensionality. Metrics are individually identified as a
combination of a name and a collection of key/value tags, which enables fast
 searching and queries via the Web-UI. 

### Analysis capabilities

Support for multi-dimensional data tagging and querying combined with an
expressive DSL that enables users to quickly compute aggregations, summaries,
and percentiles make for an excellent time-series analysis system. The built-in
expression browser can execute ad-hoc queries and visualize individual metrics,
and Grafana or PromDash may be used to create longer-lived dashboards. 

### Notification Capabilities

Prometheus has first-class alerting support via alerting rules that you define
in Prometheus server. Multiple Prometheus servers can be configured to point to
a separately running Alertmanager daemon, which handles alert processing
(Silencing/aggregating duplicate alerts, and etc..). The usual notification
targets are supported (email, SMS, PagerDuty, et.al)

### Integration capabilities

Prometheus directly supports a litany of language-bindings, daemons and DB's.
Third part exporters exist for a wider range of targets like HAProxy, JMX,
Redis and etc.. If you can't find the exporter you're looking for, Prometheus
also has first class support for StatsD, which can ingest pretty much anything. 

### Scaling Model

Prometheus' custom data store is a local-only single-point-of-failure, and its
poll-only operation bring into question the system's overall scalability and
resilience. The docs report single-instances with SSD's ingesting on the order
of 500k metrics per second, and the Prometheus blog mentions
million-metric-per-second ingestion. 

Further, there are federation and sharding strategies that can be employed that
isolate the polling burden from the processing burden. For more info see:
http://www.robustperception.io/scaling-and-federating-prometheus/
