guard :rspec do
  watch("app.rb") { "spec/captain_hook_spec.rb" }
  watch(%r|^spec/(.+)_spec.rb|)
  watch(%r|^lib/(.+)\.rb|) { |m| "spec/#{m[1]}_spec.rb" }
end
