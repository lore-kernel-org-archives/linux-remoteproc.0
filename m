Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/4] Venus remoteproc driver
Date: Fri, 19 Aug 2016 18:53:16 +0300
Message-Id: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
To: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi all,

The first patch adds a call to qcom SCM driver which helps to change
the Venus core state, in practice it is used for supend and resume
the video core. Second patch add two SCM calls needed by Venus
remoteproc driver in order to load and authenticate the firmware.

Next two patches add dt binding document and the Venus remoteproc
driver itself.

Comments are welcome.

regards,
Stan

Stanimir Varbanov (4):
  firmware: qcom: scm: add a video command for state setting
  firmware: qcom: scm: add iommu scm calls for pg table
  dt-binding: remoteproc: venus rproc dt binding document
  remoteproc: qcom: add Venus video core firmware loader driver

 .../devicetree/bindings/remoteproc/qcom,venus.txt  |  33 +++
 drivers/firmware/qcom_scm-32.c                     |  18 ++
 drivers/firmware/qcom_scm-64.c                     |  58 ++++++
 drivers/firmware/qcom_scm.c                        |  28 +++
 drivers/firmware/qcom_scm.h                        |  13 ++
 drivers/remoteproc/Kconfig                         |  10 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/qcom_venus_pil.c                | 226 +++++++++++++++++++++
 include/linux/qcom_scm.h                           |   5 +
 9 files changed, 392 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
 create mode 100644 drivers/remoteproc/qcom_venus_pil.c

-- 
2.7.4
