set :application, "ballad"
set :repository,  "https://repository.takagotch.com/svn/ballad/trunk"
set :deploy_to,   "/var/rails/#{application}"

set :user, "app"
set :use_sudo, false

role :app, "takagotch.com"
role :web, "takagotch.com"
role :db,  "takagotch.com", :primary => true

