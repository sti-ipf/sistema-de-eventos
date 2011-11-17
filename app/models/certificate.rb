class Certificate < ActiveRecord::Base

  belongs_to :registration

  def self.generate_all
    registrations = Registration.all
    registrations.each do |r|
      file = fill_with_data(create_file('90anos'), r)
      name = r.name.gsub(/[^a-zA-Z0-9 ]/,"").downcase
      file_path = "certificates/#{r.id}_#{name}.pdf"
      file.render_file("#{RAILS_ROOT}/public/#{file_path}")
      Certificate.create(:registration_id => r.id, :file_path => file_path)
      break
    end
  end

private

  def self.fill_with_data(file, registration)
    puts registration.name
    file.draw_text registration.name, :at => [170,280], :size => 14
    file
  end

  def self.create_file(template_name)
    pdf = Prawn::Document.new(:template => "#{RAILS_ROOT}/lib/certificate/#{template_name}.pdf")
    pdf.font_families.update(
         "Cambria" => {
             :normal => "/Library/Fonts/Microsoft/Cambria.ttf",
            :bold => "/Library/Fonts/Microsoft/Cambria Bold.ttf"})
  
    pdf.font "Cambria"
    pdf
  end

end