class Notification < ActionMailer::Base
  

  def registered(registration_id)
    @registration = Registration.find(registration_id)
    activity = @registration.activities.first
    @activity = activity.name if !activity.nil?
    puts "Enviando notificacao para o email: #{@registration.email}"
    subject = "Confirmação da Inscrição no evento Paulo Freire 90 anos"
    mail(:from => '90anos@paulofreire.org', :to => @registration.email, :subject => subject)
    ActiveRecord::Base.connection.execute "UPDATE registrations set notificator_status = 1 WHERE id = #{@registration.id}"
    puts "Notificao enviada para o email: #{@registration.email}"
  end

  def link_to_update_new_data(registration_id)
    @registration = Registration.find(registration_id)
    puts "Enviando notificacao para o email: #{@registration.email}"
    subject = "IMPORTANTE: Retificação no cadastro de participação"
    mail(:from => '90anos@paulofreire.org', :to => @registration.email, :bcc => 'ffc.fabricio@gmail.com', :subject => subject)
    ActiveRecord::Base.connection.execute "UPDATE registrations set notificator_status = 2 WHERE id = #{@registration.id}"
  end

  def paper_sent(paper_id)
    @paper = Paper.find(paper_id)
    @registration = @paper.registration
    puts "Enviando notificacao para o email: #{@registration.email}"
    subject = "Confirmação do envio de trabalho para o evento Paulo Freire 90 anos"
    mail(:from => '90anos@paulofreire.org', :to => @registration.email, :bcc => 'ffc.fabricio@gmail.com', :subject => subject)
    ActiveRecord::Base.connection.execute "UPDATE registrations set notificator_status = 5 WHERE id = #{@registration.id}"
    puts "Notificao enviada para o email: #{@registration.email}"
  end

  def reminder(registration_id)
    @registration = Registration.find(registration_id)
    puts "Enviando notificacao para o email: #{@registration.email}"
    subject = "LEMBRETE: Retificação no cadastro de participação"
    mail(:from => '90anos@paulofreire.org', :to => @registration.email, :bcc => 'ffc.fabricio@gmail.com', :subject => subject)
    ActiveRecord::Base.connection.execute "UPDATE registrations set notificator_status = 10 WHERE id = #{@registration.id}"
  end

  def paper_reminder(registration_id)
    @registration = Registration.find(registration_id)
    puts "Enviando notificacao para o email: #{@registration.email}"
    subject = "LEMBRETE: Encerramento do envio de trabalhos"
    mail(:from => '90anos@paulofreire.org', :to => @registration.email, :bcc => 'ffc.fabricio@gmail.com', :subject => subject)
    ActiveRecord::Base.connection.execute "UPDATE registrations set notificator_status = 11 WHERE id = #{@registration.id}"
  end  

  def notification_to_all(registration_id)
    @registration = Registration.find(registration_id)
    puts "Enviando notificacao para o email: #{@registration.email}"
    subject = "IMPORTANTE: Publicada a lista dos trabalhos selecionados para apresentação e caderno de resumos"
    mail(:from => '90anos@paulofreire.org', :to => @registration.email, :bcc => 'ffc.fabricio@gmail.com', :subject => subject)
    ActiveRecord::Base.connection.execute "UPDATE registrations set notificator_status = 12 WHERE id = #{@registration.id}"
  end

  def new_notification(registration_id)
    @registration = Registration.find(registration_id)
    puts "Enviando notificacao para o email: #{@registration.email}"
    subject = "Paulo Freire 90 Anos"
    mail(:from => '90anos@paulofreire.org', :to => @registration.email, :bcc => 'ffc.fabricio@gmail.com', :subject => subject)
    ActiveRecord::Base.connection.execute "UPDATE registrations set notificator_status = 12 WHERE id = #{@registration.id}"
  end

  def send_certificate(registration_id)
    @registration = Registration.find(registration_id)
    puts "Enviando notificacao para o email: #{@registration.email}"
    subject = "Certificado de participação Encontro Paulo Freire 90 anos"

    name = @registration.name.gsub(/[^a-zA-Z0-9 ]/,"").downcase
    id = @registration.id + 1000


    file_name = "certificates/#{id}_#{name}.pdf"
    attachments['certificado.pdf'] = File.read("#{RAILS_ROOT}/public/#{file_name}")
    mail(:from => '90anos@paulofreire.org', :to => 'ffc.fabricio@gmail.com', :bcc => 'ffc.fabricio@gmail.com', :subject => subject)
    #ActiveRecord::Base.connection.execute "UPDATE registrations set notificator_status = 20 WHERE id = #{@registration.id}"
  end
end

