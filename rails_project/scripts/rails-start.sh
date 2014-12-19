# start-server.sh

#!/bin/bash
cd /app
bundle exec rake assets:precompile
bundle exec unicorn -p 8080 -c config/unicorn.rb