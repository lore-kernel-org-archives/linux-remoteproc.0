Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4484A59162
	for <linux-remoteproc@vger.kernel.org>; Tue, 11 Jun 2024 17:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128706; cv=none; b=hUP4klpxXBOGUn5kimeAm0Ul6tTw2usu2o7apVBDLIrGP07n0h+/5fNZKZFrxvMAyxcgcTMpZkCiFEVdlGYnucCpCjnPBYPSfLL3HPy6rOjdcCVQiK4DHpNBQTgZW6+xFn0Kaji76zWaUxxBrNuL9thWaT+I1tOFCOEdgiPu+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128706; c=relaxed/simple;
	bh=CR0Oj0XOoZ7y22JghqczjZrf/GTITEydKBz1s5DymH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJKMk7msDTNy4oDgqYmcGq7Yg6opncqlgAB+Y+Il/0+s2s51Q+iAe6XCJ6V4nHMH187BZT+VCyszAGCEzFEQVpK0J4LgHMHs6C7dbvxMsmcUwvQHITJKupZBF/kQ5c3Ll+mKVzBywMlQ3dvZco2DosXJQeLs/q/3eVVhTCteygg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QEbshTHg; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QEbshTHg"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-704261a1f67so1495863b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Jun 2024 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718128704; x=1718733504; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1mU4E5MR7G8MdpFb909SPM49zIumrpDBhQvKM4R8Il0=;
        b=QEbshTHgnRoRzO62I5ZjBteygGo7Ma9Rv7YYUkIDX8V5NMAGcQ6hgWBEh4FCK+PTpo
         Wr0vC1IvsvxX7L7jqgdY0qsneRjX/xAXvnRXSr2JWasK75fOOFIf2QczxOn5m5KM/xxT
         Wdn0Tk5qzg7mFR7F/IpMovSvZirwySfPrDjbBtlnsx/VThHsJEouCqGFjPD5sQNAsNVs
         VdwYE/ls6VMOpYjbcE4Zy6uvVg3txsVOuWzKxnjtifQ/Z7PdeIsXS/4ZZdQ6atYnRsRy
         I05t+0/UwWVR/YDqWsm4lFWfii0Icb6mT69BVKr/PHGjlH3xVlwdveOI+QyWFE9bGHVR
         Tqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718128704; x=1718733504;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mU4E5MR7G8MdpFb909SPM49zIumrpDBhQvKM4R8Il0=;
        b=qOlemowH674GhlbuwibiWZ3fg6M4/GxRzlPvXHtDP1a8BG8p6oJhQzaPmpaThAwrN2
         ipBqRcpesvxTTmcKskBjI42CD8/+dwVIcFsJ4qSMFQIiFBZDgvpf3aP2F4LQpSncpeq/
         8ZWfs2Wf2S6P2DlvcnRgdmLP3QygeQIvsByof7Q98UM0amusO0bmZualDkp13q0Slzr8
         o4LuDX0VOc+t3P+egDnmIqcLuVTThyhBBIbnJ37hdsc7yYpu5Qj56MT1h0IULxgfVos5
         MWvP2PpBO178d3DwQxVtMTe6Klzt4aodDCBO3mbOYeoED73YkEdNuOJaDjZD9FeTSfqB
         G0Cg==
X-Forwarded-Encrypted: i=1; AJvYcCV/vLOLKFlPVXIGulSA9sm6tGCyu1VkJa/vR19H5ci/v/iURWmYUVyAWBUGlxuboC3wZiqFVXMmt5eUhc5fZKTTB1xzd3kmZuey5pp5Bt0G0A==
X-Gm-Message-State: AOJu0Yy+0hLbJLCJirZBjRi7SJx2UbWwlUSKgx3p7N4jrgYpEV4H8hvy
	Op/F/Wo7nW0bw8CDQJYbjkEeyvJ6I8xXcD8kZXnumDvDnsKxy+mON5To+84jFP0=
