This is built using middleman (http://middlemanapp.com/)

1. cd gluster-site; bundle install 
   (installs stuff defined in Gemfile)

2. bundle exec middleman

   Browse to http://localhost:4567/ to see the site

3. bundle exec middleman build

   This generates the site in folder "build", ready to rsync to a webserver.