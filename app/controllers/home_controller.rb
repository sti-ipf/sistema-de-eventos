class HomeController < ApplicationController

  def index
    @total_registrations = Registration.count
    @total_papers = Paper.count
  end
  
end