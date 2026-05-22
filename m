Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0C13793C6
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452092; cv=none; b=mguBLoDdtE9zpm6T827EljPu8c2BrUmo0AXbVv5d3SE3DNgX9lJwVJ8m1IlItaUZ7j58vtMpj8XivfMlXxb40v3dE3mIUd17SsdtBWvdj0vxAttvp5595iO2S0mrKOaCfvT7/liS3xPWSkr4LP/dJ3Zf5W3MGQjKWz0dshu0P0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452092; c=relaxed/simple;
	bh=Z7WYvrDcaqVs+7anYHSzDEo0GveQb9WfUn9Sv2ufkrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jArLyjEm3HsTXBCpW5BL8xt/+RDqO78WtRzSF8YU/Zf50WG6oGAsJ77Prdx9InAdF1UGRjSJDUKtWs8QadAZF7Qi7HyBiNK4LDkp0bXUCf0/nGzNOc0igV5HVG41r3RpqfyW7Ro7K7N9okAaQzK4Yf4WaGiUv+DhjJty/33VmeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m0Fsud1G; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m0Fsud1G"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490426d72f7so7042335e9.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779452089; x=1780056889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=90y7x6sel2hIxCCCCElmz6nzXLa/RsMCG0kg8p2DOaI=;
        b=m0Fsud1Gxp0A8SkTR5C0pRKApqBj6JUPahFYoDWh2ptUal5BCx/UXuw2RUloFw91gf
         q3JN5vRkU3sjFH96HQWK5i47SG4xsiaXIzrboaBJvLeXxqDgbV17aA4XwmZf8P25OlzG
         mugxOEsLwPsvFz41oMp7hXimqM9Gta1TNm33zmhkGhjWN4Jl/XbLtuZ8sTALwmqRpMbr
         WfOc0oTzYvEozAusYkjQZBR7uNbNvwUy9/E5ZhQLSLwzpKoz2TVxDYWt2p/QCeCYQeAN
         GaylET7RT/8qNeI0QEY3dbf3FFdGznURXuppwfsrZK1nWaF7cOvU5JYYd5/4oyBU4ad8
         eoqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779452089; x=1780056889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90y7x6sel2hIxCCCCElmz6nzXLa/RsMCG0kg8p2DOaI=;
        b=aSV6KnV+CRIZslpviWL+W4Cx/0KBZOS+sBhJsQg9t8Eh5x+yWtOmXz/mjciZWU9VPG
         V0vUt5YfpYwhUKEE2scVaC3TS6WMmvL1LrJOaXjUgG2/s05FG7WNH2n6wnMMq0KnSs4K
         +fpQRa/oVbb6SZlrUlla/izqKOzaQhFNsYjm8v+P12Hdy6yovyTAH8CnNMOKT8Z9vdB1
         yr4jBU+XK9V1Xf0cU+LM0ebA7mzdOULTpGd7bzWfrrPhoqdJunfTNXQcRVZBIrLi90DX
         NpoaFApW5pBm0mLMqhjK+zto9AvTFwpx5Xw1SroKvHGQXo9jUXwnXYxHrkeAPQ3V2wB0
         oFVw==
X-Forwarded-Encrypted: i=1; AFNElJ+vrOKKSRSyktIsl+xSg7jMcEa1/7jiWSY+APn87BO/AXok4DV/qyk7nhRHQmA3mv4sRNsYJZzoohCPlBKiXyL+@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3/LajnWcMeGi4C2GWkxGu0URkfku/LRt8FBxUPPRMVqhhxFc
	Pa7G/6AI5DNHP9JFfS7uoUWXckxg3+/0PJPOa3LwZFYLEqb/i38CT6d3toSzod3QfzQ=
