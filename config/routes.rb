Reddit::Application.routes.draw do
  resources :users do
    resources :links, :only => [:new, :create]
  end
  resource :session
  resources :subs

  resources :links, :except => [:new, :create] do
    resources :comments
  end
end
