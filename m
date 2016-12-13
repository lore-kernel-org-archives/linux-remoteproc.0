Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 12 Dec 2016 16:12:04 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v4.10
Message-ID: <20161213001204.GB3439@tuxbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Linus,

Here are the changes to remoteproc for v4.10. I had to pull an immutable
branch from Vinod to include the ST FDMA dma driver in order to sort out
the Kconfig dependencies between the two subsystems.

Regards,
Bjorn

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.10

for you to fetch changes up to e2a32b6bb59c3274f466559b897d0d6acded507d:

  remoteproc: qcom_adsp_pil: select qcom_scm (2016-12-09 16:16:56 -0800)

----------------------------------------------------------------
remoteproc updates for v4.10

Introduces remoteproc "subdevice" support, which allows remoteproc
driver to associate devices to the "running" state of the remoteproc,
allowing devices to be probed and removed as the remote processor is
booted, shut down or recovering from a crash.

Handling of virtio device resources was improved, vring memory is now
allocated as part of other memory allocation. This ensures that all
vrings for all virtio devices are allocated before we boot the remote
processor.

The debugfs mechanism for starting and stopping remoteproc instances was
replaced with a sysfs interface, also providing a mechanism for
specifying firmware to use by the instance. This allows user space to
load and boot use case specific firmware on remote processors.

New drivers for the ST Slimcore and Qualcomm Hexagon DSP as well as
removal of the unused StE modem loader.

Finally support for crash recovery in the Qualcomm Wirelss subsystem
(used for WiFi/BT/FM on a number of platforms) and a number of bug fixes
and cleanups.

----------------------------------------------------------------
Arnd Bergmann (5):
      dmaengine: st_fdma: fix uninitialized variable access
      remoteproc: adsp-pil: fix recursive dependency
      remoteproc: wcnss-pil: add QCOM_SMD dependency
      remoteproc: qcom_adsp_pil: select qcom_scm
      remoteproc: qcom_adsp_pil: select qcom_scm

Bjorn Andersson (21):
      remoteproc: Introduce subdevices
      rpmsg: smd: Expose edge registration functions
      remoteproc: wcnss: Bond SMD edge to remoteproc
      dt-binding: remoteproc: wcnss: Allow describing smd edge
      remoteproc: Assign kref to rproc_vdev
      remoteproc: virtio: Anchor vring life cycle in vdev
      remoteproc: Further extend the vdev life cycle
      remoteproc: Decouple vdev resources and devices
      remoteproc: Update max_notifyid as we allocate vrings
      remoteproc: Remove custom vdev handler list
      remoteproc: Merge table_ptr and cached_table pointers
      remoteproc: qcom_wcnss: Fix circular module dependency
      dt-binding: remoteproc: Introduce ADSP loader binding
      remoteproc: Introduce Qualcomm ADSP PIL
      Merge branch 'topic/st_fdma' of git://git.kernel.org/.../vkoul/slave-dma into rproc-next
      Merge branch 'topic/st_fdma' of git://git.kernel.org/.../vkoul/slave-dma into rproc-next
      remoteproc: qcom: adsp: Add missing MODULE_DEVICE_TABLE
      remoteproc: Update last rproc_put users to rproc_free
      dt-binding: soc: qcom: smd: Add label property
      remoteproc: Remove "experimental" warning
      remoteproc: Drop wait in __rproc_boot()

Javier Martinez Canillas (3):
      remoteproc: qcom: q6v5_pil: Fix module autoload
      remoteproc: qcom: wcnss: Fix module autoload
      remoteproc: qcom: wcnss_iris: Fix module autoload

Jean Delvare (1):
      remoteproc/ste: Delete unused driver

Matt Redfearn (3):
      remoteproc: Keep local copy of firmware name
      remoteproc: Add a sysfs interface for firmware and state
      remoteproc: debugfs: Remove state entry which is duplicated is sysfs

