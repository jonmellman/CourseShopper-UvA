class Course < ActiveRecord::Base
  belongs_to :institutes
  has_many :course_statuses
  attr_accessible :catalog_number, :credits, :description, :institute_id, :participant_count, :programmes, :staff, :title
  
  def self.getInstitute(course)
    Institute.find(course.institute_id).name
  end
  
  def self.isListed(field)
    if field.to_s.empty?
      return 'Not listed'
    else
      return field
    end
  end
  
end
