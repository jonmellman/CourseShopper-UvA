class Course < ActiveRecord::Base
  has_many :course_statuses
  attr_accessible :catalog_number, :credits, :description, :institute, :participant_count, :programmes, :staff, :title
end
