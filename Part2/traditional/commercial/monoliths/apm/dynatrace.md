# Dynatrace

## User experience monitoring for Java and .Net apps

### What is it? 

Dynatrace is one of the few traditionally implemented APM tools, meaning it's a
packaged Java application that's intended to run on-premise along side your
application. It describes itself as a "User experience monitoring" tool, and it
delivers on that moniker, providing a littany of views that are focused on
presenting core metrics around the performance of your application as well as
the satisfaction of its users across various browsers and mobile platforms.

Dynatrace agents use bytecode instrumentation to measure the performance of
your Java, .Net, and node.js applications, reporting metrics to dedicated
collector systems which in turn pass the data back into the Dynatrace "Server".
The Server then runs multiple interfaces, a web-based UI which is designed for
business-oriented users, and a thick-client designed for engineers. 

Dynatrace provides excellent application-oriented visibility. It can monitor
and provide real-time performance data on everything from the end-users browser
to the back-end database, but there is a non-trivial overhead involved in
maintaining it. Installation involves implementing multiple dedicated servers,
adhereing to documented system requirements, and following sizing guides to
appropriately provision it for example. Dynatrace is an application in the
old-school sense of the word. You need people to manage it.

There is a SaaS offering which consists of calling Dynatrace and requesting
that they run an instance of the app in the AWS cloud for you. Another hosted
option is Ruxit, which is a Dynatrace start-up with a fair amount of
functionality overlap plus some machine learning baked in. 

### push, pull, both, or neither?
Dynatrace agents push to collectors, which also push to the centralized server. 

### Measurement resolution 

Dynatrace includes myriad interoperating polling services, each of which might
have different default data resolution defaults depending on what they're
polling. In general the default polling interval is 10 seconds and cannot be
changed. 

### Data Storage 
Dynatrace stores performance data in the "Perfomance Warehouse" which is
actually a schema that can run on any modern database system including Oracle
and PostgreSQL. Because the Database itself is the customer's responsibility,
the data retention defaults are also at the customer's discrestion. The Schema
appears to store raw-resolution data as well as pre-computed roll-ups
side-by-side for the entire life of the retention policy. Users can then select
the resolution they wish to view at display time in the Web-UI. The roll-up
tiers are: 10s, 30s, 1m, 5m, 15m, 1h, 6h, 1d

### Analysis capabilities

Dynatrace has two primary analysis interfaces. The first is a Web-UI which runs
on the server and is designed to help business users who are interested in
troubleshooting user-oriented performance problems. It relies heavily on graphs
and simplified data representations (like the abstraction of using happy/sad
faces to represent latency values).

The second is a thick client interface that provides raw dumps of application
stack traces and sessions. Entire end-to-end sessions stored at the server can
be examined here. It is entirely textual, using cell highlighting and table
layouts to break up the data into meaningful chunks.

### Notification Capabilities

Dynatrace includes good criteria for generating alerts and a plug-in
architecture which allows you to send notifications to systems like Slack and
Nagios as well as the typical SMS and Email options. As a user you can only
configure alerts via the thick-client however, which requires a full java
runtime and etc.. on your workstation. 

### Integration capabilities
Dynatrace has excellent integration options which run the gamut from very
corporate proprietary systems like DB2 to web-savvy open-source tools like
Cassandra and Docker.

### Scaling Model
Dynatrace depends on a centralized server instance and a single-instance
database. Generally, it scales within the confines of a single-server. More
detailed transaction-based forumlas are available in their documentation here:
https://community.dynatrace.com/community/display/DOCDT62/Server+and+Performance+Warehouse+Guidelines
