set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

activate :directory_indexes

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :asset_hash
  ignore "README.md"
end

after_build do |builder|
  src = File.join(config[:source],"README.md")
  dst = File.join(config[:build_dir],"README.md")
  builder.source_paths << File.dirname(__FILE__)
  builder.copy_file(src,dst)
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  deploy.branch = "master"
end
