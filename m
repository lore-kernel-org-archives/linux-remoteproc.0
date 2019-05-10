Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/8] Qualcomm QCS404 CDSP improvements and fastrpc
Date: Thu,  9 May 2019 21:34:13 -0700
Message-Id: <20190510043421.31393-1-bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This series introduces the non-Trustzone based CDSP support, restructures the
remoteproc nodes in the dts, introduces the IOMMU and adds the fastrpc nodes.

The matrix_multi app is used for verification, the test completes 100% of the
time, but exits only succesfully 70% of the time.

Bjorn Andersson (7):
  dt-bindings: remoteproc: Rename and amend Hexagon v56 binding
  remoteproc: qcom: qdsp6-adsp: Add support for QCS404 CDSP
  arm64: dts: qcom: qcs404-evb: Mark CDSP clocks protected
  arm64: dts: qcom: qcs404: Add TCSR node
  arm64: dts: qcom: qcs404: Fully describe the CDSP
  arm64: dts: qcom: qcs404: Move lpass and q6 into soc
  arm64: dts: qcom: qcs404: Define APPS IOMMU

Thierry Escande (1):
  arm64: dts: qcom: qcs404: Add fastrpc nodes

 ...qcom,adsp-pil.txt => qcom,hexagon-v56.txt} |  35 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      |   7 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi          | 364 +++++++++++++-----
 drivers/remoteproc/qcom_q6v5_adsp.c           |  73 +++-
 4 files changed, 358 insertions(+), 121 deletions(-)
 rename Documentation/devicetree/bindings/remoteproc/{qcom,adsp-pil.txt => qcom,hexagon-v56.txt} (74%)

-- 
2.18.0
