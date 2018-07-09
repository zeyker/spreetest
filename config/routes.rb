Rails.application.routes.draw do
  get 'normalorders/new'

  get 'normalorders/gateway'
  get 'welcome/index'

  get 'normalorders/index'
  root to: 'normalorders/normal_orders#new'
  #post 'normalorders/return'
  #post 'normalorders/final'

  resources :normalorders, only: [:new, :create] do
    member do
      post :return
      post :final
    end
  end
 # root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
