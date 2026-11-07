Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018370;
	b=kTt8p3Fz5wWKgKw5guIiInbMQG7NXz4G76XWpI3uqI7Z10gR+iiJo0c2Aab8EDcJEk8x
	 mREk/oPs5c0kPTxSxkb7V5szXpiZzN9JF7m6ZA2hOOEkEupncWyWcmVY+NXHiXXgFwFMg
	 GC92bUR8vS9+fByMFBUe58nd+2WhvG9HQ93/OyVZtL8FXIV4S5SofQwdpF69FETu3lthc
	 aO1pOvM3ftlXbx7DU+RWJMUjwKkqASPDUc9fGx9auKWFZ8UC1fi9jK31UFcEZulISVIYh
	 wwkN9AOK3edGXCxYn8aOUvUu3KL485xHckySFJKPQKHioJ3kDZmbLpg3XZv7GkcARRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i15RWoDZXaIfhDa/h7rHPTU6W5SUeMZPUzPs5MwoGX4=;
	b=ybExgiAEkcnCoNQVTSxk36MkwfqA+PlfZeJoVtW1+OSJROm/XjD0nEZ804h3vVChlOJA
	 FHjtu234Lj6JaI+iRi5IpVbKAXbWuJ1Hfz/wXKzTUfwuB1wQSNI61xbvL3F3OeLUCM4W1
	 iabMekOQJ58yk2+QYRKifRMoFG9AlLiLLLjpGnPPZXmJ8TWYlsIf0PRuJkqi8nXsxlvok
	 W0rUvhN9tVNSTmIM0iH2fL3MrBYWhIAcLHQuJEAAC++8uxasiITbCX0IRZ2Xkd2kOZAcQ
	 srWLT3B9iLgJYtI+k8h3+vawahaQT6vIh7KmU6qbMdmxU98o9gcpd66p7Sl8pEAP09w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FHEyYftF;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1400606A32C
	for <linux-remoteproc@vger.kernel.org>; Sat,  7 Nov 2026 02:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1400606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FHEyYftF
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c33cc572e6so210724137.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 18:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018369; x=1794623169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i15RWoDZXaIfhDa/h7rHPTU6W5SUeMZPUzPs5MwoGX4=;
        b=FHEyYftFXzkqjQwjEIprWSC/Utjc/qTmOIstJ1GEpTxh331QYEvft2ZPLE+Iv3DW3K
         I3gpIAQlximbXh/z3TvROgEMqsiXKA4j9QXdAdk3VSmUxtnnfbEG15DL1v1RSFL/yVWm
         aPq+rN0l3S6Z8Q8Urcch4IYNs6a7u47JVNWEDQ8+qGPeBEQDgex5t6PWaFHyUS3bm1Yp
         4QutB0bb2ji60tPbvZzb9ZsmlHGh7RJ+cE5SkT+TI/cG5psxY7ppGe1LSEaB+KHeNYeQ
         CQH7+BmHob+uLYNqaUGNenvNpa/tiSFpNLaW0RqDasbLdTiYiJUcy4k72QypYvudO5pW
         FPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018369; x=1794623169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i15RWoDZXaIfhDa/h7rHPTU6W5SUeMZPUzPs5MwoGX4=;
        b=r5mnG1ty62DzqRkYawC30BUT4bVPbyGot30fmTYcOkyH5YUjXLBlgb1PF+dYv7suJy
         twcr0Frhy9oHkEbLEGe7V9IbxSL+XUWJVwXnaFwC7Ez26V2Su6ihJgjAY4l4MelBRBWG
         AYUFtxynorpAz9NMzYSGS6l7XUqJVKV/uPJRwG375k6f7+8WJ887Sm1SAd+5mns1DjL4
         k0ww5inx6hJ+67ambgvqv9Y/Ue3LWd0Fo4+265NYutP6XL0Dwv6BlqDsQ6rczcj8K8t/
         78pVmE65//XOKA3Qgi13KPK0YRxvFsms5nKbY554CNlHDnIBXg+uc38XLTniKcXD1EkZ
         DfvQ==
X-Forwarded-Encrypted: i=1; AL+hErGPe9ORLqRZrTV1zcfSzZEjTLrAQ824VfdJcqjbNtxPB33T41xZHWOW8w5cBWGzHmVoTsTMnsb30lsBpjdkdogO@vger.kernel.org
X-Gm-Message-State: APuU4Z8XtAX2bWZBDy36vxRq8MYRW8kXx3ue8wBizIWQjUuK6kZ9MBs9
	/pZpixTjgkf8dIIFmrlvF+qGj4CmEXF6QIH9DYHHWGeCtbDgupTNgSoR
