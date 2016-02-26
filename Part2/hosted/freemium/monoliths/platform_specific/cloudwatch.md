# Cloudwatch

## A decent start

### What is it? 

Cloudwatch is Amazon Web Service's built-in metrics collection service. It's
available as an add-on to just about every type of Amazon service from
individual instances (EC2) to their scientific-computing offerings like elastic
map-reduce.

Cloudwatch collects useful baseline metrics and installs with the flip of a
switch, but the data is difficult to use and expensive to alert on, and Amazon
doesn't store the data very long. For these reasons many AWS customers enable
at least the free-tier of cloudwatch, and export the data via the AWS API to a
dedicated monitoring system where they have better control over how the metrics
data can be employed. 

### push, pull, both, or neither?

If you're only using the CLoudwatch user interface from amazon, the answer to
the push vs pull question os largely irrelevent since it's all handled
internally by Amazon.

If you're exporing Cloudwatch data to an external monitoring system, which is
very common, cloudwatch is a pull-based system from your perspective (ie.. you
have to poll the AWS API every so often for metrics).

### Measurement resolution 
The free-tier is 5-minute resolution metrics, and 1-minute resolution metrics
are available at a fee which varies based on the service in question.

### Data Storage 
Cloudwatch metrics are stored at their raw resolution for for 2-weeks

### Analysis capabilities

Cloudwatch analysis UI is pretty rudimentary. You can visualize one metrics
from one instance at a time. There's no way to combine multiple instances in
the same graph. Further, the two-week data retention policy makes longer-term
or month-over-month timeshifts impossible. 

### Notification Capabilities

Cloudwatch allows users to craft rudimentary alerts, but charges per
notification. If you plan to do a lot of alerting out of the interface it's
highly recommended to export the data to something like Librato where alerts
are free. 

### Integration capabilities

The Cloudwatch API is well understood and well tested. You'll find turn-key
Cloudwatch integrations available for every data-oriented monitoring system
that you might want to use.

### Scaling Model

Cloudwatch scales linerally with AWS, so effectively from the end-user
standpoint it's infinately scalable. As long as you can still instantiate aws
instances and services, you'll be able to use cloudwatch to extract metrics
from them.
