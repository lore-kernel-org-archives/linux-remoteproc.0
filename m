Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E1D218591
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652175; cv=none; b=fRzO8cuelKdWe6YuAz/aUjqKAzed8SNC0B79TP5iSDPXse0Y1f1pLBDeLb6t9jSX5cL3NKhqaPVgaZTDDqBoGDtNrcUg5WAKZkN9I57n7/HbL61m8o9Y6MSb4qnH2tALfxYyTYZT5hEZC8QIYgpavSeqbNZwwYhhtQ/IGWaEBqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652175; c=relaxed/simple;
	bh=Efl7CZDOuECv9di8D9DhDkfW/8hB3yUHg2An+aKkbRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oFCC9Ba2I0+wvRbx/88hNhhobpXvrnHhRmhTCV0cwdVrjQJa1WRjYj6o0CjdC7Y3jfZVkXs3hrN23kXIUnSb2hlCwvBJSXdzHd4Q2P1VB0M3X7sRoYnSqwrinREFY6e3MJ2Qm1wJHIosKDPFUNAidSdROEDFeJ5BjaTYkUTYp+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QTPyGYs4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QTPyGYs4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4312484334eso64655e9.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728652172; x=1729256972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UG3Qm2MgrjH9dMYem/mVTYMGse1VSn0DCYfZp91tfJM=;
        b=QTPyGYs4dsy+1tt2x+hAUL3I3EU/j3beafz6/4jzi9n0n8qiJnZ7O/ycNq6TN6ffFm
         au618pMq8awfdBDElC42RweNXBJ825D4q67XyGE9r5QJIruHlkjDMGLwDbxTO0rCJiih
         RwCHrR9DukpWYMuMIx3ub60l6S1KT5aa+SYEIOo/4beM5vWE0Ia+QPpI4MUxfDyI7Nud
         SnXBIATp52hlVHVvmBiUThtrdgEsOgZDKwEfMtbg14yeeZtW1JiA0oUQosTHh7OuEo6g
         hI6Q6aZBgnr84U3XMxGtUYjk0jG8VZW3IqNew0mx+E0LaTC+MoQDFuyni/HEP2q5KqTG
         kgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652172; x=1729256972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UG3Qm2MgrjH9dMYem/mVTYMGse1VSn0DCYfZp91tfJM=;
        b=C/wI9X84ab2PoynXRCvv76n5a0f9Kk2VP1xV4CctP57TbnuUYIxgwcwvM3THozRBec
         A39jXTESUKL1idTQ3tH/yH9aH+uoBi2R37Vg4uVUi2uDduDWVQkUFyVdq3/n3OF7PFPc
         NTtb/enSNlnur2J8zipRngQvROc+iJljzqo67x3ah92CqiJQ0n98byX2yqIBtzUnqUdU
         4mli69Ikb3NlWWS9Rlkk0ILodbSdoDiL3Q5j1SRadU+ULxH6lW95yqogbfYGFXBIXgpa
         CTbJCkLS2gbR8DpTyHGk1oh47NfsyEyHofksGouqT7lns0ay1MCBNAQ8MIFsqJZdKof8
         V5iA==
X-Gm-Message-State: AOJu0YxLs4TN04GUNdLZLcaOpCxsfp5TaOHeHIc/LZEfIpLz9/sKwraP
	+e6fDhp6v5aG1Cpg8E22hm6kiS3cFvsMucQHvi1WJQULN0hw91GEsta5VgTxcog=
X-Google-Smtp-Source: AGHT+IEOpwQ5zbShnH9q9k+xPE2cbuqtLIvjMJ9Ws3a25NNyN/fDuxegI1VMFli5L1E2DFcgasgTyg==
X-Received: by 2002:a05:600c:470e:b0:42c:b55f:f4f with SMTP id 5b1f17b1804b1-4311df6050dmr10163155e9.6.1728652171681;
        Fri, 11 Oct 2024 06:09:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff6d3sm41621835e9.12.2024.10.11.06.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:09:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 11 Oct 2024 15:09:09 +0200
Subject: [PATCH 01/10] remoteproc: da8xx: Handle deferred probe
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-remote-proc-dev-err-probe-v1-1-5abb4fc61eca@linaro.org>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Efl7CZDOuECv9di8D9DhDkfW/8hB3yUHg2An+aKkbRk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCSN+kmXApJYRDzFRCX+0jqfEjq+GDgfNftaPJ
 TsD8ge3KYGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwkjfgAKCRDBN2bmhouD
 192oD/sGhh13Qoc/TkSae9x65oSc+HxSm9V7PJwKGu3DqHEc83mI/INO5DOmzeuJXa5+gsEeidj
 8piYBZOX25DlPbkCH7kd+hSnfX0bax7AodU+rQM1VEApgFl48A56xAp92mRc+OG7fEYyCj87PiZ
 xQmH4U6VWs5vpPouGUnhrXo+pS7M9tTRwSrATGH951t6mfzl4PB2F1ZhadPbXB4mdJIzYqe0lbs
 DYB8pvJASagSI2mkaTOPEXLRXKwGZhMKJEqhvEHvie+n4Dm2du0jVk3OtnHEQz353V7XhC5fzrh
 KPY7HuQ8gvFk03HTnT8MRFLT6b4ZnEYcErRj3V5d5ZtmpnNKP7fYF6l4lv0IM1kBU3H6OjwZXRX
 Aij265jfsD3qeVYYlsdiUQ6Zq+ewFZ7ERB8rHQDg1gKmI9lNIOIyXR1s++SwfYd62PgP/+onGtl
 ba2givXln5gp2ZKim51jE/Ub3Pdz+mRLdabOf+WT0oOc7JatlI67Spz0nEy3MzRDbEYLLHadrwq
 TC51jUdqt97gwrHM9aApT3dJPfinKnhaKsm2cKEqqOKWhBKfAme92dmgDnb2N7VmHd9dlVLABDg
 sbTfyigBgHHHoPHFhX6Vne7lU/FNGQxZqixOkPud5KqOsminUM+IjB9zlPV1FSEudXjQzFWpMCE
 axDRnZ4Mm1W43Lw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Don't pollute dmesg on deferred probe by using dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/da8xx_remoteproc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 8770d0cf1255f8b618283965e1cf913018fe173d..f8121682ae9a2aeee560d7f012bc68d2cd53b5f7 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -265,11 +265,8 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 		return PTR_ERR(chipsig);
 
 	dsp_clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(dsp_clk)) {
-		dev_err(dev, "clk_get error: %ld\n", PTR_ERR(dsp_clk));
-
-		return PTR_ERR(dsp_clk);
-	}
+	if (IS_ERR(dsp_clk))
+		return dev_err_probe(dev, PTR_ERR(dsp_clk), "clk_get error\n");
 
 	dsp_reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(dsp_reset)) {

-- 
2.43.0

