# ELK

## Elasticsearch, Logstash, and Kibana

ELK is an acronym to describe a collection of three separate open-source tools:
Elasticsearch, Logstash, and Kibana. All three tools are managed by Elastic, an
open-source company focused on creating data analysis tools. Elasticsearch is
a No-SQL database that is based on the Lucene search engine and Kibana is a
visualization Layer created to be used with Elasticsearch.  Logstash is a log
processing tool, and arguably the only of these tools that can properly be
called a "monitoring" tool. Despite the "log" moniker however, it acts more
like passive monitoring agent, and many shops rely wholly on ELK for their
monitoring needs. 

Logstash ingests log-data from various sources, parsing, transforming, and
normalizing the text, which is then exported into Elasticsearch where it is
stored and indexed. Admin then interrogate the data using Kibana to, for
example, graph the number of occurrences of HTTP 404's, or parse out latency
numbers and graph them.

If it sounds less like running a monitoring system and more like running three
separate, mildly complex pieces of software, you'd be right. ELK has many uses
besides Monitoring, including business analytics and security, and it comes
with a non-trivial learning curve and management overhead. It's often used by
teams with dedicated telemetry staff or those who have pre-existing
Elasticsearch expertise.

### push, pull, both, or neither?
Logstash is obviously the primary means of getting data into the system and it
is modular, supporting ruby-based plug-ins for both input and output. Input
plug-ins *mostly* pull, but depending on your use-case polling plug-ins for
systems like Kafka and even S3 are available. 

### Measurement resolution 
Because ELK is really a free-form data analysis tool there is no "tick", or
standard resolution. 

### Data Storage 
Elasticsearch is a distributed document store. It literally stores
data-structures which are inputed and returned as serialized JSON documents.
You feed pre-parsed, formatted data from Logstash in as JSON, and Elasticsearch
automatically indexes every field in each data structure. You use "Grok", a DSL
built-in to Logstash to format your log data using configuration commands
called "patterns".  Logstash ships with around 120 patterns by default which
are capable of parsing log data from many common sources (you can see these
here:
https://github.com/logstash-plugins/logstash-patterns-core/tree/master/patterns)

### Analysis capabilities
ELK really isn't a monitoring tool, it's a system for add-hoc data analysis.
It's analysis capabilities are therefore outstanding, to the point of being
complete overkill for most shops with the typical concerns we use monitoring
tools for. If you are the type of engineer who wishes they could very
deliberately pre-process their log data, and then perform add-hoc, interactive
statistical analysis on the result, ELK is certainly the tool for you. But if
you're in search of a tool to help you monitor X, ELK will probably seem
unhelpful and frustrating.

### Notification Capabilities
No real notification capabilities are built-in to Elk stack. By way of
work-arounds, there is a commercial tool from elastic called "watcher" that
will query Elasticsearch.  There is also an 'email{}' output target in Logstash
and an open source tool called "elastialert".

### Integration capabilities
Integration options pretty much center around Logstash, which has many
different plugins for input and output. You can see these here:
https://github.com/logstash-plugins

### Scaling Model
Elasticsearch is a horizontally-scalable distributed data store. It will scale
as far as your pocketbook allows. 
