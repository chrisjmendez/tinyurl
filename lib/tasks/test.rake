# Description
# http://stackoverflow.com/questions/825748/how-do-i-pass-command-line-arguments-to-a-rake-task

namespace :test do
  desc "›› Run all tasks"
  task all: :environment do
		sh %{ bundle exec rspec }
  end

  desc "›› Run a single task"
  task :one, [:arg1] => :environment do |task, args|
		puts args
		sh %{ bundle exec rspec #{args} }
  end
end

