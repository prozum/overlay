# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-misc/redshift-plasmoid/redshift-plasmoid-1.0.ebuild,v 1.2 2014/08/05 16:31:43 mrueg Exp $

EAPI=5

KDE_LINGUAS="cs de es fr it"
inherit kde5

DESCRIPTION="Plasma plasmoid for redshift"
HOMEPAGE="http://kde-apps.org/content/show.php/Redshift+Plasmoid?content=148737 https://github.com/simgunz/redshift-plasmoid/"
SRC_URI="https://codeload.github.com/simgunz/redshift-plasmoid/tar.gz/plasma5-porting -> ${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS=""
SLOT="5"
IUSE="debug"

DEPEND="$(add_frameworks_dep plasma)"
RDEPEND="${DEPEND}
	x11-misc/redshift"

KDE_BUILD_TYPE=release

S="${WORKDIR}/redshift-plasmoid-plasma5-porting"
