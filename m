Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FB215350B
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Apr 2024 15:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713800076; cv=none; b=sWXheA8EWJvoa/CzOZYHj3T2M9Zjg86j/CVorvOqnY5Q4lzGhan2UeSqVKgROMdFn3IH3MzDV/ItV7gE9w7CG9EvQHgQXcY4sse4HUknYQA044MrR9kfpf5LMkIsiFZYTnFHfwVjMSgaTDFBN20UdWU5mU8xAm5fwUvVuVZozeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713800076; c=relaxed/simple;
	bh=7rDy8l0sDwyBXfHsO2TUrRhK/INejU/rzcZpBVr/SuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tG65HYmNDv1aD5aodSznO/pnD6W6tQGGdnVn2v/3PPtagP0NsNjgfTbGKgYLHIJqQmMvE0j2Loty9eV54v9aoBJ03u3ykaCpUCZPFWANVbqMpEPBc2AIjGayq9SqiAuiy3JKkmWivV3E4hh8ZSH1XND3Zrh2+0PQMvPFUVc45sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BqEjHHG5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BqEjHHG5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e86d56b3bcso26799605ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Apr 2024 08:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713800075; x=1714404875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=337wBwclmpc6tEt1+i4HX8mw2rCsniBI2t8I+UU3Arc=;
        b=BqEjHHG5uqcOa68JJZfN4kB1DlLzkTymvk7fOpaGwQ/O2SRjvfBVyEMvJ64uj7/JyN
         7PwhFG98P0KAJYZiOrSGb6/X8GtiO1U9/e3t60jdGpBEyGamTiei1HgzoXOQOX9zfiRj
         0hpmNmWoloZsmkGl6I60DG2gKbaMleObLm/w38F7MT0BCfnwNvBDUDiFvNQ6iuGrx5jt
         YZ97NGV++jjMY6wSPBEqkOx5bb8Hd/GxYi5PEKewylMB6itsZhrt+iYD/00pkrok3UaO
         wHuPo3migHuCeNEes25vBV5BFLhDNFMInqDifkJ45XbFvgEV7sEZ9JTNuv6niIBQ1V8+
         Lz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713800075; x=1714404875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=337wBwclmpc6tEt1+i4HX8mw2rCsniBI2t8I+UU3Arc=;
        b=qNxoHNS40Fk4Kjf94JUJuAuOiUd/l1hLpOnGPnV14jsMOZhDI9JzV9pJoZXz+6WEih
         K39/F21FD5Pr1zZmJ0LwJ8O7+BLmj6kz7V2957DU0WloW1TQgy3MBmrcrdIrp+UNColY
         RfjKwBFIxIBORXTbTlGu5BHuy7aUoqsorIm4zxtkNJoG+VdNmtuVSNuAH1F9rA/NMP6R
         D6PWI6h9lrBWfekbrMiRwXUkOhHKnN5R+Ue+5qLI2jVWH4fkOcXw4E4jK0oILeNO6y0i
         SFuisrvIycK7xSZFDOjtCth63lw04rirGjGKyJZOoANwXRs2A9WypxXBqejrpcTlNLif
         skqw==
X-Forwarded-Encrypted: i=1; AJvYcCUcFTnUYdvkTBUmTQefyFOhaWqOhfWK2BmxkHhlmb3HeaMrfAfWd0BUeKNWnSj9ToM9PMTYIkpw0L2OtkzYDBD7exK0OXwkkZ4YtvHSdrRLOg==
X-Gm-Message-State: AOJu0YzEqZOXTYHHYzk5W8r6bzqoxZYnfcdta5WtSJ6oWq7M5JmB+Py8
	ABeTV+pEiTntv91fX9vg09S9TxXhZsF7pQJ8iDeqogXu3Loz0pUf54wRT/iNLNs=
X-Google-Smtp-Source: AGHT+IHe1PTjpEIZG7kkFQ9aDxKVX/PgGZxcewaa3UBNjLsLZf2wJj5hQf8t0zLc6uCo7e7GYLuCKA==
X-Received: by 2002:a17:902:b18e:b0:1e9:668d:a446 with SMTP id s14-20020a170902b18e00b001e9668da446mr5566962plr.20.1713800074608;
        Mon, 22 Apr 2024 08:34:34 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b2a0:f51d:b8f7:33f5])
        by smtp.gmail.com with ESMTPSA id w3-20020a170902e88300b001e2bbe87912sm8273478plg.11.2024.04.22.08.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 08:34:34 -0700 (PDT)
Date: Mon, 22 Apr 2024 09:34:31 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: remoteproc: xlnx: Add Versal and Versal-NET
 support
Message-ID: <ZiaDh7kRnK+qkaZn@p14s>
References: <20240418220125.744322-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418220125.744322-1-tanmay.shah@amd.com>

