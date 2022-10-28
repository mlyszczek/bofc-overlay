# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="scripts for meh"
HOMEPAGE="https://git.bofc.pl/bofc-scripts/"

EGIT_REPO_URI="git://git.kurwinet.pl/bofc-scripts"

LICENSE="bsd-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="app-shells/bash
app-shells/zsh"
RDEPEND="${DEPEND}"
BDEPEND=""
