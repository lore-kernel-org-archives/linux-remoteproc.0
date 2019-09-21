Date: Sat, 21 Sep 2019 09:59:17 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v5.4
Message-ID: <20190921165912.GB6693@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc tags/rpmsg-v5.4

for you to fetch changes up to 9fe69a725e238ac279027f0132e50617a63b847d:

  rpmsg: glink-smem: Name the edge based on parent remoteproc (2019-09-17 15:33:31 -0700)

----------------------------------------------------------------
rpmsg updates for v5.4

This contains updates to make the rpmsg sample driver more useful, fixes
the naming of GLINK devices to avoid naming collisions and a few minor
bug fixes.  It also updates MAINTAINERS to reflect the move to
kernel.org.

----------------------------------------------------------------
Bjorn Andersson (1):
      rpmsg: glink-smem: Name the edge based on parent remoteproc

Gustavo A. R. Silva (1):
      rpmsg: glink: Use struct_size() helper

Pierre-Louis Bossart (2):
      rpmsg: core: fix comments
      MAINTAINERS: rpmsg: fix git tree location

Suman Anna (3):
      samples/rpmsg: Replace print_hex_dump() with print_hex_dump_debug()
      samples/rpmsg: Introduce a module parameter for message count
      rpmsg: virtio_rpmsg_bus: replace "%p" with "%pK"

 MAINTAINERS                         |  2 +-
 drivers/rpmsg/qcom_glink_native.c   |  2 +-
 drivers/rpmsg/qcom_glink_smem.c     |  2 +-
 drivers/rpmsg/rpmsg_core.c          |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h      |  5 +++--
 drivers/rpmsg/virtio_rpmsg_bus.c    |  2 +-
 samples/rpmsg/rpmsg_client_sample.c | 10 ++++++----
 7 files changed, 17 insertions(+), 14 deletions(-)
