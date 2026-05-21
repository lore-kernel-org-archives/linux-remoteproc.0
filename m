Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C693CB2CF
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779385721; cv=none; b=GFhmT7eP54OFsp2XIgJXsqyOKtANsaU7Bp86+WojwspbNJrawUjRYALgqOzEcv49uCmKHpwVmBegmEmzLs62G0f8m8Wh47agR/KrnqwIIRIxfoeA6m/5vu1shRPTq9pg37V3lKwv5x2abglPCO8jmJOHc+SYNYJCGicZ9MXsjMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779385721; c=relaxed/simple;
	bh=7y59o9o0M7WwtNmzO+DTpfwElq6b8BxXxcgrWPNx/w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzDahaNt0jk51ZuoWtB1NcxREBf1l4qixXX7GAngoBzzmiiVBj6pdJbJvBU0kfyyklYuO8mTX24KiMjiH/Ywuz3U3pgn+jPJrAUmuPwao6tSw0iU8DNvQ3zGFuxJ0MqMOYHkUMUqq95fuW05p/1AlUV/04RKUueliB9xcukJAsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLzbKhjU; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLzbKhjU"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c802803ac17so2823545a12.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 10:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779385717; x=1779990517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WiN/SkcIQjWbum7/p7uPRaQeyYXLwJ51hfK20HisxH0=;
        b=SLzbKhjUWkZOfplG4kV8tuBEB5EJSJ9VzDzPvKDtUVNui7oyiBIS2lSZ3AlOU+dtQf
         qmQlFCv/7/6PpwnVtZkvvoLktxR4mUBnT+UoNMFxDzpua5vYmoiIQMNEamyoWLDwp3qD
         ErG4nYtDzW0QtkaS3Wfdfvie1b+5WG8Lmyuu3zFDjeGzTwgH6wvz7hQBj+qNKab0iSmJ
         5YYVxNWbMrBMZ/vmkHzbtyiLpoq5OC/lsRQGix3a/sFrNVSRPND6MuJ6/VefdCH52lvb
         HpJBW58znVGTpKBM1XVe9jWkW6ZOv0jHsdFrb0/pbGxtHROchp95ioFre7OG864xUiMx
         krdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385717; x=1779990517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiN/SkcIQjWbum7/p7uPRaQeyYXLwJ51hfK20HisxH0=;
        b=A8GYaBHIVd1mFJ3ybjlV7l77fRBk9ucD2eengFZZVYarJ4G8Kk38TlrA+zEOMYDMOe
         cng+xeOXFNQTpHawiJ0UXr582VGE/NSMvO1veR1ZoOG96pGvYuGDrhPv1yy6dw+ETDkA
         373MChP+XBfFLUXslt+spq8idELR7zsJuVidSvHsrOMDNyClyrahte8/+ipa2rqMLQj8
         dnsddWdTZABJtBTRlygfU+SZ8PyRvNDQ+gEGV6kSYgWxYz0mCkH4SuXIPgBn0jxJTRmf
         9nLHzF3777HNMq9GMkzAN9RLgJDRDhSXs/oBQNPzCxB2HUcpM1+UD2PgzoyblpcHdIrr
         cYbw==
X-Forwarded-Encrypted: i=1; AFNElJ+MKXJflCAHrgS0T9HlzkhSLIEUxubP1zxFlGHQ+8eRA2bescXRyQBxL4EcaDVFLJ71XLU41B7Ck8andvTpZKSG@vger.kernel.org
X-Gm-Message-State: AOJu0YwAyXv7n+f84pv3fkUaEZQ7pby3Z1MYEnWg/tc2Mf1mmOXIWC5f
	ur4ocpLUn4Uzyn/7BtautCjVpPmcaWBH4qMEDXQKaQbQhl0Uqd9ZYhCGTnOEALOZB7Y=
X-Gm-Gg: Acq92OHoF67ToqEcA4uk/aAVc7JQnajIN4chJCMEl6e+B3MfxKC1HNT6S4UdGhs4zkA
	8Dh8FJqYEtwYkIwXZ9DojSluJL+/Wchlg3U35nRN8s8qCPdkwi7AVw6wdWQx3fIO6LrBRAFrWek
	8RQaZ9VnW53+0agZhKyfP8tWS56ffi+8OjkiuNjF/cpUTw4jwNEyNDfpR7+sBQ8giD10lAoVzKN
	pti03dBwqHtwQ2/zHcOvF97y0XYvfQ7RbI5fCFQJLPiZdSdocZ3Zda3iqwVgeDlgxNU24sG3rD6
	Rg8uxKm9dtAEeyYIMV1fyHiuY83iT48nmsrRHWoTCM0qC/HgM2WZ7k+hHQKxgLhCwmCWfBsxBne
	2mT/qT2TriiDtEOY2TqqRmXdKEz+6l2IepXyA88Z2GJwf+IoD/Bl85OU/nGUF+h3qGiO8kZckWH
	jGmBFh97VAG5A9ezc9rdS8j7ssRBY=
X-Received: by 2002:a05:6a20:7491:b0:3a0:bc61:62e5 with SMTP id adf61e73a8af0-3b30883a17bmr4801497637.44.1779385716400;
        Thu, 21 May 2026 10:48:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7ba6:1f4c:9869:500c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85197ef536sm952270a12.8.2026.05.21.10.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:48:35 -0700 (PDT)
Date: Thu, 21 May 2026 11:48:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com, ben.levinsky@amd.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: xlnx: enable auto boot feature
Message-ID: <ag9FcXeIIiJWdld7@p14s>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-3-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501143707.1591110-3-tanmay.shah@amd.com>

