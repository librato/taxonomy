# OpenTSDB

## Hadoop all the metrics

### What is it? 
OpenTSDB is the brute force answer to the "Big Data" problem of metrics
processing. If you've ever been frustrated by the data aggregation and Roll-up
problems I spoke briefly about in Part1 (and you have an unlimited amount of
computing resources at your disposal) You'll be happy to hear that OpenTSDB does
no data summarization whatsoever. It ingests millions of millisecond precision
metrics and stores them as RAW data data points. You never lose precision and
make none of the compromises that are usually inherent to TSDB's.

The bad news is that achieves this by relying on Hadoop and Hbase to map-reduce
the metrics processing and query load. Yep, you read that correctly; OpenTSDB
is literally a distributed Map-reduce infrastructure for ingesting, processing
and retrieving metrics data. Once installed, it listens on a network socket and
uses a simple text-based protocol for metrics submission. It also supports
arbitrary *tagging* of metrics with key/value pairs to make them easier to look
up later.

### push, pull, both, or neither?
OpenTSDB is mostly a push-based system for metrics ingestion, though things get
complicated quickly as you begin to distribute it across hosts and datacenters.
The complications are all related to data replication and not to data-polling,
OpenTSDB is just a TSDB, it doesn't come with an agent, and does not attempt to
measure anything.

### Measurement resolution 
Millisecond precision is possible but not recommended.

### Data Storage 
As mentioned, the primary data store is HBase by default although Cassandra and
BigTable are also options. The documentation claims that an individual
measurement takes 12bytes on disk (with LZO compression enabled) making 100+
billion data points per Terabyte possible. Tags are stored in-line (not in
external indexes) so adding tags increases the primary data storage burden.

### Analysis capabilities
OpenTSDB requires more than the average degree of expertise on the part of it's
users (see: http://opentsdb.net/docs/build/html/user_guide/query/index.html).
It's built-in Web-UI is also notoriously disliked but Grafana is an officially
supported replacement UI. Given a good front-end and a savvy end-user it's
data-analysis capabilities are excellent.

### Notification Capabilities
None. (Best option is probably Bosun (https://bosun.org), but Nagios is also an
officially supported option)

### Integration capabilities
Many systems include native support for OpenTSDB's wire protocol, and there are
a few Web-UI's (you probably want Grafana)

### Scaling Model
Built atop literal map-reduce infrastructure, OpenTSDB's scaling model is
unparalleled but not for the faint of heart.
