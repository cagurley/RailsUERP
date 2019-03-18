class PersonDemography < ApplicationRecord
  belongs_to :person
  belongs_to :core_sex
  belongs_to :core_gender
end
