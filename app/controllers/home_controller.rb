class HomeController < ApplicationController
  def index
    @courses = Course.select(:institute).uniq.order("institute")
  end
end