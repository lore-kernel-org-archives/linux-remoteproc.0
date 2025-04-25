Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1744D1DDA32
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745599662; cv=none; b=rUPo4602GXFA71CJJq+ISBisMgPm7sUlNGr6+vVpppLQIhn9kaG13w13D99WfTNwtyEWBEYhTsh4pPuHFqK19lRRwyMAmUBuzvNskmkBWbrIIXYanvGGSpl/fyqcFVnFBgHNH/grV0xibyMCFr5MkyyOuYZHsIy6TkbCU5uQkLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745599662; c=relaxed/simple;
	bh=aV+e3F8mAzBUf2Bp1xvLIc7M86ZpGwplUq8NhxsAMs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcTHtg9HLt8PYHS8daLP1HOXHjnT+uT8jZIIFby4lwLB284KpBs2fmrtChha5tRm0vSmJ7/LFqjlk0JKbzY8G+TduZA0n7wAfXW8/FjtGcbgMSvd4I2hvY+trAVHLWc5MeuPWM3B5tz01ENBYVtfb0ZTxf7XmgFwN4SaA807SLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C89/MkKp; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C89/MkKp"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-afc857702d1so2313076a12.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745599659; x=1746204459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHnQmsHLpTkXpk9pCYWZ2+u9EL7Tjau9DVeHds4Cfpo=;
        b=C89/MkKpM4GEUSuMC8ZIUOUOYtQrilRiWLdHUovVGQsDFRNF82l8QSSgu51nhGxGw8
         49mcVgSlnpN04hpgO4MHFGEW7G18NxYNgyBbwr86Xkft8qMF4jVNxv0OLLzFlgMO7KdB
         BxKVguwbXw5gnjOCkx8JEcpESaPCyq8sJvmqsn+ORAl6ps3VLgVKCbJvsVNhS8cir2dj
         iDBVX+cboiOsFVrlny3L74Y7vFKzENP7XSv0DtxEFW19Z2UEtms3lrN9wgL57prgJgho
         LzZnwTyAMUTeljR83AYE8ekAm8T85b7IGEunYYTLkrW2X14P5tQj99O6HymXscShIWhT
         DfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745599659; x=1746204459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHnQmsHLpTkXpk9pCYWZ2+u9EL7Tjau9DVeHds4Cfpo=;
        b=p6oxwn6pmcUGWfI7UENWYWFJmjIleMHkM5gG4KVh65vhJCU5FNh7cuMY/CNYgD5W6R
         xAXcd8qi3SyZyz5vdhLtcpLpAGRDmmPJWbs29CSXiGcYq0JdsoTNmrbVcFCXFuSMZUVb
         cwMpjC0S689ouCl2WZLsdTa6k2z9qT//ZweckJTheq7H/up2OQVuOqCEJgpxFBFM60GU
         uXSEaCrqQoQdi30brmz1ftM2VsSZ3OXkMZBPsD1KlXTiH2qHlDG33izWWXWIaY4wuxEi
         KJg5uMg8pi6w3R9EcgLr0ZLgpqFWdUEV0jr66KHCOdaSHiniN3PXQOxF3R7hPJs1IDjo
         JWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpPQ4z00hHn/BTqzbHApAY8Unr9aDFcdNDpc4ZBdkiBN52D9xqKBnNIXb4no4drgtwcZrxiUsW+qb4HYL9Iwxp@vger.kernel.org
X-Gm-Message-State: AOJu0YzROlbx9tZfWjrRWziAfFVpSnBD4WGj4FcMDv/Dnqa7G45WTdGi
	UYY1T2zGGJqLQ8G8oiedmjJQPkcgDoliZ3l+He1YZ2adYReiXLaUHluedxhy6t0=
X-Gm-Gg: ASbGncuHLMi4ogl7ynac9Y17uao/gNzFjssiAes5YO7wRxRMa5zko9+l1jbI5B6cSn/
	pqLWoQEmjBdathWMuyNhb3fpoTxqcHwth7y2MhA4UUGnphxeeUCz/l05q92sJN156lyFvOARRQl
	zoeScAnoe/wUJU5sRb9QXYAjdBXHtPZRfZ6KpufAzbnFTHmJWrAYocH+aqkaI5rTW9c/U+z49ZV
	qrAhlclj1yCN2xFoVr1ZOUvkX+ZbhBHUc04+u6YF1twHEq8zlvwcenQSLcXcB9ciKz+cSu4zH30
	j3rr5LqTXTc9YlsFEcI1oyZAv3FVXUihAhIi56n1vrTx
X-Google-Smtp-Source: AGHT+IEFtm0kx9ryjYyAugqM7VqnMN866ofICD5304SL4j5RNB8nYzku/8tyb6zQ0c1+PCz7Hhe9FQ==
X-Received: by 2002:a05:6a21:920b:b0:1ee:c390:58ac with SMTP id adf61e73a8af0-2045b98feb4mr4519768637.34.1745599659333;
        Fri, 25 Apr 2025 09:47:39 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e9ed:84f3:2e15:1cdc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a420sm3487235b3a.107.2025.04.25.09.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:47:38 -0700 (PDT)
Date: Fri, 25 Apr 2025 10:47:36 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, festevam@gmail.com,
	kernel@pengutronix.de, linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
Message-ID: <aAu8qPl7EpcIU0oe@p14s>
References: <20250424122252.2777363-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424122252.2777363-1-xiaolei.wang@windriver.com>

On Thu, Apr 24, 2025 at 08:22:51PM +0800, Xiaolei Wang wrote:
> Release all carveouts under imx_rproc after rproc_attach() fails to solve
> the following kmemleak:
>

Please provide more details on the steps needed to reproduce this problem and
where in rproc_attach() the original failure occured.

Thanks,
Mathieu

> unreferenced object 0xffff0000861c5d00 (size 128):
> comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
> hex dump (first 32 bytes):
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
> 00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
> backtrace:
>  [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
>  [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
>  [<00000000521c0345>] kmalloc_trace+0x40/0x158
>  [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
>  [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
>  [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
>  [<00000000e7e994ac>] rproc_add+0x124/0x17c
>  [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
>  [<00000000efc298a1>] platform_probe+0x68/0xd8
>  [<00000000110be6fe>] really_probe+0x110/0x27c
>  [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
>  [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
>  [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
>  [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
>  [<00000000db3eb243>] __device_attach+0xfc/0x18c
>  [<0000000072e4e1a4>] device_initial_probe+0x14/0x20
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..c489bd15ee91 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  	return  0;
>  }
>  
> +static int imx_rproc_unprepare(struct rproc *rproc)
> +{
> +	struct rproc_mem_entry *entry, *tmp;
> +
> +	rproc_coredump_cleanup(rproc);
> +	/* clean up carveout allocations */
> +	list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
> +		list_del(&entry->node);
> +		kfree(entry);
> +	}
> +	return  0;
> +}
> +
>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  {
>  	int ret;
> @@ -675,6 +688,7 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
> +	.unprepare	= imx_rproc_unprepare,
>  	.attach		= imx_rproc_attach,
>  	.detach		= imx_rproc_detach,
>  	.start		= imx_rproc_start,
> -- 
> 2.25.1
> 
