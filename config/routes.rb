JusolinkExample::Application.routes.draw do
  root :to => 'jusolink#index'
  get "/JusolinkExample/getBalance" => 'jusolink#getBalance', via: [:get]
  get "/JusolinkExample/getUnitCost" => 'jusolink#getUnitCost', via: [:get]
  get "/JusolinkExample/search" => 'jusolink#search', via: [:get]
  get "/JusolinkExample/zipcode_search" => 'jusolink#zipcode_search', via: [:get]
end