Peter Griffin (12):
      remoteproc: st_slim_rproc: add a slimcore rproc driver
      MAINTAINERS: Add st slim core rproc driver to STi section.
      remoteproc: Update Kconfig setup to 'depends on REMOTEPROC'
      dmaengine: st_fdma: Add STMicroelectronics FDMA DT binding documentation
      dmaengine: st_fdma: Add STMicroelectronics FDMA driver header file
      dmaengine: st_fdma: Add STMicroelectronics FDMA engine driver support
      MAINTAINERS: Add FDMA driver files to STi section.
      ARM: multi_v7_defconfig: Enable remoteproc core
      ARM: multi_v7_defconfig: Enable st_remoteproc driver.
      ARM: multi_v7_defconfig: Enable STi FDMA driver
      ARM: multi_v7_defconfig: Enable STi and simple-card drivers.
      dmaengine: st_fdma: Update st_fdma to 'depends on REMOTEPROC'.

Sarangdhar Joshi (1):
      remoteproc: Add support for xo clock

Stanimir Varbanov (1):
      remoteproc: qcom: mdt_loader: add include for sizes

Vinod Koul (2):
      dmaengine: st_fdma: Revert: Update st_fdma to 'depends on REMOTEPROC'
      dmaengine: st_fdma: Revert: "Revert: Update st_fdma to 'depends on REMOTEPROC'"

Wei Yongjun (2):
      dmaengine: st_fdma: Fix the error return code in st_fdma_probe()
      remoteproc: st: Fix error return code in st_rproc_probe()

 Documentation/ABI/testing/sysfs-class-remoteproc   |  50 ++
 Documentation/devicetree/bindings/dma/st_fdma.txt  |  87 ++
 .../devicetree/bindings/remoteproc/qcom,adsp.txt   |  98 +++
 .../bindings/remoteproc/qcom,wcnss-pil.txt         |  30 +-
 .../devicetree/bindings/soc/qcom/qcom,smd.txt      |   7 +
 MAINTAINERS                                        |   3 +
 arch/arm/configs/multi_v7_defconfig                |   6 +
 drivers/dma/Kconfig                                |  14 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/st_fdma.c                              | 889 +++++++++++++++++++++
 drivers/dma/st_fdma.h                              | 249 ++++++
 drivers/remoteproc/Kconfig                         |  52 +-
 drivers/remoteproc/Makefile                        |   9 +-
 drivers/remoteproc/qcom_adsp_pil.c                 | 428 ++++++++++
 drivers/remoteproc/qcom_mdt_loader.c               |   1 +
 drivers/remoteproc/qcom_q6v5_pil.c                 |   1 +
 drivers/remoteproc/qcom_wcnss.c                    |  53 +-
 drivers/remoteproc/qcom_wcnss.h                    |   2 +
 drivers/remoteproc/qcom_wcnss_iris.c               |   9 +-
 drivers/remoteproc/remoteproc_core.c               | 247 ++++--
 drivers/remoteproc/remoteproc_debugfs.c            |  71 --
 drivers/remoteproc/remoteproc_internal.h           |   6 +
 drivers/remoteproc/remoteproc_sysfs.c              | 151 ++++
 drivers/remoteproc/remoteproc_virtio.c             |  17 +-
 drivers/remoteproc/st_remoteproc.c                 |   4 +-
 drivers/remoteproc/st_slim_rproc.c                 | 364 +++++++++
 drivers/remoteproc/ste_modem_rproc.c               | 342 --------
 drivers/rpmsg/qcom_smd.c                           |   1 +
 include/linux/remoteproc.h                         |  36 +-
 include/linux/remoteproc/st_slim_rproc.h           |  58 ++
 include/linux/rpmsg/qcom_smd.h                     |  33 +
 31 files changed, 2768 insertions(+), 551 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-remoteproc
 create mode 100644 Documentation/devicetree/bindings/dma/st_fdma.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
 create mode 100644 drivers/dma/st_fdma.c
 create mode 100644 drivers/dma/st_fdma.h
 create mode 100644 drivers/remoteproc/qcom_adsp_pil.c
 create mode 100644 drivers/remoteproc/remoteproc_sysfs.c
 create mode 100644 drivers/remoteproc/st_slim_rproc.c
 delete mode 100644 drivers/remoteproc/ste_modem_rproc.c
 create mode 100644 include/linux/remoteproc/st_slim_rproc.h
 create mode 100644 include/linux/rpmsg/qcom_smd.h
