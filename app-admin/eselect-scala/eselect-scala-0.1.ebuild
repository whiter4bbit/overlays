# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Manages Scala symlinks"
HOMEPAGE="http://whiter4bbit.info"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=app-admin/eselect-1.0.10
  !<dev-lang/scala-2.8.1"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/eselect/modules
	doins "${FILESDIR}/scala.eselect" || die "doins failed"
}
