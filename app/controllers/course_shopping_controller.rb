class CourseShoppingController < ApplicationController
  def toggle
    
    courseStatus = CourseStatus.where(:course_id => params[:courseID])
    
    if courseStatus.exists? #if the record exists, toggle shopping
      courseStatus = courseStatus.first
      courseStatus.shopping = !courseStatus.shopping
      courseStatus.save
    else
      CourseStatus.create(:course_id => params[:courseID], :shopping => true)
    end
    
    render :nothing => true
    
  end
end
