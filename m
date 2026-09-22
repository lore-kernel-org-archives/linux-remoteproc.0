Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B6137F8DD
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 01:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042307; cv=none; b=dioWw85Obi05eWCmaPW0PioXQ6NBkjVwI1m8jWkp4rw99SgncqYFuN4v6hcthPDVW4fib44qJt3AHeiQL61nTXluj1l3z0wAY3dWz0n5YIRTBm5eSMSfEl7PvsRFY2HWnDcEKK+kBKlXxGN5OXUPAZBR5YeIw2Ry00Dpv/HffTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042307; c=relaxed/simple;
	bh=8kYViKSQ3C0eFrFVx2F6qVjb6w2IQh5LAUii4XAKVSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FTpxHGEc4/JHJzLm28QrsGvJjTjUxIKO6C7IZLXiX30NiFrf+idILdHCIXGb82ngawodxwsf2tFBxFinmW25qvzBH9CpMohsNdxX5tsL8ThvO5bTBfnWx3BHRhgkO3yh9gUd7JmYWlxP5fFkHUv1W287V0L9l4b73guG1LsG72A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLLu88Th; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLLu88Th"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-912431d946cso3914116d6.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 18:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042305; x=1790647105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCJdCy1spHfvoWqPiL4zSSNSR11irryhiW1SJ7jEa5o=;
        b=eLLu88Th8E0yvCwNDkiuuOAik+FykyWRUTZ8VTdtc81PBnzFHYDQGOmHfRWycDNmXY
         k0zKXlKs8D8s5mUIDs0pkKAqe6nAFdlhTMwTW4oL8o0UaLXs4HjubsQvkxrmRNkILzle
         4ya3IdLiHznvRE5hXORPvFHo/glPrGddT4qv1lnS/rHxnLQZ1zyIW9DShqytOUrRGb6g
         rNZ8PiQ/+na7rbyA44pv06R7/QEYb76g9hl7iTFIAcSvV3WxmkW3Tp6Eq0xY5ewpNvnA
         e6xWqhmbGVbdgyoSeg4B2ofCjEp1kEcVMH5XquDF6rJ82KEmdra94Xi2rOGPAi6Xeddg
         gESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042305; x=1790647105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCJdCy1spHfvoWqPiL4zSSNSR11irryhiW1SJ7jEa5o=;
        b=1+ATvLp45RrPcc/L0jmk9NzXLsNqOKxqGzRP37iiuBoDYR1vh+q7/ZIEaWyADvZPVG
         fNgag1BsjcJVcVFckvxjPzbbVP40cykilEx7aAPWvJu5Att7dU/b4WBHXfL6JPCacGsd
         rogjt4U22PK3IJekpo6FNQTFPprA2NL/lzInQepoOQ/WqlicuCmNvGk0xFVWEIdYO2Oi
         4YE8fr+++0lDZ4HswJ6Q0sSnbR5DuvQDlAxdoTUs+RqZXow03R9hZD6ZBoIhiVFCt8Ke
         ZOVy7NR+klFeEHqjXTxFgax2dnGbmGY86lcA/h8Lz1wi2ohMO3+Y3fKEfcMZGJqYAJox
         LUeg==
X-Forwarded-Encrypted: i=1; AKwUvBwAUheCwHFSm8q2rVhD8dCciKJBjCIWIRFoNF+vpsVqc7neSu05np9QmHGW5gTgpvCJeYOMoVJEOpJYDI+DONqr@vger.kernel.org
X-Gm-Message-State: AFuF++lrMmbDZ6ssbRhZT/zm+zgC/+UrQ+XuLVR4EKYBSFvwqT7d/WJs
	NZt0Obo8Vdipz5eUymMJyy2GF0SIML90XJyJJ5PjQnKQELesaU2JDSJH
X-Gm-Gg: AYBFou2m0aKrHnUV0PuZNbEM/Dm1FsyVQ6LdnVDvsB0CjUc30K3dvlFDGaMgfanSmZp
	YgS/cZUcfLwdUrB6rHjrOwWBp8EUsnqLdbfUk5+qATvnePUmh57CWbApIZBxOUpeg+TsqGMgriG
	rOPXWOwx1lgULsoGfJSOAkNVHGzQtgn6IeHRT1DKPQwQNXuw79p+BTp5wMShBgxZA1LJQ3qjEO/
	296zJ5pGzcod6nSLPb+PoDHdRXwM/N3dE5DIe5B/cT980bgpxI7gGs3ue5wh+mimm3v8PGR+BRA
	qH3I91yYOub2wClKPBxg5yEgq70xXiHI0rvJDuMCbxEQO1d64NdX42s5hKa8O/sNKtLB0ALWWpg
	jrxJKsptk00yOcsnMDbI2YPcfrc3eiJDdmHGAhNmRoSaJPOaqmprwu32yMwZ24O/ynW9YKFsqOM
	duKTpNlaPEHILGq5sbjHJjzrmPJynIOcz+xLbr6twY9shbqbtnOVNJyvTAFS7ysb+S+9zwnl6Xm
	g==
X-Received: by 2002:a05:6214:1cc2:b0:910:705d:2041 with SMTP id 6a1803df08f44-913fef9f78bmr22969696d6.12.1790042304971;
        Mon, 21 Sep 2026 18:58:24 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024ed0d6sm4131626d6.30.2026.09.21.18.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:24 -0700 (PDT)
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
Subject: [PATCH 10/11] arm64: dts: qcom: sdm670: add digital audio codec
Date: Mon, 21 Sep 2026 21:58:00 -0400
Message-ID: <20260922015801.32373-11-mailingradian@gmail.com>
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

Add the SDM660 digital audio codec to the SDM670 device tree, as both
platforms have the same internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 3856431fa587..22a5ae0d01d5 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2548,5 +2549,19 @@ data2-pins {
 				};
 			};
 		};
+
+		lpass_codec: audio-codec@62ec0000 {
+			compatible = "qcom,sdm660-wcd-digital-codec",
+				     "qcom,msm8916-wcd-digital-codec";
+			reg = <0 0x62ec0000 0 0x400>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk";
+
+			sound-name-prefix = "Digital";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.55.0

