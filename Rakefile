require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :test

desc "Compiles rex and racc"
task :compile do
  sh 'rex lib/html_ruby/parser.rex'
  sh 'racc lib/html_ruby/parser.racc'
end

desc "Compiles rex and racc and then run RSpec code examples"
task :test do
  Rake::Task[:compile].invoke
  Rake::Task[:spec].invoke
end
