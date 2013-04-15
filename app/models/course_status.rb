class CourseStatus < ActiveRecord::Base
  belongs_to :course
  attr_accessible :course_id, :shopping, :taking, :user_id
end
