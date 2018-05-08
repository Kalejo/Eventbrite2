Rails.application.routes.draw do
  devise_for :users, :path => '',
               :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'}
  root 'home#index'

resources :users, only: [:show]


end
