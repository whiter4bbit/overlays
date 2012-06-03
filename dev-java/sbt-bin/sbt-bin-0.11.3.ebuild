# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit java-utils-2

MY_PN="sbt-launch"
MY_PV="${PV}"
OUT_PN="${MY_PN}-${MY_PV}"
DESCRIPTION="sbt is a build tool for Scala and Java projects that aims to do the basics well"
HOMEPAGE="http://github.com/harrah/xsbt"
SRC_URI="http://typesafe.artifactoryonline.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/${MY_PV}/${MY_PN}.jar -> ${OUT_PN}.jar"

LICENSE="BSD"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"

RDEPEND=">=virtual/jdk-1.6"

S=${WORKDIR}

src_unpack() {
    cp "${DISTDIR}/${OUT_PN}.jar" "${WORKDIR}/${MY_PN}.jar"
}

src_install() {
    java-pkg_dojar ${MY_PN}.jar
    java-pkg_dolauncher sbt --main xsbt.boot.Boot --java_args "-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=384M"
}
