Rails.application.routes.draw do
  get "certificates/show"
  post '/video_progress', to: 'video_progress#create'


 
  authenticate :user, lambda { |u| u.admin? } do
    mount Motor::Admin => '/admin'
  end
  


  resource :profile

  resources :courses do
    resource :certificate, only: [:show] 
    member do
      post :enroll
    end
  end

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  get 'contact', to: 'pages#contact'
  get 'terms', to: 'pages#terms'

  root "pages#main"

  resources :tasks do
  post 'start_timer', on: :member
  post 'stop_timer',  on: :member
end

end
