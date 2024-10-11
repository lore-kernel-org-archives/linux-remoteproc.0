Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D20A218D65
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652176; cv=none; b=MXjOQT7fV5SJ0fr9g74XLEIrUsHiGhidCbJ02IlQsyWWeT8BC0a/UrNYnmQShAjgH7QItm/eONhIN9NYQoNZVz/KcAwamWutu49FxqoLRC3bfcUuRDcHMaolBQjHQjAr/DTpT15AgrNRzKgoeCjDN5xnv7xHBbV7Bv46fngmaJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652176; c=relaxed/simple;
	bh=gSXieckynan1ggvVnlG+inZiqvoY429i7fWJbf6BPSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oMpVzhSOHAnil1eOz8bCCWydSGjU+qBess+N/h1z3C+Z3x3dFAbWO5QfXahBK/LSDo2vO66sGjdaZHmlnQDiDEEBKf9XR6qY7vgBDnOZpXf3Wtkc0JLTKmuuvlE+lnDnx5a3zWCb2xtmOhdYQlp+UZnAO2vLrrXwUxeGayCM13Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KfgT8uiC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfgT8uiC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43052b41f25so2247755e9.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 06:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728652173; x=1729256973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKuBlnx6g3hljoBRvOf9HGy5tVw7a+mfxQ6RfkELrCo=;
        b=KfgT8uiCOEZrJE+lLBS+uXbdev6xs+JaIH80Mvw250c/9q8vivhI+8wQb7drdwUz0j
         hKSgstGPooddEzALHtZs4f5QeYXHHllbM1qrJa4v1PiGIA1MwHv94Cisx231G5iez1Fn
         t+qVPqmicOF2zhVLc/aQHT8qZUQAAVqgJSxAvnV1nDJ/HkFPyzJM8ybfU4sw3/X3uhaI
         MdELY14F74DHz+lJzPLMJ5WKSnC36XyZ9CpkWTUEkLEXJ3HoaLLNnszkYiq6h77sPhIT
         sFq6hH6Mc5SLEuxuW2EdpWfG1sidw7dcee8udgkSQPPpY4XipeEHoMOy+2ComlnO0bNQ
         fo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652173; x=1729256973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKuBlnx6g3hljoBRvOf9HGy5tVw7a+mfxQ6RfkELrCo=;
        b=TU5gqJiH0I45/gYuhU5c6QDzxAoiIk9XwbdItcz97QCXMMfwt9OCOXNnpdSyMX/l4K
         Q5XtNmsOqO9P4V7Fazq6XGw2bxBwHOU0hbi9VSQX18w5Gh8xejzXNPqu5/1FHNFmi7wi
         rh/wQo0M8vpA8cRizNslkBXFSQfVJpIvHIYygWMfRzFfppimw6kFiNG5WHY9NVzbkYlP
         PTpwHm6XbYybfQvF1oIEZQgPQ4i4osEFDTwLcZe1o4ZNQUZBB4QG4ACuquXIHG1GEkkV
         jwqWK/atp7pOIct2stgFC/70BwnxO10vtgLnBhFenyJr97GSm+qU2DIEzTal6MhF73Np
         mLKA==
X-Gm-Message-State: AOJu0YzIhLoqFnvBNxYMbnwgEbefb5weAdjAnW1/DKh1BylC9sstLLE0
	q6aszRqA8hAruaAvn0MwSwhHkd22Nc6pdRPsyT0QU6TmmY3ZWfgVAOB7UYSKwl0tqfzimoY8Oc1
	H
X-Google-Smtp-Source: AGHT+IGRkv8Jxp7w+8vtYLwBf0YkF4LDatGqUzWO19liXPl7ZpkzADwjozl4YjhJltfWQBGnAj/NEg==
X-Received: by 2002:a05:600c:4509:b0:42c:aeee:e604 with SMTP id 5b1f17b1804b1-4311df5920cmr9955705e9.8.1728652172857;
        Fri, 11 Oct 2024 06:09:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff6d3sm41621835e9.12.2024.10.11.06.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:09:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 11 Oct 2024 15:09:10 +0200
