Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 5 Jul 2017 16:44:26 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] hwspinlock updates for v4.13
Message-ID: <20170705234426.GC20643@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Baolin Wang <baolin.wang@spreadtrum.com>, Vincent Legoll <vincent.legoll@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/hwlock-v4.13

for you to fetch changes up to 93f66edd440fb5c5c97cb211d8560479520f01af:

  DT: hwspinlock: Add binding documentation for Spreadtrum hwspinlock (2017-05-24 12:25:47 -0700)

----------------------------------------------------------------
hwspinlock updates for v4.13

This introduces a driver for the Spreadtrum hardware spinlock device and cleans
up the Kconfig file.

----------------------------------------------------------------
Baolin Wang (2):
      hwspinlock: sprd: Add hardware spinlock driver
      DT: hwspinlock: Add binding documentation for Spreadtrum hwspinlock

Vincent Legoll (1):
      Make HWSPINLOCK a menuconfig to ease disabling

 .../devicetree/bindings/hwlock/sprd-hwspinlock.txt |  23 +++
 drivers/hwspinlock/Kconfig                         |  26 +--
 drivers/hwspinlock/Makefile                        |   1 +
 drivers/hwspinlock/sprd_hwspinlock.c               | 183 +++++++++++++++++++++
 4 files changed, 222 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt
 create mode 100644 drivers/hwspinlock/sprd_hwspinlock.c
