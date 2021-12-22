Rails.application.routes.draw do
  root to:'homes#top'
  get 'about'=> 'homes#about'
  devise_for :users
  resources:books,only:[:new,:create,:index,:show,:edit,:destroy]
  resources:users,only:[:new,:create,:index,:show,:edit,:destroy]

end
