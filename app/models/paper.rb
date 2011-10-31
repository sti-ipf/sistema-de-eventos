class Paper < ActiveRecord::Base
  belongs_to :registration

  has_attached_file :artefact
  validates_presence_of :title, :author, :culture_circle
  validates_attachment_presence :artefact, :message => I18n.t('paper.must_be_set')
  validates_attachment_content_type :artefact,
    :content_type => ['application/msword', 'application/vnd.oasis.opendocument.text'],
    :message => I18n.t('paper.invalid_content_type')
  validates_length_of :resume, :maximum => 1000, :allow_blank => true
    
  
  TYPES = [['Relato de Experiência',1],['Apresentação Oral',2]]
  CULTURE_CIRCLES = [['Educação Popular',1], ['Educação Cidadã',2], ['Educação de Adultos',3]]
  APPROVED = 1

  scope :presentation, where(:paper_type => 1)
  scope :paper, where(:paper_type => 2)
  
  def self.get_types_that_didnt_send(paper_type_ids)
    if paper_type_ids.blank?
      return TYPES
    else
      paper_type_ids.each do |id|
        if id == TYPES.first.last
          return [TYPES.last]
        else
          return [TYPES.first]
        end
      end
    end
  end

  def paper_type_to_s
    TYPES.each do |t|
      return t.first if self.paper_type == t.last
    end
    ''
  end

  def culture_circle_to_s
    CULTURE_CIRCLES.each do |t|
      return t.first if self.paper_type == t.last
    end
    ''
  end

  def self.to_csv_file
    array = []
    all(:include => [:registration], :order => 'registrations.mode_of_payment').each do |p|
      new_array = Array.new(11)
      new_array[0] = p.registration.name if !p.registration.nil?
      new_array[1] = p.created_at.strftime("%d/%m/%Y") if !p.created_at.nil?
      new_array[2] = p.registration.unit if !p.registration.nil?
      new_array[3] = p.registration.phone if !p.registration.nil?
      new_array[4] = p.registration.mobile if !p.registration.nil?
      new_array[5] = p.registration.email if !p.registration.nil?
      new_array[6] = p.registration.mode_of_payment_to_s if !p.registration.nil?
      new_array[7] = p.title
      new_array[8] = p.paper_type_to_s
      new_array[9] = "http://inscricao.eieosasco.net#{p.artefact.url}"
      new_array[10] = p.activity.name
      new_array[11] = p.registration.city if !p.registration.nil?
      (0..11).each do |i|
        new_array[i] = "  " if new_array[i].blank?
      end
      array << new_array
    end
    array
  end


end
