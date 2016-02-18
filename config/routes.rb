RailsTest::Application.routes.draw do
  
  resources :books, only: [:index, :create, :destroy, :update], defaults: { format: :json }
  resources :books, only: [:edit]
  root to: "books#index"
  get 'about/test'

  match 'books/upload/:id', to: 'books#update', via: [:post], defaults: { format: :json }
end
