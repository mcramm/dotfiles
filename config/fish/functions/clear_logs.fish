function clear_logs
  for file in (ls log/*.log)
    echo "echo -n > $file"
    echo -n > $file
  end
end

