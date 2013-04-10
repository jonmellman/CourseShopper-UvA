class CourseStatus < ActiveRecord::Base
  belongs_to :course
  attr_accessible :shopping
end
