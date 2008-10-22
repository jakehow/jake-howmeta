begin
  require 'vlad'
  Vlad.load(:web => :apache, :scm => :git, :app => nil)
  
  namespace :vlad do
    
    desc "rebuild site"
    remote_task :rebuild do
      run "cd #{current_path} && webby build"
    end
    
    desc "deploy site"
    task :deploy => [:update_code, :rebuild]
    
    desc "update vhost"
    remote_task :update_vhost do
      run "sudo cp #{current_path}/config/vhost /etc/apache2/sites-enabled/#{application}"
    end
    
    desc "Update task for Webby.".cleanup

    remote_task :update_code, :roles => :app do
      symlink = false
      begin
        run [ "cd #{scm_path}",
              "#{source.checkout revision, '.'}",
              "#{source.export ".", release_path}",
              "chmod -R g+w #{latest_release}",
            ].join(" && ")

        symlink = true
        run "rm -f #{current_path} && ln -s #{latest_release} #{current_path}"

        run "echo #{now} $USER #{revision} #{File.basename release_path} >> #{deploy_to}/revisions.log"
      rescue => e
        run "rm -f #{current_path} && ln -s #{previous_release} #{current_path}" if
          symlink
        run "rm -rf #{release_path}"
        raise e
      end
    end
  end
rescue LoadError
  puts 'no vlad'
end

