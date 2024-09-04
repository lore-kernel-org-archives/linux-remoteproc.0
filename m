Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915861DEFC7
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Sep 2024 15:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725464653; cv=none; b=f2Rgz+P8o3cBCnu2pWzZZVPzZbe0LlIap9Nk6IcGifRuz1Q0J2MYIWlWw0H+8s3/8wByX4MiRgqYWr2sp8mMAt8cG7Cx0JxepPTH8B9jmsjLIVVWJorUQ4Z+RmehoDo9uM/V9T0KPxTjdRlh0dvXWeYOfnYwr3V9tKSx/71i2Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725464653; c=relaxed/simple;
	bh=zkWE9eHQtAP59JThyXzFthwkywAghmi5eg1TtaGzNAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAEavAVqSy3ZTrWIKakaKVXwZ4WNE/KKuhaxmA+CV+Prw02axmPU6VoXE6xl9dOmtpwZRY67a1PdjFjfZr11NyPuy8QfRmDTTAS4I3OXbf/BvfZtX+4XhL7Oede84ZJ9F+RR2UEWIHnAHo/20GaP9Z7TT661sQ3Ml2Jxy1lggE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qMn3OmPk; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qMn3OmPk"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7c3d8f260easo3800754a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Sep 2024 08:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725464651; x=1726069451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lvq181bt53++X2ipAJuBWwtoz5tjcNktNxin7O2M81s=;
        b=qMn3OmPkvu1FF6CuPoBq7k/O2X7FK44VgljeHSoaCD3mZ/z3I0/uLKs8r5/arh8yHj
         vwHnUPiREUOYsYA1Oc1vtKj3owusGVBPzUrXWfNHoZICGKA2FSRdG9J2WejRA0EHEBdC
         lml/M5TO/1E6ccjGpi8z+YLUPpRnJpWd/SwXsFcx+UnMdK6H/hrnaR42sT7qEhwyW/H4
         2q0SMUiRVBKlmOBZ2JZVntbVPWGRb2RXbzLaPFpsS5OEoKzbVIR0Zfkr8yWvbGfb72SA
         msXrgf24k64JeZkNH64+ATm3XL6NkCThTPpkxkxUNErnP17/rCHLbg8HWDDBK5DCL4N5
         uPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725464651; x=1726069451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lvq181bt53++X2ipAJuBWwtoz5tjcNktNxin7O2M81s=;
        b=ia1QTt0IN0dcwbnj2vajnD1Pbp6uLmhFPAJL46FreLuOzcsMpDv5d+jxmpu5iBqAQE
         6REJdNqzFgKliNZudZyDYZUQM+A+TmaQaU1MxBFRPHLmGqFJ+NwTJpizY4pWxJIx3Sxf
         MKXsGuvLcpG2oRcT0ngKDRMJU36ez/d+1NUzU2yWneRFyHGwu3CZgJD+vbODNmXgUs85
         1wnlNZN0ThtdfJYHYSuk3MduvXEhjjsrWejX6+IuK9p1DgFrefrW7j5GM8OtVH/BGrjC
         g0CGxLrBievMStmua8nVv/ajevk1jb8Cx17KTgdelQEwIBqyt/k7mCDlESdXKNkw2G9+
         QT/w==
X-Forwarded-Encrypted: i=1; AJvYcCWPfVsarAz+1pWCm1R7PAksHxhYZIGm0V/2RXY0ZAk+Bc4eGy1bBMQUaDoTnuCdSF3Si14McDVk2nqwb8qwwqDm@vger.kernel.org
X-Gm-Message-State: AOJu0YxOl/ycERPAdm8R2ZlZAI1EJIj/jmrz4d1ZKXwkszOg4sis7QUd
	edS7kKjjOui4h04W+0KbK136k1nJHFNlrsttfGym2X5OH3pDaaCUDo9cZRF7u08=
X-Google-Smtp-Source: AGHT+IEzkhU1NY+b/rFo3CUIWLkNeW1QOlR8kkj/gEDVFHDtok9gvgAxeDuYVkH4KCg7NBQoom+p7w==
X-Received: by 2002:a05:6a20:9f89:b0:1c6:fb2a:4696 with SMTP id adf61e73a8af0-1cce100b917mr22074760637.19.1725464650872;
        Wed, 04 Sep 2024 08:44:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8490:5dd6:5f49:1365])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778530830sm1761671b3a.49.2024.09.04.08.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 08:44:10 -0700 (PDT)
Date: Wed, 4 Sep 2024 09:44:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Liu Jing <liujing@cmss.chinamobile.com>
Cc: patrice.chotard@foss.st.com, andersson@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc:remove redundant dev_err message
Message-ID: <ZtiAR7Tp2jVOWb2g@p14s>
References: <20240904020949.11193-1-liujing@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904020949.11193-1-liujing@cmss.chinamobile.com>

Hi,

There are several other instances such as these in the remoteproc subsystem.
Please send another revision that is addressing them all.

Thanks,
Mathieu

On Wed, Sep 04, 2024 at 10:09:49AM +0800, Liu Jing wrote:
> devm_ioremap_resource already contains error message, so remove
> the redundant dev_err message
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index d17719384c16..a6e50f51c794 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -251,7 +251,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  
>  		slim_rproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(slim_rproc->mem[i].cpu_addr)) {
> -			dev_err(&pdev->dev, "devm_ioremap_resource failed\n");
>  			err = PTR_ERR(slim_rproc->mem[i].cpu_addr);
>  			goto err;
>  		}
> @@ -262,7 +261,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "slimcore");
>  	slim_rproc->slimcore = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(slim_rproc->slimcore)) {
> -		dev_err(&pdev->dev, "failed to ioremap slimcore IO\n");
>  		err = PTR_ERR(slim_rproc->slimcore);
>  		goto err;
>  	}
> @@ -270,7 +268,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "peripherals");
>  	slim_rproc->peri = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(slim_rproc->peri)) {
> -		dev_err(&pdev->dev, "failed to ioremap peripherals IO\n");
>  		err = PTR_ERR(slim_rproc->peri);
>  		goto err;
>  	}
> -- 
> 2.33.0
> 
> 
> 
