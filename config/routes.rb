RailsTest::Application.routes.draw do
  resources :books, only: [:index, :create, :destroy], defaults: { format: :json }
  resources :books, only: [:edit,:update]
  root to: "books#index"
  get 'about/test'
end
