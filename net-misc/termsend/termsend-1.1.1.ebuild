# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools user

DESCRIPTION="Server to share files from command line with netcat."
HOMEPAGE="https://termsend.termsend.pl"
SRC_URI="https://distfiles.bofc.pl/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/embedlog-0.5.0"
RDEPEND="${DEPEND}"

pkg_preinst() {
	enewuser "${PN}"
}

src_install() {
	default
	newinitd "${FILESDIR}"/termsend.rc6 termsend
	newconfd "${FILESDIR}"/termsend.confd termsend
}
