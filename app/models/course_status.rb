class CourseStatus < ActiveRecord::Base
  belongs_to :courses
  attr_accessible :course_id, :shopping, :taking, :user_id
end
