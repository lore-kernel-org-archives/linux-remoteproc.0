Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 8/8] arm64: dts: qcom: qcs404: Add fastrpc nodes
Date: Thu,  9 May 2019 21:34:21 -0700
Message-Id: <20190510043421.31393-9-bjorn.andersson@linaro.org>
In-Reply-To: <20190510043421.31393-1-bjorn.andersson@linaro.org>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Thierry Escande <thierry.escande@linaro.org>

The ADSP fastrpc provides 3 context banks and are assigned to IOMMU
context banks 23, 24 and 25; using SIDs 0x804, 0x805 and 0x806.  The
CDSP fastrpc provides 5 context banks and are assigned to IOMMU context
banks 5, 6, 7, 8 and 9; using SIDs 0x1001 through 0x1005. Add these to
their respective remoteproc.

The lower 4 bits of the SID is used to identify the context bank when
communicating with the fastrpc firmware, so this gives the reg values.

Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
[bjorn: Added SMMU linkage and extend commit message]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 66 ++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index fcde4f0334c2..858a53160564 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -243,6 +243,45 @@
 				mboxes = <&apcs_glb 12>;
 
 				label = "cdsp";
+
+				fastrpc_cdsp: fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_iommu 5>;
+					};
+
+					cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_iommu 6>;
+					};
+
+					cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_iommu 7>;
+					};
+
+					cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_iommu 8>;
+					};
+
+					cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_iommu 9>;
+					};
+				};
 			};
 		};
 
@@ -928,6 +967,33 @@
 				mboxes = <&apcs_glb 8>;
 
 				label = "adsp";
+
+				fastrpc_adsp: fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_iommu 23>;
+					};
+
+					cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_iommu 24>;
+					};
+
+					cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_iommu 25>;
+					};
+				};
 			};
 		};
 	};
-- 
2.18.0
