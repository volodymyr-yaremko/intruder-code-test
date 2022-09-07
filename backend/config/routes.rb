Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/reports/:id', to: 'reports#show'
      get '/reports/:report_id/hosts/:id', to: 'report_hosts#show'
      post '/nessus/upload', to: 'nessus#upload'
    end
  end
end
