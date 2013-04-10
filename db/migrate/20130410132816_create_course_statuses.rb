class CreateCourseStatuses < ActiveRecord::Migration
  def change
    create_table :course_statuses do |t|
      t.references :course
      t.boolean :shopping

      t.timestamps
    end
    add_index :course_statuses, :course_id
  end
end
