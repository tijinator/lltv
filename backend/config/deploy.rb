# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'lltv'
set :repo_url, 'git@github.com:tijinator/lltv.git' # Edit this to match your repository
set :repo_tree, '/backend'
set :branch, :master
set :deploy_to, '/home/deploy/lltv'
set :pty, true
set :linked_files, %w{config/database.yml config/.env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :user
set :rvm_ruby_version, '2.0.0-p643' # Edit this if you are using MRI Ruby
set :rbenv, '2.0.0-p643'
set :rbenv_ruby, '2.0.0-p643'

set :default_env, { rvm_bin_path: '~/.rvm/bin' }

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
