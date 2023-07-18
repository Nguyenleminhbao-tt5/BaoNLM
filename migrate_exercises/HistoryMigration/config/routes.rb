Rails.application.routes.draw do

  # User
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
    get 'profile/edit', to: 'devise/registrations#edit'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Profile
  get 'profile/:id/tab_photos', to: 'profile#tab_photos', as: 'profile'
  get 'profile/:id/tab_albums', to: 'profile#tab_albums', as: 'profile_albums'
  get 'profile/:id/tab_followers', to: 'profile#tab_followers', as: 'profile_followers'
  get 'profile/:id/tab_followings', to: 'profile#tab_followings', as: 'profile_followings'
  get 'profile/edit', to: redirect('users/edit')


  # Photo-Album
  scope :user do
    resources :photos, :albums, except: [:index, :show]
    post '/like_photo/:id/:is_like', to: 'photos#like', as: 'like_photo'
    post '/like_album/:id/:is_like', to: 'albums#like', as: 'like_album'
  end

  # Follow
  delete '/follows/:id', to: 'follows#destroy', as: 'follow'
  post '/follows/:id/:is_profile', to: 'follows#create', as: 'follows'

  # Admin temporarily
  get '/admin/manage_photos', to: 'admin#manage_photos'
  get '/admin/manage_albums', to: 'admin#manage_albums'
  get '/admin/manage_users', to: 'admin#manage_users'

  # Home
  get 'home/feed/:category', to: 'home#feed', as: 'home_feed'
  get 'home/discover/:category', to: 'home#discover', as: 'home_discover'
  # Defines the root path route ("/")
  root "home#feed"
end
