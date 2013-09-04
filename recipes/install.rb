package "python-pip"

execute "install python hipchat module" do
  action :run
  command "pip install python-simple-hipchat"
end

cookbook_file "/usr/bin/hipchat_notification.py" do
  source "hipchat_notification.py"
  group "root"
  mode "0755"
  owner "root"
end
