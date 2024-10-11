Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055DB21B43A
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 13:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652187; cv=none; b=bl9HBB9vMo0agZxkVt5qnLkJDgXSR2ImXalcId5x5drwiY9TKeBb5uMnGOniy36C0DBZ97TvPhhA9AayVRI8EqG+eyNI+zEWEwk9nqEpSMAwMK1JjsKgwU93dvVliczldE1tRokKtqZTABebkWFkA9S8QQbF5uHeaKItnKngIoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652187; c=relaxed/simple;
	bh=aMcNBPeURPXIhNuMngoM0gRIWvppAMi+Wbo99mTH2bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WORjBiiSQfouCkIDP1Ui3pIf1Y6WvMcUeL+Y76dwnkCl9sxTOQC5yGl6SZ6JuEszv02zwEyxv4e5TVafhUTplrTD9TPg60WWH3viVfGSlUM/yGnPXFWnAL33g5DPlILSZ1ckYMqrNLlup8RQM5W3cLX+z1ivDtHNn4xG6mv44jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nuzoGB4a; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nuzoGB4a"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d58a51fa5so47869f8f.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 06:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728652184; x=1729256984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrM6MfbqjGQogO7kaKSf9Rc0irvOSmDPvQniDSWlBW0=;
        b=nuzoGB4aDsFqvvkfC/zwdBaDexhLuS1lHH4fgZqkBoo/MiOde5GgQuQWNdQLAm9g+v
         Vc31Zg2hsoH3tyhEVa7ByEvlYvGfuob3Y2S4g06gux9q/RUU6NcCfSvMJEq519AB6s7C
         Ow59Q6yzFne4spI4P/11WE80Ewj9l9xVAn02GoC9byZg7KVIbfpur07c7udyDGYYHLo4
         bkOWWtMyGhlAvhmGzRXZ2qY0OwXiPiMvYgHPLrLragCkN+X81F1nZ1jvbKlRAiTBpUho
         8xmeU3/m1jzYl32B0oYhxmO1ncAazpZ0wv2dOR4HpxxkWiuCVptkhwxHUwR4HzeEYCiz
         yVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652184; x=1729256984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrM6MfbqjGQogO7kaKSf9Rc0irvOSmDPvQniDSWlBW0=;
        b=JOnn56VHcqXK6djkcMEYaR27Touc74V0uwS4mVpjOjNXbS+edGGnthdnIYEett2pHf
         D2xviZ6ohp7NwyQ6EzdmLBAMf0ZsvpCU3nrtb0SUdUsl44rOGpqBXXg8+ODKzNjfu7Bg
         jy7Ns6B8IFj3neiBzUR/CcrtdUxSVJG8in9GCXcaKO0CoK4mfY0w075gijN2skoYF++8
         EPzeWKkuzHcbL5m45Ir2LS3oo6Cq6TijK1raGz2i850gF43wUEb0dsdMTIV5s6DuKrVK
         D5jVo3VjAvi2ievzKv+raSpoJGc59H3vqPFbBDoKNK8r1qZhVGKITwwLZan5jExCQrxO
         8Vhg==
X-Gm-Message-State: AOJu0YyLMh8XybOdDZnFk0HMwFcirxgO3OFx+tzGlBfa+rJveM2d2aC/
	Cj/Vl0H8ZDwANfly7+LPmsv6gI30CCBwMB90/W7wWYdhnYiEIibTSn5yDED9Vm/652hVLtTk7gR
	w
X-Google-Smtp-Source: AGHT+IGLzh9qD7wpeSjGtp0Ds5swuxDDAZLcgxh47KTeFVzcHhpNLCZB9ujHVAwAoK2ct2UW/jc3Gw==
X-Received: by 2002:a5d:6942:0:b0:37d:54d0:1f15 with SMTP id ffacd0b85a97d-37d552b2603mr742424f8f.7.1728652184313;
        Fri, 11 Oct 2024 06:09:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff6d3sm41621835e9.12.2024.10.11.06.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:09:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 11 Oct 2024 15:09:17 +0200
