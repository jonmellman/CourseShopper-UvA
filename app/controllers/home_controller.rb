class HomeController < ApplicationController
  def index
    @institutes = Institute.order("name")
  end
end