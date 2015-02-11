app_path = '/var/www/dev-easypaint-api'
working_directory "#{app_path}/current"

listen "0.0.0.0:9393"
pid "#{app_path}/current/tmp/pids/unicorn.pid"

# logging
# stderr_path "log/unicorn.stderr.log"
# stdout_path "log/unicorn.stdout.log"
#
# worker_processes 1
# timeout 600
# check_client_connection false
# preload_app false
#
