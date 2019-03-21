Rails.application.routes.draw do
  resources :people do
    resources :person_names, path: '/names', only: [:index, :new, :create]
    resource :person_names, only: [:edit]
  end
end
