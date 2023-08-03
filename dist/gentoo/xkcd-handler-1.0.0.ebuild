# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg

DESCRIPTION="A handler for XKCD urls"
HOMEPAGE="https://xkcd.com/"
SRC_URI="https://github.com/mazunki/xkcd/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="x11-misc/xdg-utils"

src_install() {
	dobin xkcd
	doins xkcd.desktop
}
