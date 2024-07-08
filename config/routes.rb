Rails.application.routes.draw do
  # Health check endpoint
  get "up", to: "rails/health#show", as: :rails_health_check

  # Root route
  root "root#index"

  # CRUD operations for tasks
  get "/update/:id", to: "root#get_update", as: :update_task
  put "/update/:id", to: "root#update"
  post "/add", to: "root#add"
  delete "/delete/:id", to: "root#delete", as: :delete_task

  # Other routes
  get "/about", to: "root#about"
  get "/tasks", to: "root#tasks"
  get "/search", to: "root#search"

  # Catch-all route for 404 errors
  match "*path", to: "application#not_found", via: :all
end
