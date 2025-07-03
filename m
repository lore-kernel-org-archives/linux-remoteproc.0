Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED8224DCEC
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Jul 2025 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751560047; cv=none; b=q8ia6OR/SVeh+AK8sSuzP6bc7aS4AQ411ekEFjvscBIFBJXdR4ntqAhGiJ9I/rzUBzWz5YQ6zcgjbJ1RYYrjJb75YXGYO5Z9raRMt8e53UjJZr6GX3ULl8c7Ky3ccEAbpgEZ4YFuyN0wU6+60Q/mww/ZAE/5F2AuBwAGhJuDp04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751560047; c=relaxed/simple;
	bh=+t/wAOncNpuxr9FEwXK71z09xEBZNujuFzMPJXnnvlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVyxDJKCdU2jszqOnHlNwhmlGyD2SQmZ+32jI/M8HUBLmoLuKDIpbAvokhKvcSwsSEshR4BX3cUx8rNz7yg51bMq0OMPfLgvLJrh5gT6NlBU/yMk1hOJ8iLEfo22QlcBme6HiUYX+2QK4gMT5rr3o3v1Tf56Bg0dDzJiTEtRavE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=buhNXt6G; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="buhNXt6G"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74264d1832eso289925b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Jul 2025 09:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751560045; x=1752164845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9DG4rBv1FPLSozhVTa/r0rwIxRT4k59IacJ14rLRAE4=;
        b=buhNXt6GbucFvP7mQAB7AzKQh4OJRTWfg5Glk6lw49HKyTspW8jhAP0pgTUKwd54ot
         zAYluvw6dJ1n6q2ivOIgWnmY0Gu1sSzatfkYtXu/mpdKqpLfMZyn/TTX9D/kvdCGmhR3
         LkZYNP0KqxPrxCxBzmTG8QCw8ljJVpWimue48zkXKjk547xW3Ux+72uasli5yJQBxhuD
         OL17871tpwfuezg7zzRCPS0VcRq8cqCvmlRuEurCHuPhCaYWCpfB6URT95bjTdWpcVFL
         s6YZGiBSCglv0lflA8sc/GkVMy6CUxZx6J3Z7c3/r5F39mU2QRkUtjiz9ZKgLxLHv7QG
         ZUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751560045; x=1752164845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DG4rBv1FPLSozhVTa/r0rwIxRT4k59IacJ14rLRAE4=;
        b=uZt44DCjKZSMkZPZChf44WuQz/0tqdB/d60EN+ilQZ77vLey6V5AIoIqFMj0WfLvgc
         EAbGK//aA5zEf2Xvb0B9+P2Qao28p2fQw7u+SwnNC4iCePWMNpa15ZOgrb7bei4PCkbk
         87BCZeoDLRTNWhkDBvlxwoKfDm40TbatGCBOep5Bj1WMUkvBCH9r0hj+veKgPKcDG2ju
         R/rbpKylpuX8zeE6rpHWl0xR53eiKuKMRhhPsIEL9dG6BT+CIQnPFsC0POBBYXJ8oyf6
         1o56KXnsgGSQ7wbPLYFMWAApa9hWKBWwe5Sg62dWYpaXLDHHy4MHNS5oxeLRZkGxvX97
         bZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq5rXbX0gFo69faHQDmXu0ULVnYbCyE4Jrk22G04PN2vNrM1o/w34ogmOb49b8NJIpRz8PRfz9ZIJHYrZOgNdk@vger.kernel.org
X-Gm-Message-State: AOJu0YypIa//yhi2nqr/TcpLaXl7UDDKbU6y1KvGClKqRl1kdlbYrBp0
	t64XLnrC162rDLfcb8cUxKttENJZ2flAkR0lEsciA2+OTjwua31HYZ0zRn/EEiiAFE8=
X-Gm-Gg: ASbGncsnfSPkcphkUeLx9lYYzMvuUobdyjIIDDIwHJ/PdfIaj73gmJDoAXc9FqHLbw/
	Msk+W4Mo9L3UZEt1kmxtQK7zuJ7vkCXxfBDxEk0iG4SnEEWKT6iNzaixle61dif7pwE8yoxMULI
	s00m3Tgt6P+mBoaIsB8bjaV1mFuGfU8N9H+4OFtHM1BSpeJVPU+ICDwQNek+xeNk60qkH0zeyDr
	CFL/cpmiExr/Aa7Cr9+3SFph1uRqrUyzftYTyg+JJs/QEMdT/hvMqdlp9IjD1LJL5mMAIjGDKUB
	2wHjEiE7Nfxj9Mx+d4XdSfCEnfQ2XIM+6s/AG0N1C5l5wUm8g+QHjlYja/ryUi4e
