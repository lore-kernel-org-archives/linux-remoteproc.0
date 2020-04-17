Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/5] Add PAS and MSA based Modem support
Date: Fri, 17 Apr 2020 19:56:00 +0530
Message-Id: <20200417142605.28885-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org
Cc: agross@kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, ohad@wizery.com, mka@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add PAS based modem support on SC7180 SoCs and update the device node to
support MSA based modem boot.

Patch [1,2] - Add PAS based modem support
Patch [3] - Update reserved memory map
Patch [4,5] - Add PAS/MSA modem nodes

Sibi Sankar (5):
  dt-bindings: remoteproc: qcom: Add SC7180 MPSS support
  remoteproc: qcom: pas: Add SC7180 Modem support
  arm64: dts: qcom: sc7180: Update reserved memory map
  arm64: dts: qcom: sc7180: Add Q6V5 MSS node
  arm64: dts: qcom: sc7180: Update Q6V5 MSS node

 .../bindings/remoteproc/qcom,adsp.txt         |   3 +
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       | 105 +++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 124 +++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c            |   1 +
 4 files changed, 231 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
