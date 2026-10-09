# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A Bash script for blinking the ThinkPad lid LED in Morse code"
HOMEPAGE="https://sr.ht/~fijarom/thinkmorse/"
EGIT_REPO_URI="https://git.sr.ht/~fijarom/thinkmorse"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE="systemd"

DEPEND="
	systemd? ( sys-apps/systemd )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin thinkmorse

	if use systemd; then
		insinto /etc/systemd/system
		doins systemd/manual/thinkmorse.service
		doins systemd/thinkmorse.timer
	fi
}

pkg_postinst() {
	elog "thinkmorse requires root privileges to write to the ThinkPad LED device."
	elog "Configure the morse message and WPM by editing the script:"
	elog "  /usr/bin/thinkmorse"
	elog ""
	if use systemd; then
		elog "To run thinkmorse at the start of every hour:"
		elog "  sudo systemctl enable --now thinkmorse.timer"
	fi
}
