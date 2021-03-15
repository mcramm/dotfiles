# function db
#   if test -f config/database.yml
#     set db (cat config/database.yml  | grep --after-context 9 development: | grep database | cut -d : -f 2 | sed -e 's/^[ ]*//')
#   else
#     set db 'postgres'
#   end

#   psql -h localhost -U michaelcramm $db
# end

function db
  if test "$argv[1]" = "1"
    set db 'themis_development_1'
  else if test "$argv[1]" = "2"
    set db 'themis_development_2'
  else
    set db 'common_development'
  end

  echo "😘😘  CONNECTING TO `$db` 😘😘"
  mysql --host=127.0.0.1 --port=6033 --user=themis_dev --password=mysql5566 $db
end
