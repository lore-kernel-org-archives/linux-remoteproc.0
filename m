Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B3C218D89
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652177; cv=none; b=K1OCd6HSYZ7LklzJGyWP1WfQniYCm87NIVGAsE39xSqZgLKtoituyyFG6Wgmq0Uc+l6kLE82YhY+Q9HRiQtuH7pOL28LYmqHaqZbMQRetBn+bVui67L1q/OSMmjyKEKDCpdiqUFDhwBGnaS9FzZjPOrNu/K2Z7IWJiWpwo5u3mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652177; c=relaxed/simple;
	bh=KVaLBBlbh3dYDdR8ks3ennYPPEcGrZDyGNQYooRo1Po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDMo6Pw+7EIeny+eKBYpCH3C2uKkxRx2OAByJJsbcOGkyMKqRAG0Rj+iCSZBC3kMAet+LAU8VxUIlBfk9xFVUs+Utk3iT9dKb5tGxMm89fXqznMhDrCW0dBksmneaXQs78qSn+Ms1vYmk0Bc/Tl5dB5g3c/zNZrqL3dzefYLlIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBAnLzRB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBAnLzRB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43054ddfd52so3247245e9.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 06:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728652174; x=1729256974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7Nvg3BoaosiBkxdS8e0yItpPTXTuqmEuWUS4CnmA1o=;
        b=IBAnLzRBtcYbQl0yLb+KvekJEcFwhX8E527w+Kas+7ph4LjwsyzZw2as6kh7/rmhYU
         BHcbS4kUxLigvH93r8a6NQn82EoprAYqSdF2EJoTulfML3mnMv1FPs7dVUPMwB92eh/e
         UbWaLfuLBIvtbQZ7+hZkpnwncwEdcLiXYqZ4WdP0cDNIySrDKRqiSviZezr8VQ3oky8n
         TG0/qRZyaovqpL10AbZdIxc3RD+tCsycx1fd88MLkFgnCmbeQK7pB1SRoNuo8EwstaR2
         y6aWiff67XCdoAR2XiyZbyvKiP3ha1ZpXWU/XjWiBd9p6KCK2FbErJV2eHzJrB8uVsRR
         ifMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652174; x=1729256974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7Nvg3BoaosiBkxdS8e0yItpPTXTuqmEuWUS4CnmA1o=;
        b=OcTCKK0D25pn3J6QdV+Z5HmJYHVumJu7zJAn/m5xWvWc3KwVjlnCi4paqTrNBbGF6K
         xDQz8qwrJQlgxcn6PaNRVulz0lSQzI4ZvV9gpla4qZ+BDIpofArKvVVs8BJEE3eZLBY7
         wNLWviEwd4FNveBuhqUs3LrOI7WLk0MgWH2n7KI+aTz+lkJtIp4zhRLlhnm8B5Jt0LMz
         5DZ9Gyt/WKae6Yn+eoBXdB2VPIAHpzuPIeB4jfUsEDlhq+KAXe+PLRK3Amr7HEx05dRB
         nMsvo6ua84AHpzpRLNdKz8M7jaSjHfckr8mFgrbT0vrCLU/N7n93wFtkNw+BZccVrj03
         IREw==
X-Gm-Message-State: AOJu0YyFjFuexOHzm03r/Sb87Gkol22sqPuYKni7rU2V19UYylnUQpS2
	TtEbUKGwHxvetxm7tPafljyz4BEIIKNbrV+1BUkFqEbDGX20r4NDXBc4KBmDjIbrMkNh5XXAVXo
	b
X-Google-Smtp-Source: AGHT+IGp60E5RkMJO/FIg6S9LUWNU8V7pORyL0cemcWxhunxyvPzt3qT9kHRqbODDd/u+T77QidHmg==
X-Received: by 2002:a05:600c:1ca4:b0:42c:b9c8:2b95 with SMTP id 5b1f17b1804b1-4311df5bd1emr10207265e9.6.1728652174022;
        Fri, 11 Oct 2024 06:09:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff6d3sm41621835e9.12.2024.10.11.06.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:09:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 11 Oct 2024 15:09:11 +0200
Subject: [PATCH 03/10] remoteproc: ti_k3_r5: Simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-remote-proc-dev-err-probe-v1-3-5abb4fc61eca@linaro.org>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4503;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KVaLBBlbh3dYDdR8ks3ennYPPEcGrZDyGNQYooRo1Po=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCSOASFHiQkIljzwn8voo2jKvmxjkX/0FrzW0u
 3MJxiD/oGyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwkjgAAKCRDBN2bmhouD
 18+zEACX0aUTuAeU2RO+h5zjZGuToXBnD6yjf8dX6/8mT7pT8EIYK0/Vv/JSJ6x4Hd+fJ4zvUtq
 od2BzE9DcORbz+0fPdkoAa2RjZO27aBX5gNwX1yXUYC/m9F5Y+pG7zIRjPl5vQ9u0JPk8v5DRgm
 XtHAWWHP+lJ/UwSC54qJ/lJSxuVQ4CW9xIqAPITwyRl6RrG+pQn32w1uQ5t5BxmlMK/xf/GxB6M
 rMkIM4rPynd4IYmZHpqMCqyvzgmGEVaFW8P95pmmOQMsRHbOGXx9eRXBvyHhHx8LSeRZu+GOuop
 6n2B3XG1JDoLB5IaJiQVBzR4Lvx3sSMvZNzjblZIvcycLbyNOR04fW/IH3zfE8dbQinZBZVHvXH
 QHPByK31uMF7bm9amEQYsMPaQaEt9a4NSoR7b6MDncNWm/4BW4rjUbNPdZYcUFiEMqRC/VaYyQL
 pPxJbjdoVwo+nDH3VL3zFQ13HhkLLoNFkTjVTH1Dm0w4YKDlFvFDG+FpFn29fNl2GJjuXrpJQfF
 u6MfOud5wrHueRXlgyxO6qv7Fwv+uBsfXsKb33q0+ZGnqcY86pX6B3CDnNtufTESWPQLeSw4R6S
 JV/hx5yyB1CFjH916wp2bYYSmAnlT2PHboe36bRRXWLFRvu5W8rcpMxlaUHjrX0+17cO2TadrT7
 uuQAdz/9NBn+EeQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to make error and defer code handling simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 69 +++++++++++---------------------
 1 file changed, 24 insertions(+), 45 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index d0ebdd5cfa70e1dac782f5e131a0f19c9ac096d9..5a2e0464e1b81e3d4571a466643f08a53ebefc0d 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1557,11 +1557,7 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
 
 	core->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
 	if (IS_ERR(core->ti_sci)) {
-		ret = PTR_ERR(core->ti_sci);
-		if (ret != -EPROBE_DEFER) {
-			dev_err(dev, "failed to get ti-sci handle, ret = %d\n",
-				ret);
-		}
+		ret = dev_err_probe(dev, PTR_ERR(core->ti_sci), "failed to get ti-sci handle\n");
 		core->ti_sci = NULL;
 		goto err;
 	}
