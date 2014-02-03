# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="The StormLib library is a pack of modules, written in C++, which are able to read and also to write files from/to the MPQ archives."
HOMEPAGE="http://www.zezula.net/en/mpq/stormlib.html"
EGIT_REPO_URI="https://github.com/stormlib/StormLib.git"
EGIT_COMMIT="v9.00"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_configure() {
	cmake-utils_src_configure
}
