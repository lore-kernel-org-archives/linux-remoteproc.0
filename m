Return-Path: <bjorn.andersson@linaro.org>
Date: Sat, 2 Apr 2016 16:28:24 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] fix for v4.6-rc1
Message-ID: <20160402232824.GB391@tuxbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc.git tags/rproc-v4.6-rc1

for you to fetch changes up to d75868496ca0af1685f31726d8f5b5037c092a7a:

  MAINTAINERS: Add mailing list for remote processor subsystems (2016-03-29 07:05:24 -0700)

----------------------------------------------------------------
remoteproc fix for v4.6-rc1

Fix incorrect error check in the ST remoteproc driver and advertise the newly
created linux-remoteproc mailing list.

----------------------------------------------------------------
Bjorn Andersson (1):
      MAINTAINERS: Add mailing list for remote processor subsystems

Vladimir Zapolskiy (1):
      remoteproc: st: fix check of syscon_regmap_lookup_by_phandle() return value

 MAINTAINERS                        | 3 +++
 drivers/remoteproc/st_remoteproc.c | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)
