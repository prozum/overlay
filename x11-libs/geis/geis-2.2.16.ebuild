# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit base python

DESCRIPTION="An implementation of the GEIS (Gesture Engine Interface and Support) interface."
SRC_URI="https://launchpad.net/geis/trunk/${PV}/+download/geis-${PV}.tar.gz"
HOMEPAGE="https://launchpad.net/geis"
KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-2 LGPL-3"
IUSE=""
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}
	x11-libs/grail"

PYTHON_DEPEND="3:3.3"

S="${WORKDIR}/geis-${PV}"
