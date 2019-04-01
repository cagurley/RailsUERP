class PersonPhoto < ApplicationRecord
  belongs_to :person
  validates :image, :filename, :mime_type, presence: true
end
