function unfuck
  rm -rf node_modules
  rm -rf public/assets/*
  pushd components/manage
  rm -rf node_modules
  rm -rf public/assets/*
  yarn install
  popd
  rake tmp:cache:clear browserify:generate_index
  themis-setup
end
