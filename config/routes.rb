Rails.application.routes.draw do

	root 'index#index'

	get 'index' => 'index#index'

	resource :frame, only: [] do
		get 'reports'
		get 'users'
	end

	resource :sessions, only: %i(create new destroy)

	resources :reports, except: :destroy do
		resource :screenshot, only: %i(create new show update)
	end

	get 'status' => 'status#index'

	get 'origin' => 'origin#index'

end
