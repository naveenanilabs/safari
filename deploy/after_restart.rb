rails_env = "production"
  
  Chef::Log.info("Migrating database for RAILS_ENV=#{rails_env}...")
  execute "rake db:migrate" do
    cwd release_path
    command "bundle exec rake db:migrate"
    environment "RAILS_ENV" => rails_env
  end
  
 Chef::Log.info("Seeding database for RAILS_ENV=#{rails_env}...")
 execute "rake db:seed" do
   cwd release_path
   command "bundle exec rake db:seed"
   environment "RAILS_ENV" => rails_env
 end
