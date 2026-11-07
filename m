Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018420;
	b=a4vmj6v99YtjDI1XFjGG38sDBesT+mdKeg0OCyWiNy9aH3MgczqnxLoGyBg6481GNe59
	 EglT5AP2Ekj7Kl3UgUjYZHsn006L0yZ/a0ZBpHlUIdeldUohgrhRqMnyYqWdreoHTX6rX
	 XqXNfOQwCRyWOOm2kwGtH6EysirWtZUu6zBRjo4bLLSZtaGfq6KKA+B3HoyJrRk6KFon1
	 KoQZrzSYvnscAB4arYwvIWxswVNNhAdx7CF+J7tRmtSVJOUGPkokfxsLQmxrOZPt0LRPe
	 wSmCB5Gz9uwSaDDc5WPAAHo3O0q8a/L02YZ7KkpGWQlyh+rJeHGc4edyBtcO5r4q/pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JBs4KuqaNR2nM2Szi8pKsnADDqgagyh4d1iV5Vug0rk=;
	b=0nScihCvO83MdkYwpvlezwsJhZoo931GPvLo0KKacUFrl1PkAdIXuhQzxJ7S7VAlot+h
	 oEUvItFQlNAIiJHZKyzb3Uf7jbJlEULPGb+7STLI6nRYB2ICateea2Ev9o1eyVTFweGbw
	 ZMKgnhqREjZMgBwF0iOdN3TKnZfDSF/zs8nn5DbDW7p7b9yRIVdn3l2j74YN/hfmuXM1E
	 AsEFpk3XM7lnPqCEj/0hDbMKCR+FQCK15egzPId5Xbz1ugwkyoTGOMFjrhTUCpPi6Od86
	 SGj1ToMP+1+zcQ5Qkl5AtkIedoY3I0tarX7xGnL90ERwLkqEq8w6JWBpKMG54E67LPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TZtkk0kj;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9FB606A32C
	for <linux-remoteproc@vger.kernel.org>; Sat,  7 Nov 2026 02:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9FB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TZtkk0kj
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ec690faf85so457953e0c.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 18:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018419; x=1794623219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBs4KuqaNR2nM2Szi8pKsnADDqgagyh4d1iV5Vug0rk=;
        b=TZtkk0kjOvv+j2d2zCmF5xTHAxEmhg4L1kCBLDWIS8K8pzNkb7HqFKaxqYY3KBBG12
         W+Fp9vpo7peNhQ9xzTNba0I9nw1XUS2CUPnKD0GzKomOTd8OphyhaNLDNKyqsKYysw05
         gnW0K7uuUhu8AuEjW3TVBQxA85vU5lFiKNDuY4mtCDTPA5FlST5H2oHpQH3m20C8xOa6
         nf+PLe9oHwDr7DsGa7sGnkFK9ELdhszLFwec6AC+E74u6giEyesYS/klP9THiYPOJrvi
         Zs6jB/I4Itr9vKxt80SltWzvghvdkAm4JhHKtuLFhzS8mG4uvbd6KkFR0uLPxs1PiVwa
         3z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018419; x=1794623219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBs4KuqaNR2nM2Szi8pKsnADDqgagyh4d1iV5Vug0rk=;
        b=Ydh1l6mjXqChReD2KHtxoYk9xZZFf2yeE3MgCL7XIzgIwC5TvUP2s8Ax1+GTQdO+ZT
         kU7U5qnzGcaNJb97uOyqB0HiBzh/2/oH8SNngAbL+c7CGTm+aKjKPGi6Np+KKLWTKfZS
         CIA6HhCJzRgN2EGt2q01bXzXHJaqdzhwdUFhub1YGbp24FYYwAcxkU2vjRfZRr1kiAkI
         0nGhhAgUS1Q3prhkA/0CWMYQnCpCD9kNcKhmhKgezapPUTAxmiLTti2s5LUW5zwFxgU7
         NpQvb+vFEV6zA3ve2+rFnFX+Mst01Y2xmL+s6gWG5VX4xtNsLzXI5/Bg9e8qyBbsRC9o
         zR7A==
X-Forwarded-Encrypted: i=1; AL+hErEKnuTTdEfrk+uarD1tr0pC0dCoiPvOi7gIPSreSTeMdAM2yDSw5/8lXjhtRUNIRVG1rh6ofOlYgW/MgozidbAp@vger.kernel.org
X-Gm-Message-State: APuU4Z/gYrYNL6wSZEoiot+c1L5bvpBGyIKb9sHyEkUkSlCLqXxHcAXl
	99zd64sbkzW2SzeEux1w47E7yqSCrnCceKRKmq+xS3k6QK32G2eYux1F648jeA==
