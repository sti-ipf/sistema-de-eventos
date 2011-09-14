class HomeController < ApplicationController

  def index
    @total_registrations = Registration.count
    @total_papers = Paper.count
    @papers_total = Paper.paper.count
    @presentation_total = Paper.presentation.count
  end
  
end