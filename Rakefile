require 'organiser'

desc 'Run a tournament, based on configuration file input'
task :run do |t|
  o = Organiser.new
  t = o.read_config(File.read("#{ENV['filename']}"))
  t.run
  t.results.each do |result|
    puts result
  end 
end

task :default => [:run]
