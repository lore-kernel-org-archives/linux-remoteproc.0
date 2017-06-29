Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 0/3] Add remoteproc driver for Hexagon Q6 - WCSS integrated core
Date: Thu, 29 Jun 2017 19:47:38 +0530
Message-Id: <1498745861-20531-1-git-send-email-sricharan@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

IPQ8074 has an integrated Hexagon dsp core Q6v5 and a wireless lan
(Lithium) IP. This series adds the remoteproc driver to reset, load
and boot Q6 firmware. The first patch is to make the mdt_loader authenticate
the firmware only if required, so that the code can be reused for
self-authenticating firmware like the Q6v5 core in IPQ8074.

Sricharan R (3):
  drivers: remoteproc: Make mdt_loader firmware authentication optional
  drivers: remoteproc: Add Hexagon Q6 - WCSS integrated core driver
  dt-binding: remoteproc: Add the bindings required for Hexagon - WCSS
    core

 .../bindings/remoteproc/qcom,q6v5-wcss.txt         | 139 ++++
 drivers/remoteproc/Kconfig                         |  13 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/q6v5-wcss.c                     | 784 +++++++++++++++++++++
 drivers/remoteproc/qcom_adsp_pil.c                 |   3 +-
 drivers/remoteproc/qcom_wcnss.c                    |   3 +-
 drivers/soc/qcom/mdt_loader.c                      |  24 +-
 include/linux/soc/qcom/mdt_loader.h                |   2 +-
 8 files changed, 956 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5-wcss.txt
 create mode 100644 drivers/remoteproc/q6v5-wcss.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