@@ -1577,18 +1573,14 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
 		ret = PTR_ERR_OR_ZERO(core->reset);
 		if (!ret)
 			ret = -ENODEV;
-		if (ret != -EPROBE_DEFER) {
-			dev_err(dev, "failed to get reset handle, ret = %d\n",
-				ret);
-		}
+		dev_err_probe(dev, ret, "failed to get reset handle\n");
 		goto err;
 	}
 
 	core->tsp = ti_sci_proc_of_get_tsp(dev, core->ti_sci);
 	if (IS_ERR(core->tsp)) {
-		ret = PTR_ERR(core->tsp);
-		dev_err(dev, "failed to construct ti-sci proc control, ret = %d\n",
-			ret);
+		ret = dev_err_probe(dev, PTR_ERR(core->tsp),
+				    "failed to construct ti-sci proc control\n");
 		goto err;
 	}
 
@@ -1717,11 +1709,8 @@ static int k3_r5_probe(struct platform_device *pdev)
 	init_waitqueue_head(&cluster->core_transition);
 
 	ret = of_property_read_u32(np, "ti,cluster-mode", &cluster->mode);
-	if (ret < 0 && ret != -EINVAL) {
-		dev_err(dev, "invalid format for ti,cluster-mode, ret = %d\n",
-			ret);
-		return ret;
-	}
+	if (ret < 0 && ret != -EINVAL)
+		return dev_err_probe(dev, ret, "invalid format for ti,cluster-mode\n");
 
 	if (ret == -EINVAL) {
 		/*
@@ -1740,49 +1729,39 @@ static int k3_r5_probe(struct platform_device *pdev)
 	}
 
 	if  ((cluster->mode == CLUSTER_MODE_SINGLECPU && !data->single_cpu_mode) ||
-	     (cluster->mode == CLUSTER_MODE_SINGLECORE && !data->is_single_core)) {
-		dev_err(dev, "Cluster mode = %d is not supported on this SoC\n", cluster->mode);
-		return -EINVAL;
-	}
+	     (cluster->mode == CLUSTER_MODE_SINGLECORE && !data->is_single_core))
+		return dev_err_probe(dev, -EINVAL,
+				     "Cluster mode = %d is not supported on this SoC\n",
+				     cluster->mode);
 
 	num_cores = of_get_available_child_count(np);
-	if (num_cores != 2 && !data->is_single_core) {
-		dev_err(dev, "MCU cluster requires both R5F cores to be enabled but num_cores is set to = %d\n",
-			num_cores);
-		return -ENODEV;
-	}
+	if (num_cores != 2 && !data->is_single_core)
+		return dev_err_probe(dev, -ENODEV,
+				     "MCU cluster requires both R5F cores to be enabled but num_cores is set to = %d\n",
+				     num_cores);
 
-	if (num_cores != 1 && data->is_single_core) {
-		dev_err(dev, "SoC supports only single core R5 but num_cores is set to %d\n",
-			num_cores);
-		return -ENODEV;
-	}
+	if (num_cores != 1 && data->is_single_core)
+		return dev_err_probe(dev, -ENODEV,
+				     "SoC supports only single core R5 but num_cores is set to %d\n",
+				     num_cores);
 
 	platform_set_drvdata(pdev, cluster);
 
 	ret = devm_of_platform_populate(dev);
-	if (ret) {
-		dev_err(dev, "devm_of_platform_populate failed, ret = %d\n",
-			ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "devm_of_platform_populate failed\n");
 
 	ret = k3_r5_cluster_of_init(pdev);
-	if (ret) {
-		dev_err(dev, "k3_r5_cluster_of_init failed, ret = %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "k3_r5_cluster_of_init failed\n");
 
 	ret = devm_add_action_or_reset(dev, k3_r5_cluster_of_exit, pdev);
 	if (ret)
 		return ret;
 
 	ret = k3_r5_cluster_rproc_init(pdev);
-	if (ret) {
-		dev_err(dev, "k3_r5_cluster_rproc_init failed, ret = %d\n",
-			ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "k3_r5_cluster_rproc_init failed\n");
 
 	ret = devm_add_action_or_reset(dev, k3_r5_cluster_rproc_exit, pdev);
 	if (ret)

-- 
2.43.0

