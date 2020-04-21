Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 5/7] arm64: dts: qcom: sc7180: Update reserved memory map
Date: Tue, 21 Apr 2020 20:02:26 +0530
Message-Id: <20200421143228.8981-6-sibis@codeaurora.org>
In-Reply-To: <20200421143228.8981-1-sibis@codeaurora.org>
References: <20200421143228.8981-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, ohad@wizery.com, mka@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add missing regions and remove unused regions from the reserved memory
map, as described in version 5.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

V2:
 * move peripheral memory regions to the board dts [Bjorn]

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 53 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 33 ++++++++++++++-
 2 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 043c9b9b50240..5405cde1a32ef 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -28,6 +28,59 @@ chosen {
 	};
 };
 
+/*
+ * Reserved memory changes
+ *
+ * Delete all unused memory nodes and define the peripheral memory regions
+ * required by the board dts.
+ *
+ */
+
+/delete-node/ &hyp_mem;
+/delete-node/ &xbl_mem;
+/delete-node/ &aop_mem;
+/delete-node/ &sec_apps_mem;
+/delete-node/ &tz_mem;
+
+/* Increase the size from 2MB to 8MB */
+&rmtfs_mem {
+	reg = <0x0 0x84400000 0x0 0x800000>;
+};
+
+/ {
+	reserved-memory {
+		atf_mem: memory@80b00000 {
+			reg = <0x0 0x80b00000 0x0 0x100000>;
+			no-map;
+		};
+
+		mpss_mem: memory@86000000 {
+			reg = <0x0 0x86000000 0x0 0x8c00000>;
+			no-map;
+		};
+
+		camera_mem: memory@8ec00000 {
+			reg = <0x0 0x8ec00000 0x0 0x500000>;
+			no-map;
+		};
+
+		venus_mem: memory@8f600000 {
+			reg = <0 0x8f600000 0 0x500000>;
+			no-map;
+		};
+
+		wlan_mem: memory@94100000 {
+			reg = <0x0 0x94100000 0x0 0x200000>;
+			no-map;
+		};
+
+		mba_mem: memory@94400000 {
+			reg = <0x0 0x94400000 0x0 0x200000>;
+			no-map;
+		};
+	};
+};
+
 &apps_rsc {
 	pm6150-rpmh-regulators {
 		compatible = "qcom,pm6150-rpmh-regulators";
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 998f101ad623b..65c14a6d13fef 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -69,20 +69,49 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		hyp_mem: memory@80000000 {
+			reg = <0x0 0x80000000 0x0 0x600000>;
+			no-map;
+		};
+
+		xbl_mem: memory@80600000 {
+			reg = <0x0 0x80600000 0x0 0x200000>;
+			no-map;
+		};
+
+		aop_mem: memory@80800000 {
+			reg = <0x0 0x80800000 0x0 0x20000>;
+			no-map;
+		};
+
 		aop_cmd_db_mem: memory@80820000 {
 			reg = <0x0 0x80820000 0x0 0x20000>;
 			compatible = "qcom,cmd-db";
 		};
 
+		sec_apps_mem: memory@808ff000 {
+			reg = <0x0 0x808ff000 0x0 0x1000>;
+			no-map;
+		};
+
 		smem_mem: memory@80900000 {
 			reg = <0x0 0x80900000 0x0 0x200000>;
 			no-map;
 		};
 
-		venus_mem: memory@8f600000 {
-			reg = <0 0x8f600000 0 0x500000>;
+		tz_mem: memory@80b00000 {
+			reg = <0x0 0x80b00000 0x0 0x3900000>;
 			no-map;
 		};
+
+		rmtfs_mem: memory@84400000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0x84400000 0x0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
 	};
 
 	cpus {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
