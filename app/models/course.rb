class Course < ActiveRecord::Base
  belongs_to :institutes
  has_many :course_statuses
  attr_accessible :catalog_number, :credits, :description, :institute_id, :participant_count, :programmes, :staff, :title
  
  #retrieve the institute name from the course record
  def self.getInstitute(course)
    Institute.find(course.institute_id).name
  end
  
  #used for displaying course properties in the courses/show.html.erb view
  def self.isListed(field)
    if field.to_s.empty?
      return 'Not listed'
    else
      return field
    end
  end
  
end
