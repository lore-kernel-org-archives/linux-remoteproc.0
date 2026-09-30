Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690A04F7CDE
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781478; cv=none; b=AcsB3rWNj4VWCh/QRdzuITAuV9wNWZq99d5QU3nDFRUyMmGEqTX2HNjjIDQhI8BP9x/jcuSAeDQ3/H4nB4ZVPjP6wps6mim2B784qxUXx5edQGDxHk2YMefyvxKoX5XqEToax0ytRJ4Y2yQ89rLsHnm/N9HgvF3RNWOdHcsFGUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781478; c=relaxed/simple;
	bh=uQgcjTanqpRbiFni0yHM5IL6li1Xtxu2ojp6ApqgDuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEWsaISQNp3wsJG/4jbVVxqX/9rwucAHXBmZT3hx7gBu1ndB2H/iWrxXSYjlHkZ7Zx6Yww3QztdonDHlfeutNm9+JJBDIuETR+/y2Wa1Yfxkcp6yb8mdNO3uTAnI4YEACQ4UDuwZ0Cdvs+ELgj7tsfZD5koi9cCPdseaf5nGW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hFfiljhe; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hFfiljhe"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac5ef2610aso2608612a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790781464; x=1791386264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RmXnhr9OmMiHHu4ZPDqUZWuFVaoLJmyXOyKcRvZyBZA=;
        b=hFfiljhey0dlBlFqlHvDgbm1N+QR7BZe45jj4RyacbyL640QWYOXx3yt/ILPMyBH3/
         jHDHk5QXgTVloN6aJDVdk6UK5hcSTSc4ZI+jEuzN0F+hfXKOvRwj15Ve27SInGEP7e/n
         fEN+l7m6j6K9xfCsOfTosQxqMDMES416u+WzYFddZVXKNtn4TX1bQwv/TvFWUAuKI8BW
         phQGVAT8LP99iofN3E1CyC9KRfsZ6ALAO0koEhnN+gUq9IkZdxC6Ni7d1rzA/CZ7yAUY
         YjxjzpfqGP/A7+yQ9NVmruL7NXYjKW9BiL0LtBH9ox/IDi6yRmr09StpBUYtXCyk0olo
         bv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781464; x=1791386264;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RmXnhr9OmMiHHu4ZPDqUZWuFVaoLJmyXOyKcRvZyBZA=;
        b=o7Z5bNBUwKZZ+w4b6+dlmQSWHfSZtt4Rw5e3monxR1O36l71lAD0imyeywf64Bq6I4
         Pov4602UYp0B/A4NrOJiOlstSsdF00odYnZqFr6ALpse5AHdqVBKg/uXLl+7c3edQhnk
         2w9Oqdss1LPYLZkpksQsKpe2eadc5WCadgGBgG2i8FqrOTMKkqjbzgsdvky0TPDuQFFu
         /BWuZHzxmhTchdssoyGXyyxMh5/eGWbsqb3IpWOPNIZCVEhat0ZHXHiQySz4G1MGgcwZ
         uj2cjX2SSIif6dERWXT0bWwUup0UUPTtUfsXyxDdPKpTjr3rfQha/JReSJQ+L6y3m8qc
         OR8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTgtJES+HSeeofzvjzATDRrgYNpt1SQYTJnytTcNzRLK86JfwWH1wsu0aMV3TXay63QJSRqREOQHJGS0D7WHHU@vger.kernel.org
X-Gm-Message-State: AFq9FYICdvyTilWwViW6Z6jXFmo+5klDU5KHPv55wtdc4VS4m7FTabR4
	Nf0IFrtB/btyrPidnasZjYzP67hcBT/G5WrcmU+bP5r0TBdnUIkMvF1VZb9yB8scjmY=
X-Gm-Gg: AYBFou1PXIi0J7z6sGrKthjjRE43fCtJM2KqUdV+kUxDiOMBq5WxWqZjP680P7myjSM
	MYWuQhGpGSqiAP17gdMuA7TPr4bg5XGAgwi70P7mqUGLUnvAhN6mj2jvK0Y7gKey5aQl0Oa/0iG
	8LSjz67+Mw5wLOozQAgrY/2FYlph1XO70X8bY3GOysvPtpQQQ0bxWw+2GS+Zi+oRHzhwniVK9Pu
	72F5IO1I454oE4biP9t/o/+H1UOjg3a9005PtfirPpQmsBFvcidoyJh7HRc8xYFO7YcytcLpvtN
	mFXsLYb36OSJxXHnyhxSu0sHcqKS4DHvzcWEb2243SNDZPQU5HFqK9yy2IeNOeSLVZFWA0k8hi8
	R1AF4w17PdSBynigIJ3f3tNkiTlgyw/R9Nl6hDk+KsVlYoE8BvzpLdmV266DjOeLs7DGkoy3yUx
	2AQgFE2Ch9BnG6Jxp1enKYaCsGHArVf2H/K7p50INKRaIeMtQSdWnJI9aDhao9zlhw6JThmExV
