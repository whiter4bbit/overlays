# whiter4bbit's gentoo overlay

This repo contains my gentoo overlays for scala packages.

1. scala-mode for emacs
2. scala binary distribution
3. scala eselect module

To install scala binary distribution you will do next steps:

    $ git clone git://github.com/whiter4bbit/overlays.git
    $ cd overlays 
    $ su
    $ emerge dev-lang/scala/scala-2.9.0_rc2.ebuild

You can maintain selected scala installations. Updated ebuilds for 2.9.0rc2 and 2.8.1 to use together.
You can switch current scala version using eselect module:
    $ eselect scala list
    $   [1]   scala-2.9.0 *
    $   [2]   scala-2.8.1
    $ eselect scala set scala-2.8.1
    $   scala-2.8.1
    

