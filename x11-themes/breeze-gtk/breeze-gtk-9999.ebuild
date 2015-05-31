# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION=""
HOMEPAGE="https://github.com/dirruk1/gnome-breeze"
SRC_URI="https://github.com/dirruk1/gnome-breeze/archive/master.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE="gtk2 gtk3"

DEPEND=""
RDEPEND="${DEPEND}"
REQUIRED_USE="|| ( gtk2 gtk3 )"

S="${WORKDIR}/gnome-breeze-master"

src_install() {
    dodir /usr/share/themes/breeze-gtk/
	if use gtk2; then
    	mv "${S}/gtk-2.0" "${D}/usr/share/themes/breeze-gtk/" || die "Install failed!"
	fi
	if use gtk3; then
    	mv "${S}/gtk-3.0" "${D}/usr/share/themes/breeze-gtk/" || die "Install failed!"
	fi
    dodoc README.md
}
