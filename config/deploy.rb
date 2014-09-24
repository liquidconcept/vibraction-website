lock '3.2.1'

# Application
set :application, 'vibraction-website'
set :keep_releases, 5

set :linked_files, %w{config/database.yml config/secrets.yml}

# Git
set :scm, :git
set :git_strategy, Capistrano::Git::PushStrategy

# Rubies
set :rvm_ruby_version, '2.0.0'

# Rails
set :migration_role, :web

# Tasks
namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

end
