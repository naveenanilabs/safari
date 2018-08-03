rails_env = "production"
  
 Chef::Log.info("Mapping the environment_variables node for RAILS_ENV=#{rails_env}...")
 node[:deploy].each do |application, deploy|
   deploy[:environment_variables].each do |key, value|
   Chef::Log.info("Precompiling assets for #{key}...#{value} ")
     ENV[key] = value
   end
 end
 Chef::Log.info("Precompiling assets for RAILS_ENV=#{rails_env}...")
 execute "rake assets:precompile" do
   cwd release_path
   command "bundle exec rake assets:precompile"
   environment "RAILS_ENV" => "production"
 end
