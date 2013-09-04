# (Simple) Hipchat Opsworks notifications

##Description
'opsworks_hipchat' cookbook will create hipchat notifications in given
rooms like this:
![alttext](https://github.com/wzin/opsworks_hipchat/raw/master/src/images/notification_example.png "")

##Requirements
- Amazon Opsworks
- Ubuntu 12.04 or Amazon Linux or any other distro supporting python
- Enabled cu

##Dependencies
- custom Chef recipes in Amazon Opsworks have to be enabled
- possibility to install python via chef cookbooks

##Installation 

Put "opsworks_hipchat::install" recipe in your rails/nodejs/php/static opsworks layer under "Setup" or "Configure" section

##Usage
How to receive notifications on each deployment:

Put "opsworks_hipchat::deploy" recipe in your rails/nodejs/php/static opsworks layer under "Setup" or "Configure" section

Finally you will have something like this:
![alttext](https://github.com/wzin/opsworks_hipchat/raw/master/src/images/configuration_example.png "")
