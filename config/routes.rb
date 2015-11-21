Rails.application.routes.draw do

  devise_for :users
  resources :students do
    get :subjects
  end

  get "visitors/index" => "visitors#index", as: "visitors"
end
