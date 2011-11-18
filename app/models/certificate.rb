class Certificate < ActiveRecord::Base

  belongs_to :registration

  def self.generate_all
    registrations = Registration.all(:conditions => "name IN (select name from participants)")
    registrations.each do |r|
      r_name = Registration.find_by_sql("select name from participants where name like '#{r.name}'").first.name
      file = fill_with_data(create_file('90anos'), r_name)
      name = r.name.gsub(/[^a-zA-Z0-9 ]/,"").downcase
      file_path = "certificates/#{r.id}_#{name}.pdf"
      file.render_file("#{RAILS_ROOT}/public/#{file_path}")
      Certificate.create(:registration_id => r.id, :file_path => file_path)
    end
  end

  def self.generate_for_no_registration
    r = Registration.find(201)
    r_name = Registration.find_by_sql("select * from participants where name like '#{r.name}'").first.name
    file = fill_with_data(create_file('90anos'), r_name)
    name = r.name.gsub(/[^a-zA-Z0-9 ]/,"").downcase
    file_path = "certificates/#{r.id}_#{name}.pdf"
    file.render_file("#{RAILS_ROOT}/public/#{file_path}")
    Certificate.create(:registration_id => r.id, :file_path => file_path)
  end

private

  def self.fill_with_data(file, name)
    file.draw_text name, :at => [825,1280], :size => 60
    file
  end

  def self.create_file(template_name)
    pdf = Prawn::Document.new(:template => "#{RAILS_ROOT}/lib/certificate/#{template_name}.pdf")
    pdf.font_families.update(
         "Cambria" => {
             :normal => "#{RAILS_ROOT}/public/fonts/Cambria.ttf",
            :bold => "#{RAILS_ROOT}/public/fonts/CambriaBold.ttf"})
  
    pdf.font "Cambria"
    pdf
  end

end