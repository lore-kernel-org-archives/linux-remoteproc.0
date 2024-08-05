Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7C6160873
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Aug 2024 17:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722877705; cv=none; b=DNJEJHtFwJNDaxc9ys/EoU293EWZ90xASFrxeC8wPB6IBDs5lYHV6M0UEVo9K3d1DZ9TLAbiZ2jEcO7WXNITg1pbXHCiU/kjavj4EjZktKdtuP1Y+EZHKItDn1by38oDcH7+/zvUQWfeMRPwPams87Tf1AwdjTcd9RZyprUZjqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722877705; c=relaxed/simple;
	bh=gwIpOOABhRNJJwjCmkkwosmj9cMlvptNz18J1T/2olI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2Wy1AHnRfkgQkjlnsKzBKALa3DMlGJvUyQwEZfdY4FX/KsRPmlr4fZcozT1HcJNxMFbIGaxE6aWYvtsaDWWLV+BhFiqoVQKzVko1MamCd2H90fQ0cGayd5Nk1sCnn6l22jWWuOsL8hnCjQzC6jM1HSuXfAog+ViYbRnkNUySdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=e4iInmnI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e4iInmnI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4280bca3960so75208775e9.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Aug 2024 10:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722877701; x=1723482501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+ZuzK91DSwp6UiDazytBs+7RojAv784LufLi+/f+zI=;
        b=e4iInmnIEMf7CcIj5zW7fpMO0WxPFK5LMRlmFCL96UMOszl7+JvrpKW6bTWYjloLhP
         t/8iLaLSx+IeLCqr3rr/s9fGz+KRinaIKKzxbExTom5fH5iqsJ3xTz8fG91tY4p7Z0E1
         1cD5JeO88b/cLVrvEJsGravff0ZKDf1I0WxBnWO3LHMcNok6qSsT2O++qUUPc53n9EXa
         52ZFkuDdF5YX0LbbwTbaZLEtjLtRFIV0gSzRl6SBK1Ai0O1K5RssHjQP0yrXS/UL0i/h
         rsHwbsDsz0mKA9PKnkYiyZX6sg13m2Pj1bOfICrWTwXBcBgKu68HGBtvq5EP2DTsFcAe
         y1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722877701; x=1723482501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+ZuzK91DSwp6UiDazytBs+7RojAv784LufLi+/f+zI=;
        b=uRqRxhQ1ZQ65qdAHUSi9YD1rRA0O0JrpKHOt8L8tPhZHeLWrGmylc/QE7V6bE1tw+z
         Cr2RJmT8707M4f2hWYhDsZHio5OlwT8n/LhFXHKRpoOxISxfkiEt3MwTOTKtiwuKD05q
         YmunLWNf+4MbcWjpv5iGjxTvETrygG0DXVyCaxgKTzKcQbMorZTq/kfB2q7ib70WKJAq
         kS/t5MZA+MzR37puGuDXjK4wsaGPZVauEzgkrNIgCUEvg/P3gdx3hTD6A+e2f9U/bHpd
         l/oofEQlWVv2Fx0N2ZZrOUg6JGlv5yssduyR4gP8zhFNinGFzxJVHkH/oZQb24VYscGI
         t3Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWZB0WV4qugNBaM6fWFt8jZ0SGsVL5nLOaPIIWdFeJUHvcSlRBQnbGfXb+pCTn3GfxQpcQWviTuoNYFh29ZfI/N/yxai1ESrL7ya/1ljXXikA==
X-Gm-Message-State: AOJu0YzHrPL3RXAfgGjY2WZA4vdyASuDiWJHXsScPDpjKIXnMgjRXIsJ
	JlfDwehwC50a0WXruTS5f5faBDkZ+JPafZLAjdTsNM44tt3ryas0S3AxOZG8dT0=
X-Google-Smtp-Source: AGHT+IEr/MKI4hUen2DVQDk0WKw+WRMtUiIgRCFqjbg4pPbnn9gpqn2JZrVMo4WzCN+Ocp1Jug9IHw==
X-Received: by 2002:adf:a782:0:b0:368:3731:1613 with SMTP id ffacd0b85a97d-36bbc0e6609mr8983236f8f.13.1722877700864;
        Mon, 05 Aug 2024 10:08:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1068:b792:523c:3f73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf1e97esm10356486f8f.37.2024.08.05.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:08:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 05 Aug 2024 19:08:06 +0200
