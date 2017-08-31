Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH v3 0/6] Add support for Hexagon q6v5-wcss integrated core
Date: Thu, 31 Aug 2017 10:15:28 +0530
Message-Id: <1504154734-12175-1-git-send-email-sricharan@codeaurora.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

IPQ8074 has an integrated Hexagon dsp core Q6v5 and a wireless lan
(Lithium) IP. This series adds the remoteproc driver to reset, load
and boot Q6 firmware.

The first patch is to make the mdt_loader authenticate
the firmware only if required, so that the code can be reused for
self-authenticating firmware like the Q6v5 core in IPQ8074. The second
patch exports the elf header's get_boot_addr helper to reuse it.
The next couple of patches arranges the code in the original q6v5-mpss
rproc to add q6v5-wcss later. The last couple of patches add the relevant
bits for the q6v5-wcss core.

This is done on top of Avaneesh's msm8996 rproc support [1]

[1] https://lkml.org/lkml/2017/7/21/217

V3:
    Rebased on top of latest remoteproc next

V2:
    Last time introduced this a new rproc driver, but there is lot
    of code that can be shared if it is added to the q6v5-mpss pil
    driver.

Sricharan R (6):
  remoteproc: qcom: mdt_loader: Make the firmware authentication
    optional
  remoteproc: Export rproc_elf_get_boot_addr
  remoteproc: qcom: Push reset ops, fw ops, rproc ops in to of_match
    data
  remoteproc: qcom: Split the head and tail of the      q6v5-pil rproc
    start function
  remoteproc: qcom: Add support for q6v5-wcss pil
  remoteproc: qcom: Add q6v5-wcss rproc ops

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   7 +-
 drivers/remoteproc/Kconfig                         |   1 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 469 +++++++++++++++++----
 drivers/remoteproc/remoteproc_elf_loader.c         |   2 +-
 drivers/remoteproc/remoteproc_internal.h           |   3 +
 drivers/soc/qcom/mdt_loader.c                      |  70 ++-
 include/linux/soc/qcom/mdt_loader.h                |   3 +
 7 files changed, 453 insertions(+), 102 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
