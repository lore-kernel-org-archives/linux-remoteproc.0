Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714111;
	b=nUbN2Ts2FI6lnIFyShTq1GffJgwRcPSJBti6x1v409S0304ymAyyaCT38fqoiYRr8Akr
	 P88EFTykxIY0aku0r133vBGuNxiuZK634sTtTveUGDcTi/dapM+/a/2uHFh2Hxjr7vBsR
	 +ZDnMIBLFJsyFwB6UrDyINS77eR/Ij2Zk+IixqsvoO8xyXp1jJAR9DTqAkk5+UBe5SpG2
	 g6of48WFx0lt7i6n6iFI5j4IIqqrc95Klc1W2rDAclHTKzBioKIEN49Uhsw0ipKkib4JY
	 D4929OqlUAZQHqvIkGVl2tcGYkxQ7/Zh5b53IqxPOiBoNvhJ6/SxB5ReF+ZIkWwt1KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Mgn+JYoJ/h5QGFKbr5yJl/E/L+YyGxNW0QvmTxTy/B0=;
	b=Y5rx4H9go9UEvYK4cvJSj8Jv/CTOsSWAhKa8Iym9QzP4xsS+JDWo2rn09RYb4kULApTY
	 4+SFM69r5Fx/SJbpUTqsTqgN5h8fuOOtAFtKw1xYIAmmPYYA87PuudRmcidpRFMXZ8jD+
	 bl29e+C+C+pDQxtpWyZq1+XcC7LTXctIJ1n9NNA5hFRDl/C0ruCi4l/+iHSc5SD9XIFM8
	 05X/mAUSHLxxW3xFQmBjIqTPkK6KJn9mAx4FgCuYh+ogFVt6CeAku/kh5xzVNGEvKHOr1
	 tSL8dXkiN47kJV79VDn65PKjrzNo4h0o/vVy9rEZiwaKxTCTE59H0fTP+/kqyQLj6ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QoB8j2ye;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C02606A31C
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 17:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C02606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QoB8j2ye
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so2921574a91.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 09:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795714110; x=1796318910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mgn+JYoJ/h5QGFKbr5yJl/E/L+YyGxNW0QvmTxTy/B0=;
        b=QoB8j2yeoaBu4OKCc15l3LNhRBuIyCAGuOGQmChx68G2ipA1WcbR9U7U64RUAYUfVG
         mwV1hLSnBiLA8FF36Ztx2a1qRqWzgnTUtteNx24RHEjsfPhmMLQh3gCVFBugZd6WOodu
         ZyJcIGfU7OxcIsgkMFCSPf2LreDUWVXP3sNZPtKmmugNPB9ASEoeDp9RViDRLTSbZWL1
         svI65WBrnoRUxJa3IdAXBkn9q7ZhW/791mev+rbj4dwZ1OMjJJZNzc7eD2y2Ple/jl66
         oohOm/x5/2X8UvrbLc8uiK5Ktg6fle8CgtCMuN5cyhKlOd7ekVxnhn/EYwTpPwXOanHQ
         GKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714110; x=1796318910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mgn+JYoJ/h5QGFKbr5yJl/E/L+YyGxNW0QvmTxTy/B0=;
        b=SY2NVGSOhOkPOx3tbwstl1DgaH+tEM+IorUXZXvKhvs95Ls5u3p7euxF5VhWVHbG0C
         1GPu0XrdWBEIB4JmZ6Ls43F0sZdETSg6BkoBDnTeNibUL2DZQE4esUVXUxWHvz460yLj
         hlsO1OlVcJ/jyxlh4kfu4WMzEJDnhdkXALpN+5DW7NSy3a/G0+FCDsBjUxu6AXTmFp+z
         TryVpKdT6UGupWL83FJ00bxGdR2786j39h87/6UfNMy7yCTksCdRY75WUZpRs9Ietrqj
         Rdyoe8td9qUziEbMIQ1oFJEUnMSCCzgvjaSTg34LdlU+Q8egtAIFizXLVPfwR22fGFXk
         g2iw==
X-Forwarded-Encrypted: i=1; AL+hErE53uiAerfkkv/UEyehC8jfSufCroXkFeqXh6hu/HuCaJXyxqZhTl7NbZbi8dRzGlfW/4RaUBh3PyuuKLZ7y4kv@vger.kernel.org
X-Gm-Message-State: APuU4Z/I3Tm7noXV6peZ6z4QWjArwVs40pfIJU05s5GFOix0i2bGi2iB
	x1Ld2berlRWXLJMLxM6zcOkVzpmJjqVihz4FZc/X2WXI7Yqajsft0MDkCgSGpOyRodk=
X-Gm-Gg: AZFdTZf9ZUTAupmJfqyUbuoawMupA7DIVw60F7inrSUSsNAPvBzjJ1cca9cnknBgoaY
	iJQ/ZVLxeaN89BI4ZgTbmYp3upYbJDdtr9ND8VrEmg9EkhtwqrPY+QyqyDpPIBxDYsoNqelirrh
	4OIWUhU8xOTKAlJ3gjA5k3x1htzx1twU329Hjn8OqauKSIGJGMEJ/Mgr9LL/cqvI7gy7+1uT5D9
	IwFVc7ppXdC7tDSuby6MJBHRXQVbD4YpSsaRE8yAOkA4nT2CpGEgro1CxXr3PU8n5sqQGJRGh9R
	MMPFcs8JbMR4y3KbDyA5D88IU1h6APC+d13dBdjHEf57Cn78jkYQEHSmNSC8VZjQMNO6b8Kzknu
	SiKpMkpQsB6PK8Vdo6m6ukFNxf4Pcz8cMmK9K1dGB04S3hFm9t6zuP3/ndSoa1TmMSmIwg6mqWj
	SDr+8snMY/kMrGjlaImfjfG4uzxW0v+M9kMC/CDGroQ7M8fKyuouS04oGSbL1+Abha7I2VFmqND
	IXfG1XI9znAIJOk2pCon5obN9BU3vIIObs+nNZGC6/0n5AoDWchhXXf9OoGMF1FwXxLWGc9FFrh
	pO7G7f/O/BQrsk9hTYXI5d8uPB3r+4YN
