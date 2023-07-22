Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/projects'
  get 'pages/contact'
  # Define the root path route ("/")
  root "pages#home"
end
