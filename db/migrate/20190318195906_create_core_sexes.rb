class CreateCoreSexes < ActiveRecord::Migration[5.2]
  def change
    create_table :core_sexes do |t|
      t.string :identity
      t.string :display

      t.timestamps
    end
  end
end
