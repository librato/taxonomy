# Circonus

## Making hard monitoring possible

### What is it? 

Circonus is probably the most advanced, feature-packed, hosted telemetry system
in existence today. They are one of the few monitoring systems who are actively
attempting to bring machine-learning to bear in order to provide their
customers with tools that can forecast and predict future events and
utilization based on historical data.

The fundemental unit of configuration is the "check", which is a
customer-created piece of configuration that runs on one or more "brokers".
Circonus actually runs publicly accessable data collection servers world-wide,
which accept check results, as well as actively polling checks against customer
hardware and software. These are called "brokers", and Circonus customers can
even pay to have a broker placed on-site for their own use. 

Customers define check's via the Circonus Web-UI, by first selecting the check
type, assigning it to a broker, and providing it the relevant configuration
details. Circonus can monitor -- out of the box -- many systems that might
require custom code to integrate with other monitoring tools (like google
analytics), however, any data sent to Circonus must first be pre-configured as
a check.  

I mention it because this is a more laborious process than any other
data-oriented monitoring system, and in practice, it works as a barrier to
entry for Circonus versus other Data-oriented tools which work to keep
customer-side configuration to a minimum by accepting ad-hoc data and parseing
it to detect and auto-configure new hosts and services. Many serious users find
it necessary to combine the Circonus API with their configuration management
software (chef, puppet, et..al) to manage the configuration.

### push, pull, both, or neither?

Circonus brokers use both activing polling (pull) as well as passive listening
(push) depending on the type of check the customer is configuring. For example
Circonus's "Ping" check runs from the broker, actually pinging the resource
identified by the user, while the "json" check returns a URL that resolves to a
broker the user can emit json-encoded data to.

### Measurement resolution 

Circonus claims that they "never roll-up" your data, however, they go on to
describe their retention as "1-second" resolution for real-time graphs and
dashboards, and 1-minute resolution data for 7 years. I read this to mean that
they do in fact summarize data that arrives more often than every second, and
also 1-second resolution data destined for the persistence layer. 

### Data Storage 

Internally, Circonus *is* a proprietary TSDB. All data is stored inside
Circonus. The primary instance of Circonus is a large-scale multi-tennant
instantiation run by Omni-Ti. Private-cloud and On-Premise products are also
available where Omni-Ti will launch an instance of Circonus for you on
commodity hardware you own.

### Analysis capabilities

The analysis UI is where Circonus really shines. Data scientists and engineers
will appreciate the highly-technical features which are really not available
anywhere else outside of dedicated data-analysis software like R and SciPy. Any
combination of metrics can be analyzed together on split-Y axis line graphs,
and computational overlays are available to plot things like time-shifts,
derivatives, error bars and extrapolations into the future based on myriad
exponential smoothing and predictive algorithms. 

The product also contains a full-featured dashboard constructor and UI as well
as a query language called AQL (anylitics query language), which are designed
to help users fine-tune visualizations and combine collected data in helpful,
and meaningful ways.

### Notification Capabilities

Circonus provides the littany of threshold-based alerting options you'd expect
along with a host of dynanmic theshold options, and the ability to craft alerts
by combining myriad criteria from multiple metrics. Highly touted anomoly
detection techniques are also available as an option for automated problem
detection.

### Integration capabilities

Compared to other data-oriented monitoring systems Circonus, has a much larger
investment in metrics collection infrastructure and integration options. Indeed
entire Monitoring SaaS start-up's exist which implement only the broker
component of Circonus's infrastructure. 

A Beta API interface also exists that provides access to JSON dumps of data
stored inside Circonus.

### Scaling Model

Circonus was designed to scale horizontally to meet the needs of customers who
run large-scale distributed systems. The architecture and scalablity of
Circonus has been talked about publicly by its creators in various academic
settings like Surge (the Omni-Ti tech conference) (see:
https://www.youtube.com/watch?v=OkUxOpSAqh0). The multi-tenant instance of
Circonus reportedly handles billions of events per day.
