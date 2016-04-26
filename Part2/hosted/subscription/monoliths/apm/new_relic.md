# New Relic

## The most popular APM tool

### What is it? 
New relic is the most widely used APM (application performance monitoring)
tool. It uses an array of language-specific agents which employ bytecode
injection and monkey patching to push metrics into to their centralized,
publicly accessable data collectors. Users point their browser at New Relic's
web interface to analyize the performance of their applications. 

Agents exist for Java, .Net, PHP, Python, Ruby, and NodJs, as well as a RUM
javascript libraray and some mobile and system-oriented tools (New Relic for
servers). Compared to its competitors, New Relic tends to focus more on
savvy-engineering focused users rather than non-technical business users. The
web-UI does an excellent job of providing exactly the data an engineer who is
working to optimise the performance of a web application needs and otherwise
staying out of the way. 

### push, pull, both, or neither?
New relic agents push summarized updates every 60 seconds via HTTP.

### Measurement resolution 
Generally, metrics are collected, stored and displayed at one-minute
granularity, and transaction data is collected as it arrives. Data roll-ups
occur to various summary resolutions depending on the retention schedule
specified by the account tier payed for by the customer. The roll-up
definitions are available at:
https://docs.newrelic.com/docs/apis/rest-api-v2/requirements/extracting-metric-data#time

### Data Storage 
All data is stored centrally by New Relic in MySQL (Perconia server). Data
retention varies drastically depending on the type of data and the customer's
account tier. Generally, none of the retention schedules store metric data
longer than 90 days. 

The retention schedules are available here:
https://docs.newrelic.com/docs/accounts-partnerships/accounts/account-maintenance/data-retention

Further, the persistence layer has been documented in depth here:
https://blog.newrelic.com/2014/06/13/store-200-billion-data-points-day-disk/


### Analysis capabilities
New Relic provides an excellently designed analysis UI which focuses heavily on
classifying where individual transactions traversing a web-application spend
their time. "Map" views and flow graphs are also available, but New Relic
doesn't rely on these visualizations, prefering instead to lead with clear,
helpful line-graphs that depict latency and time spent in various activities
like database queries etc... The tool generally works to augment the engineer's
knowledge of the system rather than employing machine learning or other
summarization techniques to interpret the data or abstract it behind larger,
business-oriented artifacts. 

Timing, latency, Database, RUM, and utilization data is all available and easy
for a first-time user to find. In-depth, on-demand transaction traces are also
possible, enabling advanced users to capture user-sessions and drill down into
individual SQL queries and lines of code. 

### Notification Capabilities
New Relic notifications rely heavily on the Apdex standard to quantify
transaction health and detect problems in running applications. Apdex, which
measures the ratio of satisfactory response times to unsatisfactory response
times, is computed in real-time and depicted often throughout the UI. It is the
preferred means of configuring problem-detection criteria for alert
notifications in New Relic. 

Although it's detractors will be quick to point out that Apdex uses static
thresholds, it works well in practice in this context, giving the user a simple
means to identify trouble and quantify performance improvement.

Finally, New Relic's notification integrations are excellent, with built-in
support for email, and SMS as well as the littany of usual suspects in the
escalation service game. 

### Integration capabilities
New Relic provides an API call that users can employ to record custom metrics
from within their applications as well as a web-api users can query data from.
It is traditionally a monolithic system by design but with recent product
releases like New Relic for servers, it's widening it's integration options. 

### Scaling Model
New Relic is a SaaS tool that was designed to scale horizontally to meet the
needs of customers who run large-scale distributed systems. It reportedly
processes over 200 billion measurements per day. 
