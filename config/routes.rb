Rails.application.routes.draw do
  root 'projects#index'
  resources :projects, only: [:index, :create] do 
    resources :tasks, except: :show
  end
end
