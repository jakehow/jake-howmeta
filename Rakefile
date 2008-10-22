begin
  require 'vlad'
  Vlad.load(:web => :apache, :scm => :git)
  
  namespace :vlad do
    
    desc "rebuild site"
    task :rebuild do
      run "cd #{current_path} && vendor/gems/webby/bin/webby build"
    end
    
    desc "deploy site"
    task :deploy => [:update_code, :rebuild]
    
    desc "update vhost"
    task :update_vhost do
      sudo "cp #{shared_path}/config/vhost /etc/apache2/sites-enabled/#{application}"
    end
  end
rescue LoadError
  puts 'no vlad'
end

