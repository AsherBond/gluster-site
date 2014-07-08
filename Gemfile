# Attempt to get around UTF encoding failure Eco observed in testing

if RUBY_VERSION =~ /1.9/
    Encoding.default_external = Encoding::UTF_8
    Encoding.default_internal = Encoding::UTF_8
end

# If you have OpenSSL installed, we recommend updating
# the following line to use "https"
source 'http://rubygems.org'

gem "middleman", "~> 3.3.3"

# In order to get SASS 3.3, compass 1.0 is needed
# FIXME: Remove this once 1.0 is final (very, very soon now -- next week?)
gem 'compass', '~> 1.0.0.alpha.19'

# Live-reloading plugin
gem "middleman-livereload"

# Debugger / REPL alternative to irb
gem 'pry'
gem 'pry-debugger'
gem 'pry-stack_explorer'
gem 'middleman-pry'

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem "ruby18_source_location"
end

# For faster file watcher updates for people using Windows
gem "wdm", "~> 0.1.0", :platforms => [:mswin, :mingw]

gem "tzinfo"

#####
# General plugins

# Blog plugin
gem "middleman-blog"
gem "middleman-blog-drafts"
gem "middleman-blog-authors"

gem 'middleman-deploy'

# Thumbnailer
#gem "middleman-thumbnailer", github: "nhemsley/middleman-thumbnailer"

# favicon support (favicon PNG should be 144×144)
gem "middleman-favicon-maker"

# HTML & XML parsing smarts
gem "nokogiri"

# Syntax highlighting
gem "middleman-syntax"

# For feed.xml.builder
gem "builder" #, "~> 3.0"

# Better JSON lib
gem "oj"


#####
# Bootstrap

# Bootstrap, as SASS
gem "bootstrap-sass"

# Bootstrap 3 version of navbar (from a fork; temporary also):
gem "bootstrap-navbar" #github: "delynn/bootstrap-navbar"
# Bootstrap-navbar integration for Middleman
gem "middleman-bootstrap-navbar"

# navigation foo
# there isn't a release that fixes issue #8, so we're using master
# https://github.com/michaek/middleman-navigation/issues/8
#gem "middleman-navigation", github: "michaek/middleman-navigation", ref: "cbffe52"

# There's a bug in with bootstrap-sass + sprockets-sass in 3.3.3
# FIXME: When a fix is released (3.3.4?), remove this block
# See: https://github.com/middleman/middleman/issues/1265
gem 'middleman-sprockets', '3.3.2'

#####
# Formats

# less (css)
gem "therubyracer"
gem "less"

# asciidoctor
gem "asciidoctor"

# mediawiki
gem "wikicloth"

gem "coderay"
gem "stringex"

# Markdown
gem "kramdown"

gem 'open-uri-cached'

gem 'font-awesome-middleman'

# RSS/Atom parsing
gem "feedjira"
