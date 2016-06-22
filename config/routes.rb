Rails.application.routes.draw do
  devise_for :users

  resources :meetings, :all_meetings do
    collection do
      get 'day_calendar'
      get 'list'
    end
  end

  get 'users/:id', to: 'users#show', as: 'user_show'
  root 'all_meetings#index'
end
