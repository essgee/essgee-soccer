begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec) do |t|
    # t.rspec_opts = "--tag ~build"
  end

  RSpec::Core::RakeTask.new(:build_spec) do |t|
    t.rspec_opts = "--tag build"
  end
rescue LoadError
end

namespace :assets do
  task :precompile do
    sh 'middleman build'
  end
end
