namespace :bower do
  desc <<-DESC
        Install the current Bower environment. The install command is executed \
        with the --quiet and --config.interactive=false flag.

        You can override any of these defaults by setting the variables shown below.

          set :bower_flags, '--quiet --config.interactive=false'
          set :bower_roles, :web
          set :bower_target_path, nil
    DESC
  task :install do
    on roles fetch(:bower_roles) do
      within fetch(:bower_target_path, release_path) do
        execute fetch(:bower_bin), "install",
          fetch(:bower_flags)
      end
    end
  end

  before 'deploy:updated', 'bower:install'

end

namespace :load do
  task :defaults do
    set :bower_flags, '--quiet --config.interactive=false'
    set :bower_roles, :web
    set :bower_bin, :bower
  end
end
