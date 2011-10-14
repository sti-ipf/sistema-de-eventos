class Registration < ActiveRecord::Base

  has_many :papers

  validates_presence_of :name, :credential_name, :rg, :cpf, :dob, :zip_code, :address, :address_number, :city, :district
  validates_presence_of :state, :country, :mobile
  validates :email,   
            :presence => true,   
            :uniqueness => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }  
  validates_uniqueness_of :cpf
  validates_format_of :zip_code, :with => %r{\d{5}(-\d{3})?}
  validates_size_of :cpf, :is => 14
  validates_size_of :mobile, :is => 12

  STATES = ["AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA",
            "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO"]
  
  def activities_without_work_sended
    _activities = self.activities
    _papers = self.papers
    r_activities = []
    activity_ids = _papers.collect(&:activity_id)
    _activities.each do |a|
      r_activities << [a.name, a.id] if !activity_ids.include?(a.id)
    end
    r_activities
  end

  def disabilities_to_s
    if self.disabilities
      'Sim'
    else
      'Não'
    end
  end

  def complete_address
    return nil if self.address.blank?
    c_address = self.address
    c_address << " nº #{self.address_number}" if !self.address_number.blank?
    c_address << " - #{self.address_complement}" if self.address_complement.blank?
    c_address
  end

  def self.to_csv_file(rede, registrations)
    array = []

    if rede
      registrations.each do |r|
        new_array = Array.new(11)
        new_array[0] = r.name
        new_array[1] = r.created_at.strftime("%d/%m/%Y") if !r.created_at.nil?
        new_array[2] = r.unit
        new_array[3] = r.cpf
        new_array[4] = r.city
        new_array[5] = r.state
        new_array[6] = r.country
        new_array[7] = r.phone
        new_array[8] = r.mobile
        new_array[9] = r.email
        new_array[10] = r.activities.collect(&:name).join(',')
        array << new_array
      end
    else
     registrations.each do |r|
        new_array = Array.new(12)
        new_array[0] = r.name
        new_array[1] = r.created_at.strftime("%d/%m/%Y") if !r.created_at.nil?
        new_array[2] = r.cpf
        new_array[3] = r.city
        new_array[4] = r.state
        new_array[5] = r.country
        new_array[6] = r.phone
        new_array[7] = r.mobile
        new_array[8] = r.email
        new_array[9] = r.activities.collect(&:name).join(',')
        new_array[10] = r.mode_of_payment_to_s
        new_array[11] = r.paid_to_s
        array << new_array
      end
    end
    array
  end

  def self.masked_cpf(cpf)
    "#{cpf.slice(0..2)}.#{cpf.slice(3..5)}.#{cpf.slice(6..8)}-#{cpf.slice(9..10)}"
  end
  
  def self.with_cpf(cpf)
    registration = self.find_by_cpf(cpf)
    if registration.nil?
      registration = self.find_by_cpf(Registration.masked_cpf(cpf))
    end
    if registration.nil?
      registration = self.find_by_cpf(cpf.gsub(/[.-]/, ''))
    end
    registration
  end

  def send_notification
    return nil if self.email.blank?
    Notification.registered(self.id).deliver!
  end
  
end

