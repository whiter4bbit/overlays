# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils java-pkg-2

SLOT="0"
LICENSE="BSD"
DESCRIPTION="sbt is a build tool for Scala and Java projects that aims to do the basics well"
HOMEPAGE="http://www.scala-sbt.org/"
MY_PN="sbt-launch"
OUT_PN="${MY_PN}-${PV}"
SRC_URI="http://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/${MY_PN}/${PV}/${MY_PN}.jar -> ${OUT_PN}.jar"

DEPEND=">=virtual/jdk-1.6"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}"

src_unpack() {
    cp ${DISTDIR}/${OUT_PN}.jar ${WORKDIR}/${MY_PN}.jar
}

src_install() {
    java-pkg_dojar ${MY_PN}.jar
    java-pkg_dolauncher sbt --main xsbt.boot.Boot --java_args "-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=384M"
}

