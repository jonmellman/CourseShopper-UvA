class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :catalog_number
      t.string :title
      t.string :institute
      t.integer :credits
      t.text :description
      t.string :staff
      t.string :programmes
      t.string :participant_count

      t.timestamps
    end
  end
end
