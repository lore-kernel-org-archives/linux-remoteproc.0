Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/3] dt-bindings: soc: qcom: apr: Add protection domain bindings
Date: Fri, 20 Dec 2019 22:50:18 +0530
Message-Id: <20191220172019.11774-3-sibis@codeaurora.org>
In-Reply-To: <20191220172019.11774-1-sibis@codeaurora.org>
References: <20191220172019.11774-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org, robh+dt@kernel.org, tsoni@codeaurora.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add optional "qcom,protection-domain" bindings for APR services. This
helps to capture the dependencies between APR services and the PD on
which each apr service run.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/soc/qcom/qcom,apr.txt | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
index db501269f47b8..f87c0b2a48de4 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
@@ -45,6 +45,12 @@ by the individual bindings for the specific service
 			12 - Ultrasound stream manager.
 			13 - Listen stream manager.
 
+- qcom,protection-domain
+	Usage: optional
+	Value type: <stringlist>
+	Definition: Must list the protection domain service name and path
+		    that the particular apr service has a dependency on.
+
 = EXAMPLE
 The following example represents a QDSP based sound card on a MSM8996 device
 which uses apr as communication between Apps and QDSP.
@@ -82,3 +88,56 @@ which uses apr as communication between Apps and QDSP.
 			...
 		};
 	};
+
+= EXAMPLE 2
+The following example represents a QDSP based sound card on SDM845 device.
+Here the apr services are dependent on "avs/audio" service running on AUDIO
+Protection Domain hosted on ADSP remote processor.
+
+	apr {
+		compatible = "qcom,apr-v2";
+		qcom,glink-channels = "apr_audio_svc";
+		qcom,apr-domain = <APR_DOMAIN_ADSP>;
+
+		q6core {
+			compatible = "qcom,q6core";
+			reg = <APR_SVC_ADSP_CORE>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+		};
+
+		q6afe: q6afe {
+			compatible = "qcom,q6afe";
+			reg = <APR_SVC_AFE>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+			q6afedai: dais {
+				compatible = "qcom,q6afe-dais";
+				#sound-dai-cells = <1>;
+
+				qi2s@22 {
+					reg = <22>;
+					qcom,sd-lines = <3>;
+				};
+			};
+		};
+
+		q6asm: q6asm {
+			compatible = "qcom,q6asm";
+			reg = <APR_SVC_ASM>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+			q6asmdai: dais {
+				compatible = "qcom,q6asm-dais";
+				#sound-dai-cells = <1>;
+				iommus = <&apps_smmu 0x1821 0x0>;
+			};
+		};
+
+		q6adm: q6adm {
+			compatible = "qcom,q6adm";
+			reg = <APR_SVC_ADM>;
+			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+			q6routing: routing {
+				compatible = "qcom,q6adm-routing";
+				#sound-dai-cells = <0>;
+			};
+		};
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
