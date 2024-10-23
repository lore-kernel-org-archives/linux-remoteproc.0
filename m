Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ABA1BF80C
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Oct 2024 15:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729697531; cv=none; b=FR26PJ3QamnBPqhgo/qFI9Mm0jk+eT1ss6P6QIWVo566AKVcXKoybVa753k4LqBjHRsjrkX3OPOpz3ewdzgZTh+IBS1lCxzNsGnPatZRS4Pv81pKzF6kLS2InVc8yzUe5LatWDh0ySMpvef58IrgBZXedWPvnn5U0BUic3w/Gj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729697531; c=relaxed/simple;
	bh=uJiT7hVx/xahCA0VcyVkbeg7wZqhI1sP4Nlvax/O2s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6ebxRFFfleGrL9HbIdVQiJ/sajbvSrdPQlEYVLr7+uIq4i15D6K1JrpDiz5KGq47+6Ev9sgl8HNe1vNeqWngpEH8YObSd2Z3+jxuQgdm3oOE7dhsl945ifOyXHnmvLeoJBnfXw/FEaGAr9iw4xUVn/QGnpZcL30rJ5RfRfnCkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zBatHdAm; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zBatHdAm"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71eb1d0e3c2so3382677b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Oct 2024 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729697529; x=1730302329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dN8a7fvduKCx2N8X+Fze1sdag/dsDlxBspq41TWyoeg=;
        b=zBatHdAmcVrl714jPyH8NsfKrLQm+5+jgJFbKOH/ZEj5SYskgqXG++lv7n36hu/gO5
         eiCrJZq7cGcSwYOw8uyHgJqeyDkYjE0VbPJ/XMUgBeZEOih3tV2+oNMtAA1WznNRBOmm
         rluRDyLLWJ8rIOYTujaIGgLq283HQrLbLfOvnMowf/JoTjTzmz4eBYU3RAKIYYl6M4mq
         gtJQMnZQ9FK8V6IwioieJ+wIB/4L/vK3f0N4gJQVSbMi558+Sw2g5tEbUh5jZBmOqfCk
         /4/uCKc9/7oKaW7+gPs5AsRbrauqQoqYpIfyP/Y8a4M89uy40cirH9TUUbbF/KHKhbdq
         /Qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697529; x=1730302329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN8a7fvduKCx2N8X+Fze1sdag/dsDlxBspq41TWyoeg=;
        b=OENL48HsTyZLiC7m9wGFZ4c1LY/lfcxSxl35DNps9R14ZEGQxywh2J18I54PEpzp5T
         gCAsav3vYvEXbt7ogL+QYo/VAfehZDtGQdXezqIyieC9B0TWm6fs1WRNJE5x9MitxgH6
         gqZqU8VDLNtz77QYpZUEdlhcirkFN2QBVD/FASpbFYMkm5xa3+94CNRj1/b+sIfrHMrL
         xMlHt+vhzB+/SjAEMFsB28C7sGjDw7epNKGDlw7qtZ87bOp355Wh+u/Yfx4AmH6pfKkH
         VtB8+XTTdQ9tw73GBhwBYNI/akGKIYT+9qHL8dv907Br7a5UNenhGVs/IGEjrezlxypg
         XmoA==
X-Forwarded-Encrypted: i=1; AJvYcCU549ymIlpcz0z0o2gZxp0TvY7Rj8wNbzsw11URGdoD15Sb3GzgGq/Na+ASLuaCLYaK0o/dTO0QxfIYVugBfb8C@vger.kernel.org
X-Gm-Message-State: AOJu0YwQChmQ8NoKktnYcJ7D7FHMOMmCWaTbloQz4/BtVjFaI8PH7VVo
	bZ1sRaon+7Oj9T64ObKRgFyPuAXnQW5LGmDzBA5Gl2Jna17R1RzhNrARfMkWlIA=
X-Google-Smtp-Source: AGHT+IEuMqNTvUaDPURzgubw6rU0RA+n8yh/M6Nh+flur01DK+b9L/ZnZf5Kb+mWgIm3kN/nyflVwg==
X-Received: by 2002:a05:6a20:c901:b0:1cf:3a52:6ad6 with SMTP id adf61e73a8af0-1d978b3daacmr3402937637.24.1729697528716;
        Wed, 23 Oct 2024 08:32:08 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4d51:82be:d1c9:bc03])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1407f19sm6456248b3a.190.2024.10.23.08.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 08:32:08 -0700 (PDT)
Date: Wed, 23 Oct 2024 09:32:05 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	iuliana.prodan@nxp.com, peng.fan@nxp.com,
	Alexandru Lastur <alexandru.lastur@nxp.com>
Subject: Re: [RFC PATCH] remoteproc: core: Add support for predefined
 notifyids
Message-ID: <ZxkW9SUr91PyH9c/@p14s>
References: <20241018110929.1646410-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018110929.1646410-1-daniel.baluta@nxp.com>

Hello Daniel,

On Fri, Oct 18, 2024 at 02:09:29PM +0300, Daniel Baluta wrote:
> Currently we generate notifyids in the linux kernel and override
> those found in rsc_table.
> 
> This doesn't play well with users expecting to use the exact ids
> from rsc_table.
> 
> So, use predefined notifyids found in rsc_table if any. Otherwise,
> let Linux generate the ids as before.
> 
> Keypoint is we also define an invalid notifid as 0xFFFFFFFFU. This
> should be placed as notifids if users want Linux to generate the ids.
> 
> Signed-off-by: Alexandru Lastur <alexandru.lastur@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 14 ++++++++++++--
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f276956f2c5c..9f00fe16da38 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -332,6 +332,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  	int ret, notifyid;
>  	struct rproc_mem_entry *mem;
>  	size_t size;
> +	int start, end;
>  
>  	/* actual size of vring (in bytes) */
>  	size = PAGE_ALIGN(vring_size(rvring->num, rvring->align));
> @@ -363,9 +364,18 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  	/*
>  	 * Assign an rproc-wide unique index for this vring
>  	 * TODO: assign a notifyid for rvdev updates as well
> -	 * TODO: support predefined notifyids (via resource table)
>  	 */
> -	ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
> +
> +	start = 0;
> +	end = 0;
> +
> +	/* use id if specified in rsc table */
> +	if (rsc->vring[i].notifyid != RSC_INVALID_NOTIFYID) {
> +		start = rsc->vring[i].notifyid;
> +		end = start + 1;
> +	}

This will likely introduce a backward compatibility issue where anyone that
has more than one vring and set their notifyids to anything else than 0xFFFFFFFF
in the resource table will see a boot failure.

A while back the openAMP group started discussions on using the configuration
space of a virtio device to enhance device discovery, with exactly this kind of
use case in mind.  I think it is the only way to move forward with this
feature, though it is a big job that requires a lot of community interactions.

Regards,
Mathieu

> +
> +	ret = idr_alloc(&rproc->notifyids, rvring, start, end, GFP_KERNEL);
>  	if (ret < 0) {
>  		dev_err(dev, "idr_alloc failed: %d\n", ret);
>  		return ret;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index b4795698d8c2..98c3e181086e 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -238,6 +238,7 @@ struct fw_rsc_trace {
>  	u8 name[32];
>  } __packed;
>  
> +#define RSC_INVALID_NOTIFYID 0xFFFFFFFFU
>  /**
>   * struct fw_rsc_vdev_vring - vring descriptor entry
>   * @da: device address
> -- 
> 2.43.0
> 
