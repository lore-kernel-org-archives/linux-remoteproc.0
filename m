Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 16 May 2016 17:24:24 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v4.7
Message-ID: <20160517002424.GM1256@tuxbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 9735a22799b9214d17d3c231fe377fc852f042e9:

  Linux 4.6-rc2 (2016-04-03 09:09:40 -0500)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.7

for you to fetch changes up to b3d39032d7b33029373fbce6459aff6ac316e130:

  remoteproc: Add additional crash reasons (2016-05-12 15:50:19 -0700)

----------------------------------------------------------------
remoteproc updates for v4.7

Introduces a synchronization point between the async firmware loading
and clients requesting the remote processor to boot, as well as support
for remote processors that are not interested in the resource table
information.

----------------------------------------------------------------
Bjorn Andersson (2):
      remoteproc: core: Make the loaded resource table optional
      remoteproc: Add additional crash reasons

Lee Jones (1):
      remoteproc: core: Task sync during rproc_fw_boot()

 drivers/remoteproc/remoteproc_core.c     | 39 +++++++++++++++++++++++++-------
 drivers/remoteproc/remoteproc_internal.h |  1 +
 drivers/remoteproc/remoteproc_virtio.c   |  2 +-
 include/linux/remoteproc.h               |  4 ++++
 4 files changed, 37 insertions(+), 9 deletions(-)
