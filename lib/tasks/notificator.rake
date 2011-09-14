require 'rubygems'
require File.dirname(__FILE__)+'/../../config/application'
require File.dirname(__FILE__)+'/../../config/environment'

namespace :notificator do

  task :general_public do
    Registration.pagseguro.all(:conditions => "notificator_status is null").each do |registration|
      Notification.general_public(registration.id).deliver! if !registration.email.blank?
    end
  end

  task :employees do
    Registration.free.all(:conditions => "notificator_status is null").each do |registration|
      Notification.registered(registration.id).deliver! if !registration.email.blank?
    end
  end

  task :cancel_registration do
    Registration.pagseguro.all(:conditions => "status NOT IN (1,3) AND created_at < '2011-08-25 00:00:00'").each do |registration|
      if registration.status == 5
        Notification.canceled_payment(registration.id, true).deliver!
      else
        Notification.canceled_payment(registration.id, false).deliver!
      end
    end
  end

  task :canceled_participation do
    Registration.free.all(:conditions => "notificator_status != 3 AND id IN (select id from tmp)").each do |registration|
      email = registration.email
      Notification.canceled_participation(registration.id).deliver! if !email.blank? && email.include?('@')
      puts "EMAIL ENVIADO PARA => #{email}"
    end
  end

  task :alert_to_directors do
    Director.all.each do |d|
      Notification.alert_to_directors(d).deliver!
    end
  end

  task :file_to_directors do
    Director.all.each do |d|
      unit = d.unit.gsub(/[^a-zA-Z0-9 ]/,"").downcase
      file_name = "#{unit}.xls"
      if File.exists?("tmp/#{file_name}")
        Notification.file_to_directors(d, file_name).deliver!
        puts "EMAIL ENVIADO COM OS ARQUIVOS PARA => #{d.email}"
      else
        puts "EMAIL NAO ENVIADO COM OS ARQUIVOS PARA => #{d.email}"
      end
    end
  end

end

