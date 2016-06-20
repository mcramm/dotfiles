function db
  if test -f config/database.yml
    set db (cat config/database.yml  | grep --after-context 9 development: | grep database | cut -d : -f 2 | sed -e 's/^[ ]*//')
  else
    set db 'postgres'
  end

  psql -h localhost -U tether $db
end