X-Received: by 2002:a05:6402:304b:b0:6ab:e30:c9a0 with SMTP id 4fb4d7f45d1cf-6ae19e365d2mr1038299a12.13.1790781464353;
        Wed, 30 Sep 2026 08:17:44 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f5b4:4d0e:70d:9fba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1558b289sm944038a12.15.2026.09.30.08.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:17:43 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:17:39 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] remoteproc: xlnx: fix typecast warnings
Message-ID: <ar0oE_M9sgEpJ0st@p14s>
References: <20260828155846.2883035-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828155846.2883035-1-tanmay.shah@amd.com>

On Fri, Aug 28, 2026 at 08:58:46AM -0700, Tanmay Shah wrote:
> Fix following sparse warnings by using __force attribute:
> 
> sparse warnings: (new ones prefixed by >>)
>    drivers/remoteproc/xlnx_r5_remoteproc.c:571:20: sparse: sparse:
> cast removes address space '__iomem' of expression
>    drivers/remoteproc/xlnx_r5_remoteproc.c:749:17: sparse: sparse:
> cast removes address space '__iomem' of expression
>    drivers/remoteproc/xlnx_r5_remoteproc.c:773:24: sparse: sparse:
> cast removes address space '__iomem' of expression
>    drivers/remoteproc/xlnx_r5_remoteproc.c:797:25: sparse: sparse:
> cast removes address space '__iomem' of expression
> 
> >> drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse:
> incorrect type in initializer (different address spaces) @@     expected
> void *rsc_offset @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:
> expected void *rsc_offset
>    drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:     got
> void [noderef] __iomem *
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608190009.uCbYi1Y5-lkp@intel.com/
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>

I have applied this patch - apoligies for the delay, it got lost in the heap.

Mathieu

> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index c685bb5fa62c..f9cdd3c024dc 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -568,7 +568,7 @@ static int tcm_mem_map(struct rproc *rproc,
>  		return -ENOMEM;
>  
>  	/* Update memory entry va */
> -	mem->va = (void *)va;
> +	mem->va = (__force void *)va;
>  
>  	/* clear TCMs */
>  	memset_io(va, 0, mem->len);
> @@ -746,7 +746,7 @@ static struct resource_table *zynqmp_r5_get_loaded_rsc_table(struct rproc *rproc
>  
>  	*size = r5_core->rsc_tbl_size;
>  
> -	return (struct resource_table *)r5_core->rsc_tbl_va;
> +	return (__force struct resource_table *)r5_core->rsc_tbl_va;
>  }
>  
>  static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
> @@ -770,7 +770,7 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>  		return -EINVAL;
>  	}
>  
> -	rsc_data_va = (struct rsc_tbl_data *)ioremap_wc(res_mem.start,
> +	rsc_data_va = (__force struct rsc_tbl_data *)ioremap_wc(res_mem.start,
>  							sizeof(struct rsc_tbl_data));
>  	if (!rsc_data_va) {
>  		dev_err(dev, "failed to map resource table data address\n");
> @@ -794,7 +794,7 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>  		return -EINVAL;
>  	}
>  
> -	rsc_tbl_addr = (struct resource_table *)r5_core->rsc_tbl_va;
> +	rsc_tbl_addr = (__force struct resource_table *)r5_core->rsc_tbl_va;
>  
>  	/*
>  	 * As of now resource table version 1 is expected. Don't fail to attach
> @@ -834,7 +834,7 @@ static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
>  				int offset, int avail)
>  {
>  	struct zynqmp_r5_core *r5_core = rproc->priv;
> -	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
> +	void *rsc_offset = (__force void *)(r5_core->rsc_tbl_va + offset);
>  
>  	if (rsc_type != XLNX_RPROC_FW_CRASH_REPORT)
>  		return RSC_IGNORED;
> 
> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
> -- 
> 2.43.0
> 
