namespace :grunt do
  task :build do
    system 'cd angular && grunt build --force'
  end
end
