Rails.application.routes.draw do
  root to: "products#index"
  get 'products/index'
end
