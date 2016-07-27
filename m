Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 27 Jul 2016 12:11:35 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v4.8
Message-ID: <20160727191135.GM13516@tuxbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit af8c34ce6ae32addda3788d54a7e340cad22516b:

  Linux 4.7-rc2 (2016-06-05 14:31:26 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.8

for you to fetch changes up to 72beb49070463147e29d4aea6aca9ec5684138e9:

  remoteproc: qcom: hexagon: Clean up mpss validation (2016-07-14 20:11:36 -0700)

----------------------------------------------------------------
remoteproc updates for v4.8

Introduce remoteproc driver for controlling the modem/DSP Hexagon CPU
found in a multitude of Qualcomm platform. Also cleans up a race
condition/potential leak during registration of remoteprocs and includes
devicetree bindings in the MAINTAINERS entry.

----------------------------------------------------------------
Bjorn Andersson (3):
      dt-binding: remoteproc: Introduce Hexagon loader binding
      remoteproc: qcom: Driver for the self-authenticating Hexagon v5
      remoteproc: qcom: hexagon: Clean up mpss validation

Dave Gerlach (1):
      remoteproc: Fix potential race condition in rproc_add

Geert Uytterhoeven (1):
      MAINTAINERS: Add file patterns for remoteproc device tree bindings

Wei Yongjun (1):
      remoteproc: qcom: remove redundant dev_err call in q6v5_init_mem()

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 137 ++++
 MAINTAINERS                                        |   3 +-
 drivers/remoteproc/Kconfig                         |  14 +
 drivers/remoteproc/Makefile                        |   2 +
 drivers/remoteproc/qcom_mdt_loader.c               | 179 ++++
 drivers/remoteproc/qcom_mdt_loader.h               |  13 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 908 +++++++++++++++++++++
 drivers/remoteproc/remoteproc_core.c               |  15 +-
 8 files changed, 1264 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
 create mode 100644 drivers/remoteproc/qcom_mdt_loader.c
 create mode 100644 drivers/remoteproc/qcom_mdt_loader.h
 create mode 100644 drivers/remoteproc/qcom_q6v5_pil.c