Subject: [PATCH v4 5/6] arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP
 nodes
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-topic-sa8775p-iot-remoteproc-v4-5-86affdc72c04@linaro.org>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17728;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jSWX3d875ZPuvpcpIaaVnfx8Ty9tZAqdh//JXJbwyNE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmsQb8JiXrRgQ3q2D0U7f2ZoD255Lu4/99LhVO4
 tbveVt+no6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrEG/AAKCRARpy6gFHHX
 cg7TEACacwqsKKE54gxrbgh5ruaS1cI+OrVtBmbrVHZN8Ao80DSp4CBKto0IRQ3OcAcq0w7PYlx
 71ydUjIcuPAqc/OY+RNUBfwzFZifL3QMpiVnZ3Rps8KYNO3Ll2DYApWtOoWwdOwPGOcQnKMQDXv
 OTIkKCuHrz27WUBaYQOb41TsaIYY/k5k7UxGnvRAS0OGmWzmprWpZXMkb+/cuSii+qeGu/QGxcW
 5B/MuZmIMnivGtXNHyA8TdRi4UJL2TKuK1Sp0X7m7bRYNSzEyhY4ehmBn/MP6otS8bsFi2lUJbk
 koD1FlecQEiPTwm2MRPTWLyr3M9BNJ6TqkeQ7G3Cn13rt+OHgYD/pbT/3OfZvg9PH7ACYxK71Fy
 tNx3bqqp4isnRw7bj3OJ9n/g1aOzmwCniWShYUJDDj3yGTMoWfLTF6fwYW97zhrngLdl+qpWEVJ
 ThlMNJGwY9zDw5OljI1SG6zVGeXBqjEIEuOfm/i+SCQoqmpLMML0F/XXIJjU0Kt/4KGonzjHEVw
 +pRjsfTubJiSaflut/vli14oxsDCz0oN9/XSNYFxk9OGuNq591WK0OL2GFfn+7YRGgbJqS/0u4E
 RPwnXmeTE9R/mVjiD66l8BIffYGulcBELVAkCmSQ9z+V+ctktGER7ajKg/lAYLqqzxdJmwktfA7
 elHI9ey1FuACgOA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Tengfei Fan <quic_tengfan@quicinc.com>

