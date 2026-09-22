Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E129537F730
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 01:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042298; cv=none; b=Z27BvJpnTfcJmJc/bnZ6krOcGGsgCPAou4n7WkguHZr/qHjSmFjNfzSa5LoS6n6XOWWe4VyVghOjI9Z3dbt/dMt9fteGFmEXbM87K4HxvfDDtz0KLgzqqFq3/B0hsu/De5xUiidTHA/RXJID/9KDFTGbDgHhkuHLqB8B8Nj4iAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042298; c=relaxed/simple;
	bh=RG5DQCHS9F4G7rBZA/5y8YaWKSDc+FBjx107+RMUuW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TMG9GYexAjn7YHt7aoKl1tS9OBS0jhz9fj4F50OictbNvHGkixABt3PAhsY956k9RPFJPk2CzigmEOfkU960sME8Dn6lu9nJXkoXmNKLCcosj+EsG42Iq8axDh0mAFiHx7cV+kCCJpOIFF1XQP7wzQgT7C8M2caZIzYlxRuas5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFOkwrjx; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFOkwrjx"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104649a5dcso33430906d6.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 18:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042296; x=1790647096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7OWe40rH1taU9GlVBHAdldtniDewW9TQkAorsEsmOGE=;
        b=mFOkwrjxD//wVuvKfCNaVFmns05hrVXSUXTFnJkL3vHJWy22e7FiLkN3AgoeGUo334
         5/8DNhhKxtiRlP2jSfsGIUxsqlQfJgGAKMD05pu4OGisJHJ1wqQuGz66wZllJrGa4yFh
         44hB1mEgCKNBFvbVij4gMzKlrALDzU/gBOs1SqBP8zE3ndzkjaPODFhpCMab2LcIhYpk
         zCCA7gxz2fPPmiFMvKgFku+YUPr6KinKdMDRBJkX/A92f4zY3UoxZ/MXr07fMEOdh0fX
         wJW4LnCzdjv5h5lH7MPMb8g+5uZVzZPZTjxHnh0PpYQhM4gJEAfFvzWMecgdx3vZKc0f
         Imbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042296; x=1790647096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7OWe40rH1taU9GlVBHAdldtniDewW9TQkAorsEsmOGE=;
        b=fL3+ozMknfqIcxqtCKkW9tA4eJn92viCD9pXWDflXiG5idR9Iqvz4+rDTjgWGRhfiT
         TAgf/oHi3k5djrngYkMWDzsIOAA+d+E38vKhv3b7lnLoCJx0NUq8+hMlmxCy/446eVsO
         R264VG8PHIVo7cdmvJQBbnK1xG8x22lQqd1inyosPz7NzgoKj2DP1pphMfaTuoyJsp5R
         IJHsLqnt95RLHFSkrlKE5nHN8j5U/bl/og30qahgnVdhJyBbp6Vu+WkK2YaSB0RtNApj
         ph4c8Cd44OuKMiCAJVSrDWaWEqFeLARhZ5iIJwGUA8eDOPqrCj3PfTbaQOwD17UjmdST
         NJPw==
X-Forwarded-Encrypted: i=1; AKwUvBwp/imrTEgIN9g3hIOviMj6jbZKmGXYNS3clmz1p5xIV76YrCOKE/+SHiu295hPeGLAj8s0g/tuxEioxd/Ck8a9@vger.kernel.org
X-Gm-Message-State: AFuF++ke1b5buXKsC4rljnj3ry0IxP8F2xapx2/qIp4KMHJdUjchnhQg
	8dhruc4wPjgFsOSvgLgBpjif4oSkjSq5k2R1H4RRaylGONyYgPHORu1JjjGVQw==
X-Gm-Gg: AYBFou2ietQYy/Q5E/PlE6by2EahLWsEY/VJz5094VQhjdRbkqcUAmBX6rVa7v4MfMn
	y3/jCDM6zBh5pTusKlmX58wwpgJkP7+2uSLt9VD4T6M/q8hJDOVVV/H6WUr6AY1FCtRGVhYoRpS
	VRm81SuG9J5v/zoGd8u6NfCEB4Ux2VgG2XA5L6bbLi/zXybKu/UWT7hLrmr5bjF4qI9TG66eOeT
	SIiDq01ceGwIPyTgRwDXf4/5LamnWKRUNlHi9sKa1x7J26dOPtrDTFoyCoTg+1OIrWcxQngI5Yp
	g3s1M5sJ9eBLiUJozACXQj9UgJR/s+p5fXejSHkdVfSsMpArx6aH7yXz/bmOpyI0qNZg5fxX+vN
	NhITwmjXDPlEdntsa+gIwpjGPUwiwFXn9b1QO9C4Gv04Xvl2XzA9hYuP7KqW1HZi/t07fkuqlK6
	LuB9ktSY74RnXaFwG8cniudcEOdMeR007m70p2evIhyKTvMP3ICngoo8n5tsjGiTgjBHClSv7eY
	a6ukJmq7KsR
X-Received: by 2002:ad4:5c44:0:b0:910:44f2:5ce3 with SMTP id 6a1803df08f44-913fc89c785mr36516296d6.8.1790042295786;
        Mon, 21 Sep 2026 18:58:15 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914023b40c3sm4277166d6.2.2026.09.21.18.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:15 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 06/11] arm64: dts: qcom: sdm670: add adsp
Date: Mon, 21 Sep 2026 21:57:56 -0400
Message-ID: <20260922015801.32373-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
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
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 175 +++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..3856431fa587 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -500,6 +501,40 @@ cluster_pd: power-domain-cluster {
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
+		/*
+		 * The ADSP crashes if this is not present. Simply probing this
+		 * magically prevents the crash. It does not need any driver to
+		 * interact with it. It is labelled in case proper support is
+		 * added for it.
+		 */
+		adsp_smp2p_sleepstate: sleepstate {
+			qcom,entry-name = "sleepstate";
+			#qcom,smem-state-cells = <1>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -2111,6 +2146,19 @@ dispcc: clock-controller@af00000 {
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
@@ -2191,6 +2239,12 @@ gladiator_noc: interconnect@17900000 {
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
@@ -2301,6 +2355,127 @@ cpufreq_hw: cpufreq@17d43000 {
 			#freq-domain-cells = <1>;
 		};
 
+		adsp_pas: remoteproc@62400000 {
+			compatible = "qcom,sdm670-adsp-pas";
+			reg = <0 0x62400000 0 0x100>;
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
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
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
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
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
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
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
+						qcom,nsessions = <2>;
+					};
+				};
+			};
+		};
+
 		lpi_tlmm: pinctrl@62b40000 {
 			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
 			reg = <0 0x62b40000 0 0x20000>;
-- 
2.55.0

