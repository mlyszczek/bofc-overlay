# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="uid for backups"
ACCT_USER_ID=900
ACCT_USER_HOME="/var/${PN}"
ACCT_USER_GROUPS=( ${PN} )
ACCT_USER_HOME_OWNER="${PN}:${PN}"
ACCT_USER_HOME_PERMS=0700

acct-user_add_deps
