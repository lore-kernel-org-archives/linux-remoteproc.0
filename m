Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 11 Jun 2018 11:23:17 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] hwspinlock updates for v4.18
Message-ID: <20180611182317.GC3206@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>, Baolin Wang <baolin.wang@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/hwlock-v4.18

for you to fetch changes up to e759176c7f6b6d84a31276e11d687f232f6e4ecf:

  hwspinlock/u8500: Switch to SPDX license identifier (2018-05-24 12:05:11 -0700)

----------------------------------------------------------------
hwspinlock updates for v4.18

In addition to migrating the files to use SPDX license headers this
introduces the ability for clients to operate a hwlock without the
framework taking any additional locks.

----------------------------------------------------------------
Baolin Wang (2):
      hwspinlock: Convert to use 'switch' statement
      hwspinlock: Introduce one new mode for hwspinlock

Suman Anna (6):
      hwspinlock/core: Switch to SPDX license identifier
      hwspinlock/omap: Switch to SPDX license identifier
      hwspinlock: qcom: Switch to SPDX license identifier
      hwspinlock/sirf: Switch to SPDX license identifier
      hwspinlock: sprd: Switch to SPDX license identifier
      hwspinlock/u8500: Switch to SPDX license identifier

 drivers/hwspinlock/Kconfig               |  1 +
 drivers/hwspinlock/hwspinlock_core.c     | 77 +++++++++++++++++++++-----------
 drivers/hwspinlock/hwspinlock_internal.h | 10 +----
 drivers/hwspinlock/omap_hwspinlock.c     | 10 +----
 drivers/hwspinlock/qcom_hwspinlock.c     | 10 +----
 drivers/hwspinlock/sirf_hwspinlock.c     |  3 +-
 drivers/hwspinlock/sprd_hwspinlock.c     | 10 +----
 drivers/hwspinlock/u8500_hsem.c          | 10 +----
 include/linux/hwspinlock.h               | 68 ++++++++++++++++++++++++----
 9 files changed, 118 insertions(+), 81 deletions(-)
