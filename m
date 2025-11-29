Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E6430F955
	for <linux-remoteproc@vger.kernel.org>; Sat, 29 Nov 2025 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427861; cv=none; b=K/VHnXX2B/hpqW7W1Al8NWbutvC7yFdVFvYLbCvVdZulVUGCFanS3eYwikM7xIpTU3G4uV9ymR7AcAW1Cp5Ad5sUbnUNP32y7v2ZU88HXrWtflCUyWbICMGb0tnlSvDa+jlzR3AJzQoM4cZYki9EvMQveH6+QTFmEf3j6NdqdoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427861; c=relaxed/simple;
	bh=kJAVYd2/PPlXFLOf6bOfuTDn5AtW65rQSCFJWrlTfDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G33Ea6weDKe2l2WEjC1K+VguoNQrA9Cn13Xr33hNe7No4LwFC/mTAYXsN99YNQR/BNOVYuk9Tfi4b9RLl/pv4jdVpQtpPajfr+fx4sSwVNNfs2QLMXVv/uY6mmCmwQ89nxoI0MQC7DRCv+CrzxDdjJNSm6Ifddei6x2AtGIP068=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/Qx3XDM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/Qx3XDM"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42e2cf93f7dso83913f8f.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 29 Nov 2025 06:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764427857; x=1765032657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5roHuQegQf4KvGy0xBz6y0ubzRCDlqFmvzi3L2AWogw=;
        b=W/Qx3XDMWS1ds9QdnTvdp2EazQKt2QvWbGq+Oz5cZIPAnny/0obCp/TMzLTcx7G/Dl
         1/DyEOg8aKg1/+cwX7yUJg90U7s0QCM3ggawgrJyeRqT8snKDOHGJadgjo/RcC8L6Mj0
         4RuJyXgRVSei3CyAYLngQzTfQHJeBCZinYKHoSU9M5WF2XO+/Sco7oZ+aWRxh/d392Ug
         MUmmJnfY+A+vVz/CflTebjGmsYZZgB29EOgtChAB2fNYQqjVfWAvOSPfts78IFu6cBIE
         tcDtgrxVxBjc8D1ELRBZBg1eY5TbTKA7JbxXPAmgdo/BJ4DZ1y/LisyCd5KVMZWm06o8
         mmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764427857; x=1765032657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5roHuQegQf4KvGy0xBz6y0ubzRCDlqFmvzi3L2AWogw=;
        b=khmkQ7g/gTwHvR88nGpx5yaxdOXgV8iUq4q/RtdhjZ026Dq8+AMM955amfZZNtAZu4
         83cHJMAmZmDRaJnY72u6Vu6BQ6vZ7QOWGPYqJBiim838ayCaC1tWZm2as6Rl93z/XlMe
         XzTG5mUt3BclVMeUXOYJETxjAOfyCZg93wYxoj5nQAoPrefffbpTvMpvgVyljkRbwixn
         pdGi4CuQE4k/JBYk/WnoWY+usNg7sV0dyWMYqYUrEMvyo15WyYLzyOqf01wQG4nwLLvc
         y7x6RLp1vTQBd/xBjhmwvWHAzIk3tIJpIykmFRshhPyT62/kPsB5Ll6oC7jm1Kb2jCcS
         tO9g==
X-Forwarded-Encrypted: i=1; AJvYcCUlG3IMT97K9qks4FFQzfXI7vBmZVCtHR0PjasZwlWT8/jTnSYoUIfh5+D5qzsDn46CcoF7HwiBaifcvDNF67Xp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd7yffnm8VtRpeKUdTecAcDKEnyuhkroEk5WsE79EfRzwUE3oP
	dxiQFEDqvkwXCh5M9aiiz2CMQgvSMt2KkouVp/fEw3jw0vfHyfVBZAbZkIXfp5rt9PM=
X-Gm-Gg: ASbGncvbi1Cabc7pVDxw1ORjtkvYgpIpK2DM97FD2BiQHRfVogRX7Mz3i6KlZDO7RfL
	vrHBGRg8tMuZps5YlYDPcskUeZxuIjsWCaN6ODzAuki9cgn1gDzhwdEc/uXGxIpW2oP6IaCBLbW
	3kjiGaPjfUZmHuirkeycBMELRxPs1+CwkqFdItkU5m1toq1dnN1+1IwV586LGDsd5xHyStI8oe1
	cENuiVyFMuVeUPbwYT4KgbWIDj5tf+AHFZtWGQEhzO0tVthQ2w1ggYGxyi+8ROoWkALsNQDhIed
	wvx+Xb0SEN5zUTsZYqQQn4UHU2b7v1CP+vf+S9KGAH3l+pAEL2tN3mpoWs0FJ7pNSVH7Zi1k9WB
	zANaUVSx60soT1qBB7jChsfE4aCzCcYPK4kbrIcBZv1P2UWRlpGjWJYGuZhm/mPpc5X1zCFiNTW
	KR48+m5BcONCnpZwAwd07XBuguWtw=
X-Google-Smtp-Source: AGHT+IF17rmdp5RFNg6kmMqYr9tYvGHfwa2QHnZkDzl2I/vBSSLY/k6vA/+nMv85qGYklo9B258YMw==
X-Received: by 2002:a05:6000:61e:b0:429:d6dc:ae30 with SMTP id ffacd0b85a97d-42cc1d19914mr34066767f8f.46.1764427856782;
        Sat, 29 Nov 2025 06:50:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5c3016sm15993129f8f.1.2025.11.29.06.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:50:56 -0800 (PST)
Date: Sat, 29 Nov 2025 17:50:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] remoteproc: qcom_q6v5_adsp: Fix a NULL vs IS_ERR() check
 in adsp_alloc_memory_region()
Message-ID: <6d6b1b0fb6a61b5155a640507217fd7e658858cf.1764427595.git.dan.carpenter@linaro.org>
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
error pointers.  Update the check to match.

Fixes: c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index d3933a66ed3d..b5c8d6d38c9c 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -637,9 +637,10 @@ static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
 	adsp->mem_phys = adsp->mem_reloc = res.start;
 	adsp->mem_size = resource_size(&res);
 	adsp->mem_region = devm_ioremap_resource_wc(adsp->dev, &res);
-	if (!adsp->mem_region) {
+	if (IS_ERR(adsp->mem_region)) {
 		dev_err(adsp->dev, "unable to map memory region: %pR\n", &res);
-		return -EBUSY;
+		return PTR_ERR(adsp->mem_region);
+
 	}
 
 	return 0;
-- 
2.51.0

