class Person < ApplicationRecord
    has_many :person_names, dependent: :destroy
end
