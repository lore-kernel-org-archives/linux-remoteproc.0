Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B4E3101C0
	for <linux-remoteproc@vger.kernel.org>; Sat, 29 Nov 2025 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427873; cv=none; b=tWnniiCQDgapOO8ndVjayIlxNe5ejDlUQuKuFZXq62lD32J9M3ENEAu68azcdRlQV7XoPzL56BjNCxuto3YY1PsJxw/vz7SkITspPUYmcCjr3O5vjOYyza1bsKqcPcw172fBoZgg0kNB1X9ulLMev15ymlf3ZxWt9EeJEpz/fms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427873; c=relaxed/simple;
	bh=liK4LfPiU0pY5XDiNJ+cSHVdLUrTAgHETaseY8tBJKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/Oq83qhm+tvNtHgnmM8y9v2j07qlkJ/Vj857llFoY3xijX8/zrM838eZ5jDHyp0rzxcOgpXM/7l/2Jyq34rc6Ch0rYm84qY92nV6n5/DKnOcHMrTuc2KFC47OpXQoXtUeK66SiJ/Y7nDdjbngHFewAA9l2LmwYhWI47TS53YjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OTp0JeTY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OTp0JeTY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b31c610fcso2354776f8f.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 29 Nov 2025 06:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764427869; x=1765032669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zkWGeeB7i8StC9hMxWOTKSpu55uDyb2ej0mWJX0OlQI=;
        b=OTp0JeTYcnM7wS0ZfC8saS190+0Jynbzk/rWFOrtBoOOPzuz+1fWIxOYfNiJ0j5Eaa
         Uq803kVZMCFUQ3w9P7SP1ApyyU2KvyYJz80Tc+cz24w9bHkOBTz4OPcqSrK6JLIV60CX
         ljOLeKI7CTotbb/ZqjowVUvhsm+uRPTUO9aRJTmDzEumR4UgxzRiHmCxZTjb+wGJ+Evc
         BXxDdCcfYgn5Y5+BNF5HM6dP5cLq7HJOwq9bbf6gDstWuetBMYUJmCd4hs5SWijY31Hl
         39R67hIoGMPlOORmo9SCEaBCCjEnNvnNLYMIxxOYBcjFRlkDakuwWVyNMUlAoCt7IgKT
         9vyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764427869; x=1765032669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkWGeeB7i8StC9hMxWOTKSpu55uDyb2ej0mWJX0OlQI=;
        b=Ij8INM3hf7UHKoyI6lDDn6VdZC9ZuEEvIq2auAVQueoYLhel855dRUasr7XLcl0Ot/
         jwiMRTUH8WkIMWCOjojeotv+0xiAnENnLe1lbsdHbJ/p4jKS+R+TxJJaFL8ksBYUOYsM
         pmcDf3jQspK8Mx0QHD/umB3P2AYu3tRkgwYAqd4EwmUgFdUlpZ3eXTtVl7BOs0knX0qG
         oHLJfLJ2tUMtTFnC58p8LynbdkdpSMVI4x2Paoy+KbxgGSrMmdQHfRa0xH97q1EDJOGt
         8lPhMmbxAFSxNOogVGNyOBaM7mHPuTzSCYCJjiwrITf30o+ghytpNXFPVfXyTHA0B43D
         zHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsUyJ1H3gMEigkTXxpHjTFhkFKRUKQFTcG6FbvzD3WWLauarWwmlqGbCuTzXgZ/oXnc/PyjqDHIQZuhOr0KwWl@vger.kernel.org
X-Gm-Message-State: AOJu0YzXtfNezeaHfxco5MjXd38M8zqvyloSCarVreoUSX8pZRQMLtk0
	XboM8GJuRzvx5FPMu6bJ/0nP0qackWZ8H8QTacvdCzVGsjGiyB6oSdkj0t9ECQO75iA=
X-Gm-Gg: ASbGnctbmAZVFWdaA7/2cN9Rf9FAGTQqQDIojgZ70ilH1pMdUsko2G7mgfHJ5b/MJ9x
	34zYNh2E43D+9B4P0cBoz8lYOjA+YI9EIUTdQeF4GW72xCnZ5y5+whUbQj0l9fFf7GkiOBYeLjJ
	GSF/Px32MqplP5W373JCMyQmcgTil1VMoiIGDazFtc72NrptotYmaCxwNr7JxNIgV5eEO0E3fIa
	DHnrwbgA/O6V7O7R9qgPNSZSjvIuDLKKRlfqRQkHt2V/NqGCVRUm4IPVASU7zogVgnBSxd9gmv5
	4WDbAEKIIqbygAPX6+eU4/DsNgVNjXAx2c+vwyaS2ifo/zJlpJupIhDQX8VxpjjHVMFyESL5ill
	iXQxxFGsBxsgmnf+Zs5cPEUSuYN3x4LfHeJ6UoqZgmjxnG2hKGGoO4qwnUyC225HZcheh7aSa1G
	Js03m/hK9O2bJnbWix
X-Google-Smtp-Source: AGHT+IHtQkQGQCuMCo6bY3Ja5uUySeD4yPVpGdxPG7jpQTsa5cwSzFut7/w/KfuwVM8RFg93hJTJ6A==
X-Received: by 2002:a05:6000:3106:b0:429:cda2:9ffe with SMTP id ffacd0b85a97d-42e0f1fb97amr21174292f8f.7.1764427869395;
        Sat, 29 Nov 2025 06:51:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1ca1a38bsm16309890f8f.24.2025.11.29.06.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:51:08 -0800 (PST)
Date: Sat, 29 Nov 2025 17:51:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] remoteproc: qcom: q6v5: Fix NULL vs IS_ERR() bug in
 q6v5_alloc_memory_region()
Message-ID: <674b32a78563282adeaf3cdf941314a0b8181026.1764427595.git.dan.carpenter@linaro.org>
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
 drivers/remoteproc/qcom_q6v5_wcss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index ca748e3bcc7f..d96af0e0f665 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -887,9 +887,9 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 	wcss->mem_reloc = res.start;
 	wcss->mem_size = resource_size(&res);
 	wcss->mem_region = devm_ioremap_resource_wc(dev, &res);
-	if (!wcss->mem_region) {
+	if (IS_ERR(wcss->mem_region)) {
 		dev_err(dev, "unable to map memory region: %pR\n", &res);
-		return -EBUSY;
+		return PTR_ERR(wcss->mem_region);
 	}
 
 	return 0;
-- 
2.51.0

