Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/2] Qualcomm GLINK SSR support
Date: Mon, 24 Jul 2017 22:56:42 -0700
Message-Id: <20170725055644.20947-1-bjorn.andersson@linaro.org>
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This adds the common Qualcomm helpers to tie in subsystem restart notifications
with the ADSP and Modem PILs and then adds a driver for the "glink_ssr" channel
to propagate these notifications.

This is needed on GLINK RPM enabled platforms to have the RPM reset the state
of the communication channels to the peripherals, allowing them to be restarted
without the RPM crashing due stale FIFO data.

Bjorn Andersson (2):
  remoteproc: qcom: Add support for SSR notifications
  soc: qcom: GLINK SSR notifier

 drivers/remoteproc/qcom_adsp_pil.c    |   6 ++
 drivers/remoteproc/qcom_common.c      |  71 +++++++++++++++
 drivers/remoteproc/qcom_common.h      |  10 +++
 drivers/remoteproc/qcom_q6v5_pil.c    |   3 +
 drivers/soc/qcom/Kconfig              |   9 ++
 drivers/soc/qcom/Makefile             |   1 +
 drivers/soc/qcom/glink_ssr.c          | 164 ++++++++++++++++++++++++++++++++++
 include/linux/remoteproc/qcom_rproc.h |  22 +++++
 8 files changed, 286 insertions(+)
 create mode 100644 drivers/soc/qcom/glink_ssr.c
 create mode 100644 include/linux/remoteproc/qcom_rproc.h

-- 
2.12.0
