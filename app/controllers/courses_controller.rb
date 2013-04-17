class CoursesController < ApplicationController
  def index
    @courses = Course.where(:institute => params[:institute])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  def show
    @course = Course.where(:title => params[:title]).first
    @course_status = CourseStatus.where(:course_ID => @course.id).first
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end