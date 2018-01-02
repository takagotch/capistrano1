desc "Copy shared config files to current application"
task :after_update_code, :roles => do
  run "cp -f #{shared_path}/config/database.yml#{release_path}/config/"
  run "cp -f #{shared_path}/script/spin #{release_path}/script/"
  run "chmod u+x #{release_path}/script/spin"
end

