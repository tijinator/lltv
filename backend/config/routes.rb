Rails.application.routes.draw do


  # Subdomains -
  admin_url = Rails.env.production? ? 'admin.beta' : 'admin'
  constraints subdomain: admin_url do
    resources :videos, controller: 'admin/videos_admin'

    # Category -> Course
    resources :categories, controller: 'admin/categories_admin' do
      resources :courses, controller: 'admin/courses_admin'
    end

    # Course -> Chapter
    resources :courses, controller: 'admin/courses_admin' do
      resources :chapters, controller: 'admin/chapters_admin', except: :index
    end

    # Chapter -> Video
    resources :chapters, controller: 'admin/chapters_admin', except: :index do
      resources :videos, controller: 'admin/videos_admin'
    end


    # devise_for :users
    devise_for :users, controllers: {
      sessions:      'users/sessions'
    }

    # User Table related
    resources :users, controller: 'admin/user_admin'

    get '/'          => 'admin/index_admin#home'
    get '/dashboard' => 'admin/index_admin#dashboard'
    put '/course_popular/:id'          => 'admin/courses_admin#course_popular', as: :course_popular
    # get '/categories' => 'admin/category_admin#index'

    # get '/tags' => 'admin#tags'
    # get '/categories' => 'admin#categories'
    # get '/courses' => 'admin#courses'
    # get '/courses/:id' => 'admin#show_course'

    resources :subscribers, controller: 'admin/email_digets'
    resources :authors, controller: 'admin/authors'
    resources :courses, controller: 'admin/courses_admin'

    # Trash routes dnt delete it yet...
    # resources :courses, controller: 'admin/courses_admin' do
    #   resources :chapters, controller: 'admin/chapters_admin' do
    #   #   member do
    #   #     put '/update_published_status' => 'admin/chapters_admin#update_published_status'
    #   #   end
    #   end

    #   #   member do
    #   #     put '/update_published_status' => 'admin/course_admin#update_published_status'
    #   #   end
    # end

  end

  # Api's  /api/course/:id
  namespace :api, defaults: { format: :json } do
    # token auth routes available at /api/auth
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'devise_token/registrations'
    }

    resources :categories, only: [:show, :index] do
      # collection do
      #   get 'featured_course' => 'categories#featured_course'
      # end
      member do
        get 'all_courses' => 'categories#all_courses'
        get 'courses' => 'categories#courses'
      end
    end

    resources :courses, controller: 'courses', only: [:index, :show]
    # get 'courses' => 'api/courses#index'
    post 'subscribe' => 'api#email_subscribes'
    get 'home' => 'api#home'
    get 'search-all' => 'searches#all_searches'
  end

  get '/courses' => 'home#home'
  get '/courses/:course_id' => 'home#home'
  get '/video/:videoName' => 'home#home'
  get '/categories' => 'home#home'
  get '/categories/:cat_id' => 'home#home'
  get '/users/:user_id' => 'home#home' #profile route
  get '/account' => 'home#home' #account routes
  get '/about' => 'home#home' #about page
  get '/faq' => 'home#home' #frequently asked questions
  get '/terms' => 'home#home' #terms and policy page
  get '/privacy' => 'home#home' #privacy page
  get '/teach' => 'home#home' #privacy page

  root to: 'home#home'
end
