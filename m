Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB99357732
	for <linux-remoteproc@vger.kernel.org>; Thu, 20 Nov 2025 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763661070; cv=none; b=ZpH6MXOBlyftKeDB0xzmS+AeDMlVgeYoSomvxXJjebfnxFBKMU7Uk5h7KoXHwPKIa5wbU/SnaXzn95XLBoJImEhEircH8Xb/lHBcgAMYysiiwmiGI/n/kDZE/rf9XKvIqro33LgWp3ci78jJCYIrHRZ5Jc7TAQ8R1RGnXNLQQ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763661070; c=relaxed/simple;
	bh=zD7NgsDEUXwSzRf4wlPfCqiqHrm9X7LwU1FRDzbje5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPlhpoKQV5NA3Authwik+uqURHlqEdZtGC1XmitIQLHBOGCGBnSZG886pXgyxDrQujaVKsS2E0XN540Ttanmv6EVdFaosNnhUsVItX22KgiMmXNGI8YP1oN8za46shoV1TJaCvfksqEeGHs1SuDZe3NaqJMiN+vYiMDCNnInTR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hfFmInOp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfFmInOp"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso793664b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Nov 2025 09:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763661061; x=1764265861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SvyQOcIQQ86C542mLC2IQK954GH3/Pv3kj39BklXd04=;
        b=hfFmInOpbCBMKVDGugkn6iMnE13/FpUqFH9aDkOZMKL18kT82X0s+R2RdXJi3ha6Xk
         buHuyyG7xm0Uv0rXYJQmrbjxN0eF5Fu22t2VCjbf0awNObS3zK4ydtOxQUH7HIbTsxLk
         8b2FPZgJKa5FBKXFjQ38XWqorj3wo6c5vTHak8+7bnrXeNRFwPQtDuapIU9s9iaxUc7+
         UdpagSCjLlUqHFGxIMdRYZJoWBPX2hkj2So3miDSj48n8XuFkXiI8WH0JIc/owRGHcjf
         GfWna8x0+Mjq1G9B2K9CgjXNjZwhYp2IlLG9AZGmZvRi6LOnKAqRrfbbJ/tqgv5d2Y39
         U+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763661061; x=1764265861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvyQOcIQQ86C542mLC2IQK954GH3/Pv3kj39BklXd04=;
        b=KVyJ/MBNL/xGOswRm02OWO4wFmcH3bHf0EHjqvra+qfr5ue51P3tq1otG4Qo9kvZEy
         PXjxYMo8jkfxRQ6ZePqRdWvmNxfpeRMjmLcL0L2ZDC64BQQLTijf1shuH1JTovqw1SBH
         DYK1Of+TeW5bMyv1RYIGhiholinMa5AV55B/hY3gos6CakG7iE6SZ5nTexxydalQPgrI
         cSc9P1rSesRCZMrvOuiFHecgCDAcaT4Rv8YjKjwNhX3tYnKhp7Wc44DZ6ijEX76J+CCy
         h57tj3M3WEROIGQUWqIW/dDP0jFKs0OfBL5OZq81ma4FNB+CCQxxLK3hV6UzVrmOW5n0
         netQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo4eQbdSLuGQjjMVaobg/aMTuRQCb4TEalfnefYGJUj9DNT9nmbYEamIr/4DnWXf37tA8DAzYqS3Z7gflkSW3H@vger.kernel.org
X-Gm-Message-State: AOJu0YxbZmys2qMz24oxYedtNMudbRVVkjOQmkiVecuGf2/39dZNeiwf
	UPJgoUiAdkpxZTgs9LeCLEfMUuiEXwtdVxuOI46FLJbk7s3dTXqn/7brEKcgiiZ/eo5YF7MQcf3
	3RGgxok0=
X-Gm-Gg: ASbGncsv5WKZiaQDC9by6eYg1pXar9NWLLd2YLuD3aoYgFKMB4cL+v6xICrXMCOZvez
	KTbml94eR8M3Tr5LXOK+35nbkLEbYmUrb0385Cxwn+c/EsgggJW9pTKKYG89IA55EzdB0P7qLoX
	6mmSEcXF6ivKYTz3SBhR6pQSmlD1Mi1fKUgpItab2nvUsMU3xn9XnCmNvaO3UJozUq4GJfmvkUI
	T/vpPQRkq3s9gYUnUS011oZ+6mx6CVzPkLC5wJg5eDXj3I7HsQrj7dqGjkRq/68mggMk3hkctGm
	m/qQqNMyxtj4sM5BTyxJPdZgxaJdjNtRJTcmUtEtMdbIjGI3bEeCnXJqDxVqWGnfR+kvwbo+M30
	VtnbV6vMtxYJjlEezmPD+LQbholxtv1M8UIR3n39v0yrsuPsqlLXCeE0gIDop6wTdN3ffsg261P
	GRWiN55LL7DWPGcw==
X-Google-Smtp-Source: AGHT+IG5nfGUp6w8q9EcQONf815YWnnfwp5npwGR40rOPHk9oLxe0qBxjPkC/6purKVN5bANUXYjjw==
X-Received: by 2002:a17:90b:5144:b0:343:e692:f8d7 with SMTP id 98e67ed59e1d1-34729867d6dmr3904935a91.11.1763661061313;
        Thu, 20 Nov 2025 09:51:01 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:17b0:cde9:c3a1:870b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34726696bb2sm3242515a91.3.2025.11.20.09.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 09:51:00 -0800 (PST)
Date: Thu, 20 Nov 2025 10:50:58 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: xlnx: enable boot recovery
Message-ID: <aR9VAtgfFEe56z3W@p14s>
References: <20251113154403.2454319-1-tanmay.shah@amd.com>
 <20251113154403.2454319-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113154403.2454319-2-tanmay.shah@amd.com>

Good morning,

On Thu, Nov 13, 2025 at 07:44:02AM -0800, Tanmay Shah wrote:
> This is the default method to recover the remote processor from crash.
> During this recovery the Linux will stop the remote, load the same
> firmware again and start the remote processor. As of now, coredump
> callback does not contain any useful implementation, but this can be
> changed as required.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 0b7b173d0d26..8677b732ad14 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -891,6 +891,11 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static void zynqmp_r5_coredump(struct rproc *rproc)
> +{
> +	(void)rproc;
> +}
> +

Function rproc_coredump(), which is set by default in rproc_alloc_ops(), won't
work?  If not please indicate why this is the case, otherwise this patch can be
dropped.

>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.prepare	= zynqmp_r5_rproc_prepare,
>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> @@ -905,6 +910,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>  	.attach		= zynqmp_r5_attach,
>  	.detach		= zynqmp_r5_detach,
> +	.coredump	= zynqmp_r5_coredump,
>  };
>  
>  /**
> @@ -938,7 +944,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  
>  	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>  
> -	r5_rproc->recovery_disabled = true;
> +	r5_rproc->recovery_disabled = false;
>  	r5_rproc->has_iommu = false;
>  	r5_rproc->auto_boot = false;
>  	r5_core = r5_rproc->priv;
> -- 
> 2.34.1
> 
