Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B06263F30
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Jun 2025 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692820; cv=none; b=h9FJLZUJr5sVlyx7fyutN8lgeV/2PmKgkz1bDwn92s+eZv5v+Di71jTVrjg7BqyEZyd+KBrAvTbxL/MQP7jll6YpFmNPA0iq1/Ek5bk/Ay4TgdMKh9iPnSeINwUlGAUmynMc4CGnF0WStw2pdBn0o4Wq0C+Kuu1tTyzZeNcrwyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692820; c=relaxed/simple;
	bh=cgiHNz+KjIhdbW4tV9HGnqgWOZePX6Q9ItYQNVKO7/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGIlxR0O47SLzUPuj8Ri2ju6vOLr0ZlF+mUlDk5vz4NvfpjPhV5mx0sa7N5lCQGjSmJoGNcKuZSA0lj457r6Z4dY/Zmoz/awY2gmW9+KzxWHhixGEqslC/UcQlNOjEg161jOB6kaW+ZZfiXIoUXrnKGkTN/DV+/TzR1QebT1MUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZV3p5fy7; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZV3p5fy7"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7494999de5cso510710b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Jun 2025 08:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750692818; x=1751297618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6/MseeK5NnyJTv2/RCMZEdsiDxqp0eqeEdU8cSmGnt4=;
        b=ZV3p5fy7RUf11DVPCF8rXoVJupAHktrBoMEXp2+7IMLS4unhU3MZK5clQ/3YfjnvkB
         R2JcrPFAY4p1osv4I2FFlb9topy8EbhMhTx2/vVt65/yMUXkm4gpJugcbqP7/8KAHEtp
         KSU0/p55ctyXASJCXl7tdgYJJKVm8p433byw4vNfzfFtYAYr+1rakvf7DZYaPUyvIRTm
         sjIT38Z96C4biZ+4UFf3MOnX55C6nMLxxF5/0b5pa7lDZBk3CtM5P8HLQwJNV5DZHtxQ
         T7CiXNsV2/H3hZC591pM7/lo/abfVArDVG2dQ5auzpLCKIyYVGM2tXhKxAzavmg5y9KZ
         3cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692818; x=1751297618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/MseeK5NnyJTv2/RCMZEdsiDxqp0eqeEdU8cSmGnt4=;
        b=NeEXtBvMx3ZpicILPhmhgYnKfUNersPuY5f82avaNB7Sen2Pei0nUL/xpHetNRYrdY
         WkRqsImJZ+QkLBfamdAvJpLhGLk4YaCx2YiSiXoOb6xIW+Fzh7ugBpTCSIdUmqfhW8vR
         95FNh6EmoZlVjXF+WPtGws6DlnbvmiwUjFGl7r36O3xefqOZU5cQGQFYLCUhSSv9Meuh
         4uGuBC/8Pz2azW+qH8A/tdoW5InTXdb1VnSkwU0fZmfwV2Flu3A8ElSScEgOY7D856EI
         ajUBdV7MkOk1MA7aicN/Lr30ayiEDp4U37QX7nZEPh2hgkK7I/8gjgC2t0V2uDZZoOg5
         k8QA==
X-Forwarded-Encrypted: i=1; AJvYcCVcTjaryq14Mo6GYLeHk4NWKJD5hJIMqELGhXO88+fZG+eH7UpU+aN7q17NMHWmocC6w3X/6SmLcwYHprbuPhoq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1rXQFqrCfRb7aHW7fVomEirZtS4Ndpan2nBTb/xLQ0rt6hGu
	QHgNkNw41ZMRhgohpIUZ3bZ4E2thvgBcVFXj8UI9GWvXPcv3hojQRoGdI8X4szEPN7c=
X-Gm-Gg: ASbGncu9d8G22bqU0iJY4h0yCVwHvQaSL37G65/I9yxhbHE1UR5t8MZDGKb5sC9Zg0a
	Ok6m1LQoKhGSgO9KJH4XdzXKI0VL4Rxtvdi3XSJX7iSFTxj9fMXBMFAB48QUys2Qop2kj9KPLT5
	0xJ6MIy6pySei3QwP9SJsLP2LJazTUf3btOPBvEdS82iP4uIjVbuLwDNsLFEAuqVa4FKmb6WEsJ
	6iYyJLnFSrkpm+Q1R8ckBi5Y8af6ghiq98pIuat1Dv+0Qp3x++llyeByfLNKOyO8MzGIAUArb5K
	KpJpz2i6lO82nN7ck1pYWP43B0vjGA61e12B4s0Xc4kJzhy8DRA3u1JBLejOhtcCvy6ywsW1FpQ
	=
X-Google-Smtp-Source: AGHT+IGlW6SZFB+CKVcOw4nVGRNYqt2n8jING6D9c1KvFeN0p4vGwymPPU85i6F1UgcMhHd0SQP01A==
X-Received: by 2002:a05:6a20:748c:b0:218:5954:1293 with SMTP id adf61e73a8af0-22026de98cfmr23735448637.34.1750692816228;
        Mon, 23 Jun 2025 08:33:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d145:b99:ea4b:a65f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f126a2aesm8159117a12.67.2025.06.23.08.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:33:35 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:33:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: xlnx: allow single core use in split mode
Message-ID: <aFlzzSvUsstEQsKP@p14s>
References: <20250618181933.1253033-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618181933.1253033-1-tanmay.shah@amd.com>

On Wed, Jun 18, 2025 at 11:19:33AM -0700, Tanmay Shah wrote:
> When operating in split mode, it is a valid usecase to have
> only one core enabled in the cluster. Remove exact core count
> expecatation from the driver.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v3:
>   - Fix commit message
>   - Add details about split mode configuration in comment
> 
> Change in v2:
>   - limit core_count to max 2
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)

Merged.

Thanks,
Mathieu

> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 1af89782e116..5aa3fd1b0530 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -1329,19 +1329,23 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  
>  	/*
>  	 * Number of cores is decided by number of child nodes of
> -	 * r5f subsystem node in dts. If Split mode is used in dts
> -	 * 2 child nodes are expected.
> +	 * r5f subsystem node in dts.
> +	 * In split mode maximum two child nodes are expected.
> +	 * However, only single core can be enabled too.
> +	 * Driver can handle following configuration in split mode:
> +	 * 1) core0 enabled, core1 disabled
> +	 * 2) core0 disabled, core1 enabled
> +	 * 3) core0 and core1 both are enabled.
> +	 * For now, no more than two cores are expected per cluster
> +	 * in split mode.
>  	 * In lockstep mode if two child nodes are available,
>  	 * only use first child node and consider it as core0
>  	 * and ignore core1 dt node.
>  	 */
>  	core_count = of_get_available_child_count(dev_node);
> -	if (core_count == 0) {
> +	if (core_count == 0 || core_count > 2) {
>  		dev_err(dev, "Invalid number of r5 cores %d", core_count);
>  		return -EINVAL;
> -	} else if (cluster_mode == SPLIT_MODE && core_count != 2) {
> -		dev_err(dev, "Invalid number of r5 cores for split mode\n");
> -		return -EINVAL;
>  	} else if (cluster_mode == LOCKSTEP_MODE && core_count == 2) {
>  		dev_warn(dev, "Only r5 core0 will be used\n");
>  		core_count = 1;
> 
> base-commit: d293da1e4dbebb40560e4c6a417b29ce3393659a
> -- 
> 2.34.1
> 
