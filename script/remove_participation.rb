class EmployeeTmp < ActiveRecord::Base

end

participations_to_remove = []
registrations = Registration.free.all

registrations.each do |r|
  employees = Employee.all_with_cpf(r.cpf)
  next if employees.count == 0
  if employees.count > 1
    my_activities = []
    employees.each do |employee|
      my_activities << employee.allow_activities
    end
    a = Activity.parser_activities(my_activities) 
  else
    a = employees.first.allow_activities
  end

  activities = []

  a.each do |ac|
    ac.last.each do |act|
      activities << act.last
    end
  end

  r.participations.each do |p|
    participations_to_remove << p if !activities.include?(p.activity_id)
  end

  # if e.group_type == 2 && !r.participations.collect(&:activity_id).include?(30)
  #   Participation.create(:activity_id => 30, :registration_id => r.id)
  # end
end

participations_to_remove.each do |p|
  p.destroy
end
#   activity = p.activity
  
#   if activity.nil?
#     puts p.inspect
#     next 
#   end
#   case activity.day.to_i
#     when 1
#       day = 'QUARTA'
#     when 2
#       day = 'QUINTA'
#     when 3
#       day = 'SEXTA'
#   end
#   registration = p.registration
#   employee = Employee.with_cpf(registration.cpf)
#   EmployeeTmp.create(:day => day,
#     :work_shift => employee.work_shift,
#     :activity => activity.name,
#     :registration_id => registration.id,
#     :cpf => registration.cpf,
#     :unit => employee.unit_name,
#     :role => employee.role,
#     :eja => employee.eja,
#     :group_type => employee.group_type
#     )
#   #puts "#{day},'#{activity.name}',#{registration.id},'#{employee.unit_name}', #{registration.cpf},'#{employee.role}','#{employee.eja}','#{employee.group_type}'"
# end