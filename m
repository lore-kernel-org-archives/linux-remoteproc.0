Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5381B6D1D
	for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jan 2025 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736620996; cv=none; b=vB+A0Fp3XQNUzvsfcYSajZv0hamuC1VOaIcfnAGDur4aibtwgQ4PFeo8P+tW+SeWQ4NWVLuiv2DgICDZsUUdnWWFrEEPeCT0qpZigDYeSDkZCgZ+8qxzsxIC/ZD7otuSaCv6wvk4sCZUkwGKZ/5wGmOZDwgzyYwGif9v1Argf3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736620996; c=relaxed/simple;
	bh=5hQwmG91Ny83OGrGpyg9rnn+O+Mb6UT4EEhVO4UsBiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gmvi+x62hST1dnJHd4YUlAggci5wEeUGpc3VCDUmnNzPK4LB7CIWJRZj/lixncr+Egw8GYJ4Wa2nCKipQoCGMuSH9XSvuEcCteqH2ZtgpBy46zEt3gj2NnwEoO7zFUZpXiVDgu3ceArIV0hkTWVubaQtcE9ujcGP6h3XD/HB4Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KQSyp/EN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KQSyp/EN"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38625aa01b3so322509f8f.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jan 2025 10:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736620993; x=1737225793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3Km+T89oY9vmo43Z5zKrwDWzM7jbfOIjaTIrh6UkOs=;
        b=KQSyp/ENzYSHO85Ze5jOTZRJJjLdVKGjFso6507h3MZ6Ajir4Ka8/vxpuLP2zwQ+J7
         iil6Kk/tuk02jsGgOD2JkzfSrhvy3EBr32imO0ApSYkjgtXNbocD2znG4TRq+SMZVvbg
         4WeOIqE6iaejuoVS0O7tXhjZF13NY25WCOnXghLlq8qlg4r5uG0Dz8YjA8kM14rRa60l
         vn3it26m6a+Jrk0GMWVdr0i9DleicDVZLKJVmCq7F1Zjm1SMZbwcdUj0mNAbWXPce8W4
         7nRDwu5UsjlfMUNHnVBrr3k+bVIh8q5Q0p851kvu4q0h30TvOnkNboEErR0ur7bck7Xy
         Ox8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620993; x=1737225793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3Km+T89oY9vmo43Z5zKrwDWzM7jbfOIjaTIrh6UkOs=;
        b=HKP5IQjzXbrR62qCVQXSJRwTRCbD4o7uQOwYcNlGb/ZiDVLawJ55D/mosTLm0Boh/j
         Pv4y5e+1U/4GwK1ri5jQ3sb8aiu6SjFhSCMvacRXDHzjAjZ9jhA36FPYgZoIp83f1Ps8
         n+XShht9EjTv/eqXADlCB4l3IbpVTlnq9RhKyxua/ikzzbraEbXFsJI2yQLpbeDqYYUM
         XwDGDuaaGawr3Fc0TNDk7kHbOobWH0aDA+c3gbi/vhAv7i2ExsnU7JlbggXpW74FbNSH
         ZkhSk/tvBkYDlCliaNgUXMWWpV+qYYE9lkHx8PvbqwQj5DS/o1Vl71vXp4TzVkBCP75Q
         rbRg==
X-Gm-Message-State: AOJu0Yx/6gxqr9NYysqj1XrOAbdr1xNuAHsj+9TelgkucvUWveImXuyg
	lubuZLPTxUOhpLPkgUX8SkD9IW5Gf1T7Lk7zLDTgylXe4gEgDpRWyZhRSzod2xNxZwyVMPbfVFu
	V
X-Gm-Gg: ASbGnctMxrkMkMNK89CjdtR7YzrACB16cwOTr+hm+jwyBweV3HK9ZNdZb41ozSMf+Iw
	rUYtig5FKA028dPcHnzG0leyjB2BJCUL23Eo+JAF/S5lfM4Bd4VzVyx8968PgLOYh/HxEEuhjrx
	uUVwpLV5nMw6Upq7te8dnfWR1u5MUe+PMIsHv/o9X3KfesgW+9RLvjipz2bYA2rOY8/DZY/SMBs
	D7G5fdlT9hqvmvG6aX+OG5zzF42WEmJvFgQEQwKBvomj0NonLGkSh4wtvDiYEtZDg7eQrGV
X-Google-Smtp-Source: AGHT+IFOZCMJmwI0mKSBTGO+GGfe7sUCWdu9ZR22iWmk7CbqEsFGVHW41bP+rkVwowcZhYbO3Uyrfw==
X-Received: by 2002:a05:600c:3c97:b0:42c:b55f:f4f with SMTP id 5b1f17b1804b1-436e2713e51mr60257065e9.6.1736620992728;
        Sat, 11 Jan 2025 10:43:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm205885e9.22.2025.01.11.10.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:43:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 11 Jan 2025 19:42:51 +0100
