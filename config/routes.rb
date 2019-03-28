Rails.application.routes.draw do
  root 'static#index'
  resources :people do
    resources :person_names, path: '/names', only: [:index, :new, :edit, :create, :update, :destroy]
    resources :person_photos, path: '/photos', only: [:index, :new, :edit, :create, :destroy]
  end
end
