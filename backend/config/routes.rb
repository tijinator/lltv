Rails.application.routes.draw do


  devise_for :users

  # token auth routes available at /api/v1/auth
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  constraints subdomain: 'admin' do
    get '/' => 'admin#home'
    get '/tags' => 'admin#tags'
    get '/categories' => 'admin#categories'
    # get '/courses' => 'admin#courses'
    # get '/courses/:id' => 'admin#show_course'

    resources :users, controller: 'admin/user_admin'

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

  namespace :api, defaults: { format: :json } do

    #Category routes
    resources :categories do
      collection do
        get 'featured_course' => 'categories#featured_course'
      end
      member do
        get 'courses' => 'categories#courses'
      end
    end

    #courses routes
    resources :courses do
    end
  end

  get '/courses' => 'home#home'
  get '/courses/:course_id' => 'home#home'

  get '/categories' => 'home#home'
  get '/categories/:cat_id' => 'home#home'

  root to: 'home#home'
end