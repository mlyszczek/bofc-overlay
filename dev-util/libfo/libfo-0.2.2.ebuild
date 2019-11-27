# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="libfo - library that allows user to simulate errors of POSIX and libc functions."
HOMEPAGE="https://libfo.bofc.pl"
SRC_URI="https://distfiles.bofc.pl/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/python-3"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}/usr" install
	sed -i 's/^prefix = "\/usr\/local"$/prefix = "\/usr"/' "${D}/usr/bin/fogen"
}
