Date: Wed, 1 Apr 2020 18:08:40 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] hwspinlock updates for v5.7
Message-ID: <20200402010837.GB751391@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Baolin Wang <baolin.wang7@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/hwlock-v5.7

for you to fetch changes up to ef17f5193edd42e8913c93d0b601c101c56a15bb:

  hwspinlock: hwspinlock_internal.h: Replace zero-length array with flexible-array member (2020-03-25 22:30:46 -0700)

----------------------------------------------------------------
hwspinlock updates for v5.7

This marks all hwspinlock driver COMPILE_TESTable and replaces the zero-length
array in hwspinlock_device with a flexible-array member.

----------------------------------------------------------------
Baolin Wang (1):
      hwspinlock: Allow drivers to be built with COMPILE_TEST

Gustavo A. R. Silva (1):
      hwspinlock: hwspinlock_internal.h: Replace zero-length array with flexible-array member

 drivers/hwspinlock/Kconfig               | 12 ++++++------
 drivers/hwspinlock/hwspinlock_internal.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
