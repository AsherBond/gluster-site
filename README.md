This is built using middleman (http://middlemanapp.com/)

1. cd gluster-site; bundle install 
   (installs stuff defined in Gemfile)

2. bundle exec middleman

   Browse to http://localhost:4567/ to see the site

3. bundle exec middleman build

   This generates the site in folder "build", ready to rsync to a webserver.

BLOG: File named YYYY-MM-DD-whatever.html.adoc (or whatever other supported format) 

File starts with yml "frontmatter" header that contains the human readable title that is displayed as the first headline of the post.

---
title: Generating fake content for testing
author: Mark Ant Hony
tags: [ german ]
---

The rest of the document is asciidoc.

DOCUMENTATION: Files under documentation/ named whatever.html.adoc (asciidoc). The first level-1 headline of asciidoc becomes the title of the document, or you can define it in the frontmatter I think.

To add files in the documentation index (on the right side of doc pages) for now you need to edit data/navigation.yml, which is constructed with Human Readable Title : url pairs.

