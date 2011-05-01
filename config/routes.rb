MessinaCovers::Application.routes.draw do

  match '/construction' => 'static#construction', :as => :construction

  match '/gallery' => 'static#gallery', :as => :gallery

  match '/distributors' => 'static#distributors', :as => :distributors

  match '/sizes' => 'static#sizes', :as => :sizes

  match '/custom' => 'static#custom', :as => :custom
  
  root :to => "static#index", :as => :index

  # See how all your routes lay out with "rake routes"
end
