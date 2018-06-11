Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 11 Jun 2018 11:24:44 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v4.18
Message-ID: <20180611182444.GE3206@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Anup Patel <anup@brainfault.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 75bc37fefc4471e718ba8e651aa74673d4e0a9eb:

  Linux 4.17-rc4 (2018-05-06 16:57:38 -1000)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.18

for you to fetch changes up to 4a2e84c6ed85434ce7843e4844b4d3263f7e233b:

  rpmsg: smd: do not use mananged resources for endpoints and channels (2018-06-04 12:35:03 -0700)

----------------------------------------------------------------
rpmsg updates for v4.18

This migrates rpmsg to use SPDX license headers and fixes a
use-after-free in SMD.

----------------------------------------------------------------
Anup Patel (1):
      rpmsg: Add driver_override device attribute for rpmsg_device

Bjorn Andersson (2):
      rpmsg: qcom_smd: Access APCS through mailbox framework
      Merge tag 'v4.17-rc4' into rpmsg-next

Srinivas Kandagatla (1):
      rpmsg: smd: do not use mananged resources for endpoints and channels

Suman Anna (5):
      rpmsg: Switch to SPDX license identifier
      rpmsg: virtio_rpmsg_bus: Switch to SPDX license identifier
      rpmsg: smd: Switch to SPDX license identifier
      rpmsg: glink: Switch to SPDX license identifier
      rpmsg: char: Switch to SPDX license identifier

 Documentation/ABI/testing/sysfs-bus-rpmsg          | 20 +++++
 .../devicetree/bindings/soc/qcom/qcom,smd.txt      |  8 +-
 drivers/rpmsg/Kconfig                              |  3 +
 drivers/rpmsg/qcom_glink_native.c                  | 10 +--
 drivers/rpmsg/qcom_glink_native.h                  | 10 +--
 drivers/rpmsg/qcom_glink_rpm.c                     | 10 +--
 drivers/rpmsg/qcom_glink_smem.c                    | 10 +--
 drivers/rpmsg/qcom_smd.c                           | 96 +++++++++++++---------
 drivers/rpmsg/rpmsg_char.c                         | 10 +--
 drivers/rpmsg/rpmsg_core.c                         | 49 +++++++++--
 drivers/rpmsg/rpmsg_internal.h                     | 10 +--
 drivers/rpmsg/virtio_rpmsg_bus.c                   | 10 +--
 include/linux/rpmsg.h                              | 27 +-----
 include/linux/rpmsg/qcom_glink.h                   |  2 +
 include/uapi/linux/rpmsg.h                         |  9 --
 15 files changed, 139 insertions(+), 145 deletions(-)
