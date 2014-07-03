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

Steps to update gluster documentation:

The gluster documentation is kept in a separate project, gluster-docs-project, in order to give more open permissions to docs writers than is 
required for site maintainers.  In order to test updating the documenation locally, you will need both the gluster-site and gluster-docs-project
 repositories.  Changes to documentation occur in the gluster-docs-project under ../htmltext/documentation.  See below for an explanation of how 
files and folders are structured.  For purposes of the documentation, the only files that need to be updated in gluster-site are docs.yml and this
document, README.md.  Documentation currently uses AsciiDoc notation for markup (a nice cheat sheet can be found at http://powerman.name/doc/asciidoc).

1) Download repositories:
# git clone git@forge.gluster.org:gluster-docs-project/gluster-docs-project.git && git clone git@forge.gluster.org:gluster-site/gluster-site.git

2) For testing, it is easiest to remove the documentation folder from gluster-site and symlink the documentation folder from gluster-docs-project:
# cd gluster-site/source
# rm -rf /documentation && ln -s ../../gluster-docs-project/htmltext/documentation/ .   (this creates the symbolic link to the full documentation)

3) Run the middleman server locally (using the bundle install and bundle exec commands from above).  You can view the site at localhost:4567.

4) Make changes in docs.  If changes are to a new document, additional changes will be needed to the docs.yml navigation page in gluster-site.  Verify changes using local middleman server.  

5) Once changes are verified locally, commit changes in git.


