Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 16 Jul 2019 12:01:53 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] hwspinlock updates for v5.3
Message-ID: <20190716190153.GC8572@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/hwlock-v5.3

for you to fetch changes up to 360aa640a59f269b784848c0b2d6d462952750d9:

  hwspinlock: add the 'in_atomic' API (2019-06-29 21:08:14 -0700)

----------------------------------------------------------------
hwspinlock updates for v5.3

This contains support for hardware spinlock TI K3 AM65x and J721E family
of SoCs, support for using hwspinlocks from atomic context and better
error reporting when dealing with hardware disabled in DeviceTree.

----------------------------------------------------------------
Fabien Dessenne (4):
      hwspinlock: ignore disabled device
      hwspinlock: stm32: implement the relax() ops
      hwspinlock: document the hwspinlock 'raw' API
      hwspinlock: add the 'in_atomic' API

Suman Anna (3):
      dt-bindings: hwlock: Update OMAP binding for TI K3 SoCs
      hwspinlock/omap: Add support for TI K3 SoCs
      hwspinlock/omap: Add a trace during probe

 .../devicetree/bindings/hwlock/omap-hwspinlock.txt | 25 +++++--
 Documentation/hwspinlock.txt                       | 81 ++++++++++++++++++++++
 drivers/hwspinlock/Kconfig                         |  2 +-
 drivers/hwspinlock/hwspinlock_core.c               | 48 +++++++++----
 drivers/hwspinlock/omap_hwspinlock.c               |  4 ++
 drivers/hwspinlock/stm32_hwspinlock.c              |  7 ++
 include/linux/hwspinlock.h                         | 61 +++++++++++++++-
 7 files changed, 206 insertions(+), 22 deletions(-)
