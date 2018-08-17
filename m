Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 17 Aug 2018 14:44:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v4.19
Message-ID: <20180817214422.GA3941@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Loic Pallardy <loic.pallardy@st.com>, Sricharan R <sricharan@codeaurora.org>, Suman Anna <s-anna@ti.com>, Alex Elder <elder@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.19

for you to fetch changes up to b2201ee554a5811f569f31280b0079e7d6177606:

  remoteproc/davinci: use the reset framework (2018-08-16 17:39:55 -0700)

----------------------------------------------------------------
remoteproc updates for v4.19

This adds support for pre-start and post-shutdown hooks for remoteproc
subdevices, refactors the Qualcomm Hexagon support to allow reuse
between several drivers, makes authentication in the MDT file loader
optional, migrates a few format strings to use %pK and migrates the
Davinci driver to use the reset framework.

----------------------------------------------------------------
Alex Elder (1):
      remoteproc: rename subdev probe and remove functions

Arnd Bergmann (2):
      remoteproc: qcom q6v5: fix modular build
      remoteproc: qcom: fix Q6V5_WCSS dependencies

Bartosz Golaszewski (1):
      remoteproc/davinci: use the reset framework

Bjorn Andersson (7):
      remoteproc: q6v5: Extract common resource handling
      remoteproc: qcom: adsp: Use common q6v5 helpers
      remoteproc: qcom: q6v5-pil: Use common q6v5 helpers
      remoteproc: Rename subdev functions to start/stop
      remoteproc: Make start and stop in subdev optional
      remoteproc: Make client initialize ops in rproc_subdev
      remoteproc: Introduce prepare and unprepare for subdevices

Loic Pallardy (2):
      remoteproc: replace "%p" with "%pK"
      remoteproc: st_slim: replace "%p" with "%pK"

Sibi Sankar (1):
      remoteproc: qcom: q6v5-pil: fix modem hang on SDM845 after axis2 clk unvote

Sricharan R (2):
      remoteproc: qcom: mdt_loader: Make the firmware authentication optional
      remoteproc: qcom: Introduce Hexagon V5 based WCSS driver

Suman Anna (2):
      remoteproc: Reset table_ptr in rproc_start() failure paths
      remoteproc/davinci: Mark error recovery as disabled

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   7 +-
 drivers/remoteproc/Kconfig                         |  23 +
 drivers/remoteproc/Makefile                        |   2 +
 drivers/remoteproc/da8xx_remoteproc.c              |  37 +-
 drivers/remoteproc/qcom_adsp_pil.c                 | 156 +-----
 drivers/remoteproc/qcom_common.c                   |  26 +-
 drivers/remoteproc/qcom_q6v5.c                     | 252 +++++++++
 drivers/remoteproc/qcom_q6v5.h                     |  46 ++
 drivers/remoteproc/qcom_q6v5_pil.c                 | 158 +-----
 drivers/remoteproc/qcom_q6v5_wcss.c                | 601 +++++++++++++++++++++
 drivers/remoteproc/qcom_sysmon.c                   |   5 +-
 drivers/remoteproc/remoteproc_core.c               | 117 ++--
 drivers/remoteproc/remoteproc_debugfs.c            |   4 +-
 drivers/remoteproc/remoteproc_virtio.c             |   2 +-
 drivers/remoteproc/st_slim_rproc.c                 |   3 +-
 drivers/soc/qcom/mdt_loader.c                      |  87 ++-
 include/linux/remoteproc.h                         |  19 +-
 include/linux/soc/qcom/mdt_loader.h                |   4 +
 18 files changed, 1188 insertions(+), 361 deletions(-)
 create mode 100644 drivers/remoteproc/qcom_q6v5.c
 create mode 100644 drivers/remoteproc/qcom_q6v5.h
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss.c
