inherit eutils multilib portability java-pkg-2 versionator

MY_P="${P}".Beta1-prerelease

SLOT="0"
LICENSE="BSD"
DESCRIPTION="Scala beta version"
HOMEPAGE="http://www.scala-lang.org"
SRC_URI="http://www.scala-lang.org/downloads/distrib/files/${MY_P}.tgz"

DEPEND=">=virtual/jdk-1.5"

S=${WORKDIR}

scala_launcher() {
	local SCALADIR="/opt/scala-unstable/${MY_P}"
	local bcp="${SCALADIR}/lib/scala-library.jar"
	java-pkg_dolauncher "${1}" --main "${2}" --java_args "-Xmx256M -Xms32M -Dscala.home=${SCALADIR}"
}

src_install() {
	declare SCALA_HOME=/opt/scala-unstable

	dodir ${SCALA_HOME}
	cp -R ${MY_P}/ "${D}"${SCALA_HOME} || die "Unable to install"

	java-pkg_dojar "${MY_P}"/lib/*.jar

	scala_launcher fsc scala.tools.nsc.CompileClient
	scala_launcher scala scala.tools.nsc.MainGenericRunner
	scala_launcher scalac scala.tools.nsc.Main
	scala_launcher scaladoc scala.tools.nsc.ScalaDoc
	scala_launcher scalap scala.tools.scalap.Main	
}