X-Gm-Gg: Acq92OGCTggq5bPJ5g6F7hhvHVDsl8Y502Cj/PM9WlS1F48GG8rSc+aBLuLPm6vuEjL
	rDPRsX21YuA1Va1ApQNRk4HbwzfhM4DkVCggo+c4zs4iTh/cYXqUDFhV6i7vmD9eVR/t+y+WfhW
	ELX/w4diWnS4k8ITA94VANJ0AiQfkqQxhYWnay/UfiagyXZFRfVPKIiqABQoyAh09Mkn9Uhelpf
	CvCnNTd6egp0JK85/1BplKJElcTzc+1FviE2ViaciyDsGrZ+BFGZhCJk2UStbGBMzJoxBQI+SPc
	fPkbPvSSCuOg2UgMrfYRNdl+EeGtNHuDWgOvCKRF304VB0j7Yev/ThoeBT3jbM9/H37AD8uXnbs
	NrhbBGu1TRHjw1nIp+sYKx3t8oZDqXRzi9Rp7r4Ckfz99NdRoUUu6tu65X5fU2pDEBJqaw/BZ4X
	pJUsGzSoJ+jH56r996a/F6RW5BrXzz
X-Received: by 2002:a05:600c:4ecc:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-490426d190cmr45585095e9.22.1779452088697;
        Fri, 22 May 2026 05:14:48 -0700 (PDT)
Received: from linaro.org ([77.64.147.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527526dsm43297775e9.4.2026.05.22.05.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:14:48 -0700 (PDT)
Date: Fri, 22 May 2026 14:14:46 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] remoteproc: core: Check subdev start status in
 rproc_stop()
Message-ID: <ahBItk6iPQTGaZWT@linaro.org>
References: <20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com>
 <20260519-rproc-attach-issue-v2-2-caa1eaf75081@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-rproc-attach-issue-v2-2-caa1eaf75081@oss.qualcomm.com>

On Tue, May 19, 2026 at 12:20:03AM -0700, Jingyi Wang wrote:
> For rproc that doing attach, rproc_start_subdevices() is called only when
> attach successfully. If rproc_report_crash() is called in the attach
> function, rproc_boot_recovery()->rproc_stop()->rproc_stop_subdevices()->
> glink_subdev_stop() could be called and cause NULL pointer dereference:
> 
>  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
>  Mem abort info:
>  ...
>  pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
>  lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
>  ...
>  Call trace:
>   qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
>   glink_subdev_stop+0x1c/0x30 [qcom_common]
>   rproc_stop+0x58/0x17c
>   rproc_trigger_recovery+0xb0/0x150
>   rproc_crash_handler_work+0xa4/0xc4
>   process_scheduled_works+0x18c/0x2d8
>   worker_thread+0x144/0x280
>   kthread+0x124/0x138
>   ret_from_fork+0x10/0x20
>  Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
>  ---[ end trace 0000000000000000 ]---
> 
> Introduce "subdevs_started" flag to indicate rproc_start_subdevices() has
> been called successfully. Ensure subdevices are only stopped if they have
> been started.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 +++-
>  include/linux/remoteproc.h           | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f02db1113fae..6e23cb11e515 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1308,6 +1308,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  		goto stop_rproc;
>  	}
>  
> +	rproc->subdevs_started = true;
>  	rproc->state = RPROC_RUNNING;
>  
>  	dev_info(dev, "remote processor %s is now up\n", rproc->name);
> @@ -1712,7 +1713,8 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  		return -EINVAL;
>  
>  	/* Stop any subdevices for the remote processor */
> -	rproc_stop_subdevices(rproc, crashed);
> +	if (rproc->subdevs_started)
> +		rproc_stop_subdevices(rproc, crashed);

Thanks, this approach looks better. But where do we clear this flag?
Shouldn't we do that here?

In addition, I think we also need to set subdevs_started = true if
attach succeeds. And clear it when detaching a remoteproc. I think you
just need to update all the callers of rproc_stop_subdevices() and
rproc_start_subdevices(). Or, which is probably simpler, just make the
check directly inside these two functions to cover all users.

Thanks,
Stephan
