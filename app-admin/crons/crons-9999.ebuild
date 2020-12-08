# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Some cron jobs to automate admins live"
HOMEPAGE="https://git.bofc.pl/crons/"

# fix when version is released
#if [[ ${PV} == *9999 ]] ; then
	EGIT_REPO_URI="https://git.bofc.pl/crons"
	inherit git-r3
#fi

LICENSE="bsd-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="acct-group/backup
acct-user/backup
app-shells/bash"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake PREFIX="/" DESTDIR="${D}" install
}
