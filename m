Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598841B6D1D
	for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jan 2025 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736620994; cv=none; b=a0t1QtVBQk7EmWRTm3q5y2rVsO77ERU86ELpuavKXZTTpR8rFuenOOtTkqDZZBPJVimY+sHOKbZa36oQbhyyTx0t4JgLgDhqcplxkUSkD0TabYMCJ6xX/DeXSQCSulNsXddNo2E+FgB591/J2WGhfDHQbjRFAb9p02ubYyrDmoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736620994; c=relaxed/simple;
	bh=fWYltI4xM/KDDIH8KFL0uiLtzD8nY+Kjalail67u2Hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUj2ARABQNnIzsGG3GO2XsWzP8v0LqKCUAfR7ekq9LPzw0iGrDoMr1vJwhU1ZZRWPfoon2zTobGUU4We63NafDceasIKF3zigWOv8ErlYVMEO1z/uyJ6DZ0wdtrwNo8u9hQKNAspBm3aVhe02uK6xZXkhdNVSOStRmvAK39g2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xHaMQ+2M; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHaMQ+2M"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43616c12d72so4354285e9.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jan 2025 10:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736620990; x=1737225790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSWM4xAa3F4ckNNT2rCjA6WUCAPjzPoqRakDwXZXtqg=;
        b=xHaMQ+2MBILcyVa14NwXCm+Sqeeyf6itQqZJ4fVoL/AI8dNLeIAhJG11G2H9Nb0F+6
         sNOr7K0tb/lD//xcQtMLqzz26zPW6x5DUEsQcZ7cq73E+qnMTth/BuLBXc6A9fcJJBG3
         YbRozgunebxYAVnhz6oWQLavfDXSLEdfWb4XNC/i9mSQkYbenatgmxx/ytwAKfTIQ+/c
         n6y62NLHupEZnFV1A7r44J5HjTSt1HzWrcqCMiCDY00SeSLTnFQxlfjcztOAIq/8XPeZ
         oLdCnunZXqFHCn46tR2TQhJ9skcCIctE9JXsl0n+TOVtjCwbPSxsqEt7mRD2ULLIKT3w
         CJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620990; x=1737225790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSWM4xAa3F4ckNNT2rCjA6WUCAPjzPoqRakDwXZXtqg=;
        b=J4iu/6ARdQGK1okjrw2d0+Bb1a3ZM/RoTGylqt2Jbq10QKz+4B15H77lGppgpNmExj
         XPkx+7QK2CzSGRXk0G5kj41oiCcM1XB9Ws9mG3Vy0dCKODIRlTKDUdiDwWh3FK8VwiRa
         JpqGIPViQ1B4vhuMEfxeqIVsS0Bp72zw8iqdBSrF4C7/hQgQ00K8DJeJ6MzBxjDRHwWv
         I2/IAdbIIC3qiQsNgkWFxkRf6nAeJJSz8CIp8ekM9pn+1j8kL46LZ0M6jklEp8cXvEbN
         0W7KvvN/nLjJQLX52kw8mXkvyaCXp2RVIwh+lRvI6oXSXnxv2X4MjXJlmgWwNIcqFX7g
         luYw==
X-Gm-Message-State: AOJu0YwCwaN7/qAVtcY2zo6Scls6ma9h+JYOB/OSJBsMD95xEiJhd8Wy
	DZSucyxt5+rMobq77S7FdEum9CfQMKoae+yjkQ5TwXsx+W/Bn5nWverdpblilFM=
X-Gm-Gg: ASbGncuVPp9ZKwidqz/W/t17BRqFTYQcetb3hADt72Lvh+MCKoDLTUEkF//O+DHHMnm
	jBwxgONdvuP8tNEc+aS5zH+3XcsKTGSaL/cm6Yp/MQGjE6uxYHaeHl5OLvZtLor6tt1PW1ClsRN
	vgAUKD4hd4K/qJ71vzi5hWG+Up2+Lvfp7jZV7tjX1Uk+FHaJVcRCX7SkAgBEha+ENrvJPhfGlc+
	9uU4L0Si7m2C/4mJlBTJf4D1bpyhCJD6JQxYefmbz8A2xkdAGvkR68MMR9d9rPzNqWOeD4i
X-Google-Smtp-Source: AGHT+IECs0vQ4xGmYsqqwraczYKPphscfapxLBfYSJTZ3A0WZWrloSMYovDfByM3Hw1oG9LXyt8FmA==
X-Received: by 2002:a05:600c:4f14:b0:42c:aeee:e604 with SMTP id 5b1f17b1804b1-436e27170d3mr54335455e9.8.1736620990615;
        Sat, 11 Jan 2025 10:43:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm205885e9.22.2025.01.11.10.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:43:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 11 Jan 2025 19:42:50 +0100
Subject: [PATCH 2/5] remoteproc: omap: Simplify returning syscon PTR_ERR
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-b4-syscon-phandle-args-remoteproc-v1-2-73ed6fafa1e3@linaro.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fWYltI4xM/KDDIH8KFL0uiLtzD8nY+Kjalail67u2Hc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBngruymH5IcFgYiymLuIIna6pft0HBEyMUVO7El
 2ttiACWVGKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4K7sgAKCRDBN2bmhouD
 17gFD/4+1JVyb2aRlgR8NEL4n+4O90KtSJz4kqJMdeGGUNV1Ohj6Y6AWtKMEdSq3NfQnBom2HPS
 EkgOJdgGC7D2Qa6O8SUtSNRRTsQapl131iDg0fldAlnhyCi5N+N0oSvtjc9GMJrlfDhVJaBl61s
 PmL2+vk9b7x5TX6MHlbuG100rClHpr8jFoP020URdpbfwZ18pGVaNyKT/wxANBeSLYX2cGtF6bf
 gBjBeNdd0oGAdbkDEL5m/kyxtibo4AZj50NRR5Un73S/dqn+aCBde7ittIXnoJkpGkq1Q58QPaS
 CaD8KQk4fxXAE/r/c7mxCH3ERV5cpRdUKnVK3Lo+IZ6+w9iuOr8J4ZZwLweWkNFhAbfzg8bSYJP
 8RFEYWmMD9VblWeBzD/V5lwGVSDzDTPeVqozSpgTK64mcaobtM98ae01pTkT8/FKq6cl+/SPTns
 OtmneVgj4clWsAhQ6UXeOdVvt04Rxow3XOijZqtGFebZJ9wfzMz4PbdV9NLf3ovkOK0VVh/lAGK
 ZVXL8HSLEBgZpUl/giEQ6qL7tG0VsM85oKamuZk4YO3ozmcALAVOjuTxrEPT99uaNMn6lYT3z3J
 ZE85re7iAH/ozV4uGtU6fAfTiSaLuUMVhNlBh+GDdIh9z/rv7pok8bR71II7/7Ym6g3u6PwaiVn
 j1//l9IGlqsOGxw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

No need to store PTR_ERR into temporary, local 'ret' variable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/omap_remoteproc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 3260dd512491e8920fc881b6a7c0d9b6f725e7f5..5f463937cbbff2c9ed5b22bed42454a0ae290f0f 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1137,7 +1137,6 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
 	struct device_node *np = pdev->dev.of_node;
 	struct omap_rproc *oproc = rproc->priv;
 	const struct omap_rproc_dev_data *data;
-	int ret;
 
 	data = of_device_get_match_data(&pdev->dev);
 	if (!data)
@@ -1153,10 +1152,8 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
 
 	oproc->boot_data->syscon =
 			syscon_regmap_lookup_by_phandle(np, "ti,bootreg");
-	if (IS_ERR(oproc->boot_data->syscon)) {
-		ret = PTR_ERR(oproc->boot_data->syscon);
-		return ret;
-	}
+	if (IS_ERR(oproc->boot_data->syscon))
+		return PTR_ERR(oproc->boot_data->syscon);
 
 	if (of_property_read_u32_index(np, "ti,bootreg", 1,
 				       &oproc->boot_data->boot_reg)) {

-- 
2.43.0

