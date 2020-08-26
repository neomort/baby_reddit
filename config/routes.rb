Rails.application.routes.draw do
  root 'subs#index'
  resources :subs do
  resources :topics
  end

#when getting topics you do them with reference to respective sub

  #http method --Uri #yoyo= another controller
  # get  '/myyoyo', to: 'yoyos#fred'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
