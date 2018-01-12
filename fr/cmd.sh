bundler install
bundle exec cap install

bundle exec cap staging rails:console

bundle exec cap staging deploy
bundle exec cap staging deploy:check

bundle exec unicorn -c /var/www/myapp/current/config/unicorn/staging.rb -E deployment -D

kill -QUIT `cat /var/www/myapp/shared/tmp/pids/unicorn.pid`
kill -HUP  `cat /var/www/myapp/shared/tmp/pids/unicorn.pid`


