Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 17 Aug 2018 14:45:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] hwspinlock updates for v4.19
Message-ID: <20180817214522.GC3941@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Baolin Wang <baolin.wang@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/hwlock-v4.19

for you to fetch changes up to ddb34f480d1b8051bc18e6ff22e93a6c9a33f94f:

  hwspinlock: Fix incorrect return pointers (2018-07-30 20:54:51 -0700)

----------------------------------------------------------------
hwspinlock updates for v4.19

This introduces devres helpers and an API to request a lock by name,
then migrates the sprd SPI driver to use these.

----------------------------------------------------------------
Baolin Wang (8):
      hwspinlock: Add one new API to support getting a specific hwlock by the name
      hwspinlock: Add devm_xxx() APIs to request/free hwlock
      hwspinlock: Add devm_xxx() APIs to register/unregister one hwlock controller
      hwspinlock: Remove redundant config
      hwspinlock: Fix one comment mistake
      spi: sprd: Replace of_hwspin_lock_get_id() with of_hwspin_lock_get_id_byname()
      spi: sprd: Change to use devm_hwspin_lock_request_specific()
      hwspinlock: Fix incorrect return pointers

 drivers/hwspinlock/hwspinlock_core.c | 223 ++++++++++++++++++++++++++++++++++-
 drivers/spi/spi-sprd-adi.c           |  11 +-
 include/linux/hwspinlock.h           |  37 +++++-
 3 files changed, 262 insertions(+), 9 deletions(-)
