app_dir = File.expand_path('../../', __FILE__)

working_directory app_dir

listen "#{app_dir}/tmp/unicorn.stucheki.sock"
pid "#{app_dir}/tmp/pids/unicorn.pid"
stdout_path "#{app_dir}/log/unicorn.log"
stderr_path "#{app_dir}/log/unicorn.log"

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
