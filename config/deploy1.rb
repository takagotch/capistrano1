set :application, "balled"
set :svn_user, ENV['svn_user'] || ENV['USER']
set :svn_password, Proc.new { Capistrano::CLI.password_prompt('SVN Password: ') }
set :repository,
  Proc.new { "--username #{svn_user} " +
             "--password #{svn_password} " +
             "--no-auth-cahe " +
	     "http://repository.takagotch.com//svn/ballad/trunk" }
set :deploy_to, "/var/rails/#{application}"

set :user, "app"
set :use_sudo, false

role :app, "takagotch.com"
role :web, "takagotch.com"
role :db,  "takagotch.com", :primary => true

