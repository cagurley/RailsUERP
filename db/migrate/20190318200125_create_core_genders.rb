class CreateCoreGenders < ActiveRecord::Migration[5.2]
  def change
    create_table :core_genders do |t|
      t.string :identity
      t.string :display

      t.timestamps
    end
  end
end
