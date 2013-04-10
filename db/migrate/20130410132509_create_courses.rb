class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :institute
      t.text :description

      t.timestamps
    end
  end
end
