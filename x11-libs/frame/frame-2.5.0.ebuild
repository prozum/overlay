# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Touch Frame Library "
SRC_URI="https://launchpad.net/frame/trunk/v2.5.0/+download/frame-2.5.0.tar.gz"
HOMEPAGE="https://launchpad.net/frame"
KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-3"
IUSE=""
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}
    x11-libs/libXi"

S="${WORKDIR}/frame-${PV}"
