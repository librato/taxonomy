# Pingdom

## 

### What is it? 
Pingdom is a feature-rich remote polling service. They poll various publicly
available ports on your servers from a bunch of geographically dispersed
locations in North America, Europe, and Asia (though you can only choose one
region per check).

In addition to the core remote poller service there is a lightweight RUM
feature and something they call "Transaction Monitoring" which is actually a
hosted web-testing framework (think hosted selenium). You outline a series of
steps in a pseudo-code code language with the help of a drop-down menu. Tasks
like "click the 'foo' button; type 'bar' into the search field", and pingdom
will drive a web-kit compatible browser to run your test and return the result,
including timing data. It works with javascript and it's pretty nice
experience-wise compared with wrestling with many of the open source frameworks
you mave have tried. 

I say "lightweight RUM" because Pingdom doesn't provide a lot of the custom
client-side instrumentation you'll find in an APM tool. It installs with a
blurb of javascript in your header and provides data about how long your page
is taking to load, where it's being loaded from geographically, and a
high-level view of how it's spending it's time (DOM, Rendering, DNS etc..)

### push, pull, both, or neither?
The remote polling and transaction monitoring features are pull-based, while
their RUM component is Push. 

### Measurement resolution 
1 minute polling interval. 

### Data Storage 

### Analysis capabilities


### Notification Capabilities

### Integration capabilities

### Scaling Model
