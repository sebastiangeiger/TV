TV::Application.routes.draw do
  root to: 'home#index'

  scope "/api" do
    get '/echo/:text', to: 'echos#index', as: 'echo'
    resource :search, only: :create
    resource :session, only: [:create,:destroy]
  end
end
