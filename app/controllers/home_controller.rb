class HomeController < ApplicationController

  def index
    @total_registrations = Registration.count
    @total_presencial = Registration.count(:conditions => "participation_type = 0")
    @total_remote = Registration.count(:conditions => "participation_type = 1")
    @total_papers = Paper.count
  end
  
end
