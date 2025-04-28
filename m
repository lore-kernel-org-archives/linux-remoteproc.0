Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517C82CCC0
	for <linux-remoteproc@vger.kernel.org>; Mon, 28 Apr 2025 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858977; cv=none; b=LYsgBn3mka/upp9Afo5eHi/mlR2MkQLPVL0g1tOXfDyeWGi0uT2ooOEoh8LRqRU1Se+K9NugMZruEBvz6amlJDoqEONz5U0CdO6FrrCWlRKQk9qQNJ0ZU2qXBzg8JdUKLsxlO1R6QKkFdJIQYNjpKrEpJz7K/As9SRgyiY8Bvv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858977; c=relaxed/simple;
	bh=OJJ+6bcq7xHuiJnWwZOf89AsHChdipRGp8KVr1g9RHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPExX/ZzSSYCUsEgh7vkJYLxWBJ3NHt0bdG1k6zs3qsOPQWky+jkv8uJSLvhNhb4xvVDAmzkspP2g9KSr0cDnfrM+Uzhimmzb4eLFVLFfeWHYe9KbDDSfzjyPCN8Qv1v02PVecLPk1S+dkLXlF8yq1G7rxyQiYBeIZ9GQwSk+Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NlYg/XK/; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlYg/XK/"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso4204571a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Apr 2025 09:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745858975; x=1746463775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sgUhPrW3pZPMoUmmVNbIH37mhjHyGadhBg8JhGzQp78=;
        b=NlYg/XK/n3RJLtWxUxSIFsvvF8YJgdhfb0An61DDbv8REXYnNaLQ3ZXjFXAntE0M16
         5dteLscL7qn17q0kfcS1TYYICzQCMb8hZTcPQfMCUM+aoKr5OH8uRx+hjru8YKjQTRMI
         /uDI0MNoLP8eVqnv8/PJqYxR60wLvB3ozowxRzYiqPXI0K5UTX8uPbXrf7ehwosAvwfQ
         bEIavg5dV1LLpuX3eBeCjRS0P/7Aw2vxDuIu4ngRBDkEMlarIHrN/4ievm7l7p7nD6YO
         IZCK2uBRnY/8RNqwkCX9l0SOn2j1NuEoQu+pZfIczdzPIKbtdOP1OzwkbqLhz8jp8YhV
         Jfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858975; x=1746463775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgUhPrW3pZPMoUmmVNbIH37mhjHyGadhBg8JhGzQp78=;
        b=jYCLxCo5dzORTmQZXwU68cw4AwLeQEvX8yFL5jfW8aObEUfHTC6m9xpjEprxpU/Nkb
         mSR5jllPmTJDkRuUwr7ixyMu4hDxep9JrAz9KK4ceyJVtEL/5pid/8MF4ifwtCK3RIvy
         VkQTyNeSTZK6UH79oKwaZ2/JYBejzk0GMoZePOGDD887xJ4T9lTuRTaDc0JGAY6JxygK
         1fZr5P7kXAUsH2KhaagnXb7I/PYx+GmE1GA1lne1L2F1d7RQhRrh02XJPqu6wUcQD9Kh
         hUhAYZUgfslRhfC13AIELP2E0SDiya/BCFV8xXdXeqpLUMThf739qSOCjTJwwbk+nhGY
         LBzA==
X-Forwarded-Encrypted: i=1; AJvYcCUBzlZx0WMghMgrIMphXjJ/8DiYUYwxJ1uxyAlpod+RFwcSgkLOnkmx9yHM3LbpGZ61Hf3n/FWno+lER/JgbypK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ZVEoXpbqVuxPl7l920UeeAHN9n/Hkd3bwk07fho1eA0qjIzV
	T69FWht72zNmG+FENCUw/9pJj4bUnKqXOovae1nlXwzMLsDYg6q6+CIF26a5Jl8=
X-Gm-Gg: ASbGncuFrqgxFdtS78B+GgXW1weuVuyfgvdnt9/Dd2B5M65RWCShRG7NG0u7ELOhExq
	QrzqihxUnoYylH1/fE33rYsusqLg709zOpQR2X7rkB/dN8myAlNth52TAcV1yrE1PjG2ZPTo5cI
	y9WznN6HOdgs9Fuiji+/O8ZvxWkzdxYT418ypA5L13MyqX3zqhUAxYN1o1bhx571rBVpwZXO0bq
	lDgYrrTyJPYbNG7FQOnfuY5/9qJW/RksIetO3y5Wl4R7dIZgQDdwha2+SCJfBb/MczeL5mX+T0Q
	nnAOHFp00HdX3HGK9v1jlwMP91/QYxq2MfOSsNpFyloE
X-Google-Smtp-Source: AGHT+IGzMOhPgDfCKAp04nSjoWIJJPOKZvS99BrJ9oTEUG+UpqUfA4eSpR+xL5SbBU/UdauqUlNn0w==
X-Received: by 2002:a17:90b:4d08:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-30a2158ed10mr712782a91.24.1745858975414;
        Mon, 28 Apr 2025 09:49:35 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b816:4cd3:148d:1922])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d4d6sm7467577a91.38.2025.04.28.09.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:49:34 -0700 (PDT)
Date: Mon, 28 Apr 2025 10:49:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
Message-ID: <aA-xnA_zFn8UlTDQ@p14s>
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-2-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426065348.1234391-2-xiaolei.wang@windriver.com>

Hi Xiaolei,

On Sat, Apr 26, 2025 at 02:53:47PM +0800, Xiaolei Wang wrote:
> When rproc->state = RPROC_DETACHED and rproc_attach() is used
> to attach to the remote processor, if rproc_handle_resources()
> returns a failure, the resources allocated by rproc_prepare_device()
> should be released, otherwise the following memory leak will occur.
> 
> Therefore, add imx_rproc_unprepare() to imx_rproc to release the
> memory allocated in imx_rproc_prepare().
> 
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

I have reflected long and hard on this.  The problem with the above approach is
that we do almost the same thing in imx_rproc_prepare() and
rproc_resource_cleanup().  Function rproc_resource_cleanup() is able to deal
with empty lists so I think it is better to fix the "goto" statements in
rproc_attach().  More specifically, replace the "unprepare_device" goto
statement with "clean_up_resources" and get rid of the "unprepare_device" label.  

Please see if that works on your side.  I am good with 2/2 of this series.

Thanks,
Mathieu

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
