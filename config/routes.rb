Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: [:index, :show, :create, :update] do
    member do
      get :balance
      get :history
    end
  end

  resources :rewards, only: [:index]

  post '/redeem', to: 'redemptions#create'
  
  match '*unmatched', to: 'application#route_not_found', via: :all
end
