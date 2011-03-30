MessinaCovers::Application.routes.draw do

  match '/construction' => 'static#construction', :as => :construction

  match '/gallery' => 'static#gallery', :as => :gallery

  match '/distributors' => 'static#distributors', :as => :distributors

  match '/sizes' => 'static#sizes', :as => :sizes

  match '/custom' => 'static#custom', :as => :custom
  
  # map root to static controller
  root :to => "static#index", :as => :index

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # See how all your routes lay out with "rake routes"
end
