function tail_web
  ssh mailfeed-web tail -n 200 -f /var/log/mailfeed-web.log
end
