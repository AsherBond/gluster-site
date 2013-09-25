## Gluster.org website, built with awestruct ##

## Initial Setup ##

### For Fedora 19 ###

1. Install the rubygems, ruby-devel, and nodejs packages

        $ sudo yum install rubygems ruby-devel nodejs

2. Install the Rubygems used for the GlusterFS website

        $ gem install asciidoctor awestruct coffee-script \
          erubis htmlcompressor redcarpet uglifier


## Building the site ##

To generate the website then serve it from localhost, use:

    $ awestruct -s

You should then be able to view it in a browser by going
to [http://localhost:4242](http://localhost:4242).


## Notes ##

### Fonts and layout ###

* We are using Bootstrap for layout
* We use the Open Sans font from [http://fonts.google.com](Google Fonts) on the site.
* Local changes to CSS are in `stylesheets/style.css`.
* Colors and fonts are defined in `stylesheets/_variables.scss`.  This is an SCSS file that gets processed by awestruct.

### When committing changes ###

**When committing, also commit the generated `_site` folder to git**

We don't (yet) have a toolchain in place to automatically regenerate
the website after a commit.

For this reason, we have three profiles in `site/config.yml`:

#### devel ####

For viewing locally, base_url gets set to localhost:4242 for testing.

    $ awestruct -P devel -s


#### forge ####

Generates a site that works when viewed on the
[forge.gluster.org](http://forge.gluster.org) git repository in raw view.

    $ awestruct -P forge -s

For this to work, please remember to add the index.html to the end of
folder urls, as the git viewer does not automatically serve _index.html_
when given a bare folder name.

eg use:

&nbsp; &nbsp; http://www.mysite.org/somefolder/index.html

instead of:

&nbsp; &nbsp; http://www.mysite.org/somefolder/


#### final ####

For generating the real www.gluster.org - when it is ready to be
launched.

    $ awestruct -P final -s

