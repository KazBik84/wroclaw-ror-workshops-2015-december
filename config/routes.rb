Rails.application.routes.draw do

  devise_for :users
  resources :students do
    get :subjects
    resources :payments
  end
  resources :teachers do
    get :subjects
  end
  resources :visitors, only: [:index]


  get "report/subjects" => "reports#subjects"
  get "payments_list" => "payments#full_index"
end