Subject: [PATCH 02/10] remoteproc: da8xx: Simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-remote-proc-dev-err-probe-v1-2-5abb4fc61eca@linaro.org>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gSXieckynan1ggvVnlG+inZiqvoY429i7fWJbf6BPSs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCSN/ZevX3FY+fvEb7VdFdqC/CD35L0PTBwrDt
 CHc6yHUhHKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwkjfwAKCRDBN2bmhouD
 14jZD/43rLFf0vRWeBRs86Npyw2pvEfM6EsVRyAJzhDYaKaJaaUQbe45yNjPKuPvuMEgf/H9e0Q
 JdfI2+zfCiWLHi1wesopOJ9AfTTb3+NvrVeGjpOiNoi8hylPrDSV4S7BGXhqvq/9B7m6BbU6Wum
 OCJ8ihXzcQOY9uOXna2ZgTtaf8TDhvLHh/MEX/nM+bsrXsQfujKi1BDIkhEibEmM8QRkm6+e6Qg
 7j7jAKkTIQJj3w6lXjJYI3iGZvCsi1K+w2EfH3TWgxh6ZeAmPOZPqGw3fkRUiWVTzg0T+D8ROIG
 PYUzIs43ytNTisBmobcBMio3Ss5pgpvop9sF6usrnib6gc8RmgF0KTpTUOXjyEV6VEWkjMv9H+2
 a5BhB7BfDSLsgMexX90eAazRObOE0rcAlID6nLXQCQCHM6tFwKlKnT7NkbW3LIwn5nEdQadKlnE
 oWZCFu8zWno30snXctQKm92Vh96kKMshG9dOzdj1Af5ms/GrcWkKHT5zEmgeImnkR3aL4wGG9Dp
 3Uhednmif6edRQvfFajHxlhtrZJLesRVCmawJYHdOjV6+v+wex2tuNKbvz81k2O1l0cXebWNbUk
 mtwApbaLEmq0cVLO+B1oGTNwTambtlv1vFk0Av+ar4s2DYv7dnS/168rr7SmGDOhtG5jMipRzx3
 m+c9C9R1k3zhLqg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to make error and defer code handling simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/da8xx_remoteproc.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index f8121682ae9a2aeee560d7f012bc68d2cd53b5f7..7daaab8124e857e50201f16ab445115ea96c8abc 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -251,10 +251,8 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 		return irq;
 
 	irq_data = irq_get_irq_data(irq);
-	if (!irq_data) {
-		dev_err(dev, "irq_get_irq_data(%d): NULL\n", irq);
-		return -EINVAL;
-	}
+	if (!irq_data)
+		return dev_err_probe(dev, -EINVAL, "irq_get_irq_data(%d): NULL\n", irq);
 
 	bootreg = devm_platform_ioremap_resource_byname(pdev, "host1cfg");
 	if (IS_ERR(bootreg))
@@ -269,21 +267,13 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(dsp_clk), "clk_get error\n");
 
 	dsp_reset = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(dsp_reset)) {
-		if (PTR_ERR(dsp_reset) != -EPROBE_DEFER)
-			dev_err(dev, "unable to get reset control: %ld\n",
-				PTR_ERR(dsp_reset));
-
-		return PTR_ERR(dsp_reset);
-	}
+	if (IS_ERR(dsp_reset))
+		return dev_err_probe(dev, PTR_ERR(dsp_reset), "unable to get reset control\n");
 
 	if (dev->of_node) {
 		ret = of_reserved_mem_device_init(dev);
-		if (ret) {
-			dev_err(dev, "device does not have specific CMA pool: %d\n",
-				ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
 	}
 
 	rproc = rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,

-- 
2.43.0

