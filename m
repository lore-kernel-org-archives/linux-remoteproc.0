Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E798729C344
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Jun 2025 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868037; cv=none; b=ogRclvRutE+lzCZ/QJ8Hr0GYK83R4OMTe7vyQEdea6EN3VhUwujB7Ub2NSUm6iyHicIyGZP8SZuXT792bFyor+XdIlNib4PKE4fe5R/nF5XcrN7TZ8ti8Ytpued0Jlc6XpLD0NTI6178XWkxbuSAAyKkwZldKB8ZeZSFmxc1+e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868037; c=relaxed/simple;
	bh=4QNLkEkuI4EdTUnOIb2grO6q4rrhmfxNLIwjC1OPtDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNa5emNWX0A+HMxSBZPM6rEi3WJtA7tdqzduyqU0RlkDV5USQlKvCINWJuPLZSdI1txhfYmOYHsQlB1Q5LbQiRmnnQgaJ3QQz/JkZQA41fmH+iVa+w0TghlpSR23knee903XZOvQR6i5f1iArRqDiiRFc3TxB3Y6meRl/oupeJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=baVx0Gzn; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="baVx0Gzn"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b31befde0a0so20749a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Jun 2025 09:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750868035; x=1751472835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vCD23FijRiGDMDI+6SLBJ6sq7ACBPYUWzeLA8BmQJ3k=;
        b=baVx0Gznwd0r88DchaN7RIfItLtoO0CfPZoLUZg6nuzG19L5tXdUj2/Et2NQ5BH0/p
         tvjFLK1pMiRQnTwofbYvRVHhyDe7u/qp6orgLFOSMu/KmUvChbdXxJr/ly+L4sFOsFkN
         bhfHVO1theAZQDk711odr0eVfekOPQCIs7oHmraSyDSHnNdyq4F7Ob+JS6q8RoGIOWzi
         8LkES5LctGCT4aoFNBCVA6YMFB03k8lXmHnNO/9Rijt2Z1e6Ld/e7PHJ7KZxNxaNoo6O
         ryAAA/ChFNWb7G22eCsN7x+efn5wI7eIDFS9kdvP1L/7sGFMneb1ebqMEDgK2TRLcpk/
         UJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750868035; x=1751472835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCD23FijRiGDMDI+6SLBJ6sq7ACBPYUWzeLA8BmQJ3k=;
        b=QhbWGvZAb14Tgm8PUZ9MpvPpIj1sIfoOUj4gl1DLgGi1T3W3kEr/YjwHq8Dw8/v5F5
         etqEo54sTU21d7GwO+J8yZeXXW8/xQh8CW9qomyeKgHBJIwObQEfh15qIYPGhhDA0iGu
         UMK9nszuy62jB/+BXZD4R6lhw/i0Os7FA5iTEvkJK8HPqzbqJT+7nblG0ZWsICfVflqz
         1awutKiISkMcryYP88CXHmzcVTSICi0WENcdp7xjTd+Q44eQfNDWztf+1jm/bTic+hGN
         fx0p+LlaGCHnCwDvL6OqKBflYPASPnpJsYMbmbxIYkgKtOtRqV7DE76+Pvz2RXNwN0dw
         Ocsw==
X-Forwarded-Encrypted: i=1; AJvYcCWDMsIjBOTQ6sa0pw+EzMwhboho0oKZgFgYd/D3ikjyRhPam/iNlsk6jneqbm+Z9PhkXit5Ju0VvQC/6LwatQdS@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ1AO9/KGnTXpbpUDwL824A2sTN8a96X4J3wfn6bGHIe7UCwNd
	Atf7WIHIkDZe9P8WIUfNNodUNeQDjh5rNNFKpEK+B4vv/sF5FGki+0fhX4SBkbSjCSU=
X-Gm-Gg: ASbGncu3krrAx0bkxGe/I3y9gBw2zVnOBcxXoUL57xU3Kzr35UaLGRyQw2QN2/J3XYt
	6XXHNcnJj7lWQW1m1/jAUIYEKqTrcyLvQ9R0fgkCcnF3PdIvyyR+Ghq6MG6eiM9AYOGIgX+sIgI
	sDVh2b5ugTNoDlZEBeFCVmvk2C9hZj0kAT25sze5+t5mjqbzbcY66rZf09TZTfG2AF4SdJ/oHPQ
	C42Pn5tyjRxNvlluR9fCoxDM+xImkCIzpimcH8eKtHJ2GtMfPhq1T2cY5ZvaCV30dkdNvxrJkkc
	k5ZYqFljnDwzeIOcqwsiQkP6NlX9CtEkRIqPtpk7u0uYxMO+0hpV+l+ytjBfGkozDQ==
X-Google-Smtp-Source: AGHT+IEaq7judiTDhY4LEdwCxHhEeJO96l2aFLRZebjujuoodpXvyb7qOhHSrHTIPCIkDRJZva9x1g==
X-Received: by 2002:a17:90b:2709:b0:311:ff02:3fcc with SMTP id 98e67ed59e1d1-315f26265a6mr5857836a91.14.1750868035161;
        Wed, 25 Jun 2025 09:13:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2ed4:4c68:6e76:7d6f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53d94b1sm2124536a91.33.2025.06.25.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:13:54 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:13:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rpmsg: char: Export alias for RPMSG ID rpmsg-raw from
 table
Message-ID: <aFwgQJ8B7EcjM1q7@p14s>
References: <20250619205722.133827-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619205722.133827-1-afd@ti.com>

Good day,

On Thu, Jun 19, 2025 at 03:57:22PM -0500, Andrew Davis wrote:
> Module aliases are used by userspace to identify the correct module to
> load for a detected hardware. The currently supported RPMSG device IDs for
> this module include "rpmsg-raw", but the module alias is "rpmsg_chrdev".
> 
> Use the helper macro MODULE_DEVICE_TABLE(rpmsg) to export the correct
> supported IDs. And while here, to keep backwards compatibility we also add
> the other ID "rpmsg_chrdev" so that it is also still exported as an alias.
> 
> This has the side benefit of adding support for some legacy firmware
> which still uses the original "rpmsg_chrdev" ID. This was the ID used for
> this driver before it was upstreamed (as reflected by the module alias).

I was surprised to receive this patch - my question from almost a year back is
still pending.

> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> Acked-by: Hari Nagalla <hnagalla@ti.com>
> Tested-by: Hari Nagalla <hnagalla@ti.com>
> ---
> 
> Changes for v2:
>  - Rebased on v6.16-rc1
>  - Added Acked/Tested-by
> 
> [v1] https://www.spinics.net/lists/linux-remoteproc/msg18959.html
> 
>  drivers/rpmsg/rpmsg_char.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index eec7642d26863..96fcdd2d7093c 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -522,8 +522,10 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>  
>  static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
>  	{ .name	= "rpmsg-raw" },
> +	{ .name	= "rpmsg_chrdev" },
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_chrdev_id_table);

... and I still don't understand why this patch is needed.  What is broken that
this patch fixes?

Thanks,
Mathieu

>  
>  static struct rpmsg_driver rpmsg_chrdev_driver = {
>  	.probe = rpmsg_chrdev_probe,
> @@ -565,6 +567,5 @@ static void rpmsg_chrdev_exit(void)
>  }
>  module_exit(rpmsg_chrdev_exit);
>  
> -MODULE_ALIAS("rpmsg:rpmsg_chrdev");
>  MODULE_DESCRIPTION("RPMSG device interface");
>  MODULE_LICENSE("GPL v2");
> -- 
> 2.39.2
> 
