# Distributed under the terms of the GNU General Public License v2
# Niclas Moeslund Overby 2014

EAPI=5

DESCRIPTION="The ADAPTIVE Communication Environment - An object oriented network programming toolkit in C++."
HOMEPAGE="http://www.cs.wustl.edu/~schmidt/ACE.html"
SRC_URI="!tao? ( http://download.dre.vanderbilt.edu/previous_versions/ACE-${PV}.tar.bz2 )
	tao? (
		!ciao? ( http://download.dre.vanderbilt.edu/previous_versions/ACE+TAO-${PV}.tar.bz2 )
		ciao? ( http://download.dre.vanderbilt.edu/previous_versions/ACE+TAO+CIAO-${PV}.tar.bz2 )
	)"

LICENSE="BSD as-is"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="X boost ciao dmalloc fltk fox gtk opengl openmp qt4 static-libs ssl stl tao +threads valgrind wxwidgets xt"
REQUIRED_USE="xt? ( X )"
#SET threads USE flag to default on because disabling currently causes compilation failure with undefined reference errors.

RESTRICT="mirror"

#TODO: Determine whether the following dependencies are mandatory or configurable.
#TODO: Patch ../include/makeinclude/platform_linux_common.GNU to use pkg-config instead of shell command to fetch --libs, --cflags, and --ldflags for gtk+ and wxGTK.
#TODO: Determine which version(s) of gtk+ to depend on.
#TODO: Patch ../include/makeinclude/platform_linux.GNU to not append -O3 and to resepct CFLAGS/CXXFLAGS.
#TODO: Add Trio support (see http://sourceforge.net/projects/ctrio/ )

#NOTE: See ${ACE_ROOT}/include/makeinclude/wrapper_macros.GNU for info on parameters to pass to "make" and for clues to package dependencies and conditional USE flags.

DEPEND="virtual/pkgconfig
	boost? ( dev-libs/boost )
	dmalloc? ( dev-libs/dmalloc )
	fltk? ( x11-libs/fltk[opengl] )
	fox? ( x11-libs/fox:1.7 )
	gtk? ( x11-libs/gtk+ )
	opengl? ( virtual/opengl )
	openmp? ( sys-cluster/openmpi )
	qt4? ( x11-libs/qtcore:4
		x11-libs/qtgui:4 )
	ssl? ( dev-libs/openssl )
	stl? ( dev-libs/STLport )
	valgrind? ( dev-util/valgrind )
	wxwidgets? ( x11-libs/wxGTK )
	X? ( x11-libs/libX11 )
	xt? ( x11-libs/libXt )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/ACE_wrappers"

src_prepare() {
	echo '#include "ace/config-linux.h"' > "${S}"/ace/config.h
	echo 'include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU' > "${S}"/include/makeinclude/platform_macros.GNU
	echo 'INSTALL_PREFIX = /usr' >> "${S}"/include/makeinclude/platform_macros.GNU
#TODO: Look at symlink issues as makefiles create symlinks outside of ${D} and directly to filesystem.
#	sed -i 's:ln -sf $(INSTALL_PREFIX)/bin/ace_gperf $(DESTDIR)$(INSTALL_PREFIX)/share/ace/bin:ln -sf ${D}/$(INSTALL_PREFIX)/bin/ace_gperf $(DESTDIR)$(INSTALL_PREFIX)/share/ace/bin:' "${S}"/apps/gperf/src/GNUmakefile.gperf
}

src_compile() {
	export ACE_ROOT="${S}"
	export LD_LIBRARY_PATH="${ACE_ROOT}/lib:${LD_LIBRARY_PATH}"

	#NOTE: Some parameters may accept 0 (zero) to be disabled, but simply leaving it null (blank) is more compatible for some platforms or parameters.
	local myparams
	if use boost; then
		myparams="${myparams} boost=1"
	else
		myparams="${myparams} boost="
	fi

	if use dmalloc; then
		myparams="${myparams} dmalloc=1"
	else
		myparams="${myparams} dmalloc="
	fi

	if use fltk; then
		myparams="${myparams} fl=1"
	else
		myparams="${myparams} fl="
	fi

	if use fox; then
		export PLATFORM_FOX_CPPFLAGS=$(pkg-config fox17 --cflags)
		export PLATFORM_FOX_LIBS=$(pkg-config fox17 --libs)
		myparams="${myparams} fox=1"
	else
		myparams="${myparams} fox="
	fi

	if use opengl; then
		myparams="${myparams} gl=1"
	else
		myparams="${myparams} gl="
	fi

	if use openmp; then
		myparams="${myparams} openmp=1"
	else
		myparams="${myparams} openmp="
	fi

	if use qt4; then
		export QTDIR="/usr"
		export PLATFORM_QT_CPPFLAGS="$(pkg-config QtCore QtGui --cflags)"
		export PLATFORM_QT_LIBS="$(pkg-config QtCore QtGui --libs-only-l)"
		export PLATFORM_QT_LDFLAGS="$(pkg-config QtCore QtGui --libs-only-L)"
		myparams="${myparams} qt4=1"
	else
		myparams="${myparams} qt4="
	fi

	if use ssl; then
		myparams="${myparams} ssl=1"
	else
		myparams="${myparams} ssl="
	fi

	if use static-libs; then
		myparams="${myparams} static_libs=1"
	else
		myparams="${myparams} static_libs="
	fi

	if use stl; then
		myparams="${myparams} stlport=1"
	else
		myparams="${myparams} stlport="
	fi

	if use threads; then
		myparams="${myparams} threads=1"
	else
		myparams="${myparams} threads="
	fi

	if use valgrind; then
		myparams="${myparams} valgrind=1"
	else
		myparams="${myparams} valgrind="
	fi

	if use X; then
		myparams="${myparams} x11=1"
	else
		myparams="${myparams} x11="
	fi

	if use xt; then
		myparams="${myparams} xt=1"
	else
		myparams="${myparams} xt="
	fi

	#TODO: Determine what the "insure=0" or "insure=1" parameter controls. It has something to do with gcc.
	#TODO: Does ebuild need additional changes to support cross-compiling? See ${ACE_ROOT}/include/makeinclude/platform_g++_common.GNU
	cd ${S}/ace
	OCFLAGS="${CFLAGS}" OCCFLAGS="${CXXFLAGS}" emake debug=0 shared_libs=1 symlinks=relative ${myparams} || die "emake failed"
}

src_install() {
	echo 'ENTERING INSTALL PHASE'
	echo 'ENTERING INSTALL PHASE'
	echo 'ENTERING INSTALL PHASE'
	echo 'ACE_ROOT is ' ${ACE_ROOT}
	echo 'LD_LIBRARY_PATH is ' ${LD_LIBRARY_PATH}
	echo 'Exporting...'
	export ACE_ROOT="${S}"
        export LD_LIBRARY_PATH="${ACE_ROOT}/lib:${LD_LIBRARY_PATH}"
	echo 'ACE_ROOT is ' ${ACE_ROOT}
	echo 'LD_LIBRARY_PATH is ' ${LD_LIBRARY_PATH}

	echo 'Current directory is ' ${pwd}
	cd ${S}/ace
	echo 'Current directory is ' ${pwd}
	default
}
