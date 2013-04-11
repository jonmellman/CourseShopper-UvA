class CoursesController < ApplicationController
  def show
    @courses = Course.where(:institute => params[:institute])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end