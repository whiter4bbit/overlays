# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils versionator

SLOT="$(get_major_version)"
RDEPEND=">=virtual/jdk-1.6"

MY_PV="12.0.1"
MY_PN="idea"

RESTRICT="strip"
QA_TEXTRELS="opt/${P}/bin/libbreakgen.so"

DESCRIPTION="IntelliJ IDEA is an intelligent Java IDE"
HOMEPAGE="http://jetbrains.com/idea/"
SRC_URI="http://download-ln.jetbrains.com/${MY_PN}/${MY_PN}IU-${MY_PV}.tar.gz"
LICENSE="IntelliJ-IDEA"
IUSE=""
KEYWORDS="~x86 ~amd64"
S="${WORKDIR}/idea-IU-123.94"

RDEPEND="!dev-util/idea-community"

src_install() {
	local dir="/opt/${P}"
    insinto "${dir}"
    doins -r *
	fperms 755 "${dir}/bin/${MY_PN}.sh"
	local exe=${MY_PN}-${SLOT}
	local icon=${exe}.png
	newicon "bin/${MY_PN}.png" ${icon}
	dodir /usr/bin
	make_wrapper "$exe" "/opt/${P}/bin/${MY_PN}.sh"
	make_desktop_entry ${exe} "IntelliJ IDEA ${PV}" ${icon} "Development;IDE"
}
