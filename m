Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A14913DDC2
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2024 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716379739; cv=none; b=bd5HnNF3HLoHrPWbnnqeeWCLO3FlEMjzS9UgCS4t9tgrdyLaNj1VJL62s0XWwKoQ7xRmHCX3CKKwrRawSdj0OnEBLMFxiPFvlQMjb0xSzKE+6yilOcnHXROOSX5s9mhcoQztjD93B2nLVq6Kj6wkq+7pagflRv/BX/NkLoBNReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716379739; c=relaxed/simple;
	bh=P55jtoyNrhUYwJD0bT7FCymn+mdEeLeoZfSL1k2d32g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvNpDO+ziDMzGy1uPzcKl1fqCL7r5ygneVw95rEFa6nIxxv9u+MhFcbamMPKDugcKPzXxKBoPNyy+nlNqlZA15v8oTSSNVI0WUjXDo3HwDBALi/JPzFej/9dTWgh7aBL+qx9JAmJ6FCahm6i8lbtQ3IRbXBTR38PkrH1WKwAPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=izbpgRba; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="izbpgRba"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34db6a299b8so661086f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2024 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716379735; x=1716984535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBbl/FgcZn6F0X7Ky+upS0///p1fkbnapcfH14eSyO0=;
        b=izbpgRbaXDS9ecQ6XaZMtT0XFCrozP+9ObaCu0mcSyr7Q3yE9KHOgVSO8oK/EgP6ew
         Pc4bSWPulTNJBtVMvXkeLYqq7YNXvIDHPUJMsx3hQ+UF4qlHs6LZsr3Dh1O9US9Tuqbc
         l0YEB4RHSoSS7DmLdU1alzMuSu9f2DjhhBn/VTcKU9Cho41au9P8u+34TDIUhr5hUv16
         7RL0HSu7WWyk2dZmqAWxklVOwBG1dsIUNeDy9ICJVgdnp9OJmuPxXcHsg0YI48r+3uCw
         2cWVdapEst6Nk7sm/TxfzcozgV6ZGKmzzpmrgtNfC3Oh3aWhxogX6ugHrrgh+8X2oeo+
         ggZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716379735; x=1716984535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBbl/FgcZn6F0X7Ky+upS0///p1fkbnapcfH14eSyO0=;
        b=XkLuGGPF6Su9+Us3TkxyccHz9+gVUKyCRaO+8nmWzFcadwF7H4YQ+qKUNby8G3JgXL
         AdJzvytuaNBKqmHtauyXD/P5BQrc7/FoxaGIZqZHzmWZYjvDnYwm18J3/Lnh6wxM0n6s
         G9V9d8NW+WtKta5MDed+/2dyzia7iBCYNqJQVwGgehHhEKFQrBGnUik0hiq31S05avj3
         +dEgGRlh7pBiuD5PXu+Ae5X1M1UKUlMxiOGcTni/1L9FVNL1B/2n7Nqt6Kc7mAFBFYo1
         UqY8W5ewDgiPSAJmONMPiAnfIBvv+O/VqUkcIoFPojya9wgZwoAUwdGJKLSNmvyHJcD7
         MpeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw1CvsfIJ0r8dD3at5rr33Zn19btSg6mBTJtI+twzNJ2P3v8RtNatFAtICM0zw3R89lEPaSEug5C24g3lxki+nS3L2KcqXNNaxUl9mBqXjnw==
X-Gm-Message-State: AOJu0YyHa8t6ezmONnv/8cPsjX7s9HMNfIibfRb9yf5/OJFn6l9V3nRQ
	O6vRxc7F5aP7IXAHFfK3MSF8zVfwQWh0hG5DN3E8pA5aH6B0Rcs/6kGqpKBEXBY=
X-Google-Smtp-Source: AGHT+IFBWm3pqlXLTkV4eORK58+NiAje+bIY98/Mvh+E5RqimABjWULUrN9m3otkBIeCtCJf+0VAkQ==
X-Received: by 2002:a05:6000:180f:b0:34d:7eb6:6873 with SMTP id ffacd0b85a97d-354d8da3dabmr1196526f8f.63.1716379734990;
        Wed, 22 May 2024 05:08:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:82c7:3445:3b33:6c0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354e720d9afsm999226f8f.113.2024.05.22.05.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 05:08:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 May 2024 14:08:18 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP
 nodes
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-topic-lemans-iot-remoteproc-v1-4-af9fab7b27f0@linaro.org>
References: <20240522-topic-lemans-iot-remoteproc-v1-0-af9fab7b27f0@linaro.org>
In-Reply-To: <20240522-topic-lemans-iot-remoteproc-v1-0-af9fab7b27f0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Alex Elder <elder@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10650;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AM9WVgcgmAjbCC/W9GHvUGcjVNV77PVD1BSfacCfkHY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmTeBQRjNC8KICNZSMCKQpEi/75Ww7ZS39r8zSi
 NZUAvedSXuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZk3gUAAKCRARpy6gFHHX
 cvUkEADOJo4oE4GV2fN8ScR7ncoXtUteCg17qtsJ4gml+LbBZqBFniqW8Z45FGKTjCWKrCmdv7M
 olbF/q8jVB0L5iIOSf+07Wmxksd0ok+Fa8ZzO7qZnGbGhnfLwlJOiEV/pa46U67A8q6O6gfcSnr
 Gs0pG5ZLF3qII8uKCTas2j9o6IIFOytqXBaRrQUfTsTsYSgabX+Qn/0zMurP68yC4c/m8SoaN26
 Y7WcfjmAEaJtyTYZZrm706ZV59/9nX2iihYXciEUCdh6UKviutllZtTucsESd2kWqCJ94f4eP0E
 YQJXYHtDdxc/x3WmRXTjZA+jT/dtMK08h9foLbulj6WMHe3j0xBSePofdhTuXq+qRNe7+mXP4M6
 1z3YJJmHkfp1ZAqIh+4tfTJYJtHRecM7cRjcBhWIP1whgJ/sOYrzIwzpU6NPC483nvdv8SGFHGp
 yQGxNo0xT2oIT2qpfXz05S4/xbBX5b0KVfn06/7wFBFTjsHnoE9FGOp7X8AC49eVHwPyIs1IuEh
 PdOiFKR7R3lAdwMCeRMJ5g53ZOprOVmMrfvHtcNUwUw3mkIwlbbwFhKt9mTbrSj9VOJnL9xk6ZN
 bsNeCQfBb7e/Vi42HcKSbd0gqyon8ejTT5hro4lIcNbMvc2P7HHCVYLSZTR7vJP06QSPW/HixlP
 vGDXpdbFK0T7/Og==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Tengfei Fan <quic_tengfan@quicinc.com>

