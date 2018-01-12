set :rails_env, "staging"
set :unicorn_rack_env, "staging"

role :app, %w{user@ex.com}
role :web, %w{user@ex.com}
role :db,  %w{user@ex.com}

server 'ex.com', user: 'user', roles: %w{web app}

set :ssh_options, {
  keys: %w(/home/vagrant/.shh/id_rsa)
  forward_agent: false,
  auth_method: %w(publickey)
}

