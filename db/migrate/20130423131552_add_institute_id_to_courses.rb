class AddInstituteIdToCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :institute
    add_column :courses, :institute_id, :integer
  end
  
  def down
    remove_column :courses, :institute_id
    add_column :courses, :institute, :string
  end
end