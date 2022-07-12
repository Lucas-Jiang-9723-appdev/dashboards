Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/",{:controller => "application", :action => "homepage"})
  get("/forex",{:controller => "application", :action =>"forex_subhome"})
  get("/covid",{:controller => "application", :action =>"covid_subhome"})
  get("/forex/:the_symbol",{:controller => "application", :action =>"forex_2ndlayer"})
  get("/forex/:from/:to",{:controller => "application", :action =>"forex_3rdlayer"})
  # get("",{:controller => "application", :action =>""})
end
