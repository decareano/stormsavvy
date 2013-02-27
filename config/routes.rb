Stormsavvy::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  get "alert_pages/sender"
  get "alert_pages/thankyou"
  get "dashboard/index"

  get "sites", :to => "sites#users_sites"

  get "location/index"
  get "location/new"
  get "location/create"
  get "noaa/secret"

  get "pdf/CEM2030"
  get "pdf/CEM2034"
  get "pdf/CEM2035"
  get "pdf/CEM2040"
  get "pdf/CEM2045"
  get "pdf/CEM2050"
  get "pdf/CEM2051"
  get "pdf/CEM2052"
  get "pdf/CEM4601"

  resources :sampling_events,
    :inspection_events,
    :weather_events,
    :reports,
    :locations

  # Projects controller needs #show, redirect to root instead,
  # place before nested resource so that it is mapped properly.
  match '/projects', :to => "dashboard#index", :via => :get

  resources :projects do
    resources :sites
  end

  ReportsController::STATIC_REPORTS.each do |name|
    match "/reports/#{name}" => "reports##{name}"
  end

  match '/footer',    :to => "pages#footer",         :as => :footer
  match '/index',     :to => "pages#index",          :as => :index
  match '/about',     :to => "pages#about",          :as => :about
  match '/terms',     :to => "pages#terms",          :as => :terms
  match '/faq',       :to => "pages#faq",            :as => :faq
  match '/privacy',   :to => "pages#privacy",        :as => :privacy
  match '/contact',   :to => "pages#contact",        :as => :contact
  match '/plans-and-pricing', :to => "pages#plans",  :as => :plans
  match '/features',  :to => "pages#features",       :as => :features
  match '/team',      :to => "pages#team",           :as => :team
  match '/popemail',  :to => "pages#popemail",       :as => :popemail
  match '/sendemail', :to => "pages#sendemail",      :as => :sendemail
  match '/consulting', :to => "pages#consulting",    :as => :consulting
  match '/pdf',       :to => "pages#pdf",            :as => :pdf
  match '/testem',    :to => "pages#testem",         :as => :testem

  root :to => "dashboard#index"
end