X-Google-Smtp-Source: AGHT+IHv3gQqi2KGrLMmY+muHOUSeUdjpAlchGCrijYrOZyC7xkIM5MxnnZbED2gjCBOAf36PHITfg==
X-Received: by 2002:a05:6a00:3cce:b0:748:f365:bedd with SMTP id d2e1a72fcca58-74b514c3e92mr8739518b3a.17.1751560045389;
        Thu, 03 Jul 2025 09:27:25 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5ee3:4bef:2dc:d1f7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce4183509sm12029b3a.99.2025.07.03.09.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 09:27:24 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:27:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, afd@ti.com,
	hnagalla@ti.com, b-padhi@ti.com
Cc: Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4] remoteproc: k3-dsp: Fix an error handling path in
 k3_dsp_rproc_probe()
Message-ID: <aGavap5k0qir9x0f@p14s>
References: <f96befca61e7a819c0e955e4ebe40dc8a481619d.1751060507.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f96befca61e7a819c0e955e4ebe40dc8a481619d.1751060507.git.christophe.jaillet@wanadoo.fr>

Andrew, Hari and Beleswar - please test this on your side and get back to me
with the results.

Thanks,
Mathieu

On Fri, Jun 27, 2025 at 11:42:33PM +0200, Christophe JAILLET wrote:
> IF an error occurs after a successful k3_rproc_request_mbox() call,
> mbox_free_channel() should be called to avoid a leak.
> 
> Such a call is missing in the error handing path of k3_dsp_rproc_probe().
> It is also missing both in the error handling path of k3_m4_rproc_probe()
> and in (in-existent) corresponding remove function.
> 
> Switch to managed resources to avoid these leaks and simplify the code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> 
> This is an update of [1].
> The code has been heavily refactored recently with things moved to
> ti_k3_common.c
> 
> This new version also fixes a leak in k3_m4_rproc_probe(). In this file,
> mbox_free_channel() was missing.
> 
> Being very different from the v3, I've removed the previous review tags.
> 
> [1]: https://lore.kernel.org/all/591e219df99da6f02c9d402f7854bc3ab23e76f9.1726328417.git.christophe.jaillet@wanadoo.fr/
> ---
>  drivers/remoteproc/ti_k3_common.c         | 12 +++++++++++-
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 --
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  2 --
>  3 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index d4f20900f33b..7a9c3fb80fec 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -155,6 +155,13 @@ int k3_rproc_release(struct k3_rproc *kproc)
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_release);
>  
> +static void k3_rproc_free_channel(void *data)
> +{
> +	struct k3_rproc *kproc = data;
> +
> +	mbox_free_channel(kproc->mbox);
> +}
> +
>  int k3_rproc_request_mbox(struct rproc *rproc)
>  {
>  	struct k3_rproc *kproc = rproc->priv;
> @@ -173,6 +180,10 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>  		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>  				     "mbox_request_channel failed\n");
>  
> +	ret = devm_add_action_or_reset(dev, k3_rproc_free_channel, kproc);
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * Ping the remote processor, this is only for sanity-sake for now;
>  	 * there is no functional effect whatsoever.
> @@ -183,7 +194,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>  	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
>  	if (ret < 0) {
>  		dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
> -		mbox_free_channel(kproc->mbox);
>  		return ret;
>  	}
>  
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 7a72933bd403..d6ceea6dc920 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -175,8 +175,6 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
>  		if (ret)
>  			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
>  	}
> -
> -	mbox_free_channel(kproc->mbox);
>  }
>  
>  static const struct k3_rproc_mem_data c66_mems[] = {
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index ca5ff280d2dc..04f23295ffc1 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1206,8 +1206,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
>  				return;
>  			}
>  		}
> -
> -		mbox_free_channel(kproc->mbox);
>  	}
>  }
>  
> -- 
> 2.50.0
> 
