# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# The Debian ca-certificates package merely takes the CA database as it exists
# in the nss package and repackages it for use by openssl.
#
# The issue with using the compiled debs directly is two fold:
# - they do not update frequently enough for us to rely on them
# - they pull the CA database from nss tip of tree rather than the release
#
# So we take the Debian source tools and combine them with the latest nss
# release to produce (largely) the same end result.  The difference is that
# now we know our cert database is kept in sync with nss and, if need be,
# can be sync with nss tip of tree more frequently to respond to bugs.

# When triaging bugs from users, here's some handy tips:
# - To see what cert is hitting errors, use openssl:
#   openssl s_client -port 443 -CApath /etc/ssl/certs/ -host $HOSTNAME
#   Focus on the errors written to stderr.
#
# - Look at the upstream log as to why certs were added/removed:
#   https://hg.mozilla.org/projects/nss/log/tip/lib/ckfw/builtins/certdata.txt
#
# - If people want to add/remove certs, tell them to file w/mozilla:
#   https://bugzilla.mozilla.org/enter_bug.cgi?product=NSS&component=CA%20Certificates&version=trunk

EAPI=6

inherit eutils

DESCRIPTION="Bits of Code CA Certificates PEM files"
HOMEPAGE="https://en.bofc.pl"
LICENSE="BSDv2"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k mips ppc ppc64 riscv s390 sh sparc x86"
IUSE=""
S="${WORKDIR}"

src_install() {
	mkdir -p "${D}/usr/local/share/ca-certificates"
	cp "${FILESDIR}/kurwinet.pl.httpd.ca.crt" \
			"${D}/usr/local/share/ca-certificates"
	cp "${FILESDIR}/kurwinet.pl.vpn.ca.crt" \
			"${D}/usr/local/share/ca-certificates"
}

pkg_postinst() {
	"${EROOT%/}"/usr/sbin/update-ca-certificates --root "${ROOT}"
}
