Rails.application.routes.draw do
  get 'feedbacks/index'

  get 'feedbacks/show'

  get 'orders', to: "orders#index"
  get 'orders/:id', to: "orders#show"

  resources :orders do
    resources :feedback
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
