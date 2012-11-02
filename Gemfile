source 'https://rubygems.org'

gem 'rails', '3.2.8'

#begin twilio bullshit
gem 'twilio-ruby'
#end twilio bullshit

group :development do
  gem 'sqlite3', '1.3.5'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"  
  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails', '2.0.2'

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.11.0'
end

gem 'annotate', '2.5.0', group: :development

group :production do
  gem 'therubyracer-heroku', '0.8.1.pre3' # you will need this too
end

group :production do
  gem 'pg'
end