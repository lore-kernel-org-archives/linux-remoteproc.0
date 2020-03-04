Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v6 2/3] dt-bindings: soc: qcom: apr: Add protection domain bindings
Date: Thu,  5 Mar 2020 01:39:10 +0530
Message-Id: <20200304200911.15415-3-sibis@codeaurora.org>
In-Reply-To: <20200304200911.15415-1-sibis@codeaurora.org>
References: <20200304200911.15415-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org
Cc: agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, tsoni@codeaurora.org, vnkgutta@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh@kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Qualcomm SoCs (starting with MSM8998) allow for multiple protection
domains (PDs) to run on the same Q6 sub-system. This allows for
services like AVS AUDIO to have their own separate address space and
crash/recover without disrupting the other PDs running on the same Q6
ADSP. Add "qcom,protection-domain" bindings to capture the dependencies
between the APR service and the PD on which the apr service runs.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

V6:
 * Picked up Rob's R-b

V5:
 * Picked up Bjorn's R-b

 .../devicetree/bindings/soc/qcom/qcom,apr.txt | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
index db501269f47b8..f8fa71f5d84ba 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
@@ -45,6 +45,18 @@ by the individual bindings for the specific service
 			12 - Ultrasound stream manager.
 			13 - Listen stream manager.
 
+- qcom,protection-domain
+	Usage: optional
+	Value type: <stringlist>
+	Definition: Must list the protection domain service name and path
+		    that the particular apr service has a dependency on.
+	Possible values are :
+			"avs/audio", "msm/adsp/audio_pd".
+			"kernel/elf_loader", "msm/modem/wlan_pd".
+			"tms/servreg", "msm/adsp/audio_pd".
+			"tms/servreg", "msm/modem/wlan_pd".
+			"tms/servreg", "msm/slpi/sensor_pd".
+
 = EXAMPLE
 The following example represents a QDSP based sound card on a MSM8996 device
 which uses apr as communication between Apps and QDSP.
@@ -82,3 +94,41 @@ which uses apr as communication between Apps and QDSP.
 			...
 		};
 	};
+
+= EXAMPLE 2
+The following example represents a QDSP based sound card with protection domain
+dependencies specified. Here some of the apr services are dependent on services
+running on protection domain hosted on ADSP/SLPI remote processors while others
+have no such dependency.
+
+	apr {
+		compatible = "qcom,apr-v2";
+		qcom,glink-channels = "apr_audio_svc";
+		qcom,apr-domain = <APR_DOMAIN_ADSP>;
+
+		q6core {
+			compatible = "qcom,q6core";
+			reg = <APR_SVC_ADSP_CORE>;
+		};
+
+		q6afe: q6afe {
+			compatible = "qcom,q6afe";
+			reg = <APR_SVC_AFE>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+			...
+		};
+
+		q6asm: q6asm {
+			compatible = "qcom,q6asm";
+			reg = <APR_SVC_ASM>;
+			qcom,protection-domain = "tms/servreg", "msm/slpi/sensor_pd";
+			...
+		};
+
+		q6adm: q6adm {
+			compatible = "qcom,q6adm";
+			reg = <APR_SVC_ADM>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+			...
+		};
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
