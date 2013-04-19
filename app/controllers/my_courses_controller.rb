class MyCoursesController < ApplicationController
  def show
    session_id = request.session_options[:id]
        
    @status_shopping = Course.joins(:course_statuses).where(:course_statuses => {:shopping => true, :session_id => session_id})

    @status_taking = Course.joins(:course_statuses).where(:course_statuses => {:taking => true, :session_id => session_id})
    
    @status_recently_viewed = Course.joins(:course_statuses).where(:course_statuses => {:recently_viewed => true, :session_id => session_id}).order("updated_at")
  end
end