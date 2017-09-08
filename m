Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 8 Sep 2017 14:39:34 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v4.14
Message-ID: <20170908213934.GK20643@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Sricharan R <sricharan@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Colin Ian King <colin.king@canonical.com>, Loic Pallardy <loic.pallardy@st.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.14

for you to fetch changes up to ed43d098f9020d6669a00bd26fac807d5c19e202:

  rpmsg: glink: initialize ret to zero to ensure error status check is correct (2017-09-04 10:52:30 -0700)

----------------------------------------------------------------
rpmsg updates for v4.14

This extends the Qualcomm GLINK implementation to support the additional
features used for communicating with modem and DSP coprocessors in modern
Qualcomm platforms.

In addition to this there's support for placing virtio RPMSG buffers in
non-System RAM.

----------------------------------------------------------------
Bjorn Andersson (11):
      rpmsg: glink: Rename glink_rpm_xx functions to qcom_glink_xx
      rpmsg: glink: Associate indirections for pipe fifo accessor's
      rpmsg: glink: Split rpm_probe to reuse the common code
      rpmsg: glink: Move the common glink protocol implementation to glink_native.c
      rpmsg: glink: Allow unaligned data access
      rpmsg: glink: Introduce glink smem based transport
      rpmsg: glink: Make RX FIFO peak accessor to take an offset
      rpmsg: glink: Release idr lock before returning on error
      rpmsg: glink: Export symbols from common code
      remoteproc: qcom: adsp: Allow defining GLINK edge
      dt-bindings: soc: qcom: Extend GLINK to cover SMEM

Colin Ian King (2):
      rpmsg: glink: fix null pointer dereference on a null intent
      rpmsg: glink: initialize ret to zero to ensure error status check is correct

Loic Pallardy (2):
      rpmsg: virtio_rpmsg: set rpmsg_buf_size customizable
      rpmsg: virtio_rpmsg_bus: fix sg_set_buf() when addr is not a valid kernel address

Sricharan R (12):
      rpmsg: glink: Return -EAGAIN when there is no FIFO space
      rpmsg: glink: Do a mbox_free_channel in remove
      rpmsg: glink: Add support for transport version negotiation
      rpmsg: glink: Fix idr_lock from mutex to spinlock
      rpmsg: glink: Add support for TX intents
      rpmsg: glink: Use the local intents when receiving data
      rpmsg: glink: Add rx done command
      rpmsg: glink: Add announce_create ops and preallocate intents
      rpmsg: glink: Receive and store the remote intent buffers
      rpmsg: glink: Use the intents passed by remote
      rpmsg: glink: Request for intents when unavailable
      rpmsg: glink: Handle remote rx done command

Srinivas Kandagatla (1):
      rpmsg: qcom_smd: add of_node node to edge device

Suman Anna (1):
      rpmsg: virtio_rpmsg_bus: fix export of rpmsg_send_offchannel_raw()

 .../devicetree/bindings/remoteproc/qcom,adsp.txt   |    7 +-
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |    5 +
 .../devicetree/bindings/soc/qcom/qcom,glink.txt    |   13 +-
 drivers/remoteproc/Kconfig                         |    1 +
 drivers/remoteproc/qcom_adsp_pil.c                 |    3 +
 drivers/remoteproc/qcom_common.c                   |   49 +
 drivers/remoteproc/qcom_common.h                   |   11 +
 drivers/rpmsg/Kconfig                              |   16 +-
 drivers/rpmsg/Makefile                             |    2 +
 drivers/rpmsg/qcom_glink_native.c                  | 1612 ++++++++++++++++++++
 drivers/rpmsg/qcom_glink_native.h                  |   45 +
 drivers/rpmsg/qcom_glink_rpm.c                     | 1026 +------------
 drivers/rpmsg/qcom_glink_smem.c                    |  316 ++++
 drivers/rpmsg/qcom_smd.c                           |    1 +
 drivers/rpmsg/virtio_rpmsg_bus.c                   |   47 +-
 include/linux/rpmsg/qcom_glink.h                   |   27 +
 16 files changed, 2210 insertions(+), 971 deletions(-)
 create mode 100644 drivers/rpmsg/qcom_glink_native.c
 create mode 100644 drivers/rpmsg/qcom_glink_native.h
 create mode 100644 drivers/rpmsg/qcom_glink_smem.c
 create mode 100644 include/linux/rpmsg/qcom_glink.h
