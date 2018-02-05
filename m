Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 5 Feb 2018 09:36:35 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v4.16
Message-ID: <20180205173635.GA17344@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, weiping zhang <zhangweiping@didichuxing.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.16

for you to fetch changes up to 0a8b81cb2e413eff4cd9aeac7ef415150b699fb4:

  remoteproc: Reset table_ptr on stop (2018-01-15 09:30:04 -0800)

----------------------------------------------------------------
remoteproc updates for v4.16

This contains a few bug fixes and a cleanup up of the resource-table handling
in the framework, which removes the need for drivers with no resource table to
provide a fake one.

----------------------------------------------------------------
Bjorn Andersson (8):
      remoteproc: Remove depricated crash completion
      remoteproc: Cache resource table size
      remoteproc: Clone rproc_ops in rproc_alloc()
      remoteproc: Merge rproc_ops and rproc_fw_ops
      remoteproc: Don't handle empty resource table
      remoteproc: Move resource table load logic to find
      remoteproc: Drop dangling find_rsc_table dummies
      remoteproc: Reset table_ptr on stop

weiping zhang (1):
      virtio_remoteproc: correct put_device virtio_device.dev

 drivers/remoteproc/qcom_adsp_pil.c         |  8 +--
 drivers/remoteproc/qcom_common.c           | 19 -------
 drivers/remoteproc/qcom_common.h           |  4 --
 drivers/remoteproc/qcom_q6v5_pil.c         | 18 +------
 drivers/remoteproc/qcom_wcnss.c            |  8 +--
 drivers/remoteproc/remoteproc_core.c       | 83 ++++++++++++------------------
 drivers/remoteproc/remoteproc_elf_loader.c | 59 ++++++++++-----------
 drivers/remoteproc/remoteproc_internal.h   | 57 +++++++-------------
 drivers/remoteproc/remoteproc_virtio.c     |  2 +-
 drivers/remoteproc/st_slim_rproc.c         | 32 ++----------
 include/linux/remoteproc.h                 | 21 ++++++--
 11 files changed, 107 insertions(+), 204 deletions(-)
