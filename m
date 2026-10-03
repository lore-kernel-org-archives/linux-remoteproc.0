Received: from mail-qk2-f37.google.com (mail-qk2-f37.google.com [74.125.230.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4854AC161
	for <linux-remoteproc@vger.kernel.org>; Sat,  3 Oct 2026 17:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050248; cv=none; b=VaA318UEkJvVGYg5vvtNk+jOG5SAsEHtz6bV274Kldyr8K65RnLoxbHFP45k+aunE4zFgBJhq/dZ8Qf4cpDYFjIEOBwbK6W40ZkxGIsrMr3ZH0tbWpm9pcz2Uj1R6tgNTaoGp7dcz3AsO6GBTnCVBjkKnE6Y9pYq0T/8fPLmgJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050248; c=relaxed/simple;
	bh=ToMS9HHuwvLSNSi4KSK2Vt1m/tyIosTZ2XS2ynYNyxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nve+x7ifDYduJtpdkL5+e2mRYtjqr8PlRnWyN5728h5r0W9DqGAruTdPynoOkUTOPlU4Aw22hL7lH2vJNWWR2JTZjwHRL6H3e013IhX5k2/KAXKNr/zOgT112AoQWpWIds/Zu1vKeoB1k1re1LIr6NMhPyeaQHNG8AjK9mP3nok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8le4LeF; arc=none smtp.client-ip=74.125.230.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8le4LeF"
Received: by mail-qk2-f37.google.com with SMTP id af79cd13be357-93e587358e0so69756085a.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 03 Oct 2026 10:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050246; x=1791655046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvJU5Ed+jK8i3uf0ZW+GRwIBpnEL5KvvTjwamF/Blro=;
        b=k8le4LeFCSB6/OGbOCjOHlcu0joVjlh3yBjF1DVvcN6NXan8+ATH1W61yQJTsydZ8e
         u7SpqDx2vC8LaZ725DXgaa8Q3ntjtK1LZhKGUCoSXfsTEU2QQJX2rbaKEuW9BBbQ006t
         Jdh0f5xxUgmyz+O+s8tPvGFgtAPoaZ/3iRE0LPBuZxtBJBAfYtDKUtKO5SwVVyU8G9hY
         v+DnD1Ek0gA+Bt36s1Ddb5s7nH+GeQJqGaUYqxX2v5Lkd/J+ZOv91klsSpyaYWJZiMDU
         7KKXW9Yod6IZC3JBWmiSSFXrJGKS0IqkfEzlU6GofBlhcplgkVvcHGH7oryHcu6J8j5L
         lomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050246; x=1791655046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvJU5Ed+jK8i3uf0ZW+GRwIBpnEL5KvvTjwamF/Blro=;
        b=sHaZNf5Xb8xUOBn96MwEz9U9/PETXKYdOu15vgw8xTYDjxFGujGuKlwOmspaap/V9H
         nhhu9zv3F5jUA8dTYigUab1ZBEYex2cm2HL7AuW5BEMkWzCQZLlx0e7P16x2nGBPGmNe
         x8qIt3dbPuuKidsSneH2saaiN4QPa62vkJYSwkKOLN0pI+OkvQ0pVBnqQS+m3IMI6xoG
         F6FUKRGZ51q8veiHPt28IXK69xneCm8PSgWxXaHW3LVpz6Tpz4SqiN2MD36h/xxULAWa
         guNHhGbkVwV0jvriH5B5tOnnCdwYltxFp9P2oMe8aimhVTFi1l58Q2eYO7TNmm3ycO6l
         BALQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8tdtSJQnafeDdR2qnN1591gviSro2nwU0VNbpqRs646lrwPcsW9RZ/CeZd+d1VFo1Zgmk4AYVRia5O76KFJh/@vger.kernel.org
X-Gm-Message-State: AFuF++n5JS7hFq6uWl8bsmVvyvJae1n2GLxjaN2cLk+bH0spTC99/x9B
	pZtor+vFjnOR2TZhpGUInCiRCuJbGwj9idiYpAv1/rsLPjInwFmvRkKr
X-Gm-Gg: AYBFou1j9Ye4DSfN5LKJ85THg3TSUaABji2R+IBQk+PrC2ombGly7jgZnpTBP2rIQpv
	VgvxxkO3xBTFuTo4o0mMpAvD5+DXwROg/idvTKlEFbhURz296vceImZoy41JPIKA7qpWMGeSK1s
	9FbXT+N6Y773A0001KAwVjD1Mo9Iidce29M6gFmJYDYacmzbOyve4Yq4NDBF+78v2Lf0OidUEAP
	JDyecgQbHv0wHZS4gmYcoJIrU9prdwlaFyo6qeuhT2VIghCP7iy98H3ytQSdznJP2wrOTHzElyB
	cOXNOUaRV2QJfq3P4kp7sM151IVIpdg8aQSwXy0jg/APlbX2BkuUp9jBdujqtj3C9TFICiPGKhE
	ng4mbmiVqr9OLo7fAWu9HsjDH6sS8nLa47JUWhR7Un0wUNB+4f1YTJIyZGNY7MthTjYt2E1cEVZ
	FM5pKLVimoJyZ0tBP/ir7rYwvH2pW5dGTV2Ss6gbGgWwSQOde3XXGDWRIUJnhjUyUZnETMsLQjj
	A==
X-Received: by 2002:a05:620a:7087:b0:93a:2e8:5af5 with SMTP id af79cd13be357-93ce7a80f36mr1200797985a.6.1791050245725;
        Sat, 03 Oct 2026 10:57:25 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2b4bb2sm507369685a.42.2026.10.03.10.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:24 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 11/11] arm64: dts: qcom: sdm670-google: add sound card
Date: Sat,  3 Oct 2026 13:56:59 -0400
Message-ID: <20261003175659.23536-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pixel 3a has a sound card for built-in audio (RT5514 and CS35L36
codecs) and for the headphone jack (WCD codec). Add the sound card,
q6asm frontends, and WCD codec for headset audio.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 73639b0271e9..fadd3b5eca42 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include "sdm670.dtsi"
 #include "pm660.dtsi"
 #include "pm660l.dtsi"
@@ -52,6 +53,14 @@ framebuffer: framebuffer@9c000000 {
 		};
 	};
 
+	clocks {
+		int_cdc_bclk: int-cdc-bclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1536000>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
@@ -127,6 +136,87 @@ debug_info_mem: debug-info@a1800000 {
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
@@ -528,6 +618,17 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpass_codec {
+	clocks = <&int_cdc_bclk>,
+		 <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "ahbix-clk", "mclk";
+
+	assigned-clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	assigned-clock-rates = <9600000>;
+
+	status = "okay";
+};
+
 &lpi_tlmm {
 	/* sensor gpios are protected */
 	gpio-reserved-ranges = <0 8>, <12 6>;
@@ -591,6 +692,19 @@ &pm660_rradc {
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
+	status = "okay";
+};
+
 &pm660l_flash {
 	status = "okay";
 
@@ -633,6 +747,36 @@ &qupv3_id_1 {
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

