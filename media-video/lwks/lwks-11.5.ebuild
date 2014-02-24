# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit unpacker gnome2-utils

DESCRIPTION="LightWorks video editor software"
HOMEPAGE="http://www.lwks.com/"
SRC_URI="http://www.lwks.com/dmpub/lwks-${PV}-amd64.deb"

RESTRICT="fetch mirror"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	virtual/opengl
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+
	gnome-extra/libgsf
	virtual/jpeg:0
	x11-libs/pango
	media-gfx/nvidia-cg-toolkit
	media-libs/portaudio
	media-libs/tiff
	sys-apps/util-linux
	dev-libs/openssl
	net-misc/curl
	"

S="${WORKDIR}/"

src_install() {
	cp -R . "${D}"

	# There dirs can be changed by the user
	fperms a+rw /usr/share/lightworks/{Preferences,"Audio Mixes"}

	rm "${D}/control.tar.gz" "${D}/data.tar.gz" "${D}/debian-binary"
}

pkg_postinst() { gnome2_icon_cache_update; }
pkg_preinst() { gnome2_icon_savelist; }
pkg_postrm() { gnome2_icon_cache_update; }
