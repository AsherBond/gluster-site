require 'bootstrap-sass'
require 'erubis'
require 'tilt'

Awestruct::Extensions::Pipeline.new do
  extension Awestruct::Extensions::Posts.new( '/blog')
#  extension Awestruct::Extensions::Paginator.new( :posts, '/index', :per_page => 5 )
#  extension Awestruct::Extensions::Tagger.new( :posts, '/index', '/blog/tags', :per_page => 10)
#  extension Awestruct::Extensions::TagCloud.new( :tagcloud, '/blog/tags/index.html', :layout=>'base', :title=>'Tags')
#  extension Awestruct::Extensions::Disqus.new

  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Atomizer.new( :posts, '/feed.atom', :feed_title=>'Gluster' )

  helper Awestruct::Extensions::Partial
#  helper Awestruct::Extensions::GoogleAnalytics
#  helper Awestruct::Extensions::ReadMore
end

