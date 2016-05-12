# Monit

## Think: Monitoringd

### What is it? 
Monit began as a process-monitoring system; the sort of thing you might use
Daemontools or more recently Systemd to achieve. It's since grown into a more
general-purpose stand-alone agent, which is capable of monitoring local
processes, changes to files and directories, system resources like CPU, RAM,
and network cards, and it can even check remotely listening services and run
add-hoc scripts.

It's "killer feature" is the ability to define local automation that takes
place when Monit detects a bad-result from something it's monitoring. This was
originally intended to restart a crashed process, but any ad-hoc scripting can
be executed. 

### push, pull, both, or neither?
Neither. There is no "server". Monit runs as a state-independent daemon process
on every host in your infrastructure. All collection, notifications and
automation is run locally on each system individually.   

### Measurement resolution 
The default polling interval is 120 seconds (two minutes)

### Data Storage 
None to speak of. Monit runs as a daemon process; It wakes up on a given
interval, checks the list of entities it's been configured to check and goes
back to sleep. It maintains a state file on the local filesystem to retain
state between reboots and enable some alerting functionality (eg. only alert if
X is down for two polling cycles).

### Analysis capabilities
None to speak of. Monit was designed to either alert an operator to an error
state, or to take immediate automated corrective action when an error state is
detected.  The monit daemon runs a local HTTP server which will output system
state in XML, and there are a few open source scripts out there that will
scrape this data and summarize it, or forward it to systems like Ganglia or
Librato (see: https://github.com/karmi/monittr).  There is also a commercial
product called M/Monit with a web-UI. 

### Notification Capabilities
Monit can call arbitrary external scripts or send email when error states are
detected. It lacks some of the features of other monitoring systems in this
regard. The ability to acknowledge alerts at runtime is one example.  Further,
the specification language for what events to alert on can get a little
unwieldy in edge cases.

### Integration capabilities 
The monit daemon runs a local HTTP server which
will output system state in XML. There are a few open source scripts out there
that will scrape this data and forward it to systems like Ganglia or Librato.

### Scaling Model
Strictly speaking Monit is a stateless daemon, it is horizontally scalable in
the sense that there is nothing really to scale. 
