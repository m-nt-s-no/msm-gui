Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/directors/create_director", { :controller => "directors", :action =>"create"})
  post("/directors/update_director", { :controller => "directors", :action => "update"})

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/movies/create_movie", { :controller => "movies", :action =>"create"})
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/actors/create_actor", { :controller => "actors", :action =>"create"})
  post("/actors/update_actor", { :controller => "actors", :action => "update"})
end
