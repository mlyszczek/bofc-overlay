# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="apc to mqtt bridge"
HOMEPAGE="https://git.bofc.pl/bofc-scripts/"

EGIT_REPO_URI="git://git.bofc.pl/${PN}"
EGIT_COMMIT="v${PV}"

LICENSE="bsd-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="app-misc/mosquitto
dev-libs/libbsd
dev-libs/embedlog"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake PREFIX="/" DESTDIR="${D}" install
	newinitd ${FILESDIR}/initd_${PN} ${PN}
	newconfd ${FILESDIR}/confd_${PN} ${PN}
}
