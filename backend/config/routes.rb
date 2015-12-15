Rails.application.routes.draw do
  devise_for :users, :skip => [:password], :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions"
  }

  constraints subdomain: 'admin' do
    get '/' => 'admin#home'
    get '/users' => 'admin#users'
    get '/tags' => 'admin#tags'
    get '/categories' => 'admin#categories'
    # get '/courses' => 'admin#courses'
    # get '/courses/:id' => 'admin#show_course'

    resources :users, controller: 'admin/user_admin'
    resources :courses, controller: 'admin/course_admin' do
      resources :chapters, controller: 'admin/chapter_admin'
    end
  end

  root to: 'admin#home'

  namespace :api, defaults: { format: :json } do
    resources :users do
    end
  end
end