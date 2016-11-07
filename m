Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/3] Venus remoteproc driver
Date: Mon,  7 Nov 2016 19:30:50 +0200
Message-Id: <1478539853-23218-1-git-send-email-stanimir.varbanov@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

here is v2 of the Venus remoteproc driver, the changes are:
	- removed page table size and page table init SCM calls.

regards,
Stan

Stanimir Varbanov (3):
  firmware: qcom: scm: add a video command for state setting
  dt-binding: remoteproc: venus rproc dt binding document
  remoteproc: qcom: add Venus video core firmware loader driver

 .../devicetree/bindings/remoteproc/qcom,venus.txt  |  33 ++++
 drivers/firmware/qcom_scm-32.c                     |  18 ++
 drivers/firmware/qcom_scm-64.c                     |  16 ++
 drivers/firmware/qcom_scm.c                        |  16 ++
 drivers/firmware/qcom_scm.h                        |   2 +
 drivers/remoteproc/Kconfig                         |  12 ++
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/qcom_venus_pil.c                | 213 +++++++++++++++++++++
 include/linux/qcom_scm.h                           |   2 +
 9 files changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
 create mode 100644 drivers/remoteproc/qcom_venus_pil.c

-- 
2.7.4
