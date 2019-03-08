class RemoveForeignIdsAddRefsToPersonName < ActiveRecord::Migration[5.2]
  def change
    remove_column :person_names, :person_id, :integer
    remove_column :person_names, :core_name_type_id, :integer

    add_reference :person_names, :person, foreign_key: true
    add_reference :person_names, :core_name_type, foreign_key: true
  end
end
