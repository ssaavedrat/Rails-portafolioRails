Rails.application.routes.draw do
  get 'pages/home'
  # Define the root path route ("/")
  root "pages#home"
end
