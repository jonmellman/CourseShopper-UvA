class CoursesController < ApplicationController
  def index
    @courses = Course.where(:institute => params[:institute])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
  end
  
  def show
    @course = Course.where(:title => params[:title]).first
    @course_status = CourseStatus.where(:course_ID => @course.id).first
    
    #add to recently viewed
    courseStatus = CourseStatus.where(:course_id => @course.id)

    if courseStatus.exists? #if the record exists, update recently_viewed
      courseStatus = courseStatus.first
      if courseStatus.recently_viewed == true
        courseStatus.recently_viewed = false
        courseStatus.save
      end
      courseStatus.recently_viewed = true
      courseStatus.save
    else
      CourseStatus.create(:course_id => @course.id, :recently_viewed => true)
    end
    
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
    

  end
end