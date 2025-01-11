Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965E51B6CF9
	for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jan 2025 18:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736621000; cv=none; b=SU8fUNHtQ1UiEq5XR0uZpyu0FIxcb/wDVLlUGVfzXl/7cyCO0h5WIqIHesiOKOxeyayNQoScWJshCPFWjTdxxXDdVJ70phWicg+qfBGUHyjKlKXB2UGLFN9Qz6mw3PXahDNUV8ouAjJFrdwVe8/k2K25XUcELcV2W7SZhNtbNJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736621000; c=relaxed/simple;
	bh=qF4PHMuL+t0qB80xl2hrwOztjmUZsyo+dEMuKAh+IB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h34wqPo2vz1iRAdNwZnNCI9R+agMsHim5TEVV4XSe0V1v7sH9ohV+SjZfiR9tWMWmEuikaV0hQJ1/jVfGhaWeoiVo6Sp3hVgkcO3Ttme2fHK44lsyNj3nGGwoMVOcqrsTZ03OLQ4YpHX4SNYzYG+EA46DcqBJfXC6SVYZJ4ARxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fsz6qNWB; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fsz6qNWB"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e0d47720so236743f8f.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jan 2025 10:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736620997; x=1737225797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZfLFbNpnmpDV2565vRSGO4sUYMlrYKX9NM4kz4voi8=;
        b=fsz6qNWBf1zZwje2h/h4OHikvx7/h2gD6tqIMY0ADt4vHZSSozzG+l+vnWGojlnlMh
         Y0aepVhPEhJrdAIyqQJf0Dj8Q03mxyluEvrrvkJpBTTm1byuIcSO/kDE855tb6CtJxA7
         mVIyzVbsXSrV4oUpZIWmp+Km7DJivmtlDzr7ueqopb34JpH8hObDvWI2nLQ9OUF0oojF
         G8ThnINwOuFAKp+jmy4kx2O6g+nGWH3VABbX26LctNkwsWj+pyCiscsZHTYpRxK0ZKPK
         7QANw7h4EbBv2JIblUdkhyfai0mo9ZYV1dFuzdT+NpSNOeZ9j5jjqZblP8cK82y2qEb0
         9tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620997; x=1737225797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZfLFbNpnmpDV2565vRSGO4sUYMlrYKX9NM4kz4voi8=;
        b=cGyMFqrDarQMcUHw12pgIxEDiPRe9Ea7lUERVisX7htDYTk/JUnKOId9bhzcxqVMr6
         6MAEoZ347+sTICMfnMtrgWmZciB+5+Rhsn4tqFyBFVbFJBaBMf94FC+B0eaxba2k5DM7
         v2ojvxqMcx+DsPJFvpIQ+B66WWl3kqO/y8kAIf2JsyfDsqqLvIMiLuKwTCO8DP5EFfzG
         IQ9nzmEbMZ7SiUu89O6Y8Wv/wKkwaanzVyXKjrhzt9wrkWZC/d8ISsCH3mmTyhCluyw1
         lkWBYay3fnfjlxCDyTTzbmEMHITISKK7Gb79ncz/tRGc5SBuq37F6Ci7ERtigXuaAaUq
         lJpQ==
X-Gm-Message-State: AOJu0YzX5FZ1nHIqipmhLrv8g9TV06BG70qiTV+48schqiMf0N6n4gtJ
	JBW92KaRWGgyXiwZRRt0f5JdLzkqhYgaH+Vg2gQHUXF7RfMZkO9f+Aum/HTmAAc=
X-Gm-Gg: ASbGncv0VycjU34fOOgLApSAK9KwjouNmo0zcSDFY+MYEE/IDll0FNzV2CNpuYeHAEy
	yRg+QyZg5VwULizZQjmnmrdmoy9P2FuukfceqDBgY/Llct+WNZ3a1ZCUPS5OdLkA/yP5TvMRh94
	jI7R0nIK/jWD1xzSkBELFRDgrW31FAumSBPQhcdU5mu8e3dKQcEAmLDmEebhaKg72Z4Ncr800B7
	eBwMur1JRFLNs/EvWAAnJcuZiDxpeRQGh4tD8Oq8WZDhWyhaPmQjw7yMgv47F/aZr9xgSsA
