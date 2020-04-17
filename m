Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail27.static.mailgun.info ([104.130.122.27]:53562 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727884AbgDQO0p (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Apr 2020 10:26:45 -0400
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 3/5] arm64: dts: qcom: sc7180: Update reserved memory map
Date: Fri, 17 Apr 2020 19:56:03 +0530
Message-Id: <20200417142605.28885-4-sibis@codeaurora.org>
In-Reply-To: <20200417142605.28885-1-sibis@codeaurora.org>
References: <20200417142605.28885-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org
Cc: agross@kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, ohad@wizery.com, mka@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add missing regions and remove unused regions from the reserved memory
map, as described in version 5.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 63 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 83 ++++++++++++++++++++++++-
 2 files changed, 144 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 17eadd80f15de..e613d70cc0198 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -28,6 +28,69 @@ chosen {
 	};
 };
 
+/*
+ * Reserved memory changes
+ *
+ * Keep all modifications to the memory map (from sc7180.dtsi) in one place.
+ * Delete all unused memory nodes and re-create atf_mem/venus_mem/camera_mem
+ * and wlan_mem memory nodes.
+ *
+ */
+
+/delete-node/ &hyp_mem;
+/delete-node/ &xbl_mem;
+/delete-node/ &aop_mem;
+/delete-node/ &sec_apps_mem;
+/delete-node/ &tz_mem;
+/delete-node/ &camera_mem;
+/delete-node/ &npu_mem;
+/delete-node/ &venus_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &adsp_mem;
+/delete-node/ &wlan_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &ipa_gsi_mem;
+/delete-node/ &gpu_mem;
+
+/* Increase the size from 132 MB to 140 MB */
+&mpss_mem {
+	reg = <0x0 0x86000000 0x0 0x8c00000>;
+};
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
index 853ba6e8a53ca..f73ffd74d4fcd 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -69,18 +69,97 @@ reserved_memory: reserved-memory {
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
+			no-map;
+		};
+
+		rmtfs_mem: memory@84400000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0x84400000 0x0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
+		mpss_mem: memory@86000000 {
+			reg = <0x0 0x86000000 0x0 0x8400000>;
+			no-map;
+		};
+
+		camera_mem: memory@8e400000 {
+			reg = <0x0 0x8e400000 0x0 0x500000>;
+			no-map;
+		};
+
+		npu_mem: memory@8e900000 {
+			reg = <0x0 0x8e900000 0x0 0x500000>;
+			no-map;
+		};
+
+		venus_mem: memory@8ee00000 {
+			reg = <0x0 0x8ee00000 0x0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@8f300000 {
+			reg = <0x0 0x8f300000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		adsp_mem: memory@91100000 {
+			reg = <0x0 0x91100000 0x0 0x2800000>;
+			no-map;
+		};
+
+		wlan_mem: memory@93900000 {
+			reg = <0x0 0x93900000 0x0 0x200000>;
+			no-map;
+		};
+
+		ipa_fw_mem: memory@93b00000 {
+			reg = <0x0 0x93b00000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: memory@93b10000 {
+			reg = <0x0 0x93b10000 0x0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: memory@93b15000 {
+			reg = <0x0 0x93b15000 0x0 0x2000>;
 			no-map;
 		};
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
