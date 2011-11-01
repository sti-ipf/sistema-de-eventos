require 'rubygems'
require File.dirname(__FILE__)+'/../../config/application'
require File.dirname(__FILE__)+'/../../config/environment'

namespace :notificator do

  task :link_to_update_new_data do
    Registration.all(:conditions => "id NOT IN (select registration_id from participations)").each do |r|
      Notification.link_to_update_new_data(r.id).deliver!
    end
  end


  task :reminder do
    Registration.all(:conditions => "id NOT IN (select registration_id from participations)").each do |r|
      Notification.reminder(r.id).deliver!
    end
  end
 

end

