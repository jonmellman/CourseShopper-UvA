class CourseStatus < ActiveRecord::Base
  belongs_to :course
  attr_accessible :course_id, :recently_viewed, :session_id, :shopping, :taking
end
