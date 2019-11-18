Return-Path: <0101016e80791b96-58c1f2f0-312c-4a84-b536-9ad88f3d6f29-000000@us-west-2.amazonses.com>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 13/16] arm64: dts: qcom: msm8998: Update reserved memory map
Date: Mon, 18 Nov 2019 21:44:11 +0000
Message-ID: <0101016e80791b96-58c1f2f0-312c-4a84-b536-9ad88f3d6f29-000000@us-west-2.amazonses.com>
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca
Cc: ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Update existing and add missing regions to the reserved memory map, as
described in version 7.1

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 62 ++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index fc7838ea9a010..707673e3cf28a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -28,8 +28,13 @@
 		#size-cells = <2>;
 		ranges;
 
-		memory@85800000 {
-			reg = <0x0 0x85800000 0x0 0x800000>;
+		hyp_mem: memory@85800000 {
+			reg = <0x0 0x85800000 0x0 0x600000>;
+			no-map;
+		};
+
+		xbl_mem: memory@85e00000 {
+			reg = <0x0 0x85e00000 0x0 0x100000>;
 			no-map;
 		};
 
@@ -38,21 +43,64 @@
 			no-map;
 		};
 
-		memory@86200000 {
+		tz_mem: memory@86200000 {
 			reg = <0x0 0x86200000 0x0 0x2d00000>;
 			no-map;
 		};
 
-		rmtfs {
+		rmtfs_mem: memory@88f00000 {
 			compatible = "qcom,rmtfs-mem";
-
-			size = <0x0 0x200000>;
-			alloc-ranges = <0x0 0xa0000000 0x0 0x2000000>;
+			reg = <0x0 0x88f00000 0x0 0x200000>;
 			no-map;
 
 			qcom,client-id = <1>;
 			qcom,vmid = <15>;
 		};
+
+		spss_mem: memory@8ab00000 {
+			reg = <0x0 0x8ab00000 0x0 0x700000>;
+			no-map;
+		};
+
+		adsp_mem: memory@8b200000 {
+			reg = <0x0 0x8b200000 0x0 0x1a00000>;
+			no-map;
+		};
+
+		mpss_mem: memory@8cc00000 {
+			reg = <0x0 0x8cc00000 0x0 0x7000000>;
+			no-map;
+		};
+
+		venus_mem: memory@93c00000 {
+			reg = <0x0 0x93c00000 0x0 0x500000>;
+			no-map;
+		};
+
+		mba_mem: memory@94100000 {
+			reg = <0x0 0x94100000 0x0 0x200000>;
+			no-map;
+		};
+
+		slpi_mem: memory@94300000 {
+			reg = <0x0 0x94300000 0x0 0xf00000>;
+			no-map;
+		};
+
+		ipa_fw_mem: memory@95200000 {
+			reg = <0x0 0x95200000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@95210000 {
+			reg = <0x0 0x95210000 0x0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: memory@95215000 {
+			reg = <0x0 0x95215000 0x0 0x1000>;
+			no-map;
+		};
 	};
 
 	clocks {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
