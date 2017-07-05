Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 5 Jul 2017 16:43:54 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v4.13
Message-ID: <20170705234354.GB20643@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>, Sarangdhar Joshi <spjoshi@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>, Colin Ian King <colin.king@canonical.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.13

for you to fetch changes up to b0af7b7dbedd45367f8f1d91049c30b251ad528f:

  remoteproc/keystone: Fix circular dependencies for ARM configs (2017-06-27 16:21:34 -0700)

----------------------------------------------------------------
remoteproc updates for v4.13

This introduces the Keystone 2 DSP driver and refactors the start/stop code in
recovery. The Davinci DSP driver gets a few fixes and the Kconfig gets cleaned
up.

----------------------------------------------------------------
Andrew F. Davis (1):
      remoteproc/keystone: Ensure the DSPs are in reset in probe

Colin Ian King (1):
      remoteproc: fix spelling mistake: "Resouce" -> "Resource"

Sarangdhar Joshi (2):
      remoteproc: Introduce rproc_{start,stop}() functions
      remoteproc: Modify recovery path to use rproc_{start,stop}()

Suman Anna (8):
      remoteproc/davinci: Update Kconfig to depend on DMA_CMA
      remoteproc/davinci: simplify the reset function
      remoteproc/davinci: fix unbalanced reset between start and stop ops
      dt-bindings: remoteproc: Add Keystone DSP remoteproc binding
      remoteproc/keystone: Add a remoteproc driver for Keystone 2 DSPs
      remoteproc: Drop VIRTUALIZATION dependency from REMOTEPROC
      remoteproc: Drop redundant REMOTEPROC dependency from driver Kconfigs
      remoteproc/keystone: Fix circular dependencies for ARM configs

 .../bindings/remoteproc/ti,keystone-rproc.txt      | 133 ++++++
 drivers/remoteproc/Kconfig                         |  22 +-
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/da8xx_remoteproc.c              |  32 +-
 drivers/remoteproc/keystone_remoteproc.c           | 525 +++++++++++++++++++++
 drivers/remoteproc/remoteproc_core.c               | 178 ++++---
 6 files changed, 787 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
 create mode 100644 drivers/remoteproc/keystone_remoteproc.c
