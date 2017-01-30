Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v2 0/3] Enable msm8996 support in mss rproc driver.
Date: Mon, 30 Jan 2017 16:14:01 +0530
Message-Id: <1485773044-31489-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

In continuation of earlier RFC patch series, this series consist three patches, which add following.
	1- Add hypervisor call support to enable second stage translation of intermediat physical address generated
	   by individual subsystem, second stage mapping of address is supported armv8 onwards.
	2- Modify already floating mss rproc driver to enable mss remoteproc support for msm8996.
Differences WRT patchset 1 is as follow.
	1- Secure_buffer.c file is removed which was added as a separate driver in patchset 1.
	   Instead now to make translation scm call one additional function is added in rproc driver itself.
	2- Address other comments by sboyd on RFC patch.

This patch series is dependednt on https://patchwork.kernel.org/patch/9492177/

Avaneesh Kumar Dwivedi (3):
  soc: qcom: Add scm call to protect modem mem in qcom scm driver.
  remoteproc: qcom: Add scm call to protect modem mem in mss rproc drv.
  remoteproc: qcom: Add msm8996 specific changes in mss rproc driver.

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
 drivers/firmware/qcom_scm-64.c                     |  17 +
 drivers/firmware/qcom_scm.c                        |  14 +
 drivers/firmware/qcom_scm.h                        |   3 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 380 +++++++++++++++++++--
 include/linux/qcom_scm.h                           |   1 +
 6 files changed, 387 insertions(+), 29 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
