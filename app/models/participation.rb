class Participation < ActiveRecord::Base
  belongs_to :activity
  belongs_to :registration
end
