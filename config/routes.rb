require 'api_version_constraint'

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    namespace :api, default: { format: :json }, constraints: {subdomain: 'api'}, path: "/" do 
    	namespace :v1, path: "/", constraints: ApiVersionConstraint.new(version: 1, default: true) do
    		resources :users, only: [:show, :create], defaults: {format: 'json'}
    	end
    end

end
