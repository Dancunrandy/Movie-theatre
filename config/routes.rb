Rails.application.routes.draw do
  resources :crew_members, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :productions, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
