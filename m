Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH 2/2] arch: arm64: dtsi: dtsi changes for q6v5_pil drv validation on 8996
Date: Thu, 20 Oct 2016 22:47:29 +0530
Message-Id: <1476983849-26244-2-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1476983849-26244-1-git-send-email-akdwived@codeaurora.org>
References: <1476983849-26244-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, spjoshi@qti.qualcomm.com, kaushalk@qti.qualcomm.com, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>

DT changes to validate mss boot on 8996 using q6v5_pil driver.
driver has been validated on kernel tip after pulling glink,
smd-rpm clk driver, smd-rpm regulator etc. driver changes.

but patch consist only q6v5_pil related changes, and those dependencies
which were required to compile on tip.

this is initial version to get first hand comment and hence being mailed
only to remoteproc list.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 207 +++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8996.h |  12 ++
 include/dt-bindings/clock/qcom,rpmcc.h       | 163 +++++++++++++++++++++
 3 files changed, 382 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,rpmcc.h

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 338f82a..70f4de5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8996.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. MSM8996";
@@ -30,6 +31,27 @@
 		reg = <0 0 0 0>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		smem_mem: smem_region@86300000 {
+			reg = <0x0 0x86000000 0x0 0x200000>;
+			no-map;
+		};
+
+		mba_mem: mba_region@d4a00000 {
+			no-map;
+			reg = <0 0xd4a00000 0 0x100000>;
+		};
+
+		mpss_mem: mpss_region@88800000 {
+			no-map;
+			reg = <0 0x88800000 0 0x6200000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -212,12 +234,28 @@
 		method = "smc";
 	};
 
+	smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_mem>;
+		hwlocks = <&tcsr_mutex 3>;
+	};
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0 0 0xffffffff>;
 		compatible = "simple-bus";
 
+		tcsr_mutex_regs: syscon@740000 {
+			compatible = "syscon";
+			reg = <0x740000 0x20000>;
+		};
+
+		tcsr_mutex: hwlock {
+			compatible = "qcom,tcsr-mutex";
+			syscon = <&tcsr_mutex_regs 0 0x1000>;
+			#hwlock-cells = <1>;
+		};
+
 		intc: interrupt-controller@9bc0000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
@@ -229,6 +267,11 @@
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		apcs: syscon@9820000 {
+			compatible = "syscon";
+			reg = <0x9820000 0x1000>;
+		};
+
 		gcc: clock-controller@300000 {
 			compatible = "qcom,gcc-msm8996";
 			#clock-cells = <1>;
@@ -457,6 +500,170 @@
 					       <960000000>,
 					       <825000000>;
 		};
