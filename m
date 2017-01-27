Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 0/2] Venus remoteproc driver
Date: Fri, 27 Jan 2017 17:32:55 +0200
Message-Id: <1485531177-3543-1-git-send-email-stanimir.varbanov@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Changes since v2:
    - addressed comments in dt-binding document
    - added MODULE_DEVICE_TABLE and deleted unused define
   
regards,
Stan

Stanimir Varbanov (2):
  dt-binding: remoteproc: venus rproc dt binding document
  remoteproc: qcom: add Venus video core firmware loader driver

 .../devicetree/bindings/remoteproc/qcom,venus.txt  |  33 ++++
 drivers/remoteproc/Kconfig                         |  12 ++
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/qcom_venus_pil.c                | 208 +++++++++++++++++++++
 4 files changed, 254 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
 create mode 100644 drivers/remoteproc/qcom_venus_pil.c

-- 
2.7.4
