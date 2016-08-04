function tail_nginx
  ssh mailfeed-nginx tail -n 200 -f /var/log/mailfeed-access.log /var/log/mailfeed-error.log /var/log/nginx/*.log
end
