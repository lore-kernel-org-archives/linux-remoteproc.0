Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 6/7] arm64: dts: qcom: sdm845: Add power-domain for Q6V5 MSS node
Date: Mon, 17 Dec 2018 15:37:23 +0530
Message-Id: <20181217100724.4593-6-sibis@codeaurora.org>
In-Reply-To: <20181217100724.4593-1-sibis@codeaurora.org>
References: <20181217100724.4593-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add power-domains cx, mx, mss and load_state for Q6V5 MSS node.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

This patch depends on the following bindings:
https://patchwork.kernel.org/patch/10725801/ - rpmhpd dt bindings
https://patchwork.kernel.org/patch/10725793/ - rpmhpd dt node
https://patchwork.kernel.org/patch/10678301/ - AOP QMP dt bindings

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 33ff8668828f..56f5f55db9e2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1401,6 +1401,12 @@
 			qcom,halt-regs = <&tcsr_mutex_regs
 						0x23000 0x25000 0x24000>;
 
+			power-domains = <&aoss_qmp_pd AOSS_QMP_LS_MODEM>,
+					<&rpmhpd SDM845_CX>,
+					<&rpmhpd SDM845_MX>,
+					<&rpmhpd SDM845_MSS>;
+			power-domain-names = "load_state", "cx", "mx", "mss";
+
 			mba {
 				memory-region = <&mba_region>;
 			};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
