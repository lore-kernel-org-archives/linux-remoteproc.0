Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A52528A1E6
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 18:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758650516; cv=none; b=RlcRI5txF0QzqF4Cz8OqzzWF+0aZiU8IUtVVJHq0Jg0T9TgnAM9xVRDu4hJ64eon5m5g/TudV3YXtUm8z6shvnLL9tuXP73V2YHcSTJbcGE0Us6m5ZCt5OyQRXKfhKpi/5bHXomuu/tB9VMHt6kNvqUvqQFxPFUrvzDS74BnaN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758650516; c=relaxed/simple;
	bh=tEXaouI0MQFxLgn7NnEkdk7xivByJDQ2TC4JxchAi/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwGfps3SbPQyiNk6MkDrYMDXnEr5Z2fGzIRiGPmSEg7cwZ4uFDLEa+Z4AT8OAztvHBJI4yfHaOKQe/rfqwlZPu/MHOtKEu5P/nG4SffCFDXlyr78gzT+nb8FA2B2KOOvIZ6mVcAbvWWTc2NcCrGyL5sPfk3DUSErktVwFnq8mtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R6Z7jsdK; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R6Z7jsdK"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77dedf198d4so6483949b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 11:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758650514; x=1759255314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CVCnZnhC/iJw/eHP2Tq/7o3gN4lfNQT30rEnkFKHPLE=;
        b=R6Z7jsdKCZTGikl/oFHgz0Qetv2dckJlOUM3AEdwhL/lENxEOmH8dl1bfftK7o9r6D
         C9p3bkOwh6AGy56f/nKS4W7AZRfs8GTe+t9vYh3dQjK9RUI8+DnQR0lf8V7uKmHj4lRL
         pgwO+ZfXMZCI0L0+1bMMrUobKu8bd1Ah481geXrQE5hcMf6oz6Lv0MByuBHx6E8ZFm6r
         99m8p3v1t3f2kQmMXuE6gN99KWquuWiEcunOtj1Jy0YIZf8AIeMv5sPON4ZyCng3Y+Ym
         tqhOBO8i0mNJK6N4qESB3q9rPXZCQBgyJA1WKJKwtMr9J+yrwvJ6ppK0M/E9ZqyNI7vy
         vj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758650514; x=1759255314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVCnZnhC/iJw/eHP2Tq/7o3gN4lfNQT30rEnkFKHPLE=;
        b=bJKBy0JgNuYy3KiIGF1csRyCkBQ6Qq8frYcI984VmyvJfPHFV9NhrbtXSIZxu/v/QK
         AQBCAUl97f5TWn7g2Kqp3krk2zT/DVgVW4/Bp+xs119JHmZfPcqP9HB8QhiaeUE+Hdh3
         64YKmrsS8Je6EGgY/5UuBSIIBY7LngUT9xgI/11hGdSMtv4q1L7mfI/2Nujeb0HRauKt
         VUiiSa/RzxqR6HhnkYVFUea/Occl7uwlSQmGpYiu1O6rZWt2huEhtgWqPxZA25iVa6mM
         Fi7EwBBlcytAZgGSv8uylZxSdN/6XwRLfGRRTzC/OUVSSdum2pyKCbLTycVZLncNdClO
         6kWg==
X-Forwarded-Encrypted: i=1; AJvYcCWkiv3liOjGgViMzsQnK9eyYPiOcTeGWOf6eEzWTEzqr6UVmpkjJtPuwt89b7RlTvE1VBrbZzUFy2O/XpSRbG+q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LHmeovv4TZA3YtM3HOWD9s1mq4aoPsQHsyBbkx5zrOufdXXD
	LlBde0xLesSufxIZqtoUYLegImarYg+eZhFi6RU+3DUpTdAzUqYmkAcNPDCIs8e/YFU=
X-Gm-Gg: ASbGncvAfseoKhXO9AI8ac2pezC3W3Cu3PwRsxNpYmu3HBmLZ1UNtw6trRSvdSUC0Jc
	EOHK43osULI/RcfXRB0ctMHVb5i9yDe76tKw/AMD249hSzhparcVJf18lt72j010h7peLCp+7L+
	x0Vc2+GMgeamrg63pu4m94yObKb2xzMWYJqch53sA8ulveu3AcPox2aQsSwL1hLtROXSd5V9NFm
	6JRad1vtCizuUKTOASTfRsEKYH78b5Mo1SrB44gVrniROAOboBerUPep/aBoRCYlqZTko7zcyKz
	4albQ4r85N+3k/2XE0lHIt9lKnqKoswak/ouTGrnl48B/cqGmTglTv1SC1r8tCSrHPzdTJ3T+zI
	Avx/raTZQmHf3V9LqhpwVJuMthagPTbx4exHxhxsz5FGHoREnwN3dihkAe95WZIO9dmzFeNoUIg
	sKOSQCU2dwz7O+8GMSPXPkjqY+
X-Google-Smtp-Source: AGHT+IFjLlhraiDIPC6DXDrYq4fvv/nZOvvL3T1wFQpFeNsBdDOHpuuAX/nL8T3cbxqFx2Sgp/+lrw==
X-Received: by 2002:a05:6a00:9189:b0:77f:620f:45ac with SMTP id d2e1a72fcca58-77f620f746dmr1459597b3a.2.1758650514295;
        Tue, 23 Sep 2025 11:01:54 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e369:98ec:1aa1:e6ce])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb7ab8bsm16511273b3a.11.2025.09.23.11.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:01:53 -0700 (PDT)
Date: Tue, 23 Sep 2025 12:01:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Zhen Ni <zhen.ni@easystack.cn>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: pru: Fix potential NULL pointer
 dereference in pru_rproc_set_ctable()
Message-ID: <aNLgj49Gm9-j4wbe@p14s>
References: <20250923083848.1147347-1-zhen.ni@easystack.cn>
 <20250923112109.1165126-1-zhen.ni@easystack.cn>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923112109.1165126-1-zhen.ni@easystack.cn>

On Tue, Sep 23, 2025 at 07:21:09PM +0800, Zhen Ni wrote:
> pru_rproc_set_ctable() accessed rproc->priv before the IS_ERR_OR_NULL
> check, which could lead to a null pointer dereference. Move the pru
> assignment, ensuring we never dereference a NULL rproc pointer.
> 
> Fixes: 102853400321 ("remoteproc: pru: Add pru_rproc_set_ctable() function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>

Applied.

Thanks,
Mathieu

> ---
> v2:
> - Changed "null" to "NULL"
> - Added " pru:" prefix
> ---
>  drivers/remoteproc/pru_rproc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 842e4b6cc5f9..5e3eb7b86a0e 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -340,7 +340,7 @@ EXPORT_SYMBOL_GPL(pru_rproc_put);
>   */
>  int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr)
>  {
> -	struct pru_rproc *pru = rproc->priv;
> +	struct pru_rproc *pru;
>  	unsigned int reg;
>  	u32 mask, set;
>  	u16 idx;
> @@ -352,6 +352,7 @@ int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr)
>  	if (!rproc->dev.parent || !is_pru_rproc(rproc->dev.parent))
>  		return -ENODEV;
>  
> +	pru = rproc->priv;
>  	/* pointer is 16 bit and index is 8-bit so mask out the rest */
>  	idx_mask = (c >= PRU_C28) ? 0xFFFF : 0xFF;
>  
> -- 
> 2.20.1
> 
