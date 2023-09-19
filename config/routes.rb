Rails.application.routes.draw do
  devise_for :users
  root 'book_records#index'
  resources :book_records
end