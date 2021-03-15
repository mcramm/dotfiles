function install_deps_and_migrate
  echo " DERECATED !! "
  bundle
  yarn install
  bundle exec rake db:migrate
  env RAILS_ENV=test bundle exec rake db:migrate
end
