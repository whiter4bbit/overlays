# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit elisp

MY_PV=2.8.0_rc4
MY_PV=scala-mode-${MY_PV}

PROJECT_DISTR="scala-2.8.0.RC4"
DESCRIPTION="Scala mode for Emacs editor"
HOMEPAGE="http://www.scala-lang.org/"
SRC_URI="http://www.scala-lang.org/downloads/distrib/files/${PROJECT_DISTR}.tgz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="dev-lang/scala virtual/emacs"

S="${WORKDIR}/${PROJECT_DISTR}/misc/scala-tool-support/emacs"
SITEFILE="50${PN}-gentoo.el"
DOCS="AUTHORS FUTURE README"

