# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit base

DESCRIPTION="Gesture Recognition And Instantiation Library"
SRC_URI="http://launchpad.net/grail/trunk/${PV}/+download/grail-${PV}.tar.bz2"
HOMEPAGE="https://launchpad.net/grail"
KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPV-3"
IUSE=""
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}
	sys-libs/mtdev	
	app-misc/evemu
	x11-libs/frame
	"
S="${WORKDIR}/grail-${PV}"
