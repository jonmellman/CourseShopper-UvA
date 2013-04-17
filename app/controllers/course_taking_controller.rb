class CourseTakingController < ApplicationController
  def toggle
    
    courseStatus = CourseStatus.where(:course_id => params[:courseID])
    
    if courseStatus.exists? #if the record exists, toggle shopping
      courseStatus = courseStatus.first
      courseStatus.taking = !courseStatus.taking
      courseStatus.save
    else
      CourseStatus.create(:course_id => params[:courseID], :taking => true)
    end
    
    render :nothing => true
    
  end
end
