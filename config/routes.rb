Rails.application.routes.draw do

 root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :companies
  resources :companies do
  	resources :job_postings
  end
  resources :workers do 
  	resources :job_searches
  end


end
