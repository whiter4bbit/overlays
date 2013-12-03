inherit eutils multilib portability java-pkg-2 versionator

PROJECT_DISTR="scala-2.9.0"

SLOT="2.9.0"
LICENSE="BSD"
DESCRIPTION="Scala 2.9.0 release"
HOMEPAGE="http://www.scala-lang.org"
DISTR_POSTFIX=".final"
SRC_URI="http://www.scala-lang.org/files/archive/${PROJECT_DISTR}${DISTR_POSTFIX}.tgz"

DEPEND=">=virtual/jdk-1.5"

S=${WORKDIR}

SCALA_BINARIES=(scala scalac scaladoc scalap fsc)

src_install() {
	declare SCALA_HOME=/opt/

	dodir ${SCALA_HOME}
	cp -R ${PROJECT_DISTR}/ "${D}"${SCALA_HOME} || die "Unable to install"

	java-pkg_dojar "${PROJECT_DISTR}"/lib/*.jar
	java-pkg_dojar "${PROJECT_DISTR}"/misc/sbaz/*.jar

	dodir /usr/bin
	for b in ${SCALA_BINARIES[*]}
	do
	   dosym "${SCALA_HOME}/${PROJECT_DISTR}/bin/${b}" /usr/bin/${b}-${SLOT}
	done
}

