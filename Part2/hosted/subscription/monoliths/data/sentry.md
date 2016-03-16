# Sentry

## Real-time crash reporting for your web apps, mobile apps, and games

### What is it? 
Sentry is an exception tracking system. It counts/dumps crashes as they occur
in your code across all your web-nodes or inside your user's browser. It's a
very simple, highly effective tool that you can get up and running with quite
quickly depending on the language you're programming in.

By that I mean, if you're using a language that supports exception tracking
like Java, or Python, and you're doing a relatively sane job of catching
exceptions (of course you are), then you can probably implement Sentry in one
workday in one commit (their client lib provides a function you pass to the
exception handler). Error=based languages are also supported but in this case
you'll be using wrapper-functions to encase error-prone code, which is a bit
more effort to implement. 


It's also worth noting that there is an open-source version of the Sentry
server that you can use on-premise. The hosted SaaS service is "based on" this
server. 

### push, pull, both, or neither?
Exceptions are sent to Sentry's hosted server via HTTPS

### Measurement resolution 
Exception data is highly a-periodic and finite (stuff (hopefully) only crashes
every so often, and when it does, there are only so many ways it can crash), so
the data is transported and stored raw-resolution.

That said, various subscription plans include variously sized caps on
attributes like: 

 * The number of exceptions you can send per minute
 * The number of exceptions you can send per day
 * The size in bytes of the entire event
 * The size in bytes of the 'X' field within each event

### Data Storage 
Internally Sentry server uses two data stores, one for time-series data and one
key-value style store for events. Both of these data stores is configurable to
use the back-end or in-memory db of your choosing. Details are available here:
https://docs.getsentry.com/on-premise/server/nodestore/

### Analysis capabilities
Sentry has a simple, effective UI that makes it easy to see how many of each
type of exception is occuring over time right from page 1. You can send
arbitrary tags along with the exceptions from your code to help filter
and group exceptions in the UI.

### Notification Capabilities

### Integration capabilities

### Scaling Model
