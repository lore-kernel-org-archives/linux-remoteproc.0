Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 7/7] arm64: dts: qcom: sdm845: Add shutdown-ack for Q6V5 MSS node
Date: Mon, 17 Dec 2018 15:37:24 +0530
Message-Id: <20181217100724.4593-7-sibis@codeaurora.org>
In-Reply-To: <20181217100724.4593-1-sibis@codeaurora.org>
References: <20181217100724.4593-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add shutdown-ack smp2p interrupt for Q6V5 MSS node.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

This patch depends on:
https://patchwork.kernel.org/patch/10691213/ - shutdown-ack dt bindings

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 56f5f55db9e2..db17216a5bce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1376,9 +1376,11 @@
 				<&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
 				<&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
 				<&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-				<&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+				<&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready",
-					  "handover", "stop-ack";
+					  "handover", "stop-ack",
+					  "shutdown-ack";
 
 			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
 				 <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
