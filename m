Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4P5H4ocZ"
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A1A81BFE
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Dec 2023 07:09:13 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a196f84d217so261740066b.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Dec 2023 07:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1702048151; x=1702652951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uz469c4gN5niM5rjlwO+5+JkVlMzaiEgq9wGKFyoPqU=;
        b=4P5H4ocZBphar5DifVkZy6eexJH+QOtyA8Ky+q7fbcZAVkm/KJC15AMIpWmrWdRICq
         lpxQFuWg8AMfp70Wx3oNC8IaxV49UuweyLge8Sts1BdP2iUZ6kimic09qdV2QOznMCdS
         6Vq+e0Jfrerk6mTGBDAVAw5A8f7yoRB3ScQHtSKn65r8RhXoaLCXqest1B320YdQsAoT
         CbZ36JPWnLwPD6/cuW+v9ViaoDxpBh3QCH+zchpFRqkr4M8da8LB+eVWd7Uu+yIK0gvq
         BdA440yAjC5WPKGM1uXFcXlqT5oeoltoms/ud2sJ62k7TTor9gIqb5t8zIuKQp15YfzR
         My7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048151; x=1702652951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uz469c4gN5niM5rjlwO+5+JkVlMzaiEgq9wGKFyoPqU=;
        b=Yp/78l0lPMrTgc2nnEmha+y71o35QtvMlL7HRUSi4Z95riFKMYTeQSoPechc5HV1un
         7AbkJN2Bzb/xtJ2m7h+GMt66BTotbJ4A4uKU1qnKBqWq++FtGEexDze+ZPNfki6Q8t8j
         KWsMyPhulGC8GMZRqICSH5BiisNvR6hhS3TU005uIUBKjTLpaxDBdZG/ZmdWicp9tWRe
         5IVSBXbeBXep1LCWfWKkTSNIuIJ40EEkLmmFnhkWnMzKEed2mZfM+1LI0Xfi1bQv2oHx
         6SlLXw084KuQPYFffH78pTfLKGn9x1gFMhqIKplIoRgKP8ya7QFpK4PSMA7T4OFyUcDl
         abPw==
X-Gm-Message-State: AOJu0YyMJa4af7vqG7ytdFlMqJ0c8Uc4k9niqtzoohKCDK92v40oxbbO
	KK57AsWBH1nj4qlPrHc1khKoDrpeaF6uG5XkCPjQvw==
X-Google-Smtp-Source: AGHT+IHSQ3i9C6rNLUi/kwzRb7sDWmy7dvRBz70Y0zQN3w/4uY2lGSOJrZIYv/smgSuGvXnSWxrstA==
X-Received: by 2002:a17:906:1114:b0:a1c:c318:4bd9 with SMTP id h20-20020a170906111400b00a1cc3184bd9mr56709eja.154.1702048151506;
        Fri, 08 Dec 2023 07:09:11 -0800 (PST)
Received: from [192.168.55.221] (tmo-113-102.customers.d1-online.com. [80.187.113.102])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a1cc1be1146sm1096114eja.217.2023.12.08.07.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:09:11 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 08 Dec 2023 16:08:05 +0100
Subject: [PATCH v3 09/11] arm64: dts: qcom: sc7280: Add CDSP node
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-sc7280-remoteprocs-v3-9-6aa394d33edf@fairphone.com>
References: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
In-Reply-To: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Add the node for the ADSP found on the SC7280 SoC, using standard
Qualcomm firmware.

Remove the reserved-memory node from sc7280-chrome-common since CDSP is
currently not used there.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   5 -
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   6 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 143 +++++++++++++++++++++
 3 files changed, 149 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index b1ea31720d7b..9c25e28a62d9 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -77,11 +77,6 @@ cont_splash_mem: cont-splash@e1000000 {
 			no-map;
 		};
 
-		cdsp_mem: cdsp@88f00000 {
-			reg = <0x0 0x88f00000 0x0 0x1e00000>;
-			no-map;
-		};
-
 		rmtfs_mem: memory@f8500000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0xf8500000 0x0 0x600000>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index a60fb58d1bf1..c53a5f32915a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -17,6 +17,7 @@
  * required by the setup for Chrome boards.
  */
 
+/delete-node/ &cdsp_mem;
 /delete-node/ &gpu_zap_mem;
 /delete-node/ &gpu_zap_shader;
 /delete-node/ &hyp_mem;
@@ -86,6 +87,11 @@ spi_flash: flash@0 {
 	};
 };
 
+/* Currently not used */
+&remoteproc_cdsp {
+	/delete-property/ memory-region;
+};
+
 &remoteproc_wpss {
 	compatible = "qcom,sc7280-wpss-pil";
 	clocks = <&gcc GCC_WPSS_AHB_BDG_MST_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 6d319c8c6acf..0c25b4ecd0dc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -148,6 +148,11 @@ adsp_mem: adsp@86700000 {
 			no-map;
 		};
 
+		cdsp_mem: cdsp@88f00000 {
+			reg = <0x0 0x88f00000 0x0 0x1e00000>;
+			no-map;
+		};
+
 		video_mem: video@8b200000 {
 			reg = <0x0 0x8b200000 0x0 0x500000>;
 			no-map;
@@ -3842,6 +3847,144 @@ nsp_noc: interconnect@a0c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		remoteproc_cdsp: remoteproc@a300000 {
+			compatible = "qcom,sc7280-cdsp-pas";
+			reg = <0 0x0a300000 0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover",
+					  "stop-ack", "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SC7280_CX>,
+					<&rpmhpd SC7280_MX>;
+			power-domain-names = "cx", "mx";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
+
+			memory-region = <&cdsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x11a1 0x0420>,
+							 <&apps_smmu 0x1181 0x0420>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x11a2 0x0420>,
+							 <&apps_smmu 0x1182 0x0420>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x11a3 0x0420>,
+							 <&apps_smmu 0x1183 0x0420>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x11a4 0x0420>,
+							 <&apps_smmu 0x1184 0x0420>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x11a5 0x0420>,
+							 <&apps_smmu 0x1185 0x0420>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x11a6 0x0420>,
+							 <&apps_smmu 0x1186 0x0420>;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x11a7 0x0420>,
+							 <&apps_smmu 0x1187 0x0420>;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x11a8 0x0420>,
+							 <&apps_smmu 0x1188 0x0420>;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu 0x11ab 0x0420>,
+							 <&apps_smmu 0x118b 0x0420>;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x11ac 0x0420>,
+							 <&apps_smmu 0x118c 0x0420>;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x11ad 0x0420>,
+							 <&apps_smmu 0x118d 0x0420>;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x11ae 0x0420>,
+							 <&apps_smmu 0x118e 0x0420>;
+					};
+				};
+			};
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;

-- 
2.43.0