+		qcom,mss@2080000 {
+			compatible = "qcom,pil-q6v56-mss",
+						"qcom,q6v5-pil";
+			reg = <0x02080000 0x100>,
+				<0x0763000 0x008>,
+				<0x0765000 0x008>,
+				<0x0764000 0x008>,
+				<0x02180000 0x020>,
+				<0x038f008 0x004>;
+
+			reg-names = "qdsp6",
+						"halt_q6",
+						"halt_modem",
+						"halt_nc",
+						"rmb",
+						"restart_reg";
+
+			interrupts-extended = <&intc 0 448 1>,
+					  <&q6_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					  <&q6_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					  <&q6_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					  <&q6_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					"handover", "stop-ack";
+
+			clocks = <&rpmcc MSM8996_RPM_SMD_XO_CLK_SRC>,
+			 <&gcc GCC_MSS_CFG_AHB_CLK>,
+			 <&rpmcc MSM8996_RPM_SMD_PCNOC_CLK>,
+			 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
+			 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+			 <&gcc GPLL0_OUT_MSSCC>,
+			 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+			 <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
+			 <&rpmcc MSM8996_RPM_SMD_QDSS_CLK>;
+
+			 clock-names = "xo", "iface_clk", "pnoc_clk", "bus_clk",
+				  "mem_clk", "gpll0_mss_clk", "snoc_axi_clk",
+				  "mnoc_axi_clk", "qdss_clk";
+			qcom,proxy-clock-names = "xo", "pnoc_clk", "qdss_clk";
+			qcom,active-clock-names = "iface_clk", "bus_clk",
+				"mem_clk", "snoc_axi_clk", "mnoc_axi_clk";
+
+			vdd_cx-supply = <&pm8994_s1>;
+			vdd_cx-voltage = <1200000>;
+			vdd_mx-supply = <&pm8994_s2>;
+			vdd_mx-uV = <1050000>;
+			vdd_pll-supply = <&pm8994_l12>;
+			qcom,vdd_pll = <1800000>;
+			qcom,is-loadable;
+			qcom,firmware-name = "modem";
+			qcom,pil-self-auth;
+			qcom,ahb-clk-vote;
+			qcom,smem-states = <&q6_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			mba {
+				memory-region = <&mba_mem>;
+			};
+
+			mpss {
+				memory-region = <&mpss_mem>;
+			};
+	};
+
+	q6-smp2p {
+			compatible = "qcom,smp2p";
+			qcom,smem = <435>, <428>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <0 451 1>;
+			qcom,ipc = <&apcs 8 14>;
+
+			qcom,local-pid = <0>;
+			qcom,remote-pid = <1>;
+
+			q6_smp2p_in: slave-kernel {
+				qcom,entry-name = "slave-kernel";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			q6_smp2p_out: master-kernel {
+				qcom,entry-name = "master-kernel";
+				#qcom,state-cells = <1>;
+			};
+	};
+
+
+};
+
+	glink {
+		compatible = "qcom,glink";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
+
+		rpm {
+			qcom,glink-edge = "rpm";
+			interrupts = <0 168 1>;
+			qcom,irq-mask = <0x1>;
+			reg = <0x00068000 0x6000>,
+			      <0x09820010 0x4>;
+			reg-names = "msgram", "irq-reg-base";
+
+			rpm-requests {
+				compatible = "qcom,rpm-msm8996";
+				qcom,glink-channels = "rpm_requests";
+
+				rpmcc: qcom,rpmcc {
+					compatible = "qcom,rpmcc-msm8996", "qcom,rpmcc";
+					#clock-cells = <1>;
+				};
+
+				pm8994-regulators {
+					compatible = "qcom,rpm-pm8994-regulators";
+
+					pm8994_s1: s1 {};
+					pm8994_s2: s2 {};
+					pm8994_s3: s3 {};
+					pm8994_s4: s4 {};
+					pm8994_s5: s5 {};
+					pm8994_s6: s6 {};
+					pm8994_s7: s7 {};
+					pm8994_s8: s8 {};
+					pm8994_s9: s9 {};
+					pm8994_s10: s10 {};
+					pm8994_s11: s11 {};
+					pm8994_s12: s12 {};
+
+					pm8994_l1: l1 {};
+					pm8994_l2: l2 {};
+					pm8994_l3: l3 {};
+					pm8994_l4: l4 {};
+					pm8994_l5: l5 {};
+					pm8994_l6: l6 {};
+					pm8994_l7: l7 {};
+					pm8994_l8: l8 {};
+					pm8994_l9: l9 {};
+					pm8994_l10: l10 {};
+					pm8994_l11: l11 {};
+					pm8994_l12: l12 {};
+					pm8994_l13: l13 {};
+					pm8994_l14: l14 {};
+					pm8994_l15: l15 {};
+					pm8994_l16: l16 {};
+					pm8994_l17: l17 {};
+					pm8994_l18: l18 {};
+					pm8994_l19: l19 {};
+					pm8994_l20: l20 {};
+					pm8994_l21: l21 {};
+					pm8994_l22: l22 {};
+					pm8994_l23: l23 {};
+					pm8994_l24: l24 {};
+					pm8994_l25: l25 {};
+					pm8994_l26: l26 {};
+					pm8994_l27: l27 {};
+					pm8994_l28: l28 {};
+					pm8994_l29: l29 {};
+					pm8994_l30: l30 {};
+					pm8994_l31: l31 {};
+					pm8994_l32: l32 {};
+				};
+			};
+		};
 	};
 };
 #include "msm8996-pins.dtsi"
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8996.h b/include/dt-bindings/clock/qcom,gcc-msm8996.h
index 1828723..5a5ae3c 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8996.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8996.h
@@ -233,6 +233,18 @@
 #define GCC_PCIE_CLKREF_CLK					216
 #define GCC_RX2_USB2_CLKREF_CLK					217
 #define GCC_RX1_USB2_CLKREF_CLK					218
