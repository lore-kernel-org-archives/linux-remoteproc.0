Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 3/8] arm64: dts: qcom: qcs404-evb: Mark CDSP clocks protected
Date: Thu,  9 May 2019 21:34:16 -0700
Message-Id: <20190510043421.31393-4-bjorn.andersson@linaro.org>
In-Reply-To: <20190510043421.31393-1-bjorn.andersson@linaro.org>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

With the Trustzone based CDSP remoteproc driver these clocks are
controlled elsewhere and as they are not enabled by anything in Linux
the clock framework will turn them off during lateinit.

This results in issues either to later start the CDSP, using the
Trustzone interface, or if the CDSP is already running it will crash.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 2c3127167e3c..dc1d7d5d21a4 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -56,6 +56,13 @@
 	qcom,controlled-remotely;
 };
 
+&gcc {
+	protected-clocks = <GCC_BIMC_CDSP_CLK>,
+			   <GCC_CDSP_CFG_AHB_CLK>,
+			   <GCC_CDSP_BIMC_CLK_SRC>,
+			   <GCC_CDSP_TBU_CLK>;
+};
+
 &pms405_spmi_regulators {
 	vdd_s3-supply = <&pms405_s3>;
 
-- 
2.18.0