X-Gm-Gg: AYBFou0h+sCyPf1bgje0kSue+t0+KEpajclcVKedwiuvek9e4bbUSmU3m2qFi56U5Vt
	FddXF5Vz8Jo3+jFd5c3x8zDyViY8LVms98OLOI+BFU6NUmYCZpPaaCsv0BFQZxOA/f2KkiQVCyU
	WA8slr3A9MshZ0rSJJGjVX3QZ/utRVqHF/l3BreB8OerUGhN9w1OQaAaO1KTFUoWn5+mbwuo5B5
	f0D/iDu6czefS4tDhv7I5EFI0ICL/xqVRAE+X+WfQ3V6X3sDfZr9ZX0kpjjLrPdkNp/tG/t09RR
	VurmSAvE7aU5a3fcVoUzhuIYq45RaY2sAL/W7dxKAe42ED78d5G7icgnvHnOjM8lSKWOIEFwBCl
	WZnCwklPM96bsR28Sl7cE7yLX3THljiKzAZmXNllpAOQly2gD5UXQsl6saUZLXblLV7HGr1pHHX
	WXhuVRN0PVD6umf5wbefJ+0hEfPc4n/SpaGJ5tnIFRLwuLJQP8PznUeMuywoJ6YgWcWDQAeu/f5
	1hlQtp+j4ZzGE3SRRmPI+AWA/rUdRc+xLl9eoLQLY4CGDgMwoEOlMlOaYnIUFclnneJaMdBvXW1
	nP2mr00So1INv59skE4zbZquTUdm5g==
X-Received: by 2002:a05:6122:a554:b0:5ec:d5e1:ee27 with SMTP id 71dfb90a1353d-5ecd5e1f0d0mr10763e0c.20.1794018419194;
        Fri, 06 Nov 2026 18:26:59 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64cb602sm2728425e0c.7.2026.11.06.18.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:26:58 -0800 (PST)
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
Subject: [PATCH v3 9/9] arm64: dts: qcom: sdm670-google: add sound card
Date: Fri,  6 Nov 2026 21:24:53 -0500
Message-ID: <20261107022453.159341-10-mailingradian@gmail.com>
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

The Pixel 3a has a sound card for built-in audio (RT5514 and CS35L36
codecs) and for the headphone jack (WCD codec). Add the sound card,
q6asm frontends, and WCD codec for headset audio.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 2044593c22f3..c623b02f091d 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include "sdm670.dtsi"
 #include "pm660.dtsi"
 #include "pm660l.dtsi"
@@ -130,6 +131,87 @@ debug_info_mem: debug-info@a1800000 {
 		};
 	};
 
+	sound {
+		compatible = "qcom,sdm660-sndcard";
+		model = "Google Pixel 3a";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cdc_pdm_default>,
+			    <&cdc_dmic_default>;
+
+		audio-routing = "Analog PDM_RX1", "Digital PDM_RX1",
+				"Analog PDM_RX2", "Digital PDM_RX2",
+				"Analog PDM_RX3", "Digital PDM_RX3",
+				"Digital LPASS_PDM_TX", "Analog PDM_TX",
+				"Analog AMIC2", "Analog MIC BIAS External2";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		mm4-dai-link {
+			link-name = "MultiMedia4";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
+			};
+		};
+
+		lpi-mi2s-rx-dai-link {
+			link-name = "LPI MI2S Playback";
+
+			codec {
+				sound-dai = <&pm660l_codec 0>,
+					    <&lpass_codec 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		lpi-mi2s-tx-dai-link {
+			link-name = "LPI MI2S Capture";
+
+			codec {
+				sound-dai = <&pm660l_codec 1>,
+					    <&lpass_codec 1>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+	};
+
 	/*
 	 * The touchscreen regulator seems to be controlled somehow by a gpio.
 	 * Model it as a fixed regulator and keep it on. Without schematics we
@@ -550,6 +632,13 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpass_codec {
+	assigned-clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	assigned-clock-rates = <9600000>;
+
+	status = "okay";
+};
+
 &lpi_tlmm {
 	/* sensor gpios are protected */
 	gpio-reserved-ranges = <0 8>, <12 6>;
@@ -613,6 +702,23 @@ &pm660_rradc {
 	status = "okay";
 };
 
+&pm660l_codec {
+	vdd-cdc-io-supply = <&vreg_l10a_1p8>;
+	vdd-cdc-tx-rx-cx-supply = <&vreg_l1b_0p925>;
+	vdd-micbias-supply = <&vreg_l7b_3p125>;
+
+	qcom,mbhc-vthreshold-low = <75 150 237 437 437>;
+	qcom,mbhc-vthreshold-high = <75 150 237 437 437>;
+
+	qcom,micbias-lvl = <2500>;
+
+	qcom,hphl-jack-type-normally-open;
+	qcom,gnd-jack-type-normally-open;
+	qcom,micbias2-ext-cap;
+
+	status = "okay";
+};
+
 &pm660l_flash {
 	status = "okay";
 
@@ -655,6 +761,36 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&q6afedai {
+	dai@89 {
+		reg = <LPI_MI2S_RX_0>;
+		qcom,sd-lines = <0 1>;
+	};
+
+	dai@90 {
+		reg = <LPI_MI2S_TX_3>;
+		qcom,sd-lines = <0 1>;
+	};
+};
+
+&q6asmdai {
+	dai@0 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+	};
+
+	dai@1 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+	};
+
+	dai@2 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+	};
+
+	dai@3 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
+	};
+};
+
 &sdhc_1 {
 	supports-cqe;
 	mmc-hs200-1_8v;
-- 
2.56.0

