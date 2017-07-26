function tail_nginx
  ssh mailfeed-nginx tail -n 200 -f /var/log/mailfeed-error.log /var/log/mailfeed-access.log
end
