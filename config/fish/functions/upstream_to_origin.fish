function upstream_to_origin
  git checkout master; git fetch upstream; git merge --ff-only upstream/master; git push origin master
end

