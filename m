Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7378137F8B6
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 01:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042309; cv=none; b=E9hv2bPVbyKmsH9FhEM4VetPx/Mw9zD/5JDL0vMb4yWAzubmY4Ikm+sgCD9CPWiQDrzs35GZxs7d0E3MdreVA3RZ9e7pq3ti3KteBMCXF1iFZTsC+s0GiPoIcbIg1X872CtCZFqy1Jjg6drqCJymM3dzpAVBcTjFQqy9K5MANL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042309; c=relaxed/simple;
	bh=+IUGOTMt18Ytjl84nvO2b6EVaLrVHd0MwQO0xj44f7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAWCilNmcDoRxWPicGFJwAQgH+InOHGfan5qUFd3somq3uOmfW0PGfoQnB75gtTQ8/fjbqnObjNUpivMhY05qoIZKxoudQTms/k8hW+bKNVZNt4+s8INbml27610I6qFITKLIKV2gssnlbaf4WvVuMv319O9M4Mg5jEYJmxubjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRs6Tbe+; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRs6Tbe+"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76bcb1fso38206071cf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 18:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042307; x=1790647107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTKGnGjGTLoIF5pV7l0YX7XUZ3Vt2zTfbQePoXlfjvk=;
        b=ZRs6Tbe+LVxEAcmUHXEDwlulDQDzwxCdBcIarFyKFoOQ4L6mAKXGf6juWlTgWLH4Ff
         0h4g+s+xWHmSiWh6y6nPMZBO6Srj2jCfdEvskFzwRBu+brMvpFlI5kIzIkhCsy/4dppW
         lrU9eK1P+Dbltlrv7hrxkVsN9QbAKnReMP8zTP7TcP2emG8tZBrZv+JOYPagskzaZFNr
         LNaQKvS1GGXgsuzAHNNuPYv971xx4GR9zw1h+vUBdqYBd8X+YPKgIoZK9nGVoboADIZf
         kLcc9TtgDeHZzeS8upGbTav0v+GSoDf5qDPFi4dHa9rbvcffl8Kmfezxyqqw9gz9usAY
         RjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042307; x=1790647107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTKGnGjGTLoIF5pV7l0YX7XUZ3Vt2zTfbQePoXlfjvk=;
        b=VxLSe9s7VZOVMIfo/FGZ0cTBEmM0J6qRLG3z6st6yg1yXh47xyPt4yiAbrwK9X154W
         lwvS5Kzmg51uEGSVmHQq/PtfW9ZSYvXz3UuRzGF52AbCj/hK1evpRf7vT6lBoKZzdkVw
         XdOYtug7ldr4OcY6ApJrncshNRREQR2kizcnw8Jovsrz7MisMpiF+mCUHy6jKk/3yaPO
         8US6GG9wk80RYnmrXH4IDwiOoYrioVF0QawNGDckjXvPdtUgRWCnKl3eo2R73KI2cJTL
         UPJndZsTiQ9bhPIphBhFrc8pT5T7W+UwkQSJuuB77KH4zt5t4TjI8Cek/ClGQos+Lkss
         dHRg==
X-Forwarded-Encrypted: i=1; AKwUvBxoBCaCZZqu/RcN2P13HgH4YCWOFpsvBnj9wu2PZJJSPKc8Fve1YFRmySb/IZNiyARpoICR/luFtXY8cr+JWJ4r@vger.kernel.org
X-Gm-Message-State: AFuF++n5wF1SKVAw2dC+OoHOi/ra2xYNAtrYZnxbA2hcBhTSqU4ZMsfp
	T9EQmb2d3rSJvL1YVkAdnhOm/B9Pk96xRUYAVdVtExi2/fG6oOZcGEdn
X-Gm-Gg: AYBFou38V3otqmXtc54KpcSL0+PS4/WKCheL7WPjx5gi6Y6OBu1rRikuTKMvNKBaHww
	x9+hpU3Z0/EjMItTg6iE5JSqmFbqCW2z2aGnS7mgXhqcducQds995QlU1WhN6yfvnll+jYZl+BB
	ODwauEC4WvX54Gw9EqRb7krvBI54vg4gBn7XO7HNp0Mo61iOdqQCH6b+TDOHDlHLwbYY1jcFGES
	QKgarJ5K6IMujLbvXbaeNl3J0wrOjaobRYVyZ3JMu4BX0cZbAWG0lRxVvhC0gZ0RTCV0HS4VggD
	1OIQeH2FFm8bcAonR1rEpU6zJycXkRQb+4oDK1hnoR2G1pUj/9pIkx9hVpBPSuqVGc4O5oBlRZJ
	sOWujrlpBGVThfykBVAUDb2u5kVYyMtkgYLCXJcv3nIGczptMswtScy529u9iPjjJaaCgHMl6G+
	hpiuSnvH1NooFIrzzD2cdTvhnidCkZtLXDXlbgkVDI2Cb3J0/C02QRsuexwrcTJA6tiK9evU5cd
	w==
X-Received: by 2002:ac8:7f13:0:b0:531:131:9339 with SMTP id d75a77b69052e-532d8e34badmr36688781cf.34.1790042307257;
        Mon, 21 Sep 2026 18:58:27 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024c8020sm3987636d6.23.2026.09.21.18.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:26 -0700 (PDT)
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
Subject: [PATCH 11/11] arm64: dts: qcom: sdm670-google: configure analog and digital codecs
Date: Mon, 21 Sep 2026 21:58:01 -0400
Message-ID: <20260922015801.32373-12-mailingradian@gmail.com>
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

The SDM660 digital and PM660L analog audio codecs control the headphone
jack on the Pixel 3a. Configure them for sound playback.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 87 ++++++++++++++++++-
 1 file changed, 86 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 3abde2cbf746..48aea5d72092 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -53,6 +53,14 @@ framebuffer: framebuffer@9c000000 {
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
@@ -133,7 +141,14 @@ sound {
 		model = "Google Pixel 3a";
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&cdc_pdm_default>;
+		pinctrl-0 = <&cdc_pdm_default>,
+			    <&cdc_dmic_default>;
+
+		audio-routing = "Analog PDM_RX1", "Digital PDM_RX1",
+				"Analog PDM_RX2", "Digital PDM_RX2",
+				"Analog PDM_RX3", "Digital PDM_RX3",
+				"Digital LPASS_PDM_TX", "Analog PDM_TX",
+				"Analog AMIC2", "Analog MIC BIAS External2";
 
 		mm1-dai-link {
 			link-name = "MultiMedia1";
@@ -166,6 +181,40 @@ cpu {
 				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
 			};
 		};
+
+		lpi-mi2s-rx-dai-link {
+			link-name = "LPI MI2S Playback";
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pm660l_codec 0>,
+					    <&lpass_codec 0>;
+			};
+		};
+
+		lpi-mi2s-tx-dai-link {
+			link-name = "LPI MI2S Capture";
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pm660l_codec 1>,
+					    <&lpass_codec 1>;
+			};
+		};
 	};
 
 	/*
@@ -568,6 +617,17 @@ rmi4_f12: rmi4-f12@12 {
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
@@ -631,6 +691,19 @@ &pm660_rradc {
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
 
@@ -673,6 +746,18 @@ &qupv3_id_1 {
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
 &q6asmdai {
 	dai@0 {
 		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
-- 
2.55.0