X-Gm-Gg: AYBFou1hqBelpGRBsKVvK2KAgduEqk6YOS34i6U4OIbbv2IqrjLLzje/2JBF1lmkPqk
	jrt7nHNcr/ikUNNHiQ4i2Jod9JEnOkFzadmB7wl3RQ/ZfivZ4HjbwGJ+H+/RcQGwGSYMKhBfEYL
	2PEv3Zav6F+Bfof1Q5UaSFjlAv8F5AAzCfAEVHtlMK8Rm8NkTKMJ5SPCwN4791IfD3D4H3gAOGf
	ecqPeLio6qshaH4v2IL+qPWUIPqVPNBlWTkr52LNcap15zoRanSYTOFA5UJwfRfBD8wPRy+09B6
	q4V7LUyq/pcAiBbfBEZKtup8cG+Ou2A7IfzWGjgngXhWcygEtYS1+jN3xEk2LvvKnvFPVE9wAD+
	F6YdOzFZefuqVKjH8RsZC+uGk50lDr3SNGtIe6H6AgnHHmQ7+cT+ofI3Jv8GHLwnhXaJoIf6RSu
	K71uHtZfiGSrT2ANj+WMEIKNRjJDdYiaOl7K2NeIePj6r0FJvvcwU2rve3/NwIE/bKzBwpNXPfS
	ROiUwcBkFuT4MjglPuEwWU1Usrp5kadtHBmv1ul5GAmd5cVQ6k6YflIYW8i5yxh5NUTr3xJkSUV
	eFxoFeABBUxoSkLNKETZUcs984mc
X-Received: by 2002:a05:6102:6a8c:b0:798:24e8:23f4 with SMTP id ada2fe7eead31-7d2bd56bca0mr172187137.7.1794018368708;
        Fri, 06 Nov 2026 18:26:08 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2a89abee6sm2779376137.6.2026.11.06.18.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:26:08 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 5/9] arm64: dts: qcom: sdm670: add adsp
Date: Fri,  6 Nov 2026 21:24:49 -0500
Message-ID: <20261107022453.159341-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Audio DSP (Digital Signal Processor) is responsible for audio and
sensors on SDM670. Add this, along with the SMP2P nodes used to
communicate with it.

The sleep state is included to prevent the following crash:

    qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal

Otherwise, it is unused.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 177 +++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 711e15b56cb8..e99183c22208 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -500,6 +501,34 @@ cluster_pd: power-domain-cluster {
 		};
 	};
 
+	smp2p-lpass {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+
+		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apss_shared 26>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		adsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		adsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		adsp_smp2p_sleepstate: sleepstate {
+			qcom,entry-name = "sleepstate";
+			#qcom,smem-state-cells = <1>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -2383,6 +2412,19 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,sdm670-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0 0x0c300000 0 0x100000>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&apss_shared 0>;
+
+			#clock-cells = <0>;
+
+			cx_cdev: cx {
+				#cooling-cells = <2>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm670-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
@@ -2463,6 +2505,12 @@ gladiator_noc: interconnect@17900000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		apss_shared: mailbox@17990000 {
+			compatible = "qcom,sdm670-apss-shared", "qcom,sdm845-apss-shared";
+			reg = <0 0x17990000 0 0x1000>;
+			#mbox-cells = <1>;
+		};
+
 		apps_rsc: rsc@179c0000 {
 			compatible = "qcom,rpmh-rsc";
 			reg = <0 0x179c0000 0 0x10000>,
@@ -2573,6 +2621,135 @@ cpufreq_hw: cpufreq@17d43000 {
 			#freq-domain-cells = <1>;
 		};
 
+		adsp_pas: remoteproc@62400000 {
+			compatible = "qcom,sdm670-adsp-pas";
+			reg = <0 0x62400000 0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			memory-region = <&adsp_mem>;
+
+			power-domains = <&rpmhpd SDM670_LCX>;
+			power-domain-names = "lcx";
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+				label = "lpass";
+				qcom,remote-pid = <2>;
+				mboxes = <&apss_shared 24>;
+
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					qcom,intents = <512 20>;
+
+					q6core: service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1801 0x0>;
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1803 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1804 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1805 0x0>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1806 0x0>;
+					};
+				};
+			};
+		};
+
 		lpi_tlmm: pinctrl@62b40000 {
 			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
 			reg = <0 0x62b40000 0 0x20000>;
-- 
2.56.0

