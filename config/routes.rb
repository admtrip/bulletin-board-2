Rails.application.routes.draw do
  devise_for :users

  # Set root path to boards index
  root "boards#index"

  # Routes for the Post resource:
  post("/insert_post", { :controller => "posts", :action => "create" })        
  get("/posts", { :controller => "posts", :action => "index" })  
  get("/posts/:path_id", { :controller => "posts", :action => "show" })  
  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })  
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  # Routes for the Board resource:
  post("/insert_board", { :controller => "boards", :action => "create" })          
  get("/boards", { :controller => "boards", :action => "index" })  
  get("/boards/:path_id", { :controller => "boards", :action => "show" })  
  post("/modify_board/:path_id", { :controller => "boards", :action => "update" })  
  get("/delete_board/:path_id", { :controller => "boards", :action => "destroy" })

  # Devise authentication routes
  devise_scope :user do
    get("/users/sign_out", to: "devise/sessions#destroy", as: :signout)
  end
end
