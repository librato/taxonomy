# Pagerduty

## Incident management that helps orchestrate the ideal response to create better customer, employee, and business value.

### What is it? 
PagerDuty is an alarm aggregation and dispatching service for system administrators and support teams. It collects alerts from your monitoring tools, gives you an overall view of all of your monitoring alarms, and alerts an on duty engineer if there’s a problem.

### push, pull, both, or neither?
Every service you create in PagerDuty has a unique email address, such as nagios-problem@acme.pagerduty.com. PagerDuty opens a new incident and begins the alerting process at soon as one of your monitoring tools sends email to a service’s address.

### Measurement resolution 
N/A

### Data Storage 
Unavailable

### Analysis capabilities
Using the API you can get high level statistics about the number of alerts (SMSes, phone calls and emails) sent for the desired time period, summed daily, weekly or monthly and get high level statistics about the number of incidents created for the desired time period, summed daily, weekly or monthly.

### Notification Capabilities
Pagerduty can send alerts using any combination of phone calls, SMSes, push notifications and emails.

### Integration capabilities
PagerDuty can be integrated with any system that sends automated emails. PagerDuty is especially useful when used to deliver alerts for systems that can’t place phone calls or SMSes on their own. Here are some possibilities:

* Have your applications call you if an unexpected exception is raised. (If you’re using Ruby on Rails, take a look at ExceptionNotifier.)
* Your cron tasks can call you if a critical system maintenance task fails.
* Intrusion detection systems can be set to call you if they detect a security breach.
* Environmental sensors (e.x. temperature, humidity, etc.) can alert you if they detect an unsafe environment.

The most common monitoring tools used with PagerDuty are Nagios, Zenoss, Pingdom, monit, Munin, Splunk and BasicState. However, any monitoring tool that sends email can be used with PagerDuty.

### Scaling Model
Pagerduty handles scale by using threatstack on the AWS and Azure platforms.
(http://devops.com/2016/03/16/pagerduty-selects-threat-stack-enable-high-velocity-security-compliance-cloud/)
Not much else I could find on this
