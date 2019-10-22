Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
  get '/movies/:id/searchByDirector' => 'movies#searchByDirector', as: :searchByDirector
  
  get '/movies/:id/searchByReleasedDate' => 'movies#searchByReleasedDate', as: :searchByReleasedDate
end
