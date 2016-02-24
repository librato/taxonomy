# Appdynamics

## App and DB monitoring focused on "Business Transactions"

### What is it?

AppDynamics is an [APM (application performance monitoring)](/Part1/2.md) tool
that focuses strongly on ease of use and business value. It accomplishes this
with copious dynamic configuration and autodiscovery. In Appdynamics, the
fundmental unit of discovery is the "Business Transaction". These are
automatically detected from patterns of communication between the functional
parts of an application.

Four types of agents are employed to collect the data required to detect and
present end-to-end performance data on each business transaction within an
application. 

	* The "End-User Agent" is a Java-script [RUM](/Part1/2.md) collector that times user-interactions from within the browser.
	* The "Application Agent" is language-specific instrumentation collector, which relies on monitoring entry/exit points in the code (rather than bytecode injection) to track and time function calls inside the application.
	* The "Machine Agent" collects OS metrics like CPU, Memory and etc..
	* And finally, the "DB" agent hooks into your database systems, recording and timing quieries and inserts.

### push, pull, both, or neither?

AppDynamics agents push via one-way HTTP to a central "Controller" service
which can either by hosted or on-premise.

### Measurement resolution

AppDyanmics summarizes raw inbound data at a 1 minute resolution for the first
4 hours. After 4 hours the data is rolled up to a 10 minute summary for 48
hours.  After 48 hours the data is rolled up into 1-hour summaries for 365
days. After 365 days the data is deleted.

Additionally, the system tracks and stores "Snapshots", which are collections
of raw-resolution metrics that all coorespond to an instance of a Business
Transaction. Snapshots are stored whenever: 

 * That particular invocation of the transaction was determined to be "slow" (violated an automatically assigned, or manually configured threshold)
 * That particular invocation of the transaction encountered an error or exception.
 * That particular invocation of the transaction was collected as a result of periodic snapshot collection
 * That particular invocation of the transaction was manually captured during a diagnostic session

Metrics stored in a snapshot are raw-resolution, and snapshots are stored for
two-weeks by default. They may be archived for longer periods. 

AppDynamics allows end-users to modify all of these retention policies to
increase the retention period (you cannot decrease the minimum 1-minute
resolution) however Appdynamics recommends against this, and warns that modifying
the retention policies can adversly affect the performance of the controller
service. 

### Data Storage

Appdynamics stores all snapshots, metadata, configuration and metric data on the
Controller in a single database. 

### Analysis capabilities

Data from all four types of agent is sent to the Controller service, and
processed to detect and tag business transactions end to end. Appdynamics user
interface then visually presents the data in terms of the end-to-end business
transaction, making it possible to spot latency and performance problems in
high-level views and drilling down into individual transaction details.

The tool also features an easy-to-use interface for exploring the
inner-workings of business transactions, which includes the ability to, for
example quantify the number of orders in the last X hours by examining the data
contained within the snapshots of the shopping cart's "purchase" function.

Finally, the system is optimized to depict and troubleshoot performance
problems in applications. So, although they've begun to branch out into domains
like server-monitoring (for an additional license fee), Appdynamics expects to
co-exist with other system-specific monitoring tools, rather than integrating
with, or replacing them.

### Notification Capabilities

A fine-grained series of notification options allows the user to craft very
specific alert criteria (number of function calls within transaction X / DB
latency on any connection greater than N, combinations of criteria with logical
AND's etc..) which can then be sent via the usual means including email, SMS,
and webhooks.

### Integration capabilities

Appdynamics was designed to be a monolithic system, focused on interpreting
performance data and using it to represent higher-level business-relevent
entities. It doesn't go out of its way to consume data from other monitoring
systems, or emit data into other systems (which, given its design, is to be
expected). That said it is possible to extend the Machine Agent to collect
custom metrics, and the Collector Service exposes a Web-API which may be
queried for data. There is also a collection of community-maintained extensions
to help get data into and out of the system.

### Scaling Model

Appdynamics relies on a single, centralized controller service which cannot be
distributed. It claims to scale to 10K installed agents, and anecdotal reports
exist of installations in the wild reaching 15K installed agents. 
