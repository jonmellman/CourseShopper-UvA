CourseShopper::Application.routes.draw do

  get '/courses/:title' => 'courses#show'
  get '/institutes/:institute' => 'courses#index'

  get '/my_courses/' => 'my_courses#show'
  get 'shopping/:courseID' => 'courses#toggleShopping'
  get 'taking/:courseID' => 'courses#toggleTaking'

  root :to => 'home#index'

end