X-Google-Smtp-Source: AGHT+IFW0/peneFHNHf0VQ2I87ynYNTzqYw++V8lH2N+J7woIMmlHMzRJMHLntn2pbYLKroEqwtCug==
X-Received: by 2002:a05:600c:5027:b0:434:a30b:5433 with SMTP id 5b1f17b1804b1-436e26ff752mr59166135e9.5.1736620996872;
        Sat, 11 Jan 2025 10:43:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm205885e9.22.2025.01.11.10.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:43:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 11 Jan 2025 19:42:53 +0100
Subject: [PATCH 5/5] remoteproc: st: Use
 syscon_regmap_lookup_by_phandle_args
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-b4-syscon-phandle-args-remoteproc-v1-5-73ed6fafa1e3@linaro.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qF4PHMuL+t0qB80xl2hrwOztjmUZsyo+dEMuKAh+IB4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBngru0nQc+fzofOvHIUV+/fgemqTdgb2BKYWbit
 e6gPsMjdtKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4K7tAAKCRDBN2bmhouD
 1yAJD/9qGYLOD6d1yxq+cU4dWnu4tTUYO2HfUKb3UxNFVYISpIcj7Fg/t9w6XscXb+F1dhdEuqQ
 Qo0sEKZLgMV+JVGLP4yG/wpPv1lz4lPtuTc50hpJS/SyOVckngINxUNKatVoRo/brjSSCjWKEPE
 TEYJAtE0v7oS7Y5zxCJDZWPdhukQb/Laes2GlHC2zXGRbWqpkLnyoPJsWhGxq4UQHADX1XzZYBQ
 SSq2OKw8Q8F9+Q1b9z6Oc25dw4LWHX4MTiPRxo73ls8Yz/9MsiSmFLO4cG8su8U3blX3VNwwKLJ
 mfBCEg450PfOR0hEv0PH3dFgPOy2eWDDEMHR/hv9weZtJhO657ODwYu6wEfTyWnzz5xqo+/S9QH
 Wed4A/iSt7Y91Qv3X/dmf+3cK38qH/sdheiCwCbF4ul84pOC2PK7slF4XITdZ9tFa+fqbVkb74Z
 vmwH4GPTDGzuCo7s1QwLaP+E+I/dbAaDX9TWO2K2TWlJiNkHxRTKBuXkTv0LvTw8k4kgsJtsqYg
 WtbDn/wo/G+ESTk5a+RBWLESQPBfQG/jK+DOvqsdFOZtnGHZjnvFdEFH6vX8jse32I8VEgsjtLy
 peNwU+JATuXIBWcNFBkq2ZsCEtc/PVsdY06n23bstvpwN4ZQdo996sgJ/UeBqV7JRYC4JxfXpVb
 YbAPZrXD5w08gFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() and getting the argument.  Except
simpler code this annotates within one line that given phandle has
arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/st_remoteproc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index d1f35e8a83ba525613ed4e54d2269b7e9f427e46..e6566a9839dc5ffc83d907a3076fc4b0a644138a 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -314,18 +314,12 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 		return err;
 	}
 
-	ddata->boot_base = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
+	ddata->boot_base = syscon_regmap_lookup_by_phandle_args(np, "st,syscfg",
+								1, &ddata->boot_offset);
 	if (IS_ERR(ddata->boot_base))
 		return dev_err_probe(dev, PTR_ERR(ddata->boot_base),
 				     "Boot base not found\n");
 
-	err = of_property_read_u32_index(np, "st,syscfg", 1,
-					 &ddata->boot_offset);
-	if (err) {
-		dev_err(dev, "Boot offset not found\n");
-		return -EINVAL;
-	}
-
 	err = clk_prepare(ddata->clk);
 	if (err)
 		dev_err(dev, "failed to get clock\n");

-- 
2.43.0

