# Sidekiq bug reproduction repository

### Requirements

 - Docker
 - Docker Compose

 ### Run

 ```
 docker-compose up -d
 open http://localhost:9292
 ```

 Observe Sidekiq dashboard for some time (15-20 seconds in my case) you will see that worker on Ruby 2.6.3 will disappear.
