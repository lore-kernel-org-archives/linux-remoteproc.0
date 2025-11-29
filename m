Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E950530F7E3
	for <linux-remoteproc@vger.kernel.org>; Sat, 29 Nov 2025 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427867; cv=none; b=oV3sMcDhlis+VllkP1kRCakauWUY/Tk5Dtbu34gubz9kw7Eg+4UV+e9V4fZOhXBy3l0A23lLmIGsJ5HCbh2rgKp/Av5gj7ZjYe3Xh9wFmn/5AY0lDWV9FlLsycmau07jFUJmLTLmS+qsYP2zAjLceh7qK81PV11MafTZmGzCXn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427867; c=relaxed/simple;
	bh=X/RTVwC1oGN6z5Dka28hemcDQEwsfiKSfg6YdtWaW+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TT5rkeDezA9qWwmFrnpDmmO27wFCQEZS4UBvz6sMWuzaGZQol/5kGpXqlElg7/v6beviCh6GUeoLT6996o6hsc+jgJRzsYpsvRta/RGxJgjhC6xbwy1zQOCtRmYf2x6tIlq2itU9z98kHqdLFo0Qy1IjsDSEJf17GAQzUGLv6Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Edb7YlTM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Edb7YlTM"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so2432874f8f.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 29 Nov 2025 06:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764427864; x=1765032664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3+pjSj3t+U3wmCCuCdgSBWbp2oqy9bpefHhTr0B/p4=;
        b=Edb7YlTMKW3UOrRT81YS5BSR99iJ91d/nQS/bgTAUfcE05sG/LVymlvwCFxWNpIuA3
         zGXTsdAZDAobQ0D0//VpI5OINXNMGFjLqr+C+xle/Sw6zUd+vpFTYtnPNmw53KJxMTEA
         54vIEUB5Obth+i95O9p8DGH+2hmqwwQoiIqTILAR8GQ1Pn5nNRN46PH/mR2A9E07u5pt
         ieh2/qft8jTaczN2bbM9pgtn25azuQVtybOGwdzGotO6U6pwcNCawY0XElWB7gh/TqDu
         NPwfXWrQ3s5XdWIBxGO+nkwEQgPYVIaQVLUxlR9kdQPZSonkAjEXtN57rSwWf7Dyy+gB
         TWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764427864; x=1765032664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3+pjSj3t+U3wmCCuCdgSBWbp2oqy9bpefHhTr0B/p4=;
        b=wcQdTPzVn/PrGdltIE5jcuJhiHx7G/aOY7rJtsfoJByNUac0j8aF1jW0ENOHWxAeEZ
         wEoZFfc3uw9NK6zQlizVAmAj7/VJTFI+dTsy3ZFGFYxS3RwncxLEgHQA9uEtCzHz7Jrt
         yfuQtJAXRg+yrjSQYqjVSFiqbXd6KEJJVr70kDZtdB82P/W/U0zPiYzWLzSsSm2/BSqg
         1uzMp9IoKWKVPBUh5EmYVyehfvAJqmhdSPz13Mzsrf+xlIJZauyHcD/qBMHJcXut6JHU
         QKYQKEL2HN8R6KR+O2mJ2MnMN8g/rmaOSrm9/OjLbYuVafXNsJFo+IYBJS48kIkC2L5Z
         8VXA==
X-Forwarded-Encrypted: i=1; AJvYcCXkGbrqlcBeu+SV3zSKD/dA55vMdXJhdfTNXPKb8mia2mCkBF1QEzgPpTqmKXsoLROuXfwK+LH/7U8bnZLM1wFS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6YfUtBYIemJVLIC/yn1C45gkCU3DhpKAr0If4TEmooGBROuuC
	mMo+Dy6MqsGbu/zdzKCmMC2EB+wALgQwN5l9oqtyijEtDtlEEnOlztkeZSIyFPgDnyo=
X-Gm-Gg: ASbGncsjyzaw6OUYxv7VDRQx4QDcbq/7pkvZxu1oj0hXfVwzp8cDejlXAC/Z5ILPEx2
	15Va1bBu+DYkX3/ARh53hNUxFWdRhREARc42A5uUtOA+wkBQazJQ+oDkVw2vT4g7DHtcCtNbd0N
	gYL3Zy9ZFyZBS48wlN1PvFbLZHBlDJNhxQ5eaj5XiijIRJrt1AjaBeACUev8jHFabrnnyrFGEtW
	3mn697Ik8GGa0KUddSsxZdCo/+LfMcKM77+qctZJ3CwFqGKnD1NsSb74DT57cL87nL/2tiRYkMK
	6Fbv2s+8P2R9AKAdrBenK0KdnF8ta7nhOIlNyQYoLP3dnEV69Qux5qqvVgo99y/KW2N7FDKThlF
	mx2qC/E5VVBIrozRe//CGZtt0rwl9nYMGXbZR4lMvVciQvbX2dcvdfBsxdAbrq5JfzXN+bFu/vD
	N+X1l62OWz9hmBnp0Ffc7RYks3IDo=
X-Google-Smtp-Source: AGHT+IFXZI+MiyMb88/2TV0PWTJHmmEbApjR91PzKlDmX//1XB5OJjcUROKOaS3odKI4ruxOcHnq3w==
X-Received: by 2002:a05:6000:2681:b0:429:c8e4:b691 with SMTP id ffacd0b85a97d-42cc1d5239amr32341226f8f.55.1764427864191;
        Sat, 29 Nov 2025 06:51:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5c3022sm16478970f8f.4.2025.11.29.06.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:51:03 -0800 (PST)
Date: Sat, 29 Nov 2025 17:51:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] remoteproc: qcom: pas: Fix a couple NULL vs IS_ERR() bugs
Message-ID: <0599691acc394d9390da8fa0b5de3399b132b187.1764427595.git.dan.carpenter@linaro.org>
References: <cover.1764427595.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1764427595.git.dan.carpenter@linaro.org>

The devm_ioremap_resource_wc() function never returns NULL, it returns
error pointers.  Update the checking to match.

Fixes: c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 609df141ecb1..52680ac99589 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -559,9 +559,9 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	pas->mem_phys = pas->mem_reloc = res.start;
 	pas->mem_size = resource_size(&res);
 	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (!pas->mem_region) {
+	if (IS_ERR(pas->mem_region)) {
 		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
-		return -EBUSY;
+		return PTR_ERR(pas->mem_region);
 	}
 
 	if (!pas->dtb_pas_id)
@@ -576,9 +576,9 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
 	pas->dtb_mem_size = resource_size(&res);
 	pas->dtb_mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (!pas->dtb_mem_region) {
+	if (IS_ERR(pas->dtb_mem_region)) {
 		dev_err(pas->dev, "unable to map dtb memory region: %pR\n", &res);
-		return -EBUSY;
+		return PTR_ERR(pas->dtb_mem_region);
 	}
 
 	return 0;
-- 
2.51.0

