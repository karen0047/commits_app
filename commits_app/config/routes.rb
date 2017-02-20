Rails.application.routes.draw do
  resources :commits
  root 'commits#index'
end
