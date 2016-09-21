def within_repo_configs_path(&block)
  repo_config_path = Pathname.new("#{shared_path}/repo_configs")
  if test("[ -d #{repo_config_path} ]")
    within repo_config_path do
      yield block
    end
  else
    puts "No shared configs located at #{repo_config_path}"
  end
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
      within_repo_configs_path do
        execute 'git pull'
      end
    end
  end

  desc 'Symlinks the shared configs directory into the capistrano shared directory'
  task :symlink do
    on roles(:app) do
      within_repo_configs_path do
        execute 'cp -rlf * ../'
      end
    end
  end
end
