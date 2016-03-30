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
NetCrunch monitors unix systems via SSH. You copy-paste the SSH private keys to
your Unix infrastructure into its web interface and click save to have them
persisted in memory on the monitoring server and saved in XML files on the
monitoring server's hard drive. I'm not kidding even a little bit.

### push, pull, both, or neither?
Depending on how you use it, it is primarly a pull-based system, polling hosts
via WMI, perfmon, and SSH, checking port availability, remotely executing
scripts, and reading arbitrary custom data via HTTP. SNMP Traps and polling are
used for network gear in addition to the Netflow listener.

### Measurement resolution 
The system works on a 5-minute tick by default, but it's user-definable. Since
the system runs on-prem on a single server and has to run multiple data-storage
back-ends locally it's likely that the polling interval will need to stay at a
minimum of 60 seconds for medium-sized environments.

### Data Storage 


### Analysis capabilities

NetCrunch b 3 has good, even helpful netflow visualizations, but overall the interface is
clunky and dated, wasting space left and right on every low-data-to-pixel-ratio
gimmick ever invented. It is, in fact, the only monitoring system in the book
that managed to embed pie-charts *inside* its node-edge diagrams.

### Notification Capabilities

### Integration capabilities

### Scaling Model
