Date: Sat, 30 Nov 2019 11:14:27 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v5.5
Message-ID: <20191130191423.GB151303@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Lew <clew@codeaurora.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Krzysztof Kozlowski <krzk@kernel.org>, Navid Emamdoost <navid.emamdoost@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.5

for you to fetch changes up to 8cf9b615653e40debdcf3b6f1d69e6b580d71173:

  rpmsg: Fix Kconfig indentation (2019-11-21 10:04:49 -0800)

----------------------------------------------------------------
rpmsg updates for v5.5

This contains a number of bug fixes to the GLINK transport driver, an
off-by-one in the GLINK smem driver and a memory leak fix in the rpmsg
char driver.

----------------------------------------------------------------
Arun Kumar Neelakantam (2):
      rpmsg: glink: Fix reuse intents memory leak issue
      rpmsg: glink: Fix use after free in open_ack TIMEOUT case

Bjorn Andersson (2):
      rpmsg: glink: Don't send pending rx_done during remove
      rpmsg: glink: Free pending deferred work on remove

Chris Lew (3):
      rpmsg: glink: Set tail pointer to 0 at end of FIFO
      rpmsg: glink: Put an extra reference during cleanup
      rpmsg: glink: Fix rpmsg_register_device err handling

Christophe JAILLET (1):
      rpmsg: char: Simplify 'rpmsg_eptdev_release()'

Krzysztof Kozlowski (1):
      rpmsg: Fix Kconfig indentation

Navid Emamdoost (1):
      rpmsg: char: release allocated memory

 drivers/rpmsg/Kconfig             |  2 +-
 drivers/rpmsg/qcom_glink_native.c | 53 +++++++++++++++++++++++++++++++--------
 drivers/rpmsg/qcom_glink_smem.c   |  2 +-
 drivers/rpmsg/rpmsg_char.c        | 12 ++++-----
 4 files changed, 49 insertions(+), 20 deletions(-)
