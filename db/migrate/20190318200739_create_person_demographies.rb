class CreatePersonDemographies < ActiveRecord::Migration[5.2]
  def change
    create_table :person_demographies do |t|
      t.date :birthdate
      t.date :alt_birthdate
      t.string :gender_description
      t.references :person
      t.references :core_sex
      t.references :core_gender

      t.timestamps
    end
  end
end
