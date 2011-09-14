# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Activity.create(:name => "Abertura oficial, com autoridades lançamento de livro",
  :start_at => DateTime.strptime("{05/10/2011 19:00}", "{ %d/%m/%Y %H:%M}"),
  :end_at => DateTime.strptime("{05/10/2011 20:00}", "{ %d/%m/%Y %H:%M}"),
  :day => Activity::FIRST_DAY, :period => Activity::NIGHT, :total_places => 250)

Activity.create(:name => "I conferência, Currículo do povo que educa",
  :start_at => DateTime.strptime("{05/10/2011 20:00}", "{ %d/%m/%Y %H:%M}"),
  :day => Activity::FIRST_DAY, :period => Activity::NIGHT, :total_places => 250)


Activity.create(:name => "II Conferência Mídia, Ética e Educação lançamento de livro",
  :start_at => DateTime.strptime("{06/10/2011 08:00}", "{ %d/%m/%Y %H:%M}"),
  :end_at => DateTime.strptime("{06/10/2011 11:00}", "{ %d/%m/%Y %H:%M}"),
  :day => Activity::SECOND_DAY, :period => Activity::MORNING, :total_places => 250)

Activity.create(:name => "Pôsteres com apresentação dialogada",
  :start_at => DateTime.strptime("{06/10/2011 11:15}", "{ %d/%m/%Y %H:%M}"),
  :end_at => DateTime.strptime("{06/10/2011 12:15}", "{ %d/%m/%Y %H:%M}"),
  :day => Activity::SECOND_DAY, :period => Activity::MORNING, :total_places => 250)

Activity.create(:name => "Pôsteres com apresentação dialogada",
  :start_at => DateTime.strptime("{06/10/2011 16:45}", "{ %d/%m/%Y %H:%M}"),
  :end_at => DateTime.strptime("{06/10/2011 17:45}", "{ %d/%m/%Y %H:%M}"),
  :day => Activity::SECOND_DAY, :period => Activity::AFTERNOON, :total_places => 250)

Activity.create(:name => "Lançamento de Livro com Mesa Redonda",
  :start_at => DateTime.strptime("{06/10/2011 20:00}", "{ %d/%m/%Y %H:%M}"),
  :day => Activity::SECOND_DAY, :period => Activity::NIGHT, :total_places => 250)

thursday_activities = ["2- Afabetização no Ensino Fundamental", "4- Educação como Direito Humano",
  "5- Educação, Sustentabilidade e Desenvolvimento Local", "8- O Pensar Científico na Escola",
  "10- Matemática e Currículo", "11-  Gêneros Literários e Currículo",
  "13- Diversidade: Conceitos e Preconceitos", "16- Currículos e Avaliações",
  "17- Currículo e Livro Didático", "19- A Escola, a Rua e o Bairro enquanto Espaço Educativo"]

thursday_activities.each do |activity|
  Activity.create(:name => activity,
    :start_at => DateTime.strptime("{06/10/2011 13:30}", "{ %d/%m/%Y %H:%M}"),
    :end_at => DateTime.strptime("{06/10/2011 16:30}", "{ %d/%m/%Y %H:%M}"),
    :day => Activity::SECOND_DAY, :period => Activity::AFTERNOON, :selected => true, :total_places => 250)
end


Activity.create(:name => "Pôsteres com apresentação dialogada",
  :start_at => DateTime.strptime("{07/10/2011 11:15}", "{ %d/%m/%Y %H:%M}"),
  :end_at => DateTime.strptime("{07/10/2011 12:15}", "{ %d/%m/%Y %H:%M}"),
  :day => Activity::THIRD_DAY, :period => Activity::MORNING, :total_places => 250)

Activity.create(:name => "III Conferência Cultura, Arte e Educação lançamento de livro",
  :start_at => DateTime.strptime("{07/10/2011 13:30}", "{ %d/%m/%Y %H:%M}"),
  :end_at => DateTime.strptime("{07/10/2011 16:30}", "{ %d/%m/%Y %H:%M}"),
  :day => Activity::THIRD_DAY, :period => Activity::AFTERNOON, :total_places => 250)

Activity.create(:name => "Pôsteres com apresentação dialogada",
  :start_at => DateTime.strptime("{07/10/2011 16:45}", "{ %d/%m/%Y %H:%M}"),
  :end_at => DateTime.strptime("{07/10/2011 17:45}", "{ %d/%m/%Y %H:%M}"),
  :day => Activity::THIRD_DAY, :period => Activity::AFTERNOON, :total_places => 250)

friday_activities = ["1- Mídia e Educação", "3- Alfabetização na Educação Infantil",
  "6- Múltiplas Linguagens na Educação", "7- Currículo e Gestão da Aprendizagem na Escola",
  "9- Currículo, História e Formação de Identidade Cultural", "12- Práticas Pedagogicas Inclusivas",
  "14- Cidadania desde a Infância", "15- Criança e Consumo", "18- Educação, Famíia e Comunidade",
  "20- Educação e o Serviço Publico"]

friday_activities.each do |activity|
  Activity.create(:name => activity,
    :start_at => DateTime.strptime("{07/10/2011 08:00}", "{ %d/%m/%Y %H:%M}"),
    :end_at => DateTime.strptime("{07/10/2011 11:00}", "{ %d/%m/%Y %H:%M}"),
    :day => Activity::THIRD_DAY, :period => Activity::MORNING, :selected => true, :total_places => 250)
end


conn = ActiveRecord::Base.connection
updates = ["update activities set start_at = '2011-10-07 08:00:00' where id = 16;",
           "update activities set end_at = '2011-10-07 11:00:00' where id = 16;",
           "update activities set end_at = '2011-10-06 16:30:00' where id = 26;",
           "update activities set start_at = '2011-10-06 13:30:00' where id = 26;",
           "update activities set day = 2 where id = 26;",
           "update activities set period = 2 where id = 26;",
           "update activities set period = 1 where id = 16;",
           "update activities set day = 3 where id = 16;"
           ]

updates.each do |update|
  result = conn.execute(update) 
end

User.create(:username => 'ipf', :password => 'ipfadmin', :password_confirmation => 'ipfadmin', 
  :email => 'luis@paulofreire.org', :name => 'IPF')
