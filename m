Date: Sat, 30 Nov 2019 11:13:34 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v5.5
Message-ID: <20191130191330.GA151303@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>, Clement Leger <cleger@kalray.eu>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ding Xiang <dingxiang@cmss.chinamobile.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.5

for you to fetch changes up to e3cb40d4d80516a8f4e9afaebe4d672821a2c97b:

  Revert "dt-bindings: remoteproc: stm32: add wakeup-source" (2019-11-30 10:41:03 -0800)

----------------------------------------------------------------
remoteproc updates for v5.5

This adds support for booting the modem processor on Qualcomm MSM8998
and carries some cleanup up and bug fixes to the framework and the stm32
driver.

----------------------------------------------------------------
Arnaud Pouliquen (1):
      remoteproc: stm32: use workqueue to treat mailbox callback

Ben Dooks (Codethink) (1):
      remoteproc: fix argument 2 of rproc_mem_entry_init

Bjorn Andersson (1):
      Revert "dt-bindings: remoteproc: stm32: add wakeup-source"

Clement Leger (2):
      remoteproc: remove useless typedef
      remoteproc: Fix wrong rvring index computation

Ding Xiang (1):
      remoteproc: debug: Remove unneeded NULL check

Fabien Dessenne (3):
      dt-bindings: remoteproc: stm32: add wakeup-source
      remoteproc: stm32: wakeup the system by wdg irq
      remoteproc: stm32: fix probe error case

Jeffrey Hugo (2):
      dt-bindings: remoteproc: qcom: Add Q6v5 Modem PIL binding for MSM8998
      remoteproc: qcom_q6v5_mss: Add support for MSM8998

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   6 ++
 drivers/remoteproc/qcom_q6v5_mss.c                 |  52 +++++++++--
 drivers/remoteproc/remoteproc_core.c               |   9 +-
 drivers/remoteproc/remoteproc_debugfs.c            |   3 -
 drivers/remoteproc/stm32_rproc.c                   | 100 +++++++++++++++++++--
 5 files changed, 149 insertions(+), 21 deletions(-)
