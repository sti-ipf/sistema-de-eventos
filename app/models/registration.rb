class Registration < ActiveRecord::Base

  has_many :papers
  has_many :participations, :dependent => :destroy
  has_many :activities, :through => :participations

  validates_presence_of :name, :credential_name, :rg, :dob, :zip_code, :address, :address_number, :city, :district
  validates_presence_of :state, :country, :mobile, :participation
  validates :email,   
            :presence => true,   
            :uniqueness => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }  
  validates_uniqueness_of :cpf, :allow_blank => true
  validates_format_of :zip_code, :with => %r{\d{5}(-\d{3})?}
  validates_size_of :cpf, :is => 14, :allow_blank => true
  validates_size_of :mobile, :is => 12
  validate :has_activity

  PARTICIPATIONS = [['O dia todo', 1], ['Não participarei no período da manhã', 2]]

  STATES = ["AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA",
            "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO"]

  COUNTRIES = ["Brasil", "Afeganistão", "África do Sul", "Albânia", "Alemanha", "Andorra", "Angola", "Angula", "Antártida", "Antígua e Barbuda", "Antilhas Holandesas", "Arábia Saudita", "Argélia", "Argentina", "Armênia", "Aruba", "Austrália", "Áustria", "Azerbaijão", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Bélgica", "Belize", "Benin", "Bermuda", "Bósnia e Herzegovina", "Botsuana", "Brunei", "Bulgária", "Burkina Fasso", "Burundi", "Butão", "Cabo Verde", "Camarões", "Camboja", "Canadá", "Catar", "Cazaquistão", "Chade", "Chile", "China", "Chipre", "Cidade do Vaticano", "Cingapura", "Colômbia", "Comores", "Congo", "Coréia do Sul", "Costa do Marfim", "Costa Rica", "Croácia", "Cuba", "Djibuti", "Dominica", "Egito", "El Salvador", "Emirados Árabes Unidos", "Equador", "Eritréia", "Eslováquia", "Eslovênia", "Espanha", "Estados Unidos", "Estônia", "Etiópia", "Filipinas", "Finlândia", "França", "Gabão", "Gâmbia", "Gana", "Geórgia", "Gibraltar", "Grécia", "Grenada", "Guadalupe", "Guam", "Guatemala", "Guiana", "Guiana Francesa", "Guiné", "Guiné Equatorial", "Guiné-Bissau", "Haiti", "Holanda", "Honduras", "Hong Kong S. A. R", "Hungria", "Iêmen", "Ilha Bouvet", "Ilha Christmas", "Ilha Norfolk", "Ilhas Cayman", "Ilhas Cocos (Keeling)", "Ilhas Cook", "Ilhas Fiji", "Ilhas Geórgia do Sul e Sandwich do Sul", "Ilhas Heard e Ilhas McDonald", "Ilhas Malvinas (Falkland)", "Ilhas Marianas do Norte", "Ilhas Marshall", "Ilhas Salomão", "Ilhas Turks e Caicos", "Ilhas Virgens Americanas", "Ilhas Virgens Britânicas", "Índia", "Indonésia", "Irã", "Iraque", "Irlanda", "Israel", "Itália", "Iugoslávia", "Jamaica", "Japão", "Kiribati", "Kuwait", "Laos", "Lesoto", "Letônia", "Líbano", "Libéria", "Líbia", "Liechtenstein", "Lituânia", "Luxemburgo", "Macau S.A.R.", "Madagascar", "Malásia", "Malaui", "Maldivas", "Mali", "Malta", "Marrocos", "Martinica", "Maurício", "Mauritânia", "Mayotte", "México", "Micronésia", "Moçambique", "Moldávia", "Mônaco", "Mongólia", "Montserrat", "Myanmar", "Namíbia", "Nauru", "Nepal", "Nicarágua", "Níger", "Ninive", "Nova Caledônia", "Nova Zelândia", "Omã", "Palau", "Panamá", "Papua-Nova Guiné", "Paquistão", "Paraguai", "Peru", "Pitcairn", "Polinésia Francesa", "Polônia", "Porto Rico", "Portugal", "Quênia", "Quirguistão", "Reino Unido", "República Centro-Africana", "Macedônia", "República Dominicana", "República Tcheca", "Reunião", "Romênia", "Ruanda", "Rússia", "Saint-Pierre e Miquelon", "Samoa", "Samoa Americana", "San Marino", "Santa Helena", "Santa Lúcia", "São Tomé e Príncipe", "São Vicente e Granadinas", "Senegal", "Serra Leoa", "Seychelles", "Síria", "Somália", "Sri Lanka", "St. Kitts e Névis", "Suazilândia", "Sudão", "Suíça", "Suriname", "Svalbard", "Tadjiquistão", "Tailândia", "Taiwan", "Tanzânia", "Território Britânico do Oceano Índico", "Territórios Franceses do Sul", "Territórios Insulares dos EUA", "Timor Leste", "Togo", "Tokelau", "Tonga", "Trinidad e Tobago", "Tunísia", "Turcomenistão", "Turquia", "Tuvalu", "Ucrânia", "Uganda", "Uruguai", "Uzbequistão", "Vanuatu", "Venezuela", "Vietnã", "Wallis e Futuna", "Zâmbia", "Zimbábue"]

  accepts_nested_attributes_for :participations, :reject_if => lambda { |a| a[:activity_id].blank? }, :allow_destroy => true

  
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

  def participation_to_s
    PARTICIPATIONS.each do |p|
      return p.first if self.participation.to_i == p.last
    end
  end

  def participation_type_to_s
    if self.participation_type.to_i == 0
      'Presencial'
    else
      'A distância'
    end
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

private

  def has_activity
    errors.add(:participation, 'Escolha uma atividade') if self.participations.first.nil?
  end
  
end

