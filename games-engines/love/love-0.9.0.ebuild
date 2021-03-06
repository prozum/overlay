# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="5"

DESCRIPTION="An *awesome* framework you can use to make 2D games in Lua."
HOMEPAGE="http://love2d.org/"
if [[ ${PV} =~ "9999" ]]; then
	SCM_ECLASS="mercurial"
	EHG_REPO_URI="https://bitbucket.org/rude/love"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://bitbucket.org/rude/love/downloads/${P}-linux-src.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi;

inherit eutils autotools ${SCM_ECLASS}

LICENSE="ZLIB"
SLOT="0"
IUSE="luajit"

RDEPEND="dev-games/physfs
	media-libs/devil[mng,tiff]
	media-libs/freetype
	media-libs/libmodplug
	media-libs/libsdl[joystick,opengl]
	media-libs/libvorbis
	media-libs/openal
	media-sound/mpg123
	dev-lang/lua[deprecated]
	luajit? ( dev-lang/luajit:2 )
	virtual/opengl"
DEPEND="${RDEPEND}
	media-libs/libmng
	media-libs/tiff"

DOCS=( "readme.md" "changes.txt" )

src_configure() {
	OPTS=()
	use luajit && OPTS+=" --with-luajit"
	OPTS+=" --disable-dependency-tracking --disable-option-checking"
	econf ${OPTS}
}
