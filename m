Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 16 Jul 2019 12:01:29 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v5.3
Message-ID: <20190716190129.GB8572@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Fabien Dessenne <fabien.dessenne@st.com>, Clement Leger <cleger@kalray.eu>, Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>, YueHaibing <yuehaibing@huawei.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v5.3

for you to fetch changes up to 93f1d3e4b59cf2e7ef31eaf1131480897b040e97:

  remoteproc: stm32: fix building without ARM SMCC (2019-07-08 07:05:50 -0700)

----------------------------------------------------------------
remoteproc updates for v5.3

This adds support for the STM32 remoteproc, additional i.MX platforms
with Cortex M4 remoteprocs and Qualcomm's QCS404 Compute DSP. Initial
support for vendor specific resource table entries and support for
unprocessed Qualcomm firmware files.

----------------------------------------------------------------
Arnd Bergmann (1):
      remoteproc: stm32: fix building without ARM SMCC

Bjorn Andersson (4):
      dt-bindings: remoteproc: Rename and amend Hexagon v56 binding
      remoteproc: qcom: qdsp6-adsp: Add support for QCS404 CDSP
      soc: qcom: mdt_loader: Support loading non-split images
      remoteproc: qcom: q6v5-mss: Support loading non-split images

Clement Leger (2):
      remoteproc: add vendor resources handling
      remoteproc: copy parent dma_pfn_offset for vdev

Fabien Dessenne (3):
      dt-bindings: stm32: add bindings for ML-AHB interconnect
      dt-bindings: remoteproc: add bindings for stm32 remote processor driver
      remoteproc: stm32: add an ST stm32_rproc driver

Fabio Estevam (2):
      remoteproc: imx: Broaden the Kconfig selection logic
      remoteproc: imx: Fix typo in "failed"

Gustavo A. R. Silva (1):
      remoteproc: Use struct_size() helper

Robert P. J. Day (1):
      remoteproc,rpmsg: add missing MAINTAINERS file entries

YueHaibing (1):
      remoteproc: qcom: q6v5-mss: Fix build error without QCOM_MDT_LOADER

 .../devicetree/bindings/arm/stm32/mlahb.txt        |  37 ++
 .../{qcom,adsp-pil.txt => qcom,hexagon-v56.txt}    |  35 +-
 .../devicetree/bindings/remoteproc/stm32-rproc.txt |  63 +++
 Documentation/remoteproc.txt                       |  14 +-
 MAINTAINERS                                        |   5 +
 drivers/remoteproc/Kconfig                         |  18 +-
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/imx_rproc.c                     |   8 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                |  73 ++-
 drivers/remoteproc/qcom_q6v5_mss.c                 |  33 +-
 drivers/remoteproc/remoteproc_core.c               |  15 +
 drivers/remoteproc/remoteproc_elf_loader.c         |   3 +-
 drivers/remoteproc/remoteproc_internal.h           |  11 +
 drivers/remoteproc/stm32_rproc.c                   | 628 +++++++++++++++++++++
 drivers/soc/qcom/mdt_loader.c                      |  88 ++-
 include/linux/remoteproc.h                         |  32 +-
 include/linux/soc/qcom/mdt_loader.h                |   2 +
 17 files changed, 1009 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt
 rename Documentation/devicetree/bindings/remoteproc/{qcom,adsp-pil.txt => qcom,hexagon-v56.txt} (74%)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
 create mode 100644 drivers/remoteproc/stm32_rproc.c
