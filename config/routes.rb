Rails.application.routes.draw do
  resources :people do
    resources :person_names, path: '/names', only: [:index, :new, :edit, :create, :update, :destroy]
  end
end
