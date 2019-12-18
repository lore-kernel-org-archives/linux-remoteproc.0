Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 4/5] arm64: dts: qcom: msm8998: Update reserved memory map
Date: Wed, 18 Dec 2019 18:52:16 +0530
Message-Id: <20191218132217.28141-5-sibis@codeaurora.org>
In-Reply-To: <20191218132217.28141-1-sibis@codeaurora.org>
References: <20191218132217.28141-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org
Cc: ohad@wizery.com, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Update existing and add missing regions to the reserved memory map, as
described in version 7.1

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 70 ++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 873912c19f6ed..8d799e868a5d3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -29,8 +29,13 @@
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
 
@@ -39,25 +44,68 @@
 			no-map;
 		};
 
-		memory@86200000 {
+		tz_mem: memory@86200000 {
 			reg = <0x0 0x86200000 0x0 0x2d00000>;
 			no-map;
 		};
 
-		wlan_msa_mem: memory@95700000 {
-			reg = <0x0 0x95700000 0x0 0x100000>;
+		rmtfs_mem: memory@88f00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0x88f00000 0x0 0x200000>;
 			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
 		};
 
-		rmtfs {
-			compatible = "qcom,rmtfs-mem";
+		spss_mem: memory@8ab00000 {
+			reg = <0x0 0x8ab00000 0x0 0x700000>;
+			no-map;
+		};
 
-			size = <0x0 0x200000>;
-			alloc-ranges = <0x0 0xa0000000 0x0 0x2000000>;
+		adsp_mem: memory@8b200000 {
+			reg = <0x0 0x8b200000 0x0 0x1a00000>;
 			no-map;
+		};
 
-			qcom,client-id = <1>;
-			qcom,vmid = <15>;
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
+		gpu_mem: memory@95600000 {
+			reg = <0x0 0x95600000 0x0 0x100000>;
+			no-map;
+		};
+
+		wlan_msa_mem: memory@95700000 {
+			reg = <0x0 0x95700000 0x0 0x100000>;
+			no-map;
 		};
 	};
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
