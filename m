Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AE43FE379
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806255; cv=none; b=It8jpArOBa7J2Z1R2tSIyEoa5xnMqpfaFEzOqsGoMSBXIYm4uJj11hu0uA5L8JmO6rQ7vZ5xsGZ3cGDpiQc1qQS7z1Zz764JV5VAQZak5CLgMOdzn7FqEWgatmhYDy+kChuQ7bonmReaTsZHFe27aXV1BjPBXAtoMEPXqnbx+cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806255; c=relaxed/simple;
	bh=oXGhJHtn4nuewfbu/FUrIXGrSvjdsxHUN28rYJIud/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noJ3GgiR+L3sOgk0MNSPglWBRjtVdqdkr4w3/qa3C2y5cFVcjYbTqM8Bq0E6L0j7BmzadnncCqspMVyKmevC4l1ChjAEqANJQC11hwK7OUKlw3kZpTT8metmWE+fTAOkA4HQYP2sZ/QMRZVKUNPaZsZHD5C76dHr7pMnYZ2ZKmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nb19n/PC; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nb19n/PC"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c80291e6237so7423403a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779806252; x=1780411052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1yp634tqUfo6PBP0qI63tXI5mNKD5loNgpNN/yTOqwI=;
        b=Nb19n/PCEM2uyDKXJHxOtqC3ZqPxA9PYb64DUl3FAB4BUYoHJ81vZw4moVnId1tKi4
         u7qYS+lpwQkwnaXfKAQzKQe9xu08MDD+9cggJCkbFRk6q471Noy2wn2K+K+Kxb7V+ItO
         lmF9N45Y24Hn/ypL+FTTT7RAfbnsFgVyDVB4e3cNH4XeF8DSTVRdAN6IWfhtKgW5vGMw
         uoqMXZ0esHqNbwStV9B65KkYyNSytuEraG2ym31unABeyfI12kg31PrpOJcn9bljE+Rv
         S166BfhpWpxKrDE2J4tdqcVVkdGVmeZ+DKXE+XLZhBlzevMGYPqMkqZknsMeEXzNVW5o
         +HZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806252; x=1780411052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yp634tqUfo6PBP0qI63tXI5mNKD5loNgpNN/yTOqwI=;
        b=elb0NrpUlwRZyCKlMJdmaS6uMnahG707UveWw8J6g6+Lz+YrVMk87MZRgKelwx+fY0
         pxH2JBOomWHUaVPiLf8zyG0Hyvsr+I89zEh0TbqJnystcod3x5Rlp9BHligsRMe4U2G6
         PLuRI05jwQuIVQ7UO1obpJ1Qakifqu49/M5OGh5+7wNQqE7Dy6qupxk3ntF+d5pKI3RY
         +Cr8sDh4LbV9uJ8EmNhJZqaN9D0TjxYoWcQ7eaNOON32MobE97T2MQAB8xO79Dt73wQz
         2mDwMsYe7EMnxGm2SLJYqmfoi1qDoirpOYFd7NDkBzFyAeaCtPDImukEgQa5rgbI27t4
         dqNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tpnlr5yAsgkObNKhwQE/yi0HqYX0no48Z2P9LRJpUJDoAxeJyDRpeDRth0WVz7yzImHXT0aGoNwzEsy08bCLp@vger.kernel.org
X-Gm-Message-State: AOJu0Yya4kXRmsOHMa0WfKoVgxfmY3ytzYDOMfi8hjCDcqLxk60DsPvl
	vySyD1YpakU1tm4gCGnlW7TnzsuUKKhsjnKGA0k6KSZuUJ84DcZn+nE6xC9sVtz9DAs=
X-Gm-Gg: Acq92OFok/t59vKM+wpkPttJ5bPzXMyqw3UiMHrIcWCRLg53IA7/9GZTPdCySc3Dpfn
	oGs+S8xWeVTXVQsNdDO4pX3UEGAptX3kinhc9Z5QDooctPG2E6CALgzAP+g2zhSfqg4/svwgBxW
	QTa4GrO9CmatnJt7nk5euwSy0/+F260pI8scDIyLRs5GRu2MKA6mM662XfXCzcPTuluifHZ3114
	xVlogQPIYME1wczY8FJRzG9vIyJ6m0nmy2dcE2D0H+q2c06NeYE9luxafs4+ZiVUnLMHOWNMoMB
	Q9YBiKLtJr6VObW7gX7ESxdsDg2f2NW/BIMSd4Avv3IvF9D8/hFieUO1NpFtmogcBN2iyhGtlke
	wfRTTAo63z+S1PCEp0TQcHlenkPIboi/L1hS7PhTu7OfHg1WaPDtjXZpHQHXV9zTm8X4sgN+asK
	cFayFeRFQhYPXHY9wX82/v4nXooFQsl25sWibUBQ==
X-Received: by 2002:a05:6a21:38d:b0:3b3:2703:11c with SMTP id adf61e73a8af0-3b328f4a929mr19843539637.37.1779806252410;
        Tue, 26 May 2026 07:37:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c09c:6784:4cd5:a34d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff3e00sm14900919b3a.54.2026.05.26.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:37:31 -0700 (PDT)
Date: Tue, 26 May 2026 08:37:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: daniel.baluta@nxp.com, Frank.Li@nxp.com, andersson@kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, peng.fan@nxp.com,
	s.hauer@pengutronix.de
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Use device node name as
 processor name
Message-ID: <ahWwKB0i1pjrr9RH@p14s>
References: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
 <20260508032016.27716-1-Jiafei.Pan@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508032016.27716-1-Jiafei.Pan@nxp.com>

On Fri, May 08, 2026 at 11:20:16AM +0800, Jiafei Pan wrote:
> As currently there are maybe multiple remote processors, so change from
> using fixed name to using device node name as remote processor name in
> order to make them can be distinguished by through of name in sys
> filesystem.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> ---
> Fixes sine v1:
> * Update patch subject to aligin prefix name with existing patches
> 
>  drivers/remoteproc/imx_rproc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index e8d239bef5c9..38713f6f1c50 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1356,8 +1356,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	unsigned long cpus_bits;
>  	int ret;
>  
> -	/* set some other name then imx */
> -	rproc = devm_rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
> +	rproc = devm_rproc_alloc(dev, np->name, &imx_rproc_ops,
>  				 NULL, sizeof(*priv));
>  	if (!rproc)
>  		return -ENOMEM;
> -- 
> 2.43.0
> 