+#define GCC_AGGRE0_NOC_QOSGEN_EXTREF_CLK			219
+#define GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK			220
+#define GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK			221
+#define GCC_EDP_CLKREF_CLK					222
+#define GCC_MSS_CFG_AHB_CLK					223
+#define GCC_MSS_Q6_BIMC_AXI_CLK					224
+#define GCC_MSS_SNOC_AXI_CLK					225
+#define GCC_MSS_MNOC_BIMC_AXI_CLK				226
+#define GCC_DCC_AHB_ALK						227
+#define GCC_AGGRE0_NOC_MPU_CFG_AHB_CLK				228
+#define GCC_MMSS_GPLL0_DIV_CLK					229
+#define GPLL0_OUT_MSSCC						230
 
 #define GCC_SYSTEM_NOC_BCR					0
 #define GCC_CONFIG_NOC_BCR					1
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
new file mode 100644
index 0000000..68c6faa
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -0,0 +1,163 @@
+/*
+ * Copyright 2015 Linaro Limited
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _DT_BINDINGS_CLK_MSM_RPMCC_H
+#define _DT_BINDINGS_CLK_MSM_RPMCC_H
+
+/* apq8064 */
+#define RPM_PXO_CLK				0
+#define RPM_PXO_A_CLK				1
+#define RPM_CXO_CLK				2
+#define RPM_CXO_A_CLK				3
+#define RPM_APPS_FABRIC_CLK			4
+#define RPM_APPS_FABRIC_A_CLK			5
+#define RPM_CFPB_CLK				6
+#define RPM_CFPB_A_CLK				7
+#define RPM_QDSS_CLK				8
+#define RPM_QDSS_A_CLK				9
+#define RPM_DAYTONA_FABRIC_CLK			10
+#define RPM_DAYTONA_FABRIC_A_CLK		11
+#define RPM_EBI1_CLK				12
+#define RPM_EBI1_A_CLK				13
+#define RPM_MM_FABRIC_CLK			14
+#define RPM_MM_FABRIC_A_CLK			15
+#define RPM_MMFPB_CLK				16
+#define RPM_MMFPB_A_CLK				17
+#define RPM_SYS_FABRIC_CLK			18
+#define RPM_SYS_FABRIC_A_CLK			19
+#define RPM_SFPB_CLK				20
+#define RPM_SFPB_A_CLK				21
+
+/* msm8916 */
+#define RPM_SMD_XO_CLK_SRC				0
+#define RPM_SMD_XO_A_CLK_SRC			1
+#define RPM_SMD_PCNOC_CLK				2
+#define RPM_SMD_PCNOC_A_CLK				3
+#define RPM_SMD_SNOC_CLK				4
+#define RPM_SMD_SNOC_A_CLK				5
+#define RPM_SMD_BIMC_CLK				6
+#define RPM_SMD_BIMC_A_CLK				7
+#define RPM_SMD_QDSS_CLK				8
+#define RPM_SMD_QDSS_A_CLK				9
+#define RPM_SMD_BB_CLK1				10
+#define RPM_SMD_BB_CLK1_A				11
+#define RPM_SMD_BB_CLK2				12
+#define RPM_SMD_BB_CLK2_A				13
+#define RPM_SMD_RF_CLK1				14
+#define RPM_SMD_RF_CLK1_A				15
+#define RPM_SMD_RF_CLK2				16
+#define RPM_SMD_RF_CLK2_A				17
+#define RPM_SMD_BB_CLK1_PIN				18
+#define RPM_SMD_BB_CLK1_A_PIN			19
+#define RPM_SMD_BB_CLK2_PIN				20
+#define RPM_SMD_BB_CLK2_A_PIN			21
+#define RPM_SMD_RF_CLK1_PIN				22
+#define RPM_SMD_RF_CLK1_A_PIN			23
+#define RPM_SMD_RF_CLK2_PIN				24
+#define RPM_SMD_RF_CLK2_A_PIN			25
+
+/* msm8996 */
+#define MSM8996_RPM_SMD_XO_CLK_SRC				0
+#define MSM8996_RPM_SMD_XO_A_CLK_SRC			1
+#define MSM8996_RPM_SMD_PCNOC_CLK				2
+#define MSM8996_RPM_SMD_PCNOC_A_CLK				3
+#define MSM8996_RPM_SMD_SNOC_CLK				4
+#define MSM8996_RPM_SMD_SNOC_A_CLK				5
+#define MSM8996_RPM_SMD_BIMC_CLK				6
+#define MSM8996_RPM_SMD_BIMC_A_CLK				7
+#define MSM8996_RPM_SMD_QDSS_CLK				8
+#define MSM8996_RPM_SMD_QDSS_A_CLK				9
+#define MSM8996_RPM_SMD_BB_CLK1				10
+#define MSM8996_RPM_SMD_BB_CLK1_A				11
+#define MSM8996_RPM_SMD_BB_CLK2				12
+#define MSM8996_RPM_SMD_BB_CLK2_A				13
+#define MSM8996_RPM_SMD_RF_CLK1				14
+#define MSM8996_RPM_SMD_RF_CLK1_A				15
+#define MSM8996_RPM_SMD_RF_CLK2				16
+#define MSM8996_RPM_SMD_RF_CLK2_A				17
+#define MSM8996_RPM_SMD_BB_CLK1_PIN				18
+#define MSM8996_RPM_SMD_BB_CLK1_A_PIN			19
+#define MSM8996_RPM_SMD_BB_CLK2_PIN				20
+#define MSM8996_RPM_SMD_BB_CLK2_A_PIN			21
+#define MSM8996_RPM_SMD_RF_CLK1_PIN				22
+#define MSM8996_RPM_SMD_RF_CLK1_A_PIN			23
+#define MSM8996_RPM_SMD_RF_CLK2_PIN				24
+#define MSM8996_RPM_SMD_RF_CLK2_A_PIN			25
+#define MSM8996_RPM_SMD_AGGR1_NOC_CLK			26
+#define MSM8996_RPM_SMD_AGGR1_NOC_A_CLK			27
+#define MSM8996_RPM_SMD_AGGR2_NOC_CLK			28
+#define MSM8996_RPM_SMD_AGGR2_NOC_A_CLK			29
+#define MSM8996_RPM_SMD_CNOC_CLK				30
+#define MSM8996_RPM_SMD_CNOC_A_CLK				31
+#define MSM8996_RPM_SMD_MMAXI_CLK				32
+#define MSM8996_RPM_SMD_MMAXI_A_CLK				33
+#define MSM8996_RPM_SMD_IPA_CLK				34
+#define MSM8996_RPM_SMD_IPA_A_CLK				35
+#define MSM8996_RPM_SMD_CE1_CLK				36
+#define MSM8996_RPM_SMD_CE1_A_CLK				37
+#define MSM8996_RPM_SMD_DIV_CLK1				38
+#define MSM8996_RPM_SMD_DIV_CLK1_AO				39
+#define MSM8996_RPM_SMD_DIV_CLK2				40
+#define MSM8996_RPM_SMD_DIV_CLK2_AO				41
+#define MSM8996_RPM_SMD_DIV_CLK3				42
+#define MSM8996_RPM_SMD_DIV_CLK3_AO				43
+#define MSM8996_RPM_SMD_LN_BB_CLK				44
+#define MSM8996_RPM_SMD_LN_BB_A_CLK				45
+
+/* msm8974 */
+#define RPM_SMD_CXO_CLK_SRC                                0
+#define RPM_SMD_CXO_A_CLK_SRC                      1
+#define RPM_SMD_PNOC_CLK                           2
+#define RPM_SMD_PNOC_A_CLK                         3
+#define RPM_SMD_SNOC_CLK                           4
+#define RPM_SMD_SNOC_A_CLK                         5
+#define RPM_SMD_BIMC_CLK                           6
+#define RPM_SMD_BIMC_A_CLK                         7
+#define RPM_SMD_QDSS_CLK                           8
+#define RPM_SMD_QDSS_A_CLK                         9
+#define RPM_SMD_CXO_D0                             10
+#define RPM_SMD_CXO_D0_A                           11
+#define RPM_SMD_CXO_D1                             12
+#define RPM_SMD_CXO_D1_A                           13
+#define RPM_SMD_CXO_A0                             14
+#define RPM_SMD_CXO_A0_A                           15
+#define RPM_SMD_CXO_A1                             16
+#define RPM_SMD_CXO_A1_A                           17
+#define RPM_SMD_CXO_A2                             18
+#define RPM_SMD_CXO_A2_A                           19
+#define RPM_SMD_CXO_D0_PIN                         20
+#define RPM_SMD_CXO_D0_A_PIN                       21
+#define RPM_SMD_CXO_A2_PIN                         22
+#define RPM_SMD_CXO_A2_A_PIN                       23
+#define RPM_SMD_CXO_A1_PIN                         24
+#define RPM_SMD_CXO_A1_A_PIN                       25
+#define RPM_SMD_DIFF_CLK                           26
+#define RPM_SMD_DIFF_A_CLK                         27
+#define RPM_SMD_CNOC_CLK                           28
+#define RPM_SMD_CNOC_A_CLK                         29
+#define RPM_SMD_MMSSNOC_AHB_CLK                    30
+#define RPM_SMD_MMSSNOC_AHB_A_CLK                  31
+#define RPM_SMD_OCMEMGX_CLK                         32
+#define RPM_SMD_OCMEMGX_A_CLK                      33
+#define RPM_SMD_GFX3D_CLK_SRC                      34
+#define RPM_SMD_GFX3D_A_CLK_SRC                    35
+#define RPM_SMD_DIV_CLK1                           36
+#define RPM_SMD_DIV_A_CLK1                         37
+#define RPM_SMD_DIV_CLK2                           38
+#define RPM_SMD_DIV_A_CLK2                         39
+#define RPM_SMD_CXO_D1_PIN                         40
+#define RPM_SMD_CXO_D1_A_PIN                       41
+#define RPM_SMD_CXO_A0_PIN                         42
+#define RPM_SMD_CXO_A0_A_PIN                       43
+
+#endif
-- 
1.9.1
