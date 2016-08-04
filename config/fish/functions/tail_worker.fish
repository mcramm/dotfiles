function tail_worker
  ssh mailfeed-worker tail -n 200 -f /var/log/mailfeed-worker.log
end

