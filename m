Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FB5A927
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Jun 2025 14:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749220951; cv=none; b=numAa9NYFEw6x1GCvSWJnZq+LvrI6iMhsyMUtnurA8joicAVkmDwaYo4Y7Khb7kQrsMFIyJan1uY9tuWPrwykn5QsIpmjfn/KlwTxjOb/YSK/9jg9NxRhrMEME8qN93RLW6IcY+JBFIbMeUGTwJDocNyPL+Ggw++BcqjJy4ofOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749220951; c=relaxed/simple;
	bh=nk40chikAN/ojPvJ/RzfiBEA/gcvCUInAtLpweThwKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVl1Aay9L+wUYEdX4ApZZFWHe+zaIsAU4gDUzMUmYmtG/MJw9L+qgSQn5kZBWEZoxpc1ZKAFCYfZvyzz8FP2gGISEtNc5rih8heDqSjsprhIatLjW8MW/KM5d5F1MtM+cLi3WO1yyZL9muJx6ESfNMad0BCAL6kIxk8DB+UmNgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OaEZSAvQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OaEZSAvQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235ef62066eso29063575ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Jun 2025 07:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749220949; x=1749825749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cwtfSPHR71rbzyexp7qHtb7zRWs2e48K79HwvgXy010=;
        b=OaEZSAvQiTZs1IGqZbVGKMzZHiTsM21PfpxKf1Hl/XJNMEM+W5iYRmSl8HXFBO9xUJ
         n0ivBfPzyCant4xuEEsUpMxdfToig9f+oNRqppaCIbZpRYWE/3uB8cO5l1AQA32XDU9W
         bcPdguIUssJ1uUXbYv8BFNlWKhgacmixFYlZqz4gsWU8/7+JwST892Pze67H9mbuMiYz
         kZJL7Amjes5oNUptzZHWUFOSenoxhyWYjBZonGVpT6CgMxbLcHqdKoO3AaWk1ijkkHHo
         nnIymr8QoTpi0eMyHu2h5tzQCmk4B3b3kKDY3aD1VKI4oXQcGLVYf40jXulWUHfqZhO8
         c22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749220949; x=1749825749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwtfSPHR71rbzyexp7qHtb7zRWs2e48K79HwvgXy010=;
        b=VEedqVL0UVaO8TfwCp7od/Bu9HASChU/kslHtsxezlGPk6ZWuF+gFRk731KjazPRfD
         hHHsvksCQWylB91nlEwFcvDcQZ4PoZU40rpvGLzoEluUyGyMbZhqdSdnoriVPMge+/Tu
         BXQFeh5bSdATg85QZ8I3MrM1Qzb5GjFdkM/OMUH52fnfaknLjJRaeMa48oNAVMoO7zHz
         w1YlIhKW1oOY2a8R0R7GiaD3/5OrY6ut12CjZm0cy/W/EeweqgDWN+e0/tJFoYPj54Bk
         dVBQVTOM87zn+QjR0nrKa4Ma7ICTLBLGlWfNQ3Cux3agvuqzSstTEI+OixK+2jNC9fc2
         loHA==
X-Forwarded-Encrypted: i=1; AJvYcCVP56xFINhhlYAdxzPlxXGuzTlhf07Mj8p+HeMzAe+y2qlh9MD/v8XdvILxkB5niSDYFi+112R99hXZbtbA51Xj@vger.kernel.org
X-Gm-Message-State: AOJu0YxRWz3zBZBocMMX4mEwScEY1lMEjUY+SZRJwfIGHiLK9T1y855v
	GstqvTrO+3fjl6/bPnTslNQLkZ/rhvRQjmgrLY7GrNddneyB4Yk7aLp7nU4MqQU4nUM4x826hG+
	djCN75bs=
X-Gm-Gg: ASbGncuwepKCf8baaMaH17rxA/je9q2MB6fsqepwPIArfSp6txRx2ul10jpkRpAbwuG
	66lnh2NQALBctYzYuOCSegFRGM44vg2bK8QmpeE2NQIVdUhwUm6Bg9RzH7KH8oXU9T/iieHYVxA
	GIKYo0ZmCsWChTrMKVdBLm1vlIXubbN4mNeILPIebfNko9c61ewPB5zoJQZMgZdu9jlDKWU1D5k
	CmFK7/e3cQdkNNsgCNXVny69Zq1gGk0nwVIM+z7jkd/33QJXMJgT1yKrOgNHrxvTSadv2YwKsJJ
	WGIjBu1YxoHy3sp7etym2VlwLOZiepQUed12quhT9mRNS8ymhGifT+U=
X-Google-Smtp-Source: AGHT+IH2YJDho2j565tawfHDLDgugTdyoZ/rEYx8B3sBUoR9un+xI+MYf5Z/JfmwYoMzpzJHQP6GXg==
X-Received: by 2002:a17:902:d58f:b0:234:a139:1218 with SMTP id d9443c01a7336-23601d172f6mr62713055ad.25.1749220949318;
        Fri, 06 Jun 2025 07:42:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:15a8:14c7:80f5:8d89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fc7cdsm13155125ad.108.2025.06.06.07.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:42:28 -0700 (PDT)
Date: Fri, 6 Jun 2025 08:42:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Li Jun <lijun01@kylinos.cn>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Cancel init error to zero
Message-ID: <aEL-Ug8w9KuG8rc4@p14s>
References: <20250604094802.127472-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604094802.127472-1-lijun01@kylinos.cn>

Good day,

On Wed, Jun 04, 2025 at 05:48:02PM +0800, Li Jun wrote:
> The init action consume additional CPU cycles. the

I'm fine with code cleanup but call it what it is rather than trying to justify
it with dubious claims.  Please remove the above sentence.

> reset_control_assert(wkupm3->rsts) should assign a value
> to 'error' before it is return.so the var don't need init

Proper punctuation after a period.

Thanks,
Mathieu

> to 0.
> 
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  drivers/remoteproc/wkup_m3_rproc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
> index d8be21e71721..24d72fcc26f9 100644
> --- a/drivers/remoteproc/wkup_m3_rproc.c
> +++ b/drivers/remoteproc/wkup_m3_rproc.c
> @@ -77,9 +77,7 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
>  	struct platform_device *pdev = wkupm3->pdev;
>  	struct device *dev = &pdev->dev;
>  	struct wkup_m3_platform_data *pdata = dev_get_platdata(dev);
> -	int error = 0;
> -
> -	error = reset_control_assert(wkupm3->rsts);
> +	int error = reset_control_assert(wkupm3->rsts);
>  
>  	if (!wkupm3->rsts && pdata->assert_reset(pdev, pdata->reset_name)) {
>  		dev_err(dev, "Unable to assert reset of wkup_m3!\n");
> -- 
> 2.25.1
> 
>  
