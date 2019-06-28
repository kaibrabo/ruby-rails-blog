Rails.application.routes.draw do
	
	resources :topics do
		resources :posts, except: [:index]
	end

	resources :users, only: [:new, :create]

	resources :sessions, only: [:new, :create, :destroy]

	get 'faq' => 'welcome#faq'
	get 'about' => 'welcome#about'
	get 'contact' => 'welcome#contact'

	root 'welcome#index'
end
