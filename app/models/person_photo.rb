class PersonPhoto < ApplicationRecord
  belongs_to :person
  validates :image, presence: true
end
