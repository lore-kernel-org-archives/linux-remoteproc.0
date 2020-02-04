Date: Mon, 3 Feb 2020 21:34:59 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] hwspinlock updates for v5.6
Message-ID: <20200204053455.GA130281@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Baolin Wang <baolin.wang7@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.6

for you to fetch changes up to cb36017a8b1b582bcb7063e44c598c3e36aa0228:

  hwspinlock: sirf: Use devm_hwspin_lock_register() to register hwlock controller (2020-01-21 16:16:36 -0800)

----------------------------------------------------------------
hwspinlock updates for v5.6

This continues the transition of drivers to device managed resources and
removal of unnecessary PM runtime integration, with cleanups to the
SIRF, OMAP and Qualcomm hwspinlock drivers. It also adds Baolin as
reviewer in MAINTAINERS.

----------------------------------------------------------------
Baolin Wang (8):
      MAINTAINERS: Add myself as reviewer for the hwspinlock subsystem
      hwspinlock: qcom: Remove redundant PM runtime functions
      hwspinlock: qcom: Use devm_hwspin_lock_register() to register hwlock controller
      hwspinlock: omap: Change to use devm_platform_ioremap_resource()
      hwspinlock: omap: Use devm_kzalloc() to allocate memory
      hwspinlock: sirf: Change to use devm_platform_ioremap_resource()
      hwspinlock: sirf: Remove redundant PM runtime functions
      hwspinlock: sirf: Use devm_hwspin_lock_register() to register hwlock controller

Yangtao Li (1):
      hwspinlock: stm32: convert to devm_platform_ioremap_resource

 MAINTAINERS                           |  1 +
 drivers/hwspinlock/omap_hwspinlock.c  | 32 +++++++++---------------
 drivers/hwspinlock/qcom_hwspinlock.c  | 28 ++-------------------
 drivers/hwspinlock/sirf_hwspinlock.c  | 46 ++++++-----------------------------
 drivers/hwspinlock/stm32_hwspinlock.c |  4 +--
 5 files changed, 22 insertions(+), 89 deletions(-)
