node[:deploy].each do |application, deploy|
  token = deploy[:hipchat_token]
  room = deploy[:hipchat_room_id]
  application_name = application
  if deploy[:scm] and deploy[:deploying_user]
    scm = deploy[:scm]
    opsworks_user = deploy[:deploying_user].split('/')[1]
  else
    scm = nil
    opsworks_user = nil
  end
  if deploy[:hipchat_run_on]
    perform_notification = deploy[:hipchat_run_on].include?(node['hostname'])
  else
    perform_notification = false
  end

  if token && room && application_name && perform_notification && !scm.nil? then
    execute "send hipchat notification" do
      command "/usr/bin/hipchat_notification.py #{token} #{room} #{application_name} #{opsworks_user}"
      action :run
    end
  end
end