Add nodes for remoteprocs: ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 for
SA8775p SoCs.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 332 ++++++++++++++++++++++++++++++++++
 1 file changed, 332 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 31de73594839..5c0b61a5624b 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -544,6 +545,121 @@ cpucp_fw_mem: cpucp-fw@db200000 {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_LPASS IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp0 {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp0_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp0_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp1 {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_NSP1
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_NSP1 IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <12>;
+
+		smp2p_cdsp1_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp1_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-gpdsp0 {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP0
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_GPDSP0 IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <17>;
+
+		smp2p_gpdsp0_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_gpdsp0_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-gpdsp1 {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP1
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_GPDSP1 IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <18>;
+
+		smp2p_gpdsp1_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_gpdsp1_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -2479,6 +2595,92 @@ cpufreq_hw: cpufreq@18591000 {
 			#freq-domain-cells = <1>;
 		};
 
+		remoteproc_gpdsp0: remoteproc@20c00000 {
+			compatible = "qcom,sa8775p-gpdsp0-pas";
+			reg = <0x0 0x20c00000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_gpdsp0_in 0 0>,
+					      <&smp2p_gpdsp0_in 2 0>,
+					      <&smp2p_gpdsp0_in 1 0>,
+					      <&smp2p_gpdsp0_in 3 0>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "cx", "mxc";
+
+			interconnects = <&gpdsp_anoc MASTER_DSP0 0
+					 &config_noc SLAVE_CLK_CTL 0>;
+
+			memory-region = <&pil_gdsp0_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_gpdsp0_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP0
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_GPDSP0
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "gpdsp0";
+				qcom,remote-pid = <17>;
+			};
+		};
+
+		remoteproc_gpdsp1: remoteproc@21c00000 {
+			compatible = "qcom,sa8775p-gpdsp1-pas";
+			reg = <0x0 0x21c00000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 624 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_gpdsp1_in 0 0>,
+					      <&smp2p_gpdsp1_in 2 0>,
+					      <&smp2p_gpdsp1_in 1 0>,
+					      <&smp2p_gpdsp1_in 3 0>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "cx", "mxc";
+
+			interconnects = <&gpdsp_anoc MASTER_DSP1 0
+					 &config_noc SLAVE_CLK_CTL 0>;
+
+			memory-region = <&pil_gdsp1_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_gpdsp1_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP1
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_GPDSP1
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "gpdsp1";
+				qcom,remote-pid = <18>;
+			};
+		};
+
 		ethernet1: ethernet@23000000 {
 			compatible = "qcom,sa8775p-ethqos";
 			reg = <0x0 0x23000000 0x0 0x10000>,
@@ -2546,6 +2748,136 @@ ethernet0: ethernet@23040000 {
 
 			status = "disabled";
 		};
+
+		remoteproc_cdsp0: remoteproc@26300000 {
+			compatible = "qcom,sa8775p-cdsp0-pas";
+			reg = <0x0 0x26300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_NSP0>;
+			power-domain-names = "cx", "mxc", "nsp0";
+
+			interconnects = <&nspa_noc MASTER_CDSP_PROC 0
+					 &mc_virt SLAVE_EBI1 0>;
+
+			memory-region = <&pil_cdsp0_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp0_out 0>;
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
+			};
+		};
+
+		remoteproc_cdsp1: remoteproc@2a300000 {
+			compatible = "qcom,sa8775p-cdsp1-pas";
+			reg = <0x0 0x2A300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_NSP1>;
+			power-domain-names = "cx", "mxc", "nsp1";
+
+			interconnects = <&nspb_noc MASTER_CDSP_PROC_B 0
+					 &mc_virt SLAVE_EBI1 0>;
+
+			memory-region = <&pil_cdsp1_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp1_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_NSP1
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_NSP1
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp1";
+				qcom,remote-pid = <12>;
+			};
+		};
+
+		remoteproc_adsp: remoteproc@30000000 {
+			compatible = "qcom,sa8775p-adsp-pas";
+			reg = <0x0 0x30000000 0x0 0x100>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			interconnects = <&lpass_ag_noc MASTER_LPASS_PROC 0 &mc_virt SLAVE_EBI1 0>;
+
+			memory-region = <&pil_adsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			remoteproc_adsp_glink: glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.43.0

