Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018396;
	b=Y7j8qVrDU5W8AHLX81BAEmYEwVDk97eL6wwl+F8wcCEN13U4F6w3FK9NqQ6WUAaFmJtk
	 OZ1Y1BfdBLZgc72gN4bikFTVoUJ9E/yWNO3Z3NeTzHNGSo0bR827lI452c7kFr7QKXRch
	 KDZQlcps0kw+KVtZ1j6FNGX0L7W6iS3DGYNVDXs3133Eype6ENBTLgeo4XhyBb7lYzrz5
	 8Gpm/HOC8VTl3LiXebq82Td6FTyxB/z6HoPSsseN9vhNCoXuIbqqQlC90gl3RYnewK5gI
	 sF8QB3y8ZU6b86m1PVcJJYOiEwGvKzItO0uSOx84JRjvHX4B+9XOXtEt2bZwSBWRNpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TjYEd6P204FtTEl3+2aQREdgn69jfcQSWWob/xOBDVs=;
	b=UGrkpxs9hN4bVgCdB9i0N7XlcR1eCeR8bDllfZViGFVTRQDSbcEddMdGjkqB5zUwe33v
	 AxuDDDKBl5ZTGIoLHV6kqScmeMUu3GcjS+gZAeudm/ermRllpgNw32+N+frjqPzH55o6f
	 pXyroPVyAwzQ6lZkd0QwDtExeI8+imZ3j6tSLNwXb6ZDz5aB1X4dkVD+w4xsAH/uPWDNT
	 Cx98GuV7DcVb2kvGKHUV0JRMXh6bh+FYjba/4jyIXtLXvyr0KRXVLrk0/OIyaF3Tmz7C/
	 fmjZF0ke9pGG1Ni3NFOBIF92XtLN0qTmNNBx8UrRHbtcVenusRYturvVXvzO0OwGnqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgpsMcpN;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3798606A32E
	for <linux-remoteproc@vger.kernel.org>; Sat,  7 Nov 2026 02:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3798606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgpsMcpN
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eafb65e204so359021e0c.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 18:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018395; x=1794623195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjYEd6P204FtTEl3+2aQREdgn69jfcQSWWob/xOBDVs=;
        b=GgpsMcpNnRTpfI0IGsiJYRIK5C1tEg2vO7Qw3brjlZ1E2TIOcrf0yvf+aB8hxRzUMh
         r9acsEbwSdK+w421Zmgn9K/cQM+R6dTKdr6tlevwWvBRCfkP3HfyYvmyk7bKnabXcm3W
         c8DOzP57ND0Mzvnrq0u40AS4K52gIeQwRbe8aMdTmdG12fm8Ip5zAesxRhuwcZxeNQOS
         maXenzfFBDrPSmtfE4Ozu57snZqeURs9z5Dh0DzqGD/C3JqELtPndOVQ6m+pUf4j3L7I
         Wt1vg15H8zQ2pRdZ5Kauspgl8r/BUGFggzxWzK8/XyJN/NrKX51GXvdXMSqETZfRtSNq
         ZGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018395; x=1794623195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TjYEd6P204FtTEl3+2aQREdgn69jfcQSWWob/xOBDVs=;
        b=BP4Yn3cgn+ghbFHkPdXR/DzWPAMiux5aWnRq40J4B3Cl2v4UBvLcnG3irIgbHG3DzR
         6t6goO/9Fb8WTqSyFp8dto4z08MR1wOH6LQljIKZhRN7SIOzr+pi5AL1gHx6pK4OJUKp
         UuSlPalxxv/fitX1PItS8jJDrVwvpIcxhvG5FymHrt1Y6JyDZg2aA9K8QBIQ8yZefmD3
         xybD0ONmkcyk9/ZZ+SXJ73/tOfkaYXArgfa1AezaoTJr+41YRV/4mcYiaGb0BirWHvox
         dnF8JDcELKXoC6/zqMtm4N2EcYlpBZozmVuaiu6Fej9zvIR0HLmbmAwqWGlLUBKfbpvF
         sVtA==
