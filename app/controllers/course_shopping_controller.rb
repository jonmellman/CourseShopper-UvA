class CourseShoppingController < ApplicationController
  def toggle
    #get session ID, to differentiate lists of different users
    session_id = request.session_options[:id]
    
    courseStatus = CourseStatus.where(:course_id => params[:courseID], :session_id => session_id )
    
    if courseStatus.exists? #if the record exists, toggle shopping
      courseStatus = courseStatus.first
      courseStatus.shopping = !courseStatus.shopping
      courseStatus.save
    else
      CourseStatus.create(:course_id => params[:courseID], :shopping => true, :session_id => session_id)
    end
    
    render :nothing => true
  end
end
