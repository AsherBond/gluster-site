# -*- coding: utf-8 -*-
###
# Blog settings
###

set :site_name, "Gluster"

Time.zone = "UTC"

activate :blog do |blog|
  blog.prefix = "blog/"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  blog.default_extension = ".adoc"
  blog.sources = ":year-:month-:day-:title.html"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.year_link = ":year.html"
  blog.month_link = ":year/:month.html"
  blog.day_link = ":year/:month/:day.html"

  blog.layout = "blog-layout"

  #blog.taglink = "tags/:tag.html"

  #blog.summary_separator = /(READMORE)/
  #blog.summary_length = 250

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/:num"
end

### 
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end


###
# Page options, layouts, aliases and proxies
###

# Make pretty URLs
activate :directory_indexes

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Make URLs relative
set :relative_links, true

set :haml, { :format => :html5 }

page "/feed.xml", :layout => false
page "/sitemap.xml", :layout => false
page "/documentation/*", :layout => "docs"
page "/documentation/index.html", :layout => "layout"

#set :wikicloth, { }


# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

def page_classes
  path = request.path_info.dup
  path << settings.index_file if path.match(%r{/$})
  path = path.gsub(%r{^/}, '')

  classes = []
  parts = path.split('.')[0].split('/')
  parts.each_with_index { |path, i| classes << parts.first(i+1).join('_') }

  classes.join(' ')
end


set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :partials_dir, 'layouts'


# Development-only configuration
configure :development do
  activate :livereload
  #config.sass_options = {:debug_info => true}
  #config.sass_options = {:line_comments => true}
  compass_config do |config|
    config.output_style = :expanded
    config.sass_options = {:debug_info => true, :line_comments => true}
  end
end


# Build-specific configuration
configure :build do
  ignore 'images/*.psd'
  ignore 'stylesheets/lib/*'
  ignore 'stylesheets/vendor/*'
  ignore 'javascripts/lib/*'
  ignore 'javascripts/vendor/*'

  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  activate :cache_buster
  
  # Use relative URLs
  activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"

  # Favicon PNG should be 144×144 and in source/favicon_base.png
  activate :favicon_maker
end
