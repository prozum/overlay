# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Reference assemblies for portable class libraries(PCL)"
HOMEPAGE="https://github.com/directhex/xamarin-referenceassemblies-pcl"
SRC_URI="https://codeload.github.com/directhex/xamarin-referenceassemblies-pcl/zip/upstream/${PV} -> ${P}.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="dev-lang/mono"

S="${WORKDIR}/xamarin-referenceassemblies-pcl-upstream-${PV}/"

src_install() {
	insinto /usr/lib/mono/xbuild-frameworks/.NETPortable/
	doins v*
}
