Rails.application.routes.draw do
  get("/", {:controller => "page", :action => "home"})
  get("/:calc_type/new", {:controller => "page", :action => "new"})
  get("/:calc_type/results",  {:controller => "page", :action => "results"})
end
