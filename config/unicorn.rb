listen "/tmp/unicorn.stucheki.sock"
pid "/vagrant_data/stucheki/tmp/pids/unicorn.pid"
stdout_path "/vagrant_data/stucheki/log/unicorn.log"
stderr_path "/vagrant_data/stucheki/log/unicorn_err.log"
working_directory "/vagrant_data/stucheki"

cpu_num = `cat /proc/cpuinfo | grep processor`.split("\n").size

worker_processes 3 * cpu_num
timeout 600
preload_app true

before_fork do |server, _worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
      nil
    end
  end
end

after_fork do |_server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end

# working_directory "/vagrant_data/stucheki"
# pid "/vagrant_data/stucheki/tmp/pids/unicorn.pid"
# stderr_path "/vagrant_data/stucheki/log/unicorn.log"
# stdout_path "/vagrant_data/stucheki/log/unicorn.log"

# listen "/tmp/unicorn.todo.sock"
#listen 3000
# worker_processes 2
# timeout 600
