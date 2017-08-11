Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  root "cocktails#index"
  resources :cocktails, only: [:show, :new, :create, :destroy], shallow: true do
    resources :doses, only: [:create, :destroy]
  end
end

