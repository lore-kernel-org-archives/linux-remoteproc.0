Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/2] Qualcomm QCS404 Compute DSP loader
Date: Wed,  6 Mar 2019 16:03:16 -0800
Message-Id: <20190307000318.1750-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Remoteproc support for booting the Compute DSP on QCS404, without TrustZone
support.

Bjorn Andersson (2):
  dt-bindings: remoteproc: Rename and amend Hexagon v56 binding
  remoteproc: qcom: qdsp6-adsp: Add support for QCS404 CDSP

 ...qcom,adsp-pil.txt => qcom,hexagon-v56.txt} | 34 ++++++---
 drivers/remoteproc/qcom_q6v5_adsp.c           | 73 ++++++++++++++-----
 2 files changed, 79 insertions(+), 28 deletions(-)
 rename Documentation/devicetree/bindings/remoteproc/{qcom,adsp-pil.txt => qcom,hexagon-v56.txt} (74%)

-- 
2.18.0