X-Forwarded-Encrypted: i=1; AL+hErENTDG2IZw+o/M9yezGiUkHbAMEcM8h7e4EOUE7+X+FHDmsgfW7Hdwuf4oKDhjTG7KlZi8Qn39MYm4yoZEChE/P@vger.kernel.org
X-Gm-Message-State: APuU4Z9GKfwwVN8fUbLLxN5I4AYsP8Ah0lbfMX1tvpZbvMT5Bh4yCmoh
	vzpraDRXcETH1k+CEe4SIeER3M7ulMtO7YQcEQJr+rj2/iwvLlHNRgPA
X-Gm-Gg: AYBFou0S1tkfHWI5stdD2nFkNabkCDTpZSiYJcWoLeTmX46sUFV3lCY6dTQq1cLcLyZ
	dNBwpsroJcAjM1GHyQH73gBStN57fh1qKLJlqoUMMWgIsmmcbWLh3E5fBoDFE/Gpp3pxVG0w/6t
	WliT6Kh3Vrm8WfX63gClF17Qug3seqcmxg+l6/Sl0x4/10cz31Glmi6yWX7C9pq/aV533x8WPzG
	gm6cwlAP8sV7n1Th+iapKLRhpQktdTe7kQ4GeECeRFb7PeBDRpdYUjgefHDngGS5Do0SRHrPxdG
	R0t2JzDzil5Zwjy2Cwcayo0whW24nvOO6vvEFldZqK8hW172+ExMQv3wmDoeLzBS/pJs1fARjQ6
	oC9RbO1YqIPGkYSRC/baCTRLzBTkHwVhRfsV90s03Wh7acfVSeOAebDscFI2agcmiIykpp1ODcu
	EsFfKTgWBvdtAr4Dd99z38YTk3v33eMkS+eP1NO4B0PrPB9tFKf5tDcFt+oNO5W23DhBKoQi4k4
	iT13kX2p//Ml8Chp3udGJscj4F4Xl5ybCNtMqBXUI55eQkKrtnNT6UcCqOO88ogD28/RTFJcKMa
	TzXC43YO9ig+9U305IM7K8HQQ7azAA==
X-Received: by 2002:a05:6102:32d2:b0:7d0:6cf3:d8f2 with SMTP id ada2fe7eead31-7d2a157bc3amr2075226137.20.1794018394730;
        Fri, 06 Nov 2026 18:26:34 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99baea8aeb0sm3142227241.9.2026.11.06.18.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:26:33 -0800 (PST)
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
Subject: [PATCH v3 7/9] arm64: dts: qcom: pm660l: add analog audio codec
Date: Fri,  6 Nov 2026 21:24:51 -0500
Message-ID: <20261107022453.159341-8-mailingradian@gmail.com>
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

The PM660L analog audio codec (PMIC revision 4) controls the headphone
jack, and optionally the earpiece and speaker, at the vendor's decision.
Add the analog audio codec.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index 3f8b9eafe164..608c1c2120c9 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -87,6 +87,43 @@ pm660l_wled: leds@d800 {
 			status = "disabled";
 		};
 
+		pm660l_codec: audio-codec@f000 {
+			compatible = "qcom,pm660l-wcd-analog-codec",
+				     "qcom,pm8953-wcd-analog-codec";
+			reg = <0xf000>;
+			interrupts = <0x3 0xf0 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x3 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x5 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x6 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf0 0x7 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x3 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x3 0xf1 0x5 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "cdc_spk_cnp_int",
+					  "cdc_spk_clip_int",
+					  "cdc_spk_ocp_int",
+					  "mbhc_ins_rem_det1",
+					  "mbhc_but_rel_det",
+					  "mbhc_but_press_det",
+					  "mbhc_ins_rem_det",
+					  "mbhc_switch_int",
+					  "cdc_ear_ocp_int",
+					  "cdc_hphr_ocp_int",
+					  "cdc_hphl_ocp_det",
+					  "cdc_ear_cnp_int",
+					  "cdc_hphr_cnp_int",
+					  "cdc_hphl_cnp_int";
+			sound-name-prefix = "Analog";
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		pm660l_spmi_regulators: regulators {
 			compatible = "qcom,pm660l-regulators";
 		};
-- 
2.56.0

