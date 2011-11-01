class HomeController < ApplicationController

  def index
    @total_registrations = Registration.count
    @total_presencial = Registration.count(:conditions => "participation_type = 0")
    @total_remote = Registration.count(:conditions => "participation_type = 1")
    @total_papers = Paper.count
    @without_participation = Registration.count(:conditions => "id NOT IN (select registration_id from participations)")
    @activities_data = []
    Activity.all.each do |a|
      total_presencial = Participation.find_by_sql("
        SELECT count(*) as total FROM participations p
        INNER JOIN registrations r ON p.registration_id = r.id
        WHERE r.participation_type = 0
        AND p.activity_id = #{a.id}").first.total
      total_remote = Participation.find_by_sql("
        SELECT count(*) as total FROM participations p
        INNER JOIN registrations r ON p.registration_id = r.id
        WHERE r.participation_type = 1
        AND p.activity_id = #{a.id}").first.total
      @activities_data << {:name => a.name, :total_presencial => total_presencial, :total_remote => total_remote}
    end
  end

  def without_activity
    @registrations = Registration.all(:conditions => "id NOT IN (select registration_id from participations)")
  end
  
end
