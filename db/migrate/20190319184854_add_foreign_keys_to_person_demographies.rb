class AddForeignKeysToPersonDemographies < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :person_demographies, :people
    add_foreign_key :person_demographies, :core_sexes
    add_foreign_key :person_demographies, :core_genders
  end
end
