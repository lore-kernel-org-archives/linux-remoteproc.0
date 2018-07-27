Return-Path: <aneela@codeaurora.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH V4 0/9] Add chrdev and name query support for GLINK
Date: Fri, 27 Jul 2018 17:47:20 +0530
Message-Id: <1532693849-7037-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, robh+dt@kernel.org, arnaud.pouliquen@st.com, andy.gross@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for the GLINK rpmsg transport to register a rpmsg chrdev.
This will create the rpmsg_ctrl nodes for userspace clients to open 
rpmsg epts. Create a label property that will help userspace clients
distinguish between the different GLINK links. The rpmsg chrdev 
allocation is done by allocating a local channel which also allocates
an ept. We need to add some guards against edge cases for this chrdev
because it will never fully open.

Changes since v3:
- Change to device_add_group for rpmsg name attr
- Add patch to unregister the rpmsg device
- Add patch to support compat ioctl for rpmsg char driver

Changes since v2:
- Revert change to make glink attribute table const

Changes since v1:
- Add explanation to dt-bindings commit message
- Add patch complete_all the open_req/ack variables
- Add patch to prevent null pointer dereference in chrdev channel release
- Change chrdev allocation to use glink channel allocation
- Change glink attr struct to const

Arun Kumar Neelakantam (2):
  rpmsg: glink: unregister rpmsg device during endpoint destroy
  rpmsg: Add compat ioctl for rpmsg char driver

Chris Lew (7):
  dt-bindings: soc: qcom: Add label for GLINK bindings
  rpmsg: glink: Store edge name for glink device
  rpmsg: glink: Use complete_all for open states
  rpmsg: Guard against null endpoint ops in destroy
  rpmsg: glink: Add support for rpmsg glink chrdev
  rpmsg: glink: Expose rpmsg name attr for glink
  rpmsg: glink: Remove chunk size word align warning

 .../devicetree/bindings/soc/qcom/qcom,glink.txt    |  5 ++
 drivers/rpmsg/qcom_glink_native.c                  | 88 ++++++++++++++++++++--
 drivers/rpmsg/rpmsg_char.c                         |  2 +
 drivers/rpmsg/rpmsg_core.c                         |  2 +-
 4 files changed, 90 insertions(+), 7 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
