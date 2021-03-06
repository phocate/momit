Rails.application.routes.draw do

  root 'static_pages#home'

  mount Thredded::Engine => '/forum'

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  get 'static_pages/home'
  match '/code-of-conduct', to: 'static_pages#code_of_conduct', via: [:get]
  match '/guild-policies', to: 'static_pages#guild_policies', via: [:get]
  match '/loot-philosophy', to: 'static_pages#loot_philosophy', via: [:get]
  match '/loot-system', to: 'static_pages#loot_system', via: [:get]

  resources :events
  resources :characters
  match '/characters/byuser/:username', to: 'characters#byuser', via: [:get], as: :characters_byuser
  match '/characters/byrole/:role', to: 'characters#byrole', via: [:get], as: :characters_byrole
  
	match '/users', to: 'users#index', via: 'get'

  devise_for :users,
    controllers: {
      confirmations: 'users/confirmations',
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      passwords: 'users/passwords',
    },
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    }

  scope "/admin" do
    resources :users
  end
end
