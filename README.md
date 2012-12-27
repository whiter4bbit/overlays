# Scala tools gentoo overlay

Contains scala-related ebuilds.

## Using Layman
This overlay can be integrated into your system using layman (http://wiki.gentoo.org/wiki/Layman).

    $ sudo layman -f --overlays https://github.com/whiter4bbit/overlays/raw/master/layman.xml --add gentoo-scala-tools
    $ sudo emerge sbt-bin # to emerge sbt


## Using eselect-scala
You can have multiple installed scala versions and select active using eselect:

    $ sudo emerge eselect-scala
    $ sudo eselect scala list
    $   [1]   scala-2.9.0 *
    $   [2]   scala-2.8.1
    $ sudo eselect scala set scala-2.8.1
    $   scala-2.8.1

