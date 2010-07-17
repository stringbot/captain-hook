desc "Install gems that this app depends on. May need to be run with sudo."
task :install_dependencies do
  dependencies = ["sinatra", "json"]
  
  dependencies.each do |gem_name|
    puts "#{gem_name}"
    system "gem install #{gem_name}"
  end
end