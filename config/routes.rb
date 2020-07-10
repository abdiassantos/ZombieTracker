Rails.application.routes.draw do

  namespace 'api' do
    resources :survivors
    resources :complaints, only: [:index, :show, :create, ]
    resources :inventories, only: [:index, :show, :create]
    resources :reports, only: [:index]
    resources :trades, only: [:create]
  end
end
  