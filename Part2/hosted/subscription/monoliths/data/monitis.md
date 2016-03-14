# Monitis

## ALL the things

### What is it? 
Monitis is a site-oriented monitoring system that is generally focused on site
availability but has a little bit of everything going on. The primary service
uses geographically dispersed Monitis-owned servers to poll and collect
availability and response data on your publicly available websites.

Myriad agents are available to collect performance and availability data on
unix and windows hosts, network gear, appliations, and even RUM. As an
engineer, Monitis appears to me to be the sort of tool that was designed to
meet the needs of compliance officers rather than architects, developers, and
operations folks. It is very wide, but not particularly deep with respect to
its functionality.

You'll find it relatively easy to install, but you'll very quickly run into
problems when you try to make small customizations like extending the existing
service checks, or modifying their frequency and etc..

### push, pull, both, or neither?
Monitis agents push via https to their central collection points. I couldn't
find any documentation around how often the agents collect or push their data
in the Monitis docs.

### Measurement resolution 
Monitis is apparently one of the systems that stores raw-resolution metric data
behind the scenes but then caps the display resolution depending on the length
of time represented by the X-axis. Their graphs will display raw-resolution data for 24-hours and jumps to 1-hour aggregates for just about everything else. Details are available here: http://www.monitis.com/support/data-aggregation-in-monitors

To further complicate matters, Monitis locks down the graphs for some types of
data but not others, meaning that for some graphs, you won't be able to specify
a custom time/day range. 

### Data Storage 
See: Measurement resolution
I couldn't find any information to date about how Monitis is architected
internally. I sent an email to support but I was only told that all data is
stored in a "relational database"

### Analysis capabilities
See Measurement resolution above. Monitis has a decent UI that will allow you
to build custom dashboards that include metrics and data from anything Monitis
itself measures. You can combine arbitrary metrics on the same graph but it
doesn't support more advanced visualization features like logarithmic axis and
composite metrics. The UI also makes the mistake of wasting real-estate on
pie-graphs and speedometers.

### Notification Capabilities
Monitis has good Notification support out of the box, though I found their
configuration a little unwieldy. Alerts can be modeled as a combination of
performance and availablity as defined by static thresholds by the user.

### Integration capabilities
Monitis is a monolith. There is a web-API that enables data extraction.

### Scaling Model
I couldn't find any information to date about how Monitis is architected
internally. I sent an email to support but I was only told that all data is
stored in a "relational database"