X-Received: by 2002:a17:90b:2e8c:b0:3b3:b373:6a6a with SMTP id 98e67ed59e1d1-3b41c9e45c3mr21615927a91.28.1795714109742;
        Thu, 26 Nov 2026 09:28:29 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ce00:143c:88b9:bd58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm12843860a91.3.2026.11.26.09.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:28:29 -0800 (PST)
Date: Thu, 26 Nov 2026 11:28:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: debugfs: use sysfs_streq() for write parsing
Message-ID: <awhsOzu4o_Zn0uVa@p14s>
References: <20261116184230.1885-1-saileshnandanavanam@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116184230.1885-1-saileshnandanavanam@gmail.com>

On Tue, Nov 17, 2026 at 12:12:30AM +0530, Sailesh Nandanavanam wrote:
> The debugfs coredump and recovery write handlers compare input with
> strncmp() bounded by the write length, which accepts any prefix of a
> valid command (e.g. "e" matches "enabled"). The sysfs counterparts in
> remoteproc_sysfs.c already use sysfs_streq(), which requires an exact
> match and tolerates a single trailing newline.
> 
> Switch the debugfs handlers to sysfs_streq() for consistent parsing
> between the two interfaces, and explicitly NUL-terminate the copied
> buffer since sysfs_streq() expects a string. Tighten the length check
> to leave room for the terminator.
> 
> Truncated commands that were previously accepted by prefix match are
> now rejected with -EINVAL.
> 
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 33 ++++++++++---------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index e8e7b6a3769b..ef6761a13c6c 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -73,19 +73,16 @@ static ssize_t rproc_coredump_write(struct file *filp,
>  				    loff_t *ppos)
>  {
>  	struct rproc *rproc = filp->private_data;
> -	int ret, err = 0;
> +	int err = 0;
>  	char buf[20];
>  
> -	if (count < 1 || count > sizeof(buf))
> +	if (count < 1 || count >= sizeof(buf))
>  		return -EINVAL;
>  
> -	ret = copy_from_user(buf, user_buf, count);
> -	if (ret)
> +	if (copy_from_user(buf, user_buf, count))
>  		return -EFAULT;
>  
> -	/* remove end of line */
> -	if (buf[count - 1] == '\n')
> -		buf[count - 1] = '\0';
> +	buf[count] = '\0';
>  
>  	if (rproc->state == RPROC_CRASHED) {
>  		dev_err(&rproc->dev, "can't change coredump configuration\n");
> @@ -93,11 +90,11 @@ static ssize_t rproc_coredump_write(struct file *filp,
>  		goto out;
>  	}
>  
> -	if (!strncmp(buf, "disabled", count)) {
> +	if (sysfs_streq(buf, "disabled")) {
>  		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
> -	} else if (!strncmp(buf, "enabled", count)) {
> +	} else if (sysfs_streq(buf, "enabled")) {
>  		rproc->dump_conf = RPROC_COREDUMP_ENABLED;
> -	} else if (!strncmp(buf, "inline", count)) {
> +	} else if (sysfs_streq(buf, "inline")) {
>  		rproc->dump_conf = RPROC_COREDUMP_INLINE;
>  	} else {
>  		dev_err(&rproc->dev, "Invalid coredump configuration\n");
> @@ -211,26 +208,22 @@ rproc_recovery_write(struct file *filp, const char __user *user_buf,
>  {
>  	struct rproc *rproc = filp->private_data;
>  	char buf[10];
> -	int ret;
>  
> -	if (count < 1 || count > sizeof(buf))
> +	if (count < 1 || count >= sizeof(buf))
>  		return -EINVAL;
>  
> -	ret = copy_from_user(buf, user_buf, count);
> -	if (ret)
> +	if (copy_from_user(buf, user_buf, count))
>  		return -EFAULT;
>  
> -	/* remove end of line */
> -	if (buf[count - 1] == '\n')
> -		buf[count - 1] = '\0';
> +	buf[count] = '\0';
>  
> -	if (!strncmp(buf, "enabled", count)) {
> +	if (sysfs_streq(buf, "enabled")) {
>  		/* change the flag and begin the recovery process if needed */
>  		rproc->recovery_disabled = false;
>  		rproc_trigger_recovery(rproc);
> -	} else if (!strncmp(buf, "disabled", count)) {
> +	} else if (sysfs_streq(buf, "disabled")) {
>  		rproc->recovery_disabled = true;
> -	} else if (!strncmp(buf, "recover", count)) {
> +	} else if (sysfs_streq(buf, "recover")) {
>  		/* begin the recovery process without changing the flag */
>  		rproc_trigger_recovery(rproc);
>  	} else {
> -- 
> 2.34.1
> 
