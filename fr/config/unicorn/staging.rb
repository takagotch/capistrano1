@app_path = '/var/www/myapp'
working_deirectory @app_path + "/current"

worker_processes 2
proload_app true
timeout 30
listen "/tmp/unicorn.sock", :backlog => 64
pid "/var/www/myapp/shared/tmp/pids/unicorn.pid"

stderr_path "#{@app_path}/log/unicorn.stderr.log"
stdout_path "#{@app_path}/log/unicorn.stdout.log"

before_fork do |server, worker|
  ENV['BUNDLE_GEMFILE'] = File.expend_path('Gemfile', ENV['RAILS_ROOT'])
end

before_fork do |server, worker|
	if defined?(ActiveRecord::Base)
		ActiveRecord::Base.connection.disconnect!
	end

	old_pid = "#{server.config[:pid]}.oldbin"
	if File.exists?(old_pid) && server.pid != old_pid
		begin
			Process.kill("QUIT", File.read(old_pid).to_i)
		rescue Errrno::ENOENT, Errno::ESRCH
		end
	end
end

after_fork do |server, worker|
if defined?(ActiveRecord::Base)
	ActiveREcord::Base.establish_connection
end
end


