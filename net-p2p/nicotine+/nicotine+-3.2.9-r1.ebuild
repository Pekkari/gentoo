# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
PYTHON_REQ_USE="gdbm"
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 xdg-utils

DESCRIPTION="A fork of nicotine, a Soulseek client in Python"
HOMEPAGE="https://github.com/Nicotine-Plus/nicotine-plus"
SRC_URI="https://github.com/Nicotine-Plus/nicotine-plus/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND="${PYTHON_DEPS}"
RDEPEND="
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	x11-libs/gtk+:3[introspection]
	${DEPEND}
"

DEPEND="${RDEPEND}"

S="${WORKDIR}/nicotine-plus-${PV}"

EPYTEST_IGNORE=(
	"test/integration/test_startup.py"
)

distutils_enable_tests pytest

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
