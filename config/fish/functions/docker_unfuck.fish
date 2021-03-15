function docker_unfuck
  docker rmi (docker images -a -q)
end

