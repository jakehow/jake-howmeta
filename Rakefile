begin
  require 'vlad'
  Vlad.load(:web => :apache, :scm => :git, :app => nil)
  
  namespace :vlad do
    
    desc "rebuild site"
    task :rebuild do
      run "cd #{current_path} && vendor/gems/webby/bin/webby build"
    end
    
    desc "deploy site"
    task :deploy => [:update, :rebuild]
    
    desc "update vhost"
    task :update_vhost do
      run "sudo cp #{shared_path}/config/vhost /etc/apache2/sites-enabled/#{application}"
    end
  end
rescue LoadError
  puts 'no vlad'
end

