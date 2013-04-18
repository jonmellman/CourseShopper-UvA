class MyCoursesController < ApplicationController
  def show
    @status_shopping = Course.joins(:course_statuses).where(:course_statuses => {:shopping => true})

    @status_taking = Course.joins(:course_statuses).where(:course_statuses => {:taking => true})
    
    @status_recently_viewed = Course.joins(:course_statuses).where(:course_statuses => {:recently_viewed => true}).order("updated_at")
  end
end