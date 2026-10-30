# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo git-r3

DESCRIPTION="Clear your terminal with a rain of braille glyphs that converges, fades and vanishes."
HOMEPAGE="https://codeberg.org/ftranschel/neoclear"
EGIT_REPO_URI="https://codeberg.org/ftranschel/neoclear.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_install() {
	cargo_src_install
}
