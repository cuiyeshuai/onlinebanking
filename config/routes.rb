Rails.application.routes.draw do

  root 'pages#showWelcome'

  namespace :admin do
    root 'sessions#new'

    resources :users do
      member do
        get :delete
      end
    end
    resources :bank_accounts do
      member do
        get :delete
      end
    end

    resources :transactions do
      member do
        get :delete
      end
    end

    resources :administrators, :except=>[:show] do

      member do
        get :delete
      end
    end

    get '/new', to: 'sessions#new'
    get '/success', to: 'sessions#success'
    get '/verification', to: 'sessions#verification'
    post '/verification', to: 'sessions#authenticate'
    get '/dashboard', to: 'dashboard#index'
    get 'dashboard/index'
    post '/new', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end

  resources :bank_accounts, :only =>[:index, :show]

  resources :transactions, :only => [:index, :show, :new, :create]

  get 'l_page', to: 'l_page#index'
  get 'success', to: 'l_page#index'

  get '/login', to: 'sessions#login'
  get '/success', to: 'sessions#success'
  post '/login', to: 'sessions#verification'

  # Delete current session
  delete '/logout', to: 'sessions#destroy'

  # For static/dummy pages
  get '/pages/:page' => "pages#show"
  # Show welcome page
  get '/pages/welcomepage' => "pages#showWelcome"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end