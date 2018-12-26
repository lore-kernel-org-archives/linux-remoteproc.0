Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: [RFC,0/5] Add support for mt8183 SCP.
Date: Wed, 26 Dec 2018 15:53:08 +0800
Message-Id: <20181226075330.82462-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>, "open list:OPEN FIRMWARE AND FLATTENED" <devicetree@vger.kernel.org>, DEVICE, Eddie Huang <eddie.huang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, "moderated list:ARM/Mediatek SoC" <linux-arm-kernel@lists.infradead.org>, support, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC" <linux-mediatek@lists.infradead.org>support, "open list:REMOTE PROCESSOR" <linux-remoteproc@vger.kernel.org>, SUBSYSTEM
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for controlling and communicating with mt8183's system
control processor (SCP), using the remoteproc & rpmsg framework.
And also add a cros_ec driver for CrOS EC host command over rpmsg.

The overall structure of the series is:
* remoteproc/mtk_scp.c: Control the start / stop of SCP (Patch 2).
* remoteproc/mtk_scp_ipi.c: Communicates to SCP using inter-processor
  interrupt (IPI) and shared memory (Patch 2, 3).
* rpmsg/mtk_rpmsg.c: Wrapper to wrap the IPI communication into a rpmsg
  device. Supports name service for SCP firmware to
  announce channels (Patch 4).
* platform/chrome/cros_ec_rpmsg.c: Communicates with the SCP over the
  rpmsg framework (like what platform/chrome/cros_ec_{i2c,spi}.c does)
  (Patch 5).

Since I'm not familiar with the remoteproc / rpmsg framework, and there
are not much other custom rpmsg driver for reference, would like some
review / comments on the overall structure of the driver.


Erin Lo (2):
  dt-bindings: Add a binding for Mediatek SCP
  remoteproc/mediatek: add SCP support for mt8183

Pi-Hsun Shih (3):
  remoteproc: move IPI interface into separate file.
  rpmsg: add rpmsg support for mt8183 SCP.
  mfd: cros_ec: add EC host command support using rpmsg.

 .../bindings/remoteproc/mtk,scp.txt           |  10 +
 drivers/mfd/cros_ec_dev.c                     |  10 +
 drivers/platform/chrome/Kconfig               |   8 +
 drivers/platform/chrome/Makefile              |   1 +
 drivers/platform/chrome/cros_ec_rpmsg.c       | 164 +++++++
 drivers/remoteproc/Kconfig                    |   9 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mtk_common.h               |  76 +++
 drivers/remoteproc/mtk_scp.c                  | 441 ++++++++++++++++++
 drivers/remoteproc/mtk_scp_ipi.c              | 109 +++++
 drivers/rpmsg/Kconfig                         |   5 +
 drivers/rpmsg/Makefile                        |   1 +
 drivers/rpmsg/mtk_rpmsg.c                     | 341 ++++++++++++++
 include/linux/mfd/cros_ec.h                   |   1 +
 include/linux/mfd/cros_ec_commands.h          |   2 +
 include/linux/platform_data/mtk_scp.h         | 143 ++++++
 include/linux/rpmsg/mtk_rpmsg.h               |  34 ++
 17 files changed, 1356 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 drivers/platform/chrome/cros_ec_rpmsg.c
 create mode 100644 drivers/remoteproc/mtk_common.h
 create mode 100644 drivers/remoteproc/mtk_scp.c
 create mode 100644 drivers/remoteproc/mtk_scp_ipi.c
 create mode 100644 drivers/rpmsg/mtk_rpmsg.c
 create mode 100644 include/linux/platform_data/mtk_scp.h
 create mode 100644 include/linux/rpmsg/mtk_rpmsg.h

-- 
2.20.1.415.g653613c723-goog
