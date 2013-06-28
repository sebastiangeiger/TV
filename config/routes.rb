TV::Application.routes.draw do
  get "searches/create"

  root to: 'home#index'

  scope "/api" do
    resource :search, only: :create
  end
end
