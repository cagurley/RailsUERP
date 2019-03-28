class CreatePersonPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :person_photos do |t|
      t.binary :image
      t.boolean :current
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
