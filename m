Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/2] remoteproc: qcom: Rename adsp and mss drivers
Date: Fri, 14 Sep 2018 10:35:50 -0700
Message-Id: <20180914173552.20370-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

As we're introducing a non-TZ based remoteproc driver for the ADSP in SDM845
the current naming scheme becomes cumbersome. Rename the existing drivers in
order to allow for the following:

qcom_q6v5_adsp - handle the non-TZ adsp subsystem
qcom_q6v5_mss - handles the self-authenticated modem
qcom_q6v5_pas - handles all TZ based "standard" subsystems
qcom_q6v5_wcss - handles the non-TZ wireless subsystem

Bjorn Andersson (2):
  remoteproc: qcom: Rename Hexagon v5 PAS driver
  remoteproc: qcom: Rename Hexagon v5 modem driver

 drivers/remoteproc/Kconfig                    | 35 ++++++++++---------
 drivers/remoteproc/Makefile                   |  4 +--
 .../{qcom_q6v5_pil.c => qcom_q6v5_mss.c}      |  0
 .../{qcom_adsp_pil.c => qcom_q6v5_pas.c}      |  4 +--
 4 files changed, 22 insertions(+), 21 deletions(-)
 rename drivers/remoteproc/{qcom_q6v5_pil.c => qcom_q6v5_mss.c} (100%)
 rename drivers/remoteproc/{qcom_adsp_pil.c => qcom_q6v5_pas.c} (98%)

-- 
2.18.0
