Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home
  resources :requests
  get '/' => 'home#index'

  patch '/requests/:id/done_status' => 'requests#done', as: :done_status

end
