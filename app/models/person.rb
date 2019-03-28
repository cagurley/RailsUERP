class Person < ApplicationRecord
  has_many :person_names, dependent: :destroy
  has_one :person_demography, dependent: :destroy
  has_many :person_photos, dependent: :destroy
  accepts_nested_attributes_for :person_names
  accepts_nested_attributes_for :person_demography
  accepts_nested_attributes_for :person_photos
  validates_associated :person_names
  validates_associated :person_demography
  validates_associated :person_photos
end
