# Riemann

## The monitoring Leatherman

### What is it? 
Riemann is a powerful stream-processing system for monitoring data. It ingests
"events" -- JSON (actually protobuf) objects that represent state changes (OK,
WARN etc..), or metrics (foos:4 etc..). You then tell Riemann via its
configuration file to do something with those events. Joining them together,
sending emails based on their content, forwarding them to Visualization
systems, etc.. (the sky is the limit). 

Many different clients and language bindings exist to help you transform
whatever add-hoc monitoring data you have into Riemann events and emit them into
Riemann. The Configuration file literally is a Clojure program, so some
familiarity with Clojure is recommended (though the documentation includes a
primer that will have anyone who can program in any language up and running
fairly quickly. 

Riemann is a difficult piece of software to blithely *sum up*. It is
conceptually simple, and yet probably impossible for a non-programming systems
administrator to comprehend and use. I use it all the time and highly recommend
it.

### push, pull, both, or neither?
Riemann is strictly a push-based system.

### Measurement resolution
Riemann Event struts measure time in EPOC seconds so although the system does
not operate on a *tic* per se, it can't distinguish between two otherwise
identical events that occurred milliseconds apart (within the same EPOC second). 

### Data Storage 
Riemann maintains an in-memory state index (internally, a nonblockinghashmap)
which is queryable via the ingestion interfaces, and forms the basis of several
different Riemann UI's.

### Analysis capabilities
Riemann isn't an analysis system per-se but presents a better basis for data
analysis than most monolithic monitoring tools commercial or open source. That
said it, also presents a higher learning curve than pretty much any other
monitoring tool. 

### Notification Capabilities
Notification capabilities are basically limitless.

### Integration capabilities
Riemann was created explicitly to wire monitoring tools to other monitoring
tools; it's integration support is unparalled.

### Scaling Model It's hard to talk about Riemann consistency (suggest you read
about it here:
https://aphyr.com/posts/273-blathering-about-riemann-consistency). The ;TLDR is
that the Riemann protocol lends itself well to constructing your own
distributed pipeline processing (eg forward Riemanns to other Riemanns ad
infinitum). The system is largely stateless and transient anyway, so any sort of
sharding is also possible. That said, Riemann itself obviously doesn't provide
any safety guarantees on top of what you've constructed, and it doesn't provide
any primitives to help you make it safe. Have fun!
