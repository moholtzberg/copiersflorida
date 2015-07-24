Rails.application.routes.draw do
  
  mount Spree::Core::Engine, :at => '/'
  get '/spree/products/:id/:file(.pdf)', to: redirect("/spree/documents/%{id}/%{file}.pdf")
end