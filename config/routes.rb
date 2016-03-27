Rails.application.routes.draw do

	root 'index#index'

	get 'index' => 'index#index'

	resource :frame, only: [] do
		get 'reports'
		get 'whites'
		get 'users'
	end

	resource :sessions, only: %i(create new destroy)

	resources :reports, except: %i(destroy update) do
		resource :screenshot, only: %i(create new show update)
		post :confirm
		post :ignore
	end

	resources :whites, except: :update

	resources :origins, only: :index
end
