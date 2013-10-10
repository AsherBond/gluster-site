# -*- coding: utf-8 -*-
###
# Site settings
###

set :site_name, "Gluster"
set :site_logo, "gluster-logo.png"
set :site_domain, "gluster.org"

Time.zone = "UTC"

# Make pretty URLs
activate :directory_indexes

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Syntax highlighting
activate :syntax

# Bootstrap navbar
activate :bootstrap_navbar

# Make URLs relative
set :relative_links, true

# Set HAML to render HTML5 by default (when unspecified)
set :haml, :format => :html5

# Set Markdown features for RedCarpet
# (So our version of Markdown resembles GitHub's)
set :markdown,
  :tables => true,
  :autolink => true,
  :gh_blockcode => true,
  :fenced_code_blocks => true,
  :smartypants => true

set :markdown_engine, :redcarpet

set :asciidoctor,
  :toc => true,
  :numbered => true


# Set directories
set :css_dir, 'stylesheets'
set :fonts_dir, 'stylesheets/fonts'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :partials_dir, 'layouts'


###
# Blog settings
###

activate :blog do |blog|
  blog.prefix = "blog/"
  blog.layout = "blog_layout"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.default_extension = ".md"

  blog.sources = ":year-:month-:day-:title.html"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.year_link = ":year.html"
  blog.month_link = ":year/:month.html"
  blog.day_link = ":year/:month/:day.html"


  #blog.taglink = "tags/:tag.html"

  #blog.summary_separator = /(READMORE)/
  #blog.summary_length = 99999

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/:num"
end

#activate :authors
#activate :drafts

# Enable blog layout for all blog pages
with_layout :blog_layout do
  page "/blog.html"
  page "/blog/*"
end


###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end


###
# Page options, layouts, aliases and proxies
###

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

# Don't have a layout for XML
page "/feed.xml", :layout => false
page "/sitemap.xml", :layout => false

# Docs all have the docs layout
with_layout :docs do
  page "/documentation/*"
  page "/documentation*"
end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }


###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
helpers do
  def normalize_url(dirty_URL)
    r = url_for Middleman::Util.normalize_path(dirty_URL)
    r.sub(/\/$/, '')
  end

  # FIXME: This is a WIP; it's not working though...
  def pretty_date(sometime)
    #sometime = ActiveSupport::TimeZone[zone].parse(sometime) unless sometime.is_a?(Date)
    sometime = Date.strptime(sometime, "%Y-%m-%d") if sometime.is_a?(String)
=begin
    if date.is_a?(String)
      date = Date.parse(date)
    end

    result = date.strftime("%B %d")
    result << date.strftime(", %Y") if date.year > Time.now.year
=end

    #return sometime.to_formatted_s(:short)
    return sometime#.strftime("%d %B")
  end
end


###
# Development-only configuration
###
#
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
  ## Ignore Gimp source files
  ignore 'images/*.xcf*'

  # Don't export source JS
  ignore 'javascripts/vendor/*'
  ignore 'javascripts/lib/*'

  # Don't export source CSS
  ignore 'stylesheets/vendor/*'
  ignore 'stylesheets/lib/*'

  # Minify JavaScript and CSS on build
  activate :minify_javascript
  activate :minify_css

  # Force a browser reload for new content by using
  # asset_hash or cache buster (but not both)
  activate :cache_buster
  # activate :asset_hash

  # Use relative URLs for all assets
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"

  # Favicon PNG should be 144×144 and in source/images/favicon_base.png
  activate :favicon_maker,
    favicon_maker_input_dir: "source/images",
    favicon_maker_output_dir: "build/images",
    favicon_maker_base_image: "favicon_base.png"
end
