Rails.application.routes.draw do
  resources :sprints do
    resources :tickets
  end
end
