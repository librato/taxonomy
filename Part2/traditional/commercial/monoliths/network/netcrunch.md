# NetCrunch

## Network Network Network

### What is it?
NetCrunch began life as an SNMP/Netflow monitoring system for Network gear, and
has since grown to encompass general purpose Windows and Linux hosts. It is
on-premise and runs on Windows, which is perhaps where I should leave it,
because I don't have a lot of nice things to say. 

Suffice to say NetCrunch is pretty much what you'd expect from a traditional
monitoring system that was made to monitor network gear from a Windows box. I
probably sound neckbeardy saying that but dang yall I can't even help it.
NetCrunch monitors unix systems via SSH. I'm not kidding. You copy-paste the
SSH private keys to your Unix infrastructure into its web interface and
netcrunch persists them in XML files on the monitoring servers hard drive.

If it looks like a good fit for your org you should give some careful
consideration to using Nagios XI instead.

### push, pull, both, or neither?
Depending on how you use it, it is primarly a pull-based system, polling hosts
via WMI, perfmon, and SSH, checking port availability, remotely executing
scripts, and reading arbitrary custom data via HTTP. SNMP Traps and polling are
used for network gear in addition to the Netflow listener.

### Measurement resolution 
The system works on a 5-minute tick by default, but it's user-definable. Since
the system runs on-prem on a single server and has to run multiple data-storage
back-ends locally it's likely that the polling interval will need to stay at a
minimum of 60 seconds for medium-sized environments. You can read more about
the architecture here: 
https://www.adremsoft.com/adoc/view/NetCrunch:v9/391507487011

### Data Storage 
The Sytem uses an embedded SQL Database to store log and event data, and an
embedded No-SQL database to store time series data. The system requirements
strongly suggest your use of SSD drives. 

### Analysis capabilities

NetCrunch has good (even helpful) netflow visualizations, but overall the
interface is clunky and dated, wasting space left and right on every
low-data-to-pixel-ratio gimmick ever invented. It is, in fact, the only
monitoring system in the book that managed to embed pie-charts *inside* its
node-edge diagrams.

### Notification Capabilities
The system has an odd take on Alert criteria, which is wrapped up in how it
handles event processing, and it only supports Email and SMS out of the box.

### Integration capabilities
Netcrunch is a monolith in the classical sense. It wants to monitor your
switches, it wants to monitor your SAN, it wants to monitor your printers. 

### Scaling Model
Single-server instance with two SPOF Databases built-in. Two-machine failover
cluster configurations are possible. 
