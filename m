Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAA632C8B
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Aug 2024 16:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724085173; cv=none; b=hiexg3uLFLb4b9rsubIPBxJ2Ltg/9lFEeGpwMhoKI8+cQmNjpfSymi6okSOTDTJPFgByvNO6a4JNaAzs24z0Mx2subthkS+/rOJcDl7ZEnzh3o7uqHduSyHBXa+TMAmujf+J4GDIqdw+aeLF3xnhYfTIbEPm9m10kmzK48prJo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724085173; c=relaxed/simple;
	bh=K0q193bN5JOax1rhlDmcjYqO+uYhbBCDOeJQcoTxJMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcF4pzohptrOyVI1kxjuyuRvkmhnQPkgj9BjGMUGA79Uizoc5085y8NmVsWwSoaNZ0eCVBCg73g+A4Vcmm6mCPCiW2x9xaxDNx+kv6fGV6iuqa8VncF6OE6J0nN+UNACyh1yVXCe/WM+xvFjeiN4dYD+GPWHw5LX2KQ61+GXs6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dd+MqviX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dd+MqviX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7106e2d0ec1so3133602b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Aug 2024 09:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724085171; x=1724689971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iTLJkDxNCgz7MzPLIVAzrv8NyvHyRZtNC2lGZWfIhOw=;
        b=Dd+MqviXRFih64nkgiaX3qkMWS3vXGDRmSPMzzylkQq2on6Q1zoaKs/sxby2kDGSJ7
         P2whGPurbHvo8d7pxIRrCAdKHQh/cKIt3StUT1XwxkT308f9RuXOWwF2zEd6eNHccg+k
         Kj54F7AdsmDsUGZCDTPsYFTPN2l/IQ3g8EVo7RkKgw2B0o9UARdvz7rSQb9yT1xVdcSk
         IHGTyQvY3gcejB7RgWNQgyWLskz+WqUU/lAAUKt7CzQjwfjiahgOCYVRx8v9Ojwc3gzd
         pSsd30oud5wqVNyKmeGH7ajpaZexlVB+9XHSmKNdrvhaQ2YOBr6TnObyEzKrhT2CwNRu
         QPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724085171; x=1724689971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTLJkDxNCgz7MzPLIVAzrv8NyvHyRZtNC2lGZWfIhOw=;
        b=o30XSKIk3qtNMUD38A5C6vm4SoXOhC2CHlVtVMDCbAn7e8hExj4BEeRSh6lRGZt8eB
         KBFiT5Jl+OIBFGnU0S8DCu9ioEgVliHywiPxrp7KPs9TMQyw89/KdGsHFylc83NjphHD
         gFGP+OEF3oboSVB3aFDJ6fHI2VSXBVtEhKQ5/4I6li+pIdABgwidegN1VEAEazPWDksX
         y8urWZRRQsRps5vQB8/qhaCMPyEAE+p2n6t3wNj2VCC0aJgWeRMzCKSkjcGW0enhArWk
         x4XyWkB4g6QDsMnTaCIGM8DCROSs7Wcm+eJLdNRrar97XozSHNrLdJpVOaSWbhUIuU5y
         oSXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWhjq0RL0knfvS1fh4/0DhJp4lK/Qaex2Al4SmWUG1/kIZgifc0jQ2iuqTEnvpPNl+uzhki8rW17mhA+sM9qal+csxGaIRxCNyPAoCp9AaNA==
X-Gm-Message-State: AOJu0YxsmzizwrXMPa0m7jIZSTXq/qxRMxWmElUhhNjabNUdN+93yGpr
	5LspbDlaYDkjWOv4nCwalUx09ZGGz9+/e3FbAKdiSBNbyI1P7EAh1APMD2bWm6Q=
X-Google-Smtp-Source: AGHT+IGd9BomTOEkHSrU8yURSLWC4Z5e2W/4EhRS2sSRKbSLBn+YZp1LHRiMhzFNnRZa9sIzuHFmgQ==
X-Received: by 2002:a05:6a00:91d9:b0:70d:3354:a194 with SMTP id d2e1a72fcca58-713c4df5f72mr10370415b3a.2.1724085171195;
        Mon, 19 Aug 2024 09:32:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:903:55bf:2534:1807])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add6b3dsm6779761b3a.8.2024.08.19.09.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:32:50 -0700 (PDT)
Date: Mon, 19 Aug 2024 10:32:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: k3-r5: Delay notification of wakeup event
Message-ID: <ZsNzsDByD5okM6Xx@p14s>
References: <20240809060132.308642-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809060132.308642-1-b-padhi@ti.com>

On Fri, Aug 09, 2024 at 11:31:32AM +0530, Beleswar Padhi wrote:
> From: Udit Kumar <u-kumar1@ti.com>
> 
> Few times, core1 was scheduled to boot first before core0, which leads
> to error:
> 
> 'k3_r5_rproc_start: can not start core 1 before core 0'.
> 
> This was happening due to some scheduling between prepare and start
> callback. The probe function waits for event, which is getting
> triggered by prepare callback. To avoid above condition move event
> trigger to start instead of prepare callback.

I can see the race condition.

> 
> Fixes: 61f6f68447ab ("remoteproc: k3-r5: Wait for core0 power-up before powering up core1")
> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
> [ Applied wakeup event trigger only for Split-Mode booted rprocs ]
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 39a47540c590..f1710a61247f 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -464,8 +464,6 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>  			ret);
>  		return ret;
>  	}
> -	core->released_from_reset = true;
> -	wake_up_interruptible(&cluster->core_transition);
>  
>  	/*
>  	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
> @@ -587,6 +585,9 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>  		ret = k3_r5_core_run(core);
>  		if (ret)
>  			goto put_mbox;
> +
> +		core->released_from_reset = true;
> +		wake_up_interruptible(&cluster->core_transition);

This patch doesn't apply due to recent changes made to the k3-r5 driver.  Please
rebase and resubmit.

Thanks,
Mathieu

>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 