X-Google-Smtp-Source: AGHT+IGV99rF9+F+Cf1PyBfibxQMwpPQeXSdH+G1wwDCeMYhzDOe4MWoLKpCLo8WlpBJQZWUdPTHOg==
X-Received: by 2002:a05:6a00:cc5:b0:705:964e:d9f3 with SMTP id d2e1a72fcca58-705964ee540mr7310001b3a.11.1718128704355;
        Tue, 11 Jun 2024 10:58:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:74af:2f2d:5f50:e6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd512e3esm8763123b3a.201.2024.06.11.10.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 10:58:23 -0700 (PDT)
Date: Tue, 11 Jun 2024 11:58:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] remoteproc: da8xx: Use devm action to release
 reserved memory
Message-ID: <ZmiQPSvdkGzt6/sB@p14s>
References: <20240610151721.189472-1-afd@ti.com>
 <20240610151721.189472-5-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240610151721.189472-5-afd@ti.com>

Hi Andrew,

On Mon, Jun 10, 2024 at 10:17:20AM -0500, Andrew Davis wrote:
> This helps prevent mistakes like freeing out of order in cleanup functions
> and forgetting to free on error paths.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/remoteproc/da8xx_remoteproc.c | 29 +++++++++++++--------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index c8b7576937733..1ce91516fc6e5 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -233,6 +233,13 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static void da8xx_rproc_mem_release(void *data)
> +{
> +	struct device *dev = data;
> +
> +	of_reserved_mem_device_release(dev);
> +}
> +
>  static int da8xx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -293,14 +300,13 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  				ret);
>  			return ret;
>  		}
> +		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
>  	}
>  
>  	rproc = devm_rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,
>  				 sizeof(*drproc));
> -	if (!rproc) {
> -		ret = -ENOMEM;
> -		goto free_mem;
> -	}
> +	if (!rproc)
> +		return -ENOMEM;
>  
>  	/* error recovery is not supported at present */
>  	rproc->recovery_disabled = true;
> @@ -313,7 +319,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  
>  	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
>  	if (ret)
> -		goto free_mem;
> +		return ret;
>  
>  	platform_set_drvdata(pdev, rproc);
>  
> @@ -323,7 +329,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  					rproc);
>  	if (ret) {
>  		dev_err(dev, "devm_request_threaded_irq error: %d\n", ret);
> -		goto free_mem;
> +		return ret;
>  	}
>  
>  	/*
> @@ -333,7 +339,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  	 */
>  	ret = reset_control_assert(dsp_reset);
>  	if (ret)
> -		goto free_mem;
> +		return ret;
>  
>  	drproc->chipsig = chipsig;
>  	drproc->bootreg = bootreg;
> @@ -344,15 +350,10 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed: %d\n", ret);
> -		goto free_mem;
> +		return ret;
>  	}
>  
>  	return 0;
> -
> -free_mem:
> -	if (dev->of_node)
> -		of_reserved_mem_device_release(dev);
> -	return ret;
>  }
>  
>  static void da8xx_rproc_remove(struct platform_device *pdev)
> @@ -369,8 +370,6 @@ static void da8xx_rproc_remove(struct platform_device *pdev)
>  	disable_irq(drproc->irq);
>  
>  	rproc_del(rproc);
> -	if (dev->of_node)
> -		of_reserved_mem_device_release(dev);


This patch gives me the following compilation warning:

  CC      kernel/module/main.o
  CC      drivers/remoteproc/da8xx_remoteproc.o
  AR      drivers/base/firmware_loader/built-in.a
  AR      drivers/base/built-in.a
remoteproc/kernel/drivers/remoteproc/da8xx_remoteproc.c: In function ‘da8xx_rproc_remove’:
remoteproc/kernel/drivers/remoteproc/da8xx_remoteproc.c:363:24: warning: unused variable ‘dev’ [-Wunused-variable]
  363 |         struct device *dev = &pdev->dev;
      |                        ^~~
  AR      drivers/remoteproc/built-in.a

which is then fixed in the following patch with the introduction of
devm_rproc_add().  I suggest doing the opposite, i.e introduce devm_rproc_add()
and then get rid of da8xx_rproc_remove() by introducing
da8xx_rproc_mem_release().

No need to resend the omap set, I have them.

Thanks,
Mathieu

>  }
>  
>  static const struct of_device_id davinci_rproc_of_match[] __maybe_unused = {
> -- 
> 2.39.2
> 
