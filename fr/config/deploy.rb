#-- readline (LoadError)
#
#set :bundle_binstubs, nil
#
#set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}

lock '3.2.1'

set :application, 'myapp'
set :repo_url, 'git_url...'
set :branch, 'master'
set :deploy_to, 'var/www/myapp'
set :scm, :git
set :log_level, :debug
set :pty, true
set :linked_dirs, %w{binlog tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}
set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end

