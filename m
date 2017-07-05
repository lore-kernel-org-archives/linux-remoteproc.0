Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 5 Jul 2017 16:43:14 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v4.13
Message-ID: <20170705234314.GA20643@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Henri Roosen <henri.roosen@ginzinger.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.13

for you to fetch changes up to f4ce85281139214cd50900d0ff38b7d97766318f:

  rpmsg: Make modalias work for DeviceTree based devices (2017-06-28 21:49:24 -0700)

----------------------------------------------------------------
rpmsg updates for v4.13

This introduces the Qualcomm GLINK protocol driver and DeviceTree-based
modalias support, as well as a number of smaller fixes.

----------------------------------------------------------------
Bjorn Andersson (5):
      rpmsg: Release rpmsg devices in backends
      soc: qcom: Add device tree binding for GLINK RPM
      rpmsg: Introduce Qualcomm RPM glink driver
      rpmsg: Don't overwrite release op of rpdev
      rpmsg: Make modalias work for DeviceTree based devices

Henri Roosen (4):
      rpmsg: virtio_rpmsg_bus: fix announce for devices without endpoint
      rpmsg: cleanup incorrect function in dev_err message
      rpmsg: virtio_rpmsg_bus: fix nameservice address
      rpmsg: virtio_rpmsg_bus: cleanup multiple assignment to ops

Suman Anna (1):
      rpmsg: Drop VIRTUALIZATION dependency from RPMSG_VIRTIO

 .../devicetree/bindings/soc/qcom/qcom,glink.txt    |   73 ++
 drivers/rpmsg/Kconfig                              |   11 +-
 drivers/rpmsg/Makefile                             |    1 +
 drivers/rpmsg/qcom_glink_rpm.c                     | 1233 ++++++++++++++++++++
 drivers/rpmsg/qcom_smd.c                           |   11 +
 drivers/rpmsg/rpmsg_char.c                         |    4 +-
 drivers/rpmsg/rpmsg_core.c                         |   18 +-
 drivers/rpmsg/virtio_rpmsg_bus.c                   |   18 +-
 8 files changed, 1352 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
 create mode 100644 drivers/rpmsg/qcom_glink_rpm.c