Add nodes for remoteprocs: ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 for
SA8775p SoCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
[Ling: added the fastrcp nodes]
Co-developed-by: Ling Xu <quic_lxu5@quicinc.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
[Bartosz: ported to mainline]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 548 ++++++++++++++++++++++++++++++++++
 1 file changed, 548 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index ad8e567575e5..50ec4712e39f 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -564,6 +565,121 @@ cpucp_fw_mem: cpucp-fw@db200000 {
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
@@ -3447,6 +3563,92 @@ cpufreq_hw: cpufreq@18591000 {
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
@@ -3528,6 +3730,352 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
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
+			power-domain-names = "cx", "mxc", "nsp";
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
+			power-domain-names = "cx", "mxc", "nsp";
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
+				label = "cdsp";
+				qcom,remote-pid = <12>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x2941 0x04a0>,
+							 <&apps_smmu 0x2961 0x04a0>,
+							 <&apps_smmu 0x2981 0x0400>,
+							 <&apps_smmu 0x29c1 0x04a0>,
+							 <&apps_smmu 0x29e1 0x04a0>,
+							 <&apps_smmu 0x2d41 0x04a0>,
+							 <&apps_smmu 0x2d61 0x04a0>,
+							 <&apps_smmu 0x2d81 0x0400>,
+							 <&apps_smmu 0x2dc1 0x04a0>,
+							 <&apps_smmu 0x2de1 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x2942 0x04a0>,
+							 <&apps_smmu 0x2962 0x04a0>,
+							 <&apps_smmu 0x2982 0x0400>,
+							 <&apps_smmu 0x29c2 0x04a0>,
+							 <&apps_smmu 0x29e2 0x04a0>,
+							 <&apps_smmu 0x2d42 0x04a0>,
+							 <&apps_smmu 0x2d62 0x04a0>,
+							 <&apps_smmu 0x2d82 0x0400>,
+							 <&apps_smmu 0x2dc2 0x04a0>,
+							 <&apps_smmu 0x2de2 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x2943 0x04a0>,
+							 <&apps_smmu 0x2963 0x04a0>,
+							 <&apps_smmu 0x2983 0x0400>,
+							 <&apps_smmu 0x29c3 0x04a0>,
+							 <&apps_smmu 0x29e3 0x04a0>,
+							 <&apps_smmu 0x2d43 0x04a0>,
+							 <&apps_smmu 0x2d63 0x04a0>,
+							 <&apps_smmu 0x2d83 0x0400>,
+							 <&apps_smmu 0x2dc3 0x04a0>,
+							 <&apps_smmu 0x2de3 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x2944 0x04a0>,
+							 <&apps_smmu 0x2964 0x04a0>,
+							 <&apps_smmu 0x2984 0x0400>,
+							 <&apps_smmu 0x29c4 0x04a0>,
+							 <&apps_smmu 0x29e4 0x04a0>,
+							 <&apps_smmu 0x2d44 0x04a0>,
+							 <&apps_smmu 0x2d64 0x04a0>,
+							 <&apps_smmu 0x2d84 0x0400>,
+							 <&apps_smmu 0x2dc4 0x04a0>,
+							 <&apps_smmu 0x2de4 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x2945 0x04a0>,
+							 <&apps_smmu 0x2965 0x04a0>,
+							 <&apps_smmu 0x2985 0x0400>,
+							 <&apps_smmu 0x29c5 0x04a0>,
+							 <&apps_smmu 0x29e5 0x04a0>,
+							 <&apps_smmu 0x2d45 0x04a0>,
+							 <&apps_smmu 0x2d65 0x04a0>,
+							 <&apps_smmu 0x2d85 0x0400>,
+							 <&apps_smmu 0x2dc5 0x04a0>,
+							 <&apps_smmu 0x2de5 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x2946 0x04a0>,
+							 <&apps_smmu 0x2966 0x04a0>,
+							 <&apps_smmu 0x2986 0x0400>,
+							 <&apps_smmu 0x29c6 0x04a0>,
+							 <&apps_smmu 0x29e6 0x04a0>,
+							 <&apps_smmu 0x2d46 0x04a0>,
+							 <&apps_smmu 0x2d66 0x04a0>,
+							 <&apps_smmu 0x2d86 0x0400>,
+							 <&apps_smmu 0x2dc6 0x04a0>,
+							 <&apps_smmu 0x2de6 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x2947 0x04a0>,
+							 <&apps_smmu 0x2967 0x04a0>,
+							 <&apps_smmu 0x2987 0x0400>,
+							 <&apps_smmu 0x29c7 0x04a0>,
+							 <&apps_smmu 0x29e7 0x04a0>,
+							 <&apps_smmu 0x2d47 0x04a0>,
+							 <&apps_smmu 0x2d67 0x04a0>,
+							 <&apps_smmu 0x2d87 0x0400>,
+							 <&apps_smmu 0x2dc7 0x04a0>,
+							 <&apps_smmu 0x2de7 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x2948 0x04a0>,
+							 <&apps_smmu 0x2968 0x04a0>,
+							 <&apps_smmu 0x2988 0x0400>,
+							 <&apps_smmu 0x29c8 0x04a0>,
+							 <&apps_smmu 0x29e8 0x04a0>,
+							 <&apps_smmu 0x2d48 0x04a0>,
+							 <&apps_smmu 0x2d68 0x04a0>,
+							 <&apps_smmu 0x2d88 0x0400>,
+							 <&apps_smmu 0x2dc8 0x04a0>,
+							 <&apps_smmu 0x2de8 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x2949 0x04a0>,
+							 <&apps_smmu 0x2969 0x04a0>,
+							 <&apps_smmu 0x2989 0x0400>,
+							 <&apps_smmu 0x29c9 0x04a0>,
+							 <&apps_smmu 0x29e9 0x04a0>,
+							 <&apps_smmu 0x2d49 0x04a0>,
+							 <&apps_smmu 0x2d69 0x04a0>,
+							 <&apps_smmu 0x2d89 0x0400>,
+							 <&apps_smmu 0x2dc9 0x04a0>,
+							 <&apps_smmu 0x2de9 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&apps_smmu 0x294a 0x04a0>,
+							 <&apps_smmu 0x296a 0x04a0>,
+							 <&apps_smmu 0x298a 0x0400>,
+							 <&apps_smmu 0x29ca 0x04a0>,
+							 <&apps_smmu 0x29ea 0x04a0>,
+							 <&apps_smmu 0x2d4a 0x04a0>,
+							 <&apps_smmu 0x2d6a 0x04a0>,
+							 <&apps_smmu 0x2d8a 0x0400>,
+							 <&apps_smmu 0x2dca 0x04a0>,
+							 <&apps_smmu 0x2dea 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu 0x294b 0x04a0>,
+							 <&apps_smmu 0x296b 0x04a0>,
+							 <&apps_smmu 0x298b 0x0400>,
+							 <&apps_smmu 0x29cb 0x04a0>,
+							 <&apps_smmu 0x29eb 0x04a0>,
+							 <&apps_smmu 0x2d4b 0x04a0>,
+							 <&apps_smmu 0x2d6b 0x04a0>,
+							 <&apps_smmu 0x2d8b 0x0400>,
+							 <&apps_smmu 0x2dcb 0x04a0>,
+							 <&apps_smmu 0x2deb 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x294c 0x04a0>,
+							 <&apps_smmu 0x296c 0x04a0>,
+							 <&apps_smmu 0x298c 0x0400>,
+							 <&apps_smmu 0x29cc 0x04a0>,
+							 <&apps_smmu 0x29ec 0x04a0>,
+							 <&apps_smmu 0x2d4c 0x04a0>,
+							 <&apps_smmu 0x2d6c 0x04a0>,
+							 <&apps_smmu 0x2d8c 0x0400>,
+							 <&apps_smmu 0x2dcc 0x04a0>,
+							 <&apps_smmu 0x2dec 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x294d 0x04a0>,
+							 <&apps_smmu 0x296d 0x04a0>,
+							 <&apps_smmu 0x298d 0x0400>,
+							 <&apps_smmu 0x29Cd 0x04a0>,
+							 <&apps_smmu 0x29ed 0x04a0>,
+							 <&apps_smmu 0x2d4d 0x04a0>,
+							 <&apps_smmu 0x2d6d 0x04a0>,
+							 <&apps_smmu 0x2d8d 0x0400>,
+							 <&apps_smmu 0x2dcd 0x04a0>,
+							 <&apps_smmu 0x2ded 0x04a0>;
+						dma-coherent;
+					};
+				};
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

