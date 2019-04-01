class AddMimeTypeAndFilenameToPersonPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :person_photos, :mime_type, :string
    add_column :person_photos, :filename, :string
  end
end
