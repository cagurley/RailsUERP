class Person < ApplicationRecord
    has_many :person_names, dependent: :destroy
    accepts_nested_attributes_for :person_names
    validates_associated :person_names
end
