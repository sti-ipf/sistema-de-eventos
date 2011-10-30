class Notification < ActionMailer::Base
  

  def registered(registration_id)
    @registration = Registration.find(registration_id)
    activity = @registration.activities.first
    @activity = activity.name if !activity.nil?
    puts "Enviando notificacao para o email: #{@registration.email}"
    subject = "Confirmação da Inscrição no evento Paulo Freire 90 anos"
    mail(:from => 'eiesistema@paulofreire.org', :to => @registration.email, :subject => subject)
    ActiveRecord::Base.connection.execute "UPDATE registrations set notificator_status = 1 WHERE id = #{@registration.id}"
    puts "Notificao enviada para o email: #{@registration.email}"
  end

  def link_to_update_new_data(registration_id)
    @registration = Registration.find(registration_id)
    puts "Enviando notificacao para o email: #{@registration.email}"
    subject = "Confirmação da Inscrição no evento Paulo Freire 90 anos"
    mail(:from => 'eiesistema@paulofreire.org', :to => 'ffc.fabricio@gmail.com', :subject => subject)
    ActiveRecord::Base.connection.execute "UPDATE registrations set notificator_status = 2 WHERE id = #{@registration.id}"
    
  end

end