On Thu, Apr 18, 2024 at 03:01:25PM -0700, Tanmay Shah wrote:
> AMD-Xilinx Versal platform is successor of ZynqMP platform.
> Real-time Processing Unit R5 cluster IP on Versal is same as
> of ZynqMP Platform. Power-domains ids for Versal platform is
> different than ZynqMP.
> 
> AMD-Xilinx Versal-NET platform is successor of Versal platform.
> Versal-NET Real-Time Processing Unit has two clusters and each
> cluster contains dual core ARM Cortex-R52 processors. Each R52
> core is assigned 128KB of TCM memory.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 53 ++++++++-----------------
>  1 file changed, 17 insertions(+), 36 deletions(-)
>

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 7b1c12108bff..a6d8ac7394e7 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -300,36 +300,6 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
>  		dev_warn(dev, "failed to send message\n");
>  }
>  
> -/*
> - * zynqmp_r5_set_mode()
> - *
> - * set RPU cluster and TCM operation mode
> - *
> - * @r5_core: pointer to zynqmp_r5_core type object
> - * @fw_reg_val: value expected by firmware to configure RPU cluster mode
> - * @tcm_mode: value expected by fw to configure TCM mode (lockstep or split)
> - *
> - * Return: 0 for success and < 0 for failure
> - */
> -static int zynqmp_r5_set_mode(struct zynqmp_r5_core *r5_core,
> -			      enum rpu_oper_mode fw_reg_val,
> -			      enum rpu_tcm_comb tcm_mode)
> -{
> -	int ret;
> -
> -	ret = zynqmp_pm_set_rpu_mode(r5_core->pm_domain_id, fw_reg_val);
> -	if (ret < 0) {
> -		dev_err(r5_core->dev, "failed to set RPU mode\n");
> -		return ret;
> -	}
> -
> -	ret = zynqmp_pm_set_tcm_config(r5_core->pm_domain_id, tcm_mode);
> -	if (ret < 0)
> -		dev_err(r5_core->dev, "failed to configure TCM\n");
> -
> -	return ret;
> -}
> -
>  /*
>   * zynqmp_r5_rproc_start()
>   * @rproc: single R5 core's corresponding rproc instance
> @@ -941,7 +911,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  	/* Maintain backward compatibility for zynqmp by using hardcode TCM address. */
>  	if (of_find_property(r5_core->np, "reg", NULL))
>  		ret = zynqmp_r5_get_tcm_node_from_dt(cluster);
> -	else
> +	else if (device_is_compatible(dev, "xlnx,zynqmp-r5fss"))
>  		ret = zynqmp_r5_get_tcm_node(cluster);
>  
>  	if (ret) {
> @@ -960,12 +930,21 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  			return ret;
>  		}
>  
> -		ret = zynqmp_r5_set_mode(r5_core, fw_reg_val, tcm_mode);
> -		if (ret) {
> -			dev_err(dev, "failed to set r5 cluster mode %d, err %d\n",
> -				cluster->mode, ret);
> +		ret = zynqmp_pm_set_rpu_mode(r5_core->pm_domain_id, fw_reg_val);
> +		if (ret < 0) {
> +			dev_err(r5_core->dev, "failed to set RPU mode\n");
>  			return ret;
>  		}
> +
> +		if (of_find_property(dev_of_node(dev), "xlnx,tcm-mode", NULL) ||
> +		    device_is_compatible(dev, "xlnx,zynqmp-r5fss")) {
> +			ret = zynqmp_pm_set_tcm_config(r5_core->pm_domain_id,
> +						       tcm_mode);
> +			if (ret < 0) {
> +				dev_err(r5_core->dev, "failed to configure TCM\n");
> +				return ret;
> +			}
> +		}
>  	}
>  
>  	return 0;
> @@ -1022,7 +1001,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  		ret = of_property_read_u32(dev_node, "xlnx,tcm-mode", (u32 *)&tcm_mode);
>  		if (ret)
>  			return ret;
> -	} else {
> +	} else if (device_is_compatible(dev, "xlnx,zynqmp-r5fss")) {
>  		if (cluster_mode == LOCKSTEP_MODE)
>  			tcm_mode = PM_RPU_TCM_COMB;
>  		else
> @@ -1212,6 +1191,8 @@ static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
>  
>  /* Match table for OF platform binding */
>  static const struct of_device_id zynqmp_r5_remoteproc_match[] = {
> +	{ .compatible = "xlnx,versal-net-r52fss", },
> +	{ .compatible = "xlnx,versal-r5fss", },
>  	{ .compatible = "xlnx,zynqmp-r5fss", },
>  	{ /* end of list */ },
>  };
> 
> base-commit: 912ebe48bec5927e2049e91b0e8a9cc682a709d2
> -- 
> 2.25.1
> 
