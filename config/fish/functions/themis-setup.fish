function themis-setup
  bundle
  bundle exec rake db:migrate
  env RAILS_ENV=test bundle exec rake db:migrate
end
