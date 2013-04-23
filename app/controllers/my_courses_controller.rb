class MyCoursesController < ApplicationController
  
  def show
    session_id = request.session_options[:id]
        
    @status_shopping = Course.joins(:course_statuses).where(:course_statuses => {:shopping => true, :session_id => session_id})

    @status_taking = Course.joins(:course_statuses).where(:course_statuses => {:taking => true, :session_id => session_id})
    
    @status_recently_viewed = Course.joins(:course_statuses).where(:course_statuses => {:recently_viewed => true, :session_id => session_id}).order("course_statuses.updated_at DESC").limit(MyCoursesController.recentLimit)
  end
  
  #constant defining the number of recently viewed courses to display
  def self.recentLimit
    10
  end
end