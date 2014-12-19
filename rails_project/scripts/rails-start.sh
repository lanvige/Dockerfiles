# start-server.sh

#!/bin/bash
cd /app
bundle exec unicorn -p 8080 -c config/unicorn.rb
echo 'Rails Running'