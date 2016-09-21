def repo_config_path
  Pathname.new("#{shared_path}/repo_configs")
end

namespace :shared_configs do
  desc 'Pull the latest from the shared configs directory and symlink the files'
  task :update do
    invoke 'shared_configs:pull'
    invoke 'shared_configs:symlink'
  end

  desc 'Pulls the latest from the shared configs directory'
  task :pull do
    on roles(:app) do
      if test("[ -d #{repo_config_path} ]")
        execute <<-COMMAND
          cd #{repo_config_path}
          git pull
        COMMAND
      else
        puts "Unable to pull shared configs. No shared configs located at #{repo_config_path}."
      end
    end
  end

  desc 'Symlinks the shared configs directory into the capistrano shared directory'
  task :symlink do
    on roles(:app) do
      if test("[ -d #{repo_config_path} ]")
        execute <<-COMMAND
          cd #{repo_config_path}
          cp -rlf * ../
        COMMAND
      else
        puts "Unable to symlink shared configs. No shared configs located at #{repo_config_path}."
      end
    end
  end
end
