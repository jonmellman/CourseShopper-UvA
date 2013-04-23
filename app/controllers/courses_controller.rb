class CoursesController < ApplicationController
  def index

    @courses = Course.where(
    "institute = '#{params[:institute]}' AND 
      (catalog_number LIKE ? OR title LIKE ? OR description LIKE ? OR staff LIKE ?)",
    "%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%", "%#{params[:keyword]}%"
    )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
  end
  
  def show
    @course = Course.where(:title => params[:title]).first
    @course_status = CourseStatus.where(:course_ID => @course.id).first
    
    #get session ID, to differentiate lists of different users
    session_id = request.session_options[:id]
    
    #add to recently viewed
    courseStatus = CourseStatus.where(:course_id => @course.id, :session_id => session_id)

    if courseStatus.exists? #if the record exists, update recently_viewed
      courseStatus = courseStatus.first
      if courseStatus.recently_viewed == true
        courseStatus.recently_viewed = false
        courseStatus.save
      end
      courseStatus.recently_viewed = true
      courseStatus.save
    else
      CourseStatus.create(:course_id => @course.id, :recently_viewed => true, :session_id => session_id)
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  def toggleShopping
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
  
  def toggleTaking
    #get session ID, to differentiate lists of different users
    session_id = request.session_options[:id]
    
    courseStatus = CourseStatus.where(:course_id => params[:courseID], :session_id => session_id )
    
    if courseStatus.exists? #if the record exists, toggle shopping
      courseStatus = courseStatus.first
      courseStatus.taking = !courseStatus.taking
      courseStatus.save
    else
      CourseStatus.create(:course_id => params[:courseID], :taking => true, :session_id => session_id)
    end
    
    render :nothing => true
  end
end