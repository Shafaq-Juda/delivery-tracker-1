Rails.application.routes.draw do
  # Routes for the Delivery resource:

  # CREATE
  post("/insert_delivery", { :controller => "deliveries", :action => "create" })
          
  # READ
  get("/deliveries", { :controller => "deliveries", :action => "index" })
  
  get("/deliveries/:path_id", { :controller => "deliveries", :action => "show" })
  
  # UPDATE
  
  post("/modify_delivery/:path_id", { :controller => "deliveries", :action => "update" })
  
  # DELETE
  get("/delete_delivery/:path_id", { :controller => "deliveries", :action => "destroy" })

  #------------------------------

  # Routes for the Users sign in resource:

  # CREATE
  post("/insert_users_sign_in", { :controller => "users_sign_ins", :action => "create" })
          
  # READ
  get("/users_sign_ins", { :controller => "users_sign_ins", :action => "index" })
  
  get("/users_sign_ins/:path_id", { :controller => "users_sign_ins", :action => "show" })
  
  # UPDATE
  
  post("/modify_users_sign_in/:path_id", { :controller => "users_sign_ins", :action => "update" })
  
  # DELETE
  get("/delete_users_sign_in/:path_id", { :controller => "users_sign_ins", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