Subject: [PATCH 3/5] remoteproc: st: Simplify with dev_err_probe
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-b4-syscon-phandle-args-remoteproc-v1-3-73ed6fafa1e3@linaro.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3905;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5hQwmG91Ny83OGrGpyg9rnn+O+Mb6UT4EEhVO4UsBiQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBngruzVyM+eBg/b9r6/4HF8jM/uBdD/yIqy3mh8
 ZBsd9VqFNWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4K7swAKCRDBN2bmhouD
 16VmD/9hiE1rSyjUYGDc/ePnUA6hW+ruXaGZLpyxcxO2CKr7SF8SIGsQ1RKzG08lItOtHksuV0m
 A45F8P7kF3WW1qUZaiciVfJjcL2UVXkbTg6HfQprvZyyxghUeEu6PMM78tkvgBv7m/R2nPEcJld
 SRIF37gBt0GhuzDnV08MavNlkikaXY12VMEONl7HBAFVtfwcMKGOMs4wm2XL/bo3/SYRECKdpm/
 ef09tBL/Nv6L2bP0BptVKYgy2owH4DcdzbL/3w30bku866XdxQF/1k4Rg7j9qkweY9IMFowGmV8
 uvVw7tuvSt+vd7Zi5FlmoK4NxYwzLDjkvKLBjW8Z9PdnLnhTSzRwiomr/tOHTf1VxjRbyQvNTkc
 LYhWVaV1YpCBoGsEsmxO5W7WWyTy86lR/mC976UM7di0tkRFkeZjp2azcC1ulaLoDEDoqpOqIem
 8ubMRIg3s+fdQks0IGvIH2Mad/VxiMRp1I0mDuR3YYfeQXQokC5zmWDFUTuUyzCEtiksczSFmLw
 fBfuxd0eeWjBto8u+J7pBdOafbqbQb5yVB49FHc6WP1/LLoqwK8ClrmsBHnXveTAzxgLoMV8cAq
 VylA4W5iouI6+VEIQVhggp9q2HHdTpdaHL5FGkdrW9nhWpot9Ln2HgvqlU+P1ZFp27pcAZUvrFZ
 HimcEVkeFyrM1LQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to make error code handling simpler and handle
deferred probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/st_remoteproc.c | 44 +++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index 5df99bae7131a832c0c03c9bf8619812d9eb570d..d1f35e8a83ba525613ed4e54d2269b7e9f427e46 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -290,26 +290,23 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 	if (ddata->config->sw_reset) {
 		ddata->sw_reset = devm_reset_control_get_exclusive(dev,
 								   "sw_reset");
-		if (IS_ERR(ddata->sw_reset)) {
-			dev_err(dev, "Failed to get S/W Reset\n");
-			return PTR_ERR(ddata->sw_reset);
-		}
+		if (IS_ERR(ddata->sw_reset))
+			return dev_err_probe(dev, PTR_ERR(ddata->sw_reset),
+					     "Failed to get S/W Reset\n");
 	}
 
 	if (ddata->config->pwr_reset) {
 		ddata->pwr_reset = devm_reset_control_get_exclusive(dev,
 								    "pwr_reset");
-		if (IS_ERR(ddata->pwr_reset)) {
-			dev_err(dev, "Failed to get Power Reset\n");
-			return PTR_ERR(ddata->pwr_reset);
-		}
+		if (IS_ERR(ddata->pwr_reset))
+			return dev_err_probe(dev, PTR_ERR(ddata->pwr_reset),
+					     "Failed to get Power Reset\n");
 	}
 
 	ddata->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(ddata->clk)) {
-		dev_err(dev, "Failed to get clock\n");
-		return PTR_ERR(ddata->clk);
-	}
+	if (IS_ERR(ddata->clk))
+		return dev_err_probe(dev, PTR_ERR(ddata->clk),
+				     "Failed to get clock\n");
 
 	err = of_property_read_u32(np, "clock-frequency", &ddata->clk_rate);
 	if (err) {
@@ -318,10 +315,9 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 	}
 
 	ddata->boot_base = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
-	if (IS_ERR(ddata->boot_base)) {
-		dev_err(dev, "Boot base not found\n");
-		return PTR_ERR(ddata->boot_base);
-	}
+	if (IS_ERR(ddata->boot_base))
+		return dev_err_probe(dev, PTR_ERR(ddata->boot_base),
+				     "Boot base not found\n");
 
 	err = of_property_read_u32_index(np, "st,syscfg", 1,
 					 &ddata->boot_offset);
@@ -395,32 +391,32 @@ static int st_rproc_probe(struct platform_device *pdev)
 		 */
 		chan = mbox_request_channel_byname(&ddata->mbox_client_vq0, "vq0_rx");
 		if (IS_ERR(chan)) {
-			dev_err(&rproc->dev, "failed to request mbox chan 0\n");
-			ret = PTR_ERR(chan);
+			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
+					    "failed to request mbox chan 0\n");
 			goto free_clk;
 		}
 		ddata->mbox_chan[ST_RPROC_VQ0 * MBOX_MAX + MBOX_RX] = chan;
 
 		chan = mbox_request_channel_byname(&ddata->mbox_client_vq0, "vq0_tx");
 		if (IS_ERR(chan)) {
-			dev_err(&rproc->dev, "failed to request mbox chan 0\n");
-			ret = PTR_ERR(chan);
+			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
+					    "failed to request mbox chan 0\n");
 			goto free_mbox;
 		}
 		ddata->mbox_chan[ST_RPROC_VQ0 * MBOX_MAX + MBOX_TX] = chan;
 
 		chan = mbox_request_channel_byname(&ddata->mbox_client_vq1, "vq1_rx");
 		if (IS_ERR(chan)) {
-			dev_err(&rproc->dev, "failed to request mbox chan 1\n");
-			ret = PTR_ERR(chan);
+			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
+					    "failed to request mbox chan 1\n");
 			goto free_mbox;
 		}
 		ddata->mbox_chan[ST_RPROC_VQ1 * MBOX_MAX + MBOX_RX] = chan;
 
 		chan = mbox_request_channel_byname(&ddata->mbox_client_vq1, "vq1_tx");
 		if (IS_ERR(chan)) {
-			dev_err(&rproc->dev, "failed to request mbox chan 1\n");
-			ret = PTR_ERR(chan);
+			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
+					    "failed to request mbox chan 1\n");
 			goto free_mbox;
 		}
 		ddata->mbox_chan[ST_RPROC_VQ1 * MBOX_MAX + MBOX_TX] = chan;

-- 
2.43.0

