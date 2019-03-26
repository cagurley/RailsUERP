class PersonName < ApplicationRecord
  belongs_to :person
  belongs_to :core_name_type
  validates :first, :last, presence: true 
end
