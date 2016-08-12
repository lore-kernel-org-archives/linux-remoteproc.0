Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 00/13] various remoteproc/rpmsg trivial cleanups
Date: Fri, 12 Aug 2016 18:42:15 -0500
Message-ID: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

Following are a bunch of trivial cleanups in remoteproc core, rpmsg
bus core and couple of cleanups in OMAP remoteproc driver. The patches
are baselined on 4.8-rc1 + your rproc-next branch.

The only non-cleanup patches are the last two patches - the first of
which switches a hex_dump to a dynamic hex dump, and the second one is
a fix to rpmsg client sample to scale for multiple instances when you
have more than one remoteproc publishing the same rpmsg channel.

regards
Suman

Suman Anna (13):
  remoteproc: use proper format-specifier for printing dma_addr_t
  remoteproc: fix couple of minor typos
  remoteproc: use variable names for sizeof() operator
  remoteproc: fix bare unsigned type usage
  remoteproc: align code with open parenthesis
  remoteproc: print hex numbers with a leading 0x format
  remoteproc/omap: fix various code formatting issues
  remoteproc/omap: revise a minor error trace message
  rpmsg: remove pointless OOM prints
  rpmsg: use proper format-specifier for printing dma_addr_t
  rpmsg: align code with open parenthesis
  rpmsg: use dynamic_hex_dump for hex dump traces
  samples/rpmsg: add support for multiple instances

 drivers/remoteproc/da8xx_remoteproc.c         |  2 +-
 drivers/remoteproc/omap_remoteproc.c          |  5 +-
 drivers/remoteproc/remoteproc_core.c          | 51 ++++++++++-----------
 drivers/remoteproc/remoteproc_debugfs.c       | 20 ++++----
 drivers/remoteproc/remoteproc_elf_loader.c    |  6 +--
 drivers/remoteproc/remoteproc_internal.h      | 15 +++---
 drivers/remoteproc/remoteproc_virtio.c        | 22 ++++-----
 drivers/rpmsg/virtio_rpmsg_bus.c              | 66 +++++++++++++--------------
 include/linux/platform_data/remoteproc-omap.h |  6 +--
 include/linux/remoteproc.h                    |  6 +--
 include/linux/rpmsg.h                         |  6 +--
 samples/rpmsg/rpmsg_client_sample.c           | 18 ++++++--
 12 files changed, 118 insertions(+), 105 deletions(-)

-- 
2.9.0
