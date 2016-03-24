# NodePing

## All your nodes are pinged by them

### What is it? 
Nodeping is a bare-bones remote polling service. They poll various publicly
available ports on your servers from a bunch of geographically dispersed
locations in North America, Europe, East Asia, and South/Central America
(though you only get to choose one region per check). 

They don't waste a whole lot of time on maps and pie-charts. In fact, their
experience is pretty much entirely devoid of images, which may sound like a bad
thing but honestly I found it more than a little refreshing. All configuration
is performed by way of simple web-forms or via their API. They aren't trying to
impress you with their knowledge of javascript frameworks, they're just polling
your servers and otherwise staying out of the way. It's spartan, but not ugly,
and more to the point it just works.

### push, pull, both, or neither?
This is entirely a polling based system. You specify a geographic region and
point them at a socket and they poll it about once a minute.

### Measurement resolution 
1 minute resolution. Raw resolution data is stored for 90 days and 1-hour
summaries for 2 years. 

### Data Storage 
The primary datastore is CouchDB

### Analysis capabilities
Very basic, but then it's a very simple service. You get a Nagios-style
status table with red-light/green-light status indicators. Clicking in to a
status indicator presents a line-graph (absent a labeled x-axis) of that
check's most recent 300 check results. You can zoom in by dragging or zoom out
by clicking a details link. Mouse-overs show individual data values in the
graph header.

### Notification Capabilities
Every check you configure on a server in your environment actually comprises
several mini-checks. So enabling the 'SNMP' check on your mail server actually
turns on an availability check with a threshold for the number of seconds to
wait for a response, an open-relay check, ssl-checking options and etc.. Any of
these mini-checks failing causes a notification. Options include the normal
stuff like email and SMS, plus their own mobile push and voice notification
service.

### Integration capabilities
There's a web-api from which you may extract data.

### Scaling Model
From their FAQ: 

What tech is this service based on?
Basically, lots of Javascript and JSON. Node.js, CouchDB, Redis, and jQuery.
The web app is Node.js on the server and jQuery on the client. The checks are
all Node.js, with a distributed "pingrunner" architecture communicating via
sockets. The asynch IO provided by Node.js is what allows us to run gobs
(that's a technical term) of checks per server in parallel.