Subject: [PATCH 09/10] remoteproc: qcom_q6v5_wcss: Simplify with
 dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-remote-proc-dev-err-probe-v1-9-5abb4fc61eca@linaro.org>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4784;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aMcNBPeURPXIhNuMngoM0gRIWvppAMi+Wbo99mTH2bs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCSOG9GyRPmqGm0cNl2il7G6aX1v4RHpRs9z45
 1XqkKwxmSCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwkjhgAKCRDBN2bmhouD
 1wTkD/9IxVIyRbJMy7WI1BiD2FudLyUctCTRvC13re08iv09i6WtfXEFj7X3R4O4IGVjadK+iiQ
 03EsyuUpw29FtPnskFXRcSnLj2D+vilg3YHx64nZQyX8Z5lIWCeUncHYLGN2NGIyoPDVn5F/EeB
 hGFobyWZn5BKUpIRWjLMd+n3Of+RKN1cBoU/1uhsb2ONNWZsHFgOWlIhaoD/LOhFrvuEoNcptJm
 yqpcs+SkKgdxSFPKoLepNZw33fHt+jVx5D3Ifqtg/4FxLkUi4xjaiHO1dNQgWlQuiXU8AsWqBFE
 Jl7w4DzZQ7h01zfpj/HUjBMuMeT1FNBCm/7UlgTRxcQQfMRBY+FYAQJUuONfJLCisV+RHN7gJoe
 B8bl6hr3LeXaH9qg/M6ye2Svd5ORdTI5lZ5KRkO6trAce2qFWKt5mxsvH6F3u3Y7IS9xbugUHmt
 5Fxuic7OVPvrPjzVEOyT6rlHGeCNQkt9DIhcPX07iv90B9wJJR+QQ+HVB+x1Au9tLP9iR2tgsdf
 d/UoRb3VCULVD4MFpAewCTBzrn5dumsEqmfZoHgwtjpTJ2N9utGN48x++M7J4LIESj0/tLbcYg0
 8QZNlnx7/9keRRcw+bbjivQ3/zkC581kAj033mjnXmrfANvdN+TqD0ERpLZicVmMPr+ZxSTeFA+
 +SEY6GyqZOPy2tw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to make error and defer code handling simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 92 ++++++++++++-------------------------
 1 file changed, 30 insertions(+), 62 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index e913dabae99245da60404461240ebeaebded67eb..8161575d821c4533646223a1d967172e1cdee9c1 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -902,90 +902,58 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 
 static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 {
-	int ret;
-
 	wcss->xo = devm_clk_get(wcss->dev, "xo");
-	if (IS_ERR(wcss->xo)) {
-		ret = PTR_ERR(wcss->xo);
-		if (ret != -EPROBE_DEFER)
-			dev_err(wcss->dev, "failed to get xo clock");
-		return ret;
-	}
+	if (IS_ERR(wcss->xo))
+		return dev_err_probe(wcss->dev, PTR_ERR(wcss->xo),
+				     "failed to get xo clock");
 
 	wcss->gcc_abhs_cbcr = devm_clk_get(wcss->dev, "gcc_abhs_cbcr");
-	if (IS_ERR(wcss->gcc_abhs_cbcr)) {
-		ret = PTR_ERR(wcss->gcc_abhs_cbcr);
-		if (ret != -EPROBE_DEFER)
-			dev_err(wcss->dev, "failed to get gcc abhs clock");
-		return ret;
-	}
+	if (IS_ERR(wcss->gcc_abhs_cbcr))
+		return dev_err_probe(wcss->dev, PTR_ERR(wcss->gcc_abhs_cbcr),
+				     "failed to get gcc abhs clock");
 
 	wcss->gcc_axim_cbcr = devm_clk_get(wcss->dev, "gcc_axim_cbcr");
-	if (IS_ERR(wcss->gcc_axim_cbcr)) {
-		ret = PTR_ERR(wcss->gcc_axim_cbcr);
-		if (ret != -EPROBE_DEFER)
-			dev_err(wcss->dev, "failed to get gcc axim clock\n");
-		return ret;
-	}
+	if (IS_ERR(wcss->gcc_axim_cbcr))
+		return dev_err_probe(wcss->dev, PTR_ERR(wcss->gcc_axim_cbcr),
+				     "failed to get gcc axim clock\n");
 
 	wcss->ahbfabric_cbcr_clk = devm_clk_get(wcss->dev,
 						"lcc_ahbfabric_cbc");
-	if (IS_ERR(wcss->ahbfabric_cbcr_clk)) {
-		ret = PTR_ERR(wcss->ahbfabric_cbcr_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(wcss->dev, "failed to get ahbfabric clock\n");
-		return ret;
-	}
+	if (IS_ERR(wcss->ahbfabric_cbcr_clk))
+		return dev_err_probe(wcss->dev, PTR_ERR(wcss->ahbfabric_cbcr_clk),
+				     "failed to get ahbfabric clock\n");
 
 	wcss->lcc_csr_cbcr = devm_clk_get(wcss->dev, "tcsr_lcc_cbc");
-	if (IS_ERR(wcss->lcc_csr_cbcr)) {
-		ret = PTR_ERR(wcss->lcc_csr_cbcr);
-		if (ret != -EPROBE_DEFER)
-			dev_err(wcss->dev, "failed to get csr cbcr clk\n");
-		return ret;
-	}
+	if (IS_ERR(wcss->lcc_csr_cbcr))
+		return dev_err_probe(wcss->dev, PTR_ERR(wcss->lcc_csr_cbcr),
+				     "failed to get csr cbcr clk\n");
 
 	wcss->ahbs_cbcr = devm_clk_get(wcss->dev,
 				       "lcc_abhs_cbc");
-	if (IS_ERR(wcss->ahbs_cbcr)) {
-		ret = PTR_ERR(wcss->ahbs_cbcr);
-		if (ret != -EPROBE_DEFER)
-			dev_err(wcss->dev, "failed to get ahbs_cbcr clk\n");
-		return ret;
-	}
+	if (IS_ERR(wcss->ahbs_cbcr))
+		return dev_err_probe(wcss->dev, PTR_ERR(wcss->ahbs_cbcr),
+				     "failed to get ahbs_cbcr clk\n");
 
 	wcss->tcm_slave_cbcr = devm_clk_get(wcss->dev,
 					    "lcc_tcm_slave_cbc");
-	if (IS_ERR(wcss->tcm_slave_cbcr)) {
-		ret = PTR_ERR(wcss->tcm_slave_cbcr);
-		if (ret != -EPROBE_DEFER)
-			dev_err(wcss->dev, "failed to get tcm cbcr clk\n");
-		return ret;
-	}
+	if (IS_ERR(wcss->tcm_slave_cbcr))
+		return dev_err_probe(wcss->dev, PTR_ERR(wcss->tcm_slave_cbcr),
+				     "failed to get tcm cbcr clk\n");
 
 	wcss->qdsp6ss_abhm_cbcr = devm_clk_get(wcss->dev, "lcc_abhm_cbc");
-	if (IS_ERR(wcss->qdsp6ss_abhm_cbcr)) {
-		ret = PTR_ERR(wcss->qdsp6ss_abhm_cbcr);
-		if (ret != -EPROBE_DEFER)
-			dev_err(wcss->dev, "failed to get abhm cbcr clk\n");
-		return ret;
-	}
+	if (IS_ERR(wcss->qdsp6ss_abhm_cbcr))
+		return dev_err_probe(wcss->dev, PTR_ERR(wcss->qdsp6ss_abhm_cbcr),
+				     "failed to get abhm cbcr clk\n");
 
 	wcss->qdsp6ss_axim_cbcr = devm_clk_get(wcss->dev, "lcc_axim_cbc");
-	if (IS_ERR(wcss->qdsp6ss_axim_cbcr)) {
-		ret = PTR_ERR(wcss->qdsp6ss_axim_cbcr);
-		if (ret != -EPROBE_DEFER)
-			dev_err(wcss->dev, "failed to get axim cbcr clk\n");
-		return ret;
-	}
+	if (IS_ERR(wcss->qdsp6ss_axim_cbcr))
+		return dev_err_probe(wcss->dev, PTR_ERR(wcss->qdsp6ss_axim_cbcr),
+				     "failed to get axim cbcr clk\n");
 
 	wcss->lcc_bcr_sleep = devm_clk_get(wcss->dev, "lcc_bcr_sleep");
-	if (IS_ERR(wcss->lcc_bcr_sleep)) {
-		ret = PTR_ERR(wcss->lcc_bcr_sleep);
-		if (ret != -EPROBE_DEFER)
-			dev_err(wcss->dev, "failed to get bcr cbcr clk\n");
-		return ret;
-	}
+	if (IS_ERR(wcss->lcc_bcr_sleep))
+		return dev_err_probe(wcss->dev, PTR_ERR(wcss->lcc_bcr_sleep),
+				     "failed to get bcr cbcr clk\n");
 
 	return 0;
 }

-- 
2.43.0

