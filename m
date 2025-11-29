Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96B630FF21
	for <linux-remoteproc@vger.kernel.org>; Sat, 29 Nov 2025 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427878; cv=none; b=SwzEri4zHcZAVgAiiZ7pDay1qn37wg8oa4++BSmG2S7L23QMEXrn+QC7Bav8oVSOA79T4jMTud2w+AdqDLnWjyRGBu0OTLqMUGuYsYFKYRSGedyuwV/nqRx3EMfBJtCzmCZN6c9xCtZ8RjjqeXs3Cx+IXufg0f2wLZJF/HHss+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427878; c=relaxed/simple;
	bh=k0aIXU/reI+53H81Ixsu15XtjHUspATirIgbwnqrpAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuLgeysy8+ZFKpMFOiZCuLwJdLd6XvsMvHpoJM6OvHlGg19gid9N+aP9B77a4DKtJIaoTNZso6k0OkwNoJmJTJMIbUcucpBig2CyQVRpN802lRUs2SZA9GrQ/IhygLa28TOdGXlmVMXnmP2tbCTSzfMJaT8h0zoyPE1PjuEzUJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e6QWul9e; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e6QWul9e"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429c4c65485so2512557f8f.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 29 Nov 2025 06:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764427874; x=1765032674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OKiAwlo9LZ0Y6EQWk7tLBh+YOq0wAbCqmwXrVpwlBTk=;
        b=e6QWul9eVkXu3AldsfdZpnEwyPb4cCSw2rh1580xlqie+o9vGgPGCc0I5vv7GD/9fQ
         8l9D+fkMPTSZyBWQbrkpOOgHNIDevAhPplyFMUdwlZDrV7X3uzLEWGeUwK6uIykF3c+D
         VETW/vlda54+UFPfP1otbmf0VPW5bRimmi1zPMHJK20YwE+HlLRVmj8ocU++4LyIgdq3
         ieEYIcto4zyTjqYdMMpNZ/+pguK5M0ByvAbSW1ZkVF007/U4mv0xvXjaGd37I9pGNktf
         LJDkYywSW89izgkZtrHr4PVrsR3QTptLRviMTJvYGlx1uV+zfgWqSL5SomRuTpgIYggA
         ScvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764427874; x=1765032674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKiAwlo9LZ0Y6EQWk7tLBh+YOq0wAbCqmwXrVpwlBTk=;
        b=egMCVfuXJym58uolNDre0zO4RuPly+4nOGpmjLkTbB0ilyBprz+GukrhgO/bR6TVTS
         gRSkUv84EI4iksD+c1wp8um7QIGN/p513Fozhg4MJI0xXcQQ6m7e0ZjSxcimkQsSfbfo
         +Va2W87WQubgdvdV0HEx0xBkYnp/LuQvOIqw6oYHmXATaGaihDnigeHMqGNIUrFsJ+A/
         wc9nskWOLEKUw6X13oELnWL7J/mt28RFBAtq6j+gdILWJnBwgaoYBt/MMPMEQaMFXyuy
         wuBh8tH9uNzDYqbeqfyHJztGlSVGe4IP7Pd5ISixNzlF7wdK8tfyiFJEzdWBiH3h++wp
         x6xA==
X-Forwarded-Encrypted: i=1; AJvYcCXlIR3QoSmSW1QOAq+ZGYEkZPUisuRC5y4AaJ3QC9J2vZaFsh156iiA/xfwhT4PoSnr/rMCMVS9kiMij6VAHlOy@vger.kernel.org
X-Gm-Message-State: AOJu0YxMWPdhZ0mexHR8BGhhaT+GkU+RmGTmVE5OCsjZdcE2ho7LwNh9
	eb2A0prf/S3K+JCWT8YT8ldB9UUQ89xr4zPX8mnvIFJZNTgmpjL4P/PPus+b5sI+CQY=
X-Gm-Gg: ASbGncv0VdmBus5XvjXE/vjm7JPSoXn1sgaKNtY9qCC6cwYeJtTt1o491fJf7Hh6MIp
	cz78Vv3FFZ6qLY6yA+iwmEqpnxVQOiiP921kAAFqYC/hIkuPGk1gzJ8PVBaqQz0i7S3wiVa671O
	Oluy4Hw+4nu5HPMB0Ak7cnl9/xKZMcnk43lwasKfGJbkFlj9Y4u2twBtM0fiX3dF+GyYWbbuPqj
	NEIz2wv/9Xvp5rBYwjyYYNi5RFSJsnR04xYPLVXIz2A4u2sY77Z2yA5OlsRKXNewzGRiyJMUlgR
	Sfm7lHhZ+F7mzepsa2TrEvkCHQlFv8F4mAkXqLoW6tIwhETfovKkEoCyN+Juzbm1jdfdVzbQnIs
	AaOhaAeHQEcjZ9zcfKNWu2vr1SN5K+//mkgHKtG1+b0Ecu+/DzM0EcUrZJaCE+rLdXvGYTvlw8h
	bwrKZtGFy/Ncxq1YNchDKz2yZmo5Q=
X-Google-Smtp-Source: AGHT+IGI6zgN1d5AOjsGAZRHPGRNf4EQ0mzqlTC7dJh5tDbKD0iL7abVcYqrVgB4mGVfZwt9HhaLKw==
X-Received: by 2002:a05:6000:2387:b0:429:dc9a:ed35 with SMTP id ffacd0b85a97d-42cc1d3479cmr34440564f8f.43.1764427873971;
        Sat, 29 Nov 2025 06:51:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1ca1a303sm16609079f8f.27.2025.11.29.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:51:13 -0800 (PST)
Date: Sat, 29 Nov 2025 17:51:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] remoteproc: qcom_wcnss: Fix NULL vs IS_ERR() bug in
 wcnss_alloc_memory_region()
Message-ID: <09a43da41ee277a80a3265348831e747f7b62620.1764427595.git.dan.carpenter@linaro.org>
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
 drivers/remoteproc/qcom_wcnss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 14005fb049a2..ee18bf2e8054 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -538,9 +538,9 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 	wcnss->mem_phys = wcnss->mem_reloc = res.start;
 	wcnss->mem_size = resource_size(&res);
 	wcnss->mem_region = devm_ioremap_resource_wc(wcnss->dev, &res);
-	if (!wcnss->mem_region) {
+	if (IS_ERR(wcnss->mem_region)) {
 		dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
-		return -EBUSY;
+		return PTR_ERR(wcnss->mem_region);
 	}
 
 	return 0;
-- 
2.51.0

