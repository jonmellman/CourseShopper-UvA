class Course < ActiveRecord::Base
  has_many :course_status
  attr_accessible :catalog_number, :credits, :description, :institute, :participant_count, :programmes, :staff, :title
end
