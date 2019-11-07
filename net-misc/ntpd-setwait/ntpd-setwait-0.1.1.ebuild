# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="syncs time and runs ntpd of users choosing"
HOMEPAGE="https://ntpd-setwait.bofc.pl/"
SRC_URI="https://distfiles.bofc.pl/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-misc/openntpd"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	default
	newinitd "${FILESDIR}"/ntpd-setwait.rc6 ntpd-setwait
	newconfd "${FILESDIR}"/ntpd-setwait.confd ntpd-setwait
}
