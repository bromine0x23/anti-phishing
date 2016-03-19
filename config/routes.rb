Rails.application.routes.draw do

	root 'index#index'

	get 'index' => 'index#index'

	resource :frame, only: [] do
		get 'reports'
		get 'whites'
		get 'users'
	end

	resource :sessions, only: %i(create new destroy)

	resources :reports, except: :destroy do
		resource :screenshot, only: %i(create new show update)
	end

	resources :whites, except: :update

	resources :origins, only: :index
end
