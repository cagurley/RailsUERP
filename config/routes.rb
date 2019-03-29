Rails.application.routes.draw do
  root 'static#index'
  resources :people do
    resources :person_names, path: '/names', only: [:index, :new, :edit, :create, :update, :destroy]
    resources :person_photos, path: '/photos', only: [:index, :show, :new, :edit, :create, :destroy] do
      get 'serve', {on: :member}
    end
  end
end
