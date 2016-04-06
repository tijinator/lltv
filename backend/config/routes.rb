Rails.application.routes.draw do

  # token auth routes available at /api/v1/auth
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'devise_token/registrations'
      }
    end
  end


  # Subdomains -
  constraints subdomain: 'admin' do

    post 'payment' => 'admin/admin#payment_processer', as: :payment
          
    resources :videos, controller: 'admin/videos_admin'
    
    resources :categories, controller: 'admin/categories_admin' do
      resources :courses, controller: 'admin/courses_admin' do
        resources :chapters, controller: 'admin/chapters_admin' do
        end
      end
    end

    # devise_for :users
    devise_for :users, controllers: {
      sessions:      'users/sessions',
      registrations: 'users/registrations'  
    }

    # User Table related
    resources :users, controller: 'admin/user_admin'

    get '/' => 'admin/index_admin#home'
    get '/dashboard' => 'admin/index_admin#dashboard'
    # get '/categories' => 'admin/category_admin#index'

    # get '/tags' => 'admin#tags'
    # get '/categories' => 'admin#categories'
    # get '/courses' => 'admin#courses'
    # get '/courses/:id' => 'admin#show_course'

    # resources :courses, controller: 'admin/course_admin' do
    #   resources :chapters, controller: 'admin/chapter_admin' do
    #     member do
    #       put '/update_published_status' => 'admin/chapter_admin#update_published_status'
    #     end
    #   end

    #   member do
    #     put '/update_published_status' => 'admin/course_admin#update_published_status'
    #   end
    # end

  end


  # Api's  /api/course/:id
  namespace :api, defaults: { format: :json } do
    resources :categories, only: [:show, :index] do
      collection do
        get 'featured_course' => 'categories#featured_course'
      end
      member do
        get 'courses' => 'categories#courses'
      end
    end

    resources :courses, controller: 'courses', only: [:index, :show]
    # get 'courses' => 'api/courses#index'
  end

  get '/courses' => 'home#home'
  get '/courses/:course_id' => 'home#home'

  get '/categories' => 'home#home'
  get '/categories/:cat_id' => 'home#home'

  root to: 'home#home'
end