Good morning,

I don't recal reviewing the first revision of this set.  Can you provide a link
to it so that I can read the comments that were provided?

On Fri, May 01, 2026 at 07:37:07AM -0700, Tanmay Shah wrote:
> remoteproc framework has capability to start (or attach to) the remote

The remoteproc framework...

> processor automatically if auto boot flag is set by the driver during
> probe. If remote core is not started before the Linux boot, and linux is
> expected to start the remote core then it uses "firmware-name" property
> to load default firmware during auto boot.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 48 +++++++++++++++++--------
>  1 file changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 45a62cb98072..652030f9cea2 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -899,17 +899,18 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  };
>  
>  /**
> - * zynqmp_r5_add_rproc_core() - Add core data to framework.
> - * Allocate and add struct rproc object for each r5f core
> + * zynqmp_r5_alloc_rproc_core() - alloc rproc core data structure
> + * Allocate struct rproc object for each r5f core
>   * This is called for each individual r5f core
>   *
>   * @cdev: Device node of each r5 core
>   *
>   * Return: zynqmp_r5_core object for success else error code pointer
>   */
> -static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> +static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)

Why is there a need to change the function's name?

>  {
>  	struct zynqmp_r5_core *r5_core;
> +	const char *fw_name = NULL;
>  	struct rproc *r5_rproc;
>  	int ret;
>  
> @@ -918,10 +919,15 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
> +	if (ret < 0 && ret != -EINVAL)
> +		return ERR_PTR(dev_err_probe(cdev, ret,
> +					     "failed to parse firmware-name\n"));
> +
>  	/* Allocate remoteproc instance */
>  	r5_rproc = rproc_alloc(cdev, dev_name(cdev),
>  			       &zynqmp_r5_rproc_ops,
> -			       NULL, sizeof(struct zynqmp_r5_core));
> +			       fw_name, sizeof(struct zynqmp_r5_core));
>  	if (!r5_rproc) {
>  		dev_err(cdev, "failed to allocate memory for rproc instance\n");
>  		return ERR_PTR(-ENOMEM);
> @@ -932,6 +938,11 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  	r5_rproc->recovery_disabled = true;
>  	r5_rproc->has_iommu = false;
>  	r5_rproc->auto_boot = false;
> +
> +	/* attempt to boot automatically if the firmware-name is provided */
> +	if (fw_name)
> +		r5_rproc->auto_boot = true;
> +

What happens when a firmware name needs to be provided in the DT but you don't
want to automatically boot the remote processor?

>  	r5_core = r5_rproc->priv;
>  	r5_core->dev = cdev;
>  	r5_core->np = dev_of_node(cdev);
> @@ -941,13 +952,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  		goto free_rproc;
>  	}
>  
> -	/* Add R5 remoteproc core */
> -	ret = rproc_add(r5_rproc);
> -	if (ret) {
> -		dev_err(cdev, "failed to add r5 remoteproc\n");
> -		goto free_rproc;
> -	}
> -

I'm not sure why there is a need to move this to zynqmp_r5_cluster_init()?  Is
it simply to make the error path easier to handle?  If so, please do that in a
separate patch.

>  	r5_core->rproc = r5_rproc;
>  	return r5_core;
>  
> @@ -1280,6 +1284,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  			if (zynqmp_r5_get_rsc_table_va(r5_core))
>  				dev_dbg(r5_core->dev, "rsc tbl not found\n");
>  			r5_core->rproc->state = RPROC_DETACHED;
> +			r5_core->rproc->auto_boot = true;

I thought this was done in zynqmp_r5_add_rproc_core() - what am I missing?

Thanks,
Mathieu

>  		}
>  	}
>  
> @@ -1304,7 +1309,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  	enum rpu_oper_mode fw_reg_val;
>  	struct device **child_devs;
>  	enum rpu_tcm_comb tcm_mode;
> -	int core_count, ret, i;
> +	int core_count, ret, i, j;
>  	struct mbox_info *ipi;
>  
>  	ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
> @@ -1390,7 +1395,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  		child_devs[i] = &child_pdev->dev;
>  
>  		/* create and add remoteproc instance of type struct rproc */
> -		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
> +		r5_cores[i] = zynqmp_r5_alloc_rproc_core(&child_pdev->dev);
>  		if (IS_ERR(r5_cores[i])) {
>  			ret = PTR_ERR(r5_cores[i]);
>  			r5_cores[i] = NULL;
> @@ -1435,16 +1440,31 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  		goto release_r5_cores;
>  	}
>  
> +	for (j = 0; j < cluster->core_count; j++) {
> +		/* Add R5 remoteproc core */
> +		ret = rproc_add(r5_cores[j]->rproc);
> +		if (ret) {
> +			dev_err_probe(r5_cores[j]->dev, ret,
> +				      "failed to add remoteproc\n");
> +			goto delete_r5_cores;
> +		}
> +	}
> +
>  	kfree(child_devs);
>  	return 0;
>  
> +delete_r5_cores:
> +	i = core_count - 1;
> +	/* delete previous added rproc */
> +	while (--j >= 0)
> +		rproc_del(r5_cores[j]->rproc);
> +
>  release_r5_cores:
>  	while (i >= 0) {
>  		put_device(child_devs[i]);
>  		if (r5_cores[i]) {
>  			zynqmp_r5_free_mbox(r5_cores[i]->ipi);
>  			of_reserved_mem_device_release(r5_cores[i]->dev);
> -			rproc_del(r5_cores[i]->rproc);
>  			rproc_free(r5_cores[i]->rproc);
>  		}
>  		i--;
> -- 
> 2.34.1
> 
