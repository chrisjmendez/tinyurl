# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

=begin

ignore %r{^ignored/path/}, /public/
filter /\.txt$/, /.*\.zip/

group :frontend do
  guard :bundler do
    watch('Gemfile')
  end

  guard :livereload do
    watch(%r{^app/.+\.(erb|haml)})
    watch(%r{^app/helpers/.+\.rb})
    watch(%r{^public/.+\.(css|js|html)})
    watch(%r{^config/locales/.+\.yml})
  end
end


group :backend do

  guard :bundler do
    watch('Gemfile')
    watch('Gemfile.lock')
    watch('config/application.rb')
    watch('config/environment.rb')
    
    watch(%r{^config/environments/.+\.rb})
    watch(%r{^config/initializers/.+\.rb})
    watch(%r{^app/models/(.+)\.rb})
    watch(%r{^app/controllers/(.+)_(controller)\.rb})
  end
  
end

=end