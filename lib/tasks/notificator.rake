require 'rubygems'
require File.dirname(__FILE__)+'/../../config/application'
require File.dirname(__FILE__)+'/../../config/environment'

namespace :notificator do

  task :link_to_update_new_data do
    Notification.link_to_update_new_data(1).deliver!
  end

 

end

