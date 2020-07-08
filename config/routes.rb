Rails.application.routes.draw do

  namespace 'api' do
      namespace 'v1' do
        resources :survivors
        resources :complaints
        resources :inventories
        resources :reports
        resources :trades
      end
  end
end
