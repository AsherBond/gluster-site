Gluster.org site built with awestruct.

  * We are using Bootstrap for layout, local changes to CSS are in
    [stylesheets/style.css], colors and fonts are defined in
    [stylesheets/_variables.scss] SCSS file that gets processed by
    awestruct. Namely, we use Open Sans font from
    [http://fonts.google.com](Google Fonts) on the site.

  * Also commit the generated _site folder to git, as we do not have a
    toolchain in place to run awestruct on the server side after a
    commit for now. For this reason, we have two targets in the
    [site/config.yml]:
 
    * *devel* for viewing locally, base_url gets set to localhost:4242
       for testing.

    * *forge* for generating a site that works when viewed on
       forge.gluster.org git repository in raw view. For this to work,
       please remember to put the index.html in the site urls, as the
       git viewer does not automatically serve you _index.html_ when
       you reference a folder.

    * *final* for generating the real www.gluster.org - when it is
       ready to be launched.
