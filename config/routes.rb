Rails.application.routes.draw do

	root 'index#index'

	get 'index' => 'index#index'

	resource :frame, only: [] do
		get 'reports'
		get 'whites'
		get 'users'
	end

	resource :session, only: %i(create new destroy)

	resources :reports, only: %i(create index show update) do
		resource :screenshot, only: %i(create new show update)
		post :confirm
		post :ignore
	end

	resources :whites, except: %i(show update)
	resources :users, only: %i(index create destroy)
end
