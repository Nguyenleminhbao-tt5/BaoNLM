Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
    get 'profile/edit', to: 'devise/registrations#edit'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  

  get 'profile/:id/tab_photos', to: 'profile#tab_photos', as: 'profile'
  get 'profile/:id/tab_albums', to: 'profile#tab_albums', as: 'profile_albums'
  get 'profile/:id/tab_followers', to: 'profile#tab_followers', as: 'profile_followers'
  get 'profile/:id/tab_followings', to: 'profile#tab_followings', as: 'profile_followings'
 

  get 'profile/edit', to: redirect('users/edit')

  scope :user do
    resources :photos, :albums, except: [:index, :show]
  end


  get 'home/album', to: 'home#album'
  # Defines the root path route ("/")
  root "home#index"
end
