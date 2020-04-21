Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail26.static.mailgun.info ([104.130.122.26]:11030 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728479AbgDUOcp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Apr 2020 10:32:45 -0400
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/7] Add PAS and MSA based Modem support
Date: Tue, 21 Apr 2020 20:02:21 +0530
Message-Id: <20200421143228.8981-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, ohad@wizery.com, mka@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add PAS based modem support on SC7180 SoCs and update the device node to
support MSA based modem boot.

V2:
 * use memory-region to reference mba/mpss regions [Bjorn]
 * move peripheral memory regions to the board dts [Bjorn]
 * overload the base remoteproc_mpss node wherever possible [Bjorn]
 * Pick up Bjorn's R-b

Patch [1,2] - Add PAS based modem support
Patch [3,4] - use memory-region to reference mba/mpss regions
Patch [5] - Update reserved memory map
Patch [6,7] - Add PAS/MSA modem nodes

Sibi Sankar (7):
  dt-bindings: remoteproc: qcom: Add SC7180 MPSS support
  remoteproc: qcom: pas: Add SC7180 Modem support
  dt-bindings: remoteproc: qcom: Use memory-region to reference memory
  remoteproc: qcom_q6v5_mss: Extract mba/mpss from memory-region
  arm64: dts: qcom: sc7180: Update reserved memory map
  arm64: dts: qcom: sc7180: Add Q6V5 MSS node
  arm64: dts: qcom: sc7180: Update Q6V5 MSS node

 .../bindings/remoteproc/qcom,adsp.txt         |  3 +
 .../bindings/remoteproc/qcom,q6v5.txt         |  8 ++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       | 60 +++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 89 ++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_mss.c            | 21 ++++-
 drivers/remoteproc/qcom_q6v5_pas.c            |  1 +
 6 files changed, 177 insertions(+), 5 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
