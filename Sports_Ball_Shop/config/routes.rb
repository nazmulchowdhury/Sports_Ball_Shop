SportsBallShop::Application.routes.draw do
	resources :shops
	get "/shops/buy/:id" => "shops#buy", :as => :buy_shop_with_parameter
	match "/admin_index" => "shops#admin_index"
	match "/show_index" => "shops#show_index"
	match "/admin" => "shops#admin"
	match "/buy" => "shops#buy"
	match ':controller(/:action(/:id))(.:format)'
	root :to => 'shops#index'
end
