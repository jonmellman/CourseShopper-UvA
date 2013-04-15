class CreateCourseStatuses < ActiveRecord::Migration
  def change
    create_table :course_statuses do |t|
      t.integer :course_id
      t.boolean :shopping
      t.boolean :taking
      t.integer :user_id

      t.timestamps
    end
  end
end
