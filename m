Return-Path: <0101016e80795472-d16b3612-641f-44be-a7d3-e22ea898b7e2-000000@us-west-2.amazonses.com>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 16/16] arm64: dts: qcom: sm8150: Add ADSP, CDSP, MPSS and SLPI remoteprocs
Date: Mon, 18 Nov 2019 21:44:25 +0000
Message-ID: <0101016e80795472-d16b3612-641f-44be-a7d3-e22ea898b7e2-000000@us-west-2.amazonses.com>
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca
Cc: ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add ADSP, CDSP, MPSS and SLPI device tree nodes for SM8150 SoC.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts |  12 +++
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 135 ++++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index aa5de42fcae45..4d9bb8145dbba 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -348,6 +348,18 @@
 	};
 };
 
+&adsp_pas {
+	status = "okay";
+};
+
+&cdsp_pas {
+	status = "okay";
+};
+
+&slpi_pas {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 98a96fd1d6117..58f4ce95bd966 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -5,6 +5,8 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-sm8150.h>
+#include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -278,6 +280,139 @@
 		};
 	};
 
+	adsp_pas: remoteproc-adsp {
+		compatible = "qcom,sm8150-adsp-pas";
+
+		interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+				  "handover", "stop-ack";
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "xo";
+
+		power-domains = <&aoss_qmp AOSS_QMP_LS_LPASS>,
+				<&rpmhpd SM8150_CX>;
+		power-domain-names = "load_state", "cx";
+
+		memory-region = <&adsp_mem>;
+
+		qcom,smem-states = <&adsp_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+			label = "lpass";
+			qcom,remote-pid = <2>;
+			mboxes = <&apss_shared 8>;
+		};
+	};
+
+	cdsp_pas: remoteproc-cdsp {
+		compatible = "qcom,sm8150-cdsp-pas";
+
+		interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+				  "handover", "stop-ack";
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "xo";
+
+		power-domains = <&aoss_qmp AOSS_QMP_LS_CDSP>,
+				<&rpmhpd SM8150_CX>;
+		power-domain-names = "load_state", "cx";
+
+		memory-region = <&cdsp_mem>;
+
+		qcom,smem-states = <&cdsp_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 574 IRQ_TYPE_EDGE_RISING>;
+			label = "cdsp";
+			qcom,remote-pid = <5>;
+			mboxes = <&apss_shared 4>;
+		};
+	};
+
+	mpss_pas: remoteproc-mpss {
+		compatible = "qcom,sm8150-mpss-pas";
+
+		interrupts-extended = <&intc GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
+				      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+				      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready", "handover",
+				  "stop-ack", "shutdown-ack";
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "xo";
+
+		power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
+				<&rpmhpd SM8150_CX>,
+				<&rpmhpd SM8150_MSS>;
+		power-domain-names = "load_state", "cx", "mss";
+
+		memory-region = <&mpss_mem>;
+
+		qcom,smem-states = <&modem_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		glink-edge {
+			interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
+			label = "modem";
+			qcom,remote-pid = <1>;
+			mboxes = <&apss_shared 12>;
+		};
+	};
+
+	slpi_pas: remoteproc-slpi {
+		compatible = "qcom,sm8150-slpi-pas";
+
+		interrupts-extended = <&intc GIC_SPI 494 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+				  "handover", "stop-ack";
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "xo";
+
+		power-domains = <&aoss_qmp AOSS_QMP_LS_SLPI>,
+				<&rpmhpd SM8150_LCX>,
+				<&rpmhpd SM8150_LMX>;
+		power-domain-names = "load_state", "lcx", "lmx";
+
+		memory-region = <&slpi_mem>;
+
+		qcom,smem-states = <&slpi_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+			label = "dsps";
+			qcom,remote-pid = <3>;
+			mboxes = <&apss_shared 24>;
+		};
+	};
+
 	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_mem>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
