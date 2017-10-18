Rails.application.routes.draw do
	namespace  :api, defaults:{ format: :json } do
		namespace :v1 do

			devise_for :views
			devise_for :users

			get 'welcome/index'
			
			resources :articles do
				resources :comments
			end

		root 'welcome#index'
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
