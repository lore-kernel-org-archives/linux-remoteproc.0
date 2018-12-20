Return-Path: <rohitkr@codeaurora.org>
From: Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845: Add ADSP reserve-memory nodes
Date: Thu, 20 Dec 2018 19:09:33 +0530
Message-Id: <1545313174-13481-2-git-send-email-rohitkr@codeaurora.org>
In-Reply-To: <1545313174-13481-1-git-send-email-rohitkr@codeaurora.org>
References: <1545313174-13481-1-git-send-email-rohitkr@codeaurora.org>
To: dianders@chromium.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org, linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org
Cc: Rohit kumar <rohitkr@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add memory nodes required for remoteproc q6v5_adsp pil.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 23a253b..c0a012f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -88,6 +88,11 @@
 			reg = <0 0x86200000 0 0x2d00000>;
 			no-map;
 		};
+
+		pil_adsp_mem: memory@8b100000 {
+			reg = <0 0x8b100000 0 0x1a00000>;
+			no-map;
+		};
 	};
 
 	cpus {
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
