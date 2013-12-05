# (Simple) Hipchat Opsworks notifications

##Description
Chef *opsworks_hipchat* cookbook will automatically send [hipchat](http://www.hipchat.com)
notifications to your hipchat rooms. Below is an example:

![alttext](https://github.com/wzin/opsworks_hipchat/blob/master/images/notification_example.png?raw=true "")

##Requirements
- Amazon Opsworks
- Custom chef cookbooks enabled 
- Deployments should be performed by IAM users. You root account will throw an error with this cookbook (but it's easy to change though :) )

##Installation 
* put "opsworks_hipchat::install" recipe in your rails/nodejs/php/static opsworks layer under "Setup" or "Configure" section
* create 3 additional sections in your node[:deploy][:application_name] stack settings json,
that will resemble your hipchat api key, room id and opsworks instance
(server) that will send the notification. You must create node[:deploy][:application_name][:hipchat_token] and node[:deploy][:application_name][:hipchat_room_id]. Hipchat token and room id can be obtain from you hipchat admin panel.

Example:

```json
{ "deploy": {
        "my_fancy_app": {
            "hipchat_token" : "69d2627efe8f564c1cc0b6341e3291",
            "hipchat_room_id": "206231",
            "hipchat_run_on" : "rails-app1",
            "database": {
                "database": "my_fancy_app_production",
                "adapter": "postgresql",
                "host": "db1",
                "reconnect": true,
                "username": "my_fancy_app_production",
                "password": "rigfjnremwds"
            },
            "symlink_before_migrate": {
                "config/database.yml": "config/database.yml",
                "config/s3.yml": "config/s3.yml",
                "config/sendgrid.yml": "config/sendgrid.yml",
                "config/application.yml": "config/application.yml",
                "config/sunspot.yml": "config/sunspot.yml"
            }
        }
}
```

##Usage
How to receive notifications on each deployment:

Put "opsworks_hipchat::deploy" recipe in your rails/nodejs/php/static opsworks layer under "Deploy" section

Finally you will have something like this:

![alttext](https://github.com/wzin/opsworks_hipchat/blob/master/images/configuration_example.png?raw=true "")
