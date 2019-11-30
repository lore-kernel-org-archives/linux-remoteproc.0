Date: Sat, 30 Nov 2019 11:14:51 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] hwspinlock updates for v5.5
Message-ID: <20191130191448.GC151303@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Baolin Wang <baolin.wang@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.5

for you to fetch changes up to 9d399f0c52951c1acf972bf98ea55ba8798fea7a:

  hwspinlock: u8500_hsem: Remove redundant PM runtime implementation (2019-11-08 16:42:26 -0800)

----------------------------------------------------------------
hwspinlock updates for v5.5

This contains a number of cleanups to the core and several drivers, in
particular removing the requirement for drivers to implement pm_runtime.

It also udpates the location of the git tree in MAINTAINERS.

----------------------------------------------------------------
Baolin Wang (11):
      hwspinlock: u8500_hsem: Change to use devm_platform_ioremap_resource()
      hwspinlock: u8500_hsem: Use devm_kzalloc() to allocate memory
      hwspinlock: u8500_hsem: Use devm_hwspin_lock_register() to register hwlock controller
      hwspinlock: sprd: Change to use devm_platform_ioremap_resource()
      hwspinlock: sprd: Check the return value of clk_prepare_enable()
      hwspinlock: sprd: Use devm_add_action_or_reset() for calls to clk_disable_unprepare()
      hwspinlock: sprd: Use devm_hwspin_lock_register() to register hwlock controller
      hwspinlock: Remove BUG_ON() from the hwspinlock core
      hwspinlock: Let the PM runtime can be optional
      hwspinlock: sprd: Remove redundant PM runtime implementation
      hwspinlock: u8500_hsem: Remove redundant PM runtime implementation

Bjorn Andersson (1):
      MAINTAINERS: hwspinlock: update git tree location

 MAINTAINERS                          |  2 +-
 drivers/hwspinlock/hwspinlock_core.c | 16 +++++------
 drivers/hwspinlock/sprd_hwspinlock.c | 48 +++++++++++++++-----------------
 drivers/hwspinlock/u8500_hsem.c      | 53 ++++++++----------------------------
 4 files changed, 42 insertions(+), 77 deletions(-)
