Rails.application.routes.draw do
  root to: 'home#home'

  # User Table related
  devise_for :users
  resources :users, controller: 'admin/user_admin'


  # token auth routes available at /api/v1/auth
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  # Subdomains - 
  constraints subdomain: 'admin' do
    get '/' => 'admin#home'
    get '/tags' => 'admin#tags'
    get '/categories' => 'admin#categories'
    # get '/courses' => 'admin#courses'
    # get '/courses/:id' => 'admin#show_course'

    resources :courses, controller: 'admin/course_admin' do
      resources :chapters, controller: 'admin/chapter_admin' do
        member do
          put '/update_published_status' => 'admin/chapter_admin#update_published_status'
        end
      end

      member do
        put '/update_published_status' => 'admin/course_admin#update_published_status'
      end
    end
  end


  # Api's  /api/course/:id 
  namespace :api, defaults: { format: :json } do
    resources :categories do
      collection do
        get 'featured_course' => 'categories#featured_course'
      end
      member do
        get 'courses' => 'categories#courses'
      end
    end

    resources :courses
  end

  get '/courses' => 'home#home'
  get '/courses/:course_id' => 'home#home'

  get '/categories' => 'home#home'
  get '/categories/:cat_id' => 'home#home'
end