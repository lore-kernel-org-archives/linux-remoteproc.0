Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1721D314D3E
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764227650; cv=none; b=HGKEDriWimcPcWeDnBbU6Hn8Jl0F2W5BL4pdIrKlyiEHkjouVlaboY7HdweBt/Loxf1T+OxTlNaoc0EKdkzOStrUubCkBMhREv2YU2gZv9ygwfl7GpAxlE25k7A/kUNaWpM5OBSC6qWE6BcbxLdnNnWPtAJyJ11oHdvoMStF0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764227650; c=relaxed/simple;
	bh=LegWMLbCeHe5PZm0Ub4p2iXUO58hksEwiYKg1a+m090=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ze/O/lFEB0X65zHwGuXYQF6m/SqoVI9VbBT7sYR29AG1xq12U0bdcClhyeL4Agk3XHhSU1BlP9pjhe9l/0NFyb4CWesmdswrtq3B1pZ3W5eVX2d56zLgwPR/IXjtwu0oXjY0J7FUeUSmvLZq7abNcHDWUOjGCZ4B8VY0+sFn7YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nQicIoEB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQicIoEB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47790b080e4so1858885e9.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Nov 2025 23:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764227645; x=1764832445; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dVF2KlYm35Amf2a5Gnk993yXcXd/prgPbjpDZiGmKM=;
        b=nQicIoEB6FreAn/bOXDbiTdCZz1KywcxZuyYTTbHKC+UJ3wSKnVZADyYxqvK0pE8Vm
         aYKq2h8JLOwZwdyiJwkK4Xi+F6dPCiLzKD7RuyoNBiLGINqQXfYEDgZ+AspDr7xgVj75
         IPLrOMYXtINLikflVBFBlIJFDyYhQxY3Cr2Fhbl1bO7cB4IFwUCFFYglCs5MvUGDCIIe
         wwVsDplbugUYE1O35l3EEwNqiG2VGo4YmkDWAzpMU0e+OCQ/afNBQSvP45n6DFJ0u0Fw
         0I68oTTeNPkBemuZs6YipWXjTHoMBEeXKHsxLr/E0pHsKA9pAUuNB7PgOOzCeDdt88CH
         ndLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764227645; x=1764832445;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dVF2KlYm35Amf2a5Gnk993yXcXd/prgPbjpDZiGmKM=;
        b=e+3ERlvfoihH8y4p8aw+paEryah/r+GYtLkDkKIqO7yx2YUJoEdScfKwM2YTsXVTMY
         9MKsvSN8qGU/z1GJ7mr9dRuveK5CEUmANVgcZ7z5ekhEjWnYCCOiAuZTovy2gYgj+ZIn
         P6txXTvCew5JoNbXg7whA3PD7xdRTlrhA9qMHJcBM6dwtCcuf2uxKKToN/KdT8PEKlYL
         vGwE2VFUYsZP47T4JZGiUOjdEDpgSJOyiOkguo81m+cahFHil7WAhg+FD4/VU/M0JmfV
         eoBq+AoHV9DH8LsF7wkmE/wZgyHI3ZEQ8qxH+HmyuUVQmC/7FFBcEJFl87RYLW4hAI1v
         vNYw==
X-Forwarded-Encrypted: i=1; AJvYcCWS9oNlqJMG6pygnmF80jnB6MC7mCN8FJlWN3fro4aVAeVWkxqp6XduxNPLV+gaYIzNIprX/mBw5s65pkZ3lvqY@vger.kernel.org
X-Gm-Message-State: AOJu0YzqE8hSZAJRe+44PKCbadS8IBto1rV8vKRuepmRUMcrq5ePDUNg
	UFnoNlzLcMQOCRbptAAyM4zWPvToPbsunewBw3lbPnoCLGi5h1HTMPQcbRyRjEEDYTE=
X-Gm-Gg: ASbGncshAebp21x22XqFANLKzU/P9yz7BbFbK4/vu3iUHZqAq4WfFfXnAOaBZWQZSoj
	8nW6regA3rfgj72v4cgmgKGL2RQvtRtBuZoFCyqRBXaZdxF6B12Q6Aqxh/zmRZOBo9Jjk3NNcyC
	u9hdwjIxUhnKBlfcJegVwt0+HAv2vFacQglHrqXCBrubgXnuWGuem4aJHq7LpmqynSMvReldTcI
	CRwnIpmyXK7p0YvfaM7rQTAZU7SC6GMFTPf/HPAaldgPJ0GZMmsa6RaYaevgKzD7l+H3fladnBR
	OCJUFmVRCflbegS9jZc3xxR4RQlT26Lyrmv4Ly4XXFQzYWuQUmA0F3Tv+8wxw8Zz5464/k+ckZo
	g7ke9tcRCALShMUFWgDsrb+74pLRXhrvuRFipiI8q+1zrw+JuNABJfLbPhe1pTRGyzlqOEncgp3
	b/TSItcyipFS8XQXNQ
X-Google-Smtp-Source: AGHT+IHh2yafLn0h6WCQ3rAqHrBsqui/zuUk1dGdvyyNWo27ENOUkyCq/IzM8raGe5NR4RM82hlgnQ==
X-Received: by 2002:a05:600c:1f94:b0:471:1765:839c with SMTP id 5b1f17b1804b1-477c1117949mr172473655e9.20.1764227645302;
        Wed, 26 Nov 2025 23:14:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479110b6da9sm17043815e9.0.2025.11.26.23.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:14:04 -0800 (PST)
Date: Thu, 27 Nov 2025 10:14:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] remoteproc: imx_dsp_rproc: Fix NULL vs IS_ERR() bug in
 imx_dsp_rproc_add_carveout()
Message-ID: <aSf6OerBbPcxBUVt@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_ioremap_resource_wc() function never returns NULL, it returns
error pointers.  Update the error checking to match.

Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index be83b5f20f15..5130a35214c9 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -710,9 +710,9 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 			return -EINVAL;
 
 		cpu_addr = devm_ioremap_resource_wc(dev, &res);
-		if (!cpu_addr) {
+		if (IS_ERR(cpu_addr)) {
 			dev_err(dev, "failed to map memory %pR\n", &res);
-			return -ENOMEM;
+			return PTR_ERR(cpu_addr);
 		}
 
 		/* Register memory region */
-- 
2.51.0

