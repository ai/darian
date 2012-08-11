# encoding: utf-8

require 'rubygems'

begin
  require 'bundler/setup'
  Bundler::GemHelper.install_tasks
rescue LoadError
  puts "Bundler not available. Install it with: gem install bundler"
end

require File.join(File.dirname(__FILE__), 'lib/darian/version')

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

begin
  require 'yard'
  YARD::Rake::YardocTask.new do |yard|
    v = Darian::VERSION
    yard.options << "--title='Darian Mars Calendar Converter #{v}'"
  end
rescue LoadError; end

task :clobber_doc do
  rm_r 'doc'     rescue nil
  rm_r '.yardoc' rescue nil
end
task :clobber_package do
  rm_r 'pkg' rescue nil
end

desc 'Delete all generated files'
task :clobber => [:clobber_package, :clobber_doc]

task :default => :spec
