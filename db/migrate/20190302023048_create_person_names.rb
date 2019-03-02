class CreatePersonNames < ActiveRecord::Migration[5.2]
  def change
    create_table :person_names do |t|
      t.integer :person_id
      t.integer :core_name_type_id
      t.string :first
      t.string :middle
      t.string :last

      t.timestamps
    end
  end
end
