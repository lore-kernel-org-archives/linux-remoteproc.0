Return-Path: <jeffrey.l.hugo@gmail.com>
Return-Path: <jeffrey.l.hugo@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 0/2] Support for MSM8998 mss
Date: Thu, 31 Oct 2019 19:43:01 -0700
Message-Id: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
Cc: agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Booting mss on MSM8998 is a critical step to getting wifi functional - a
rather useful feature for the MSM8998 based laptops.

Jeffrey Hugo (2):
  dt-bindings: remoteproc: qcom: Add Q6v5 Modem PIL binding for MSM8998
  remoteproc: qcom_q6v5_mss: Add support for MSM8998

 .../bindings/remoteproc/qcom,q6v5.txt         |  6 +++
 drivers/remoteproc/qcom_q6v5_mss.c            | 52 ++++++++++++++++---
 2 files changed, 52 insertions(+), 6 deletions(-)

-- 
2.17.1
