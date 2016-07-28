# Grafana

## The "Uber" of metric front-ends

Grafana is a savvy modular web front-end for myriad metrics-oriented monitoring
systems including Graphite, InfluxDB, OpenTSDB and Prometheus. It ships with a
back-end server written in GO and uses Flot in the browser to plot the data.
Compared to all of its open source competition, and even most of it's
commercial competition, Grafana is far more elegant and user-friendly metrics
UI, enabling you to explore, find and visualize ad-hoc metrics from many
different back-end monitoring systems quickly and effectively.

### push, pull, both, or neither?
N/A Grafana queries already collected data at rest in a time series database.

### Measurement resolution 
Measurement resolution depends on the underlying data-store you're using as well
as the data itself. Generally speaking Grafana will plot whatever you are able
to measure, but it does have features like *MaxDataPoints* to protect you from
accidently making queries that result in an overabundance of browser-choking
data. 

### Data Storage 
Grafana can store meta-data (dashboard configurations, user credentials etc..)
in an embedded sqlite3 database, MySQL, or Postgres. The primary underlying
data store for your metrics is obviously up to you.

### Analysis capabilities
Analysis is literally Grafana's one job and it does it extremely well. It
uses back-end specific query interfaces, most of which support auto-completion
to enable you to quickly and easily query metrics from your back-end data
stores based on tags, names or whatever the back-end supports. It can plot any
combination of data sources across multiple back-end metrics databases, and
comes with a plug-in architecture to enable easy visualization extensions (yes
you can have pie-charts if you'd like).  Included visualization types include
lines, bars, area graphs, big-numbers, and add-hoc text.

### Notification Capabilities
Alerting is currently in the process of being designed and implemented in
Grafana. See: https://github.com/grafana/grafana/issues/2209

### Integration capabilities
Grafana was designed from the ground up to integrate with other open source
tools. It is extremely modular internally and includes an API and command-line
tool.

### Scaling Model
Another somewhat N/A category in the context of Grafana. Data-collection and
persistence problems are really what effect scale. There is no built-in H/A
functionality.
