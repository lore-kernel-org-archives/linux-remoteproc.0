Return-Path: <clew@codeaurora.org>
From: Chris Lew <clew@codeaurora.org>
Subject: [PATCH 0/6] Add chrdev and name query support for GLINK
Date: Mon, 18 Dec 2017 14:02:08 -0800
Message-Id: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for GLINK rpmsg transport to register a rpmsg chrdev to
create the rpmsg_ctrl nodes for userspace clients to open rpmsg epts.
Create a label property to identify the glink node with. This label
will be used as a name attr for GLINK devices. Expose this name through
a new API - rpmsg_get_rproc_name() for kernel clients.

Chris Lew (6):
  dt-bindings: soc: qcom: Add label for GLINK bindings
  rpmsg: glink: Store edge name for glink device
  rpmsg: glink: Add support for rpmsg glink chrdev
  rpmsg: glink: Expose rpmsg name attr for glink
  rpmsg: Introduce rpmsg_get_rproc_name
  rpmsg: glink: Add get_rproc_name device op

 .../devicetree/bindings/soc/qcom/qcom,glink.txt    |  5 ++
 drivers/rpmsg/qcom_glink_native.c                  | 72 ++++++++++++++++++++++
 drivers/rpmsg/rpmsg_core.c                         | 21 +++++++
 drivers/rpmsg/rpmsg_internal.h                     |  3 +
 include/linux/rpmsg.h                              | 10 +++
 5 files changed, 111 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
