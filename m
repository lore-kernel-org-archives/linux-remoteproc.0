Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF0E47F3BD
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 15:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992969; cv=none; b=lRCYM3NBJD6JyNuHClQ3azJVSVZBxamJKi8l8wDqdJEIxSvg1I1RRkZHJ3iNLkJWdYHgkQXPneAC9SLgt7rHgzObUrGXGtySvel5Q/IYHhAQJJB3IaQ3ednsuDvtHkBy0SsWs2TCXCGoVg+QWQU070lJItJJMfHQp72q5XQ6mLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992969; c=relaxed/simple;
	bh=G/yTDQjUpXUiAndufr2TbjEf0lXeUxS0gx4YRbdeiik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X07ddQ53reGp5WYnkaoTjdbxNg3Mj9cLlJmfOSnPpI7m8wkudjRwEb3IUpJXg3B57RG8ISnN+jdkygEJAKFlXnBt3kqxcV0NNLHA8vqrVfOJF/U7ZnK4gEYKclz/10CURiOAVTTfitdfnrrc6Sd/Ww/d219n/+THHIDJF9Y/CIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ehmqjzCd; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ehmqjzCd"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso1633121a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 08:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791992964; x=1792597764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gqCA6kXJkrBzbAXonU3O0GjiWaErukaBxBdWM36b3EQ=;
        b=ehmqjzCdo3jqBkaQheUJxjoWG1dW+JyPoenALYx3gNmIczy/kY8oN3WWhT3e10ehV8
         p9dbIz7jJwX6eiTQv1iJcKYncuFdbFtWbllLHbHRBgXA/Q3sIzIiF5aR2mn1UGyd9hce
         ZPbtkYhshW1QSVeOIWws1uF/PX6FxPLpbYPeOVzKrNFpHV514IDHQxbTMQFxe8bDwEhu
         CNNd67VGZnEmVNiUVXMejZNnMuC0LyRAeS3zRB3GmowNGm4VFJY1DV15/46cb6g9JvAV
         qv3RcqFAte9gCJvwmmM29M3ib1qWlhn96oNlWnqAKSAwtpuS4mxq68xlowGVLJWwZJAt
         GQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992964; x=1792597764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqCA6kXJkrBzbAXonU3O0GjiWaErukaBxBdWM36b3EQ=;
        b=v4cMCrxs+cGDHV2yCuuNjjtmY6AO8aXEnjVA+9UyLr3PYIKY666MztWJa6bVluRoF/
         a7/PLKSX+7QcodoSoAnbrjnVGJv6tqQ+OEKpFSibYDNJca0KK5WkPFJuahn6OCf1T96c
         C7wtPibPonyGNpq8accBEa0RjpIHKjo6ukKFFnReyWUY+cpr0gJ+BjNZA1+Uef+Q2sGw
         jhIo5Gv5s28FvjSQPezot2wZPMY9HJTvdCDtdRqUkhvEtwQpnKQIDsZ9QXtB5sXiBIZL
         6E68LKX9EvdeZtAW6XImbJk2+h3J+J4geY5K9GBFYJy+o7UU9T/Ojbt1Js0Npiam8aq9
         xsug==
X-Forwarded-Encrypted: i=1; AKwUvBz1JeAYj1yQ87z+rnZut3KTD13fNJk1kbagBsma//0mli6tTGI8EIa7hPKe1uDwypnLNbtUi62NQMpYmbnQG/QK@vger.kernel.org
X-Gm-Message-State: AFq9FYLjEA7YOSKoWOGRBGv0jX9vKxItdW/Uy8qz//RsPcl2TJ3L4u2R
	4dvDCdSVjlVSGMYxEeyerRrQlCuzYbfyOvOXMA+7s51ylGlybEOtQkOKSjx/4vEbr9pigGErbTd
	pse+F
X-Gm-Gg: AYBFou1kV6OU1ECViY3tdi3HihDok57bg8dH/uUcAzwfNFPoFUkzWlXo7rks/iyNkaQ
	0Cymo0FoXsgAQWaFOJabgP/MLaIvZQ2gvPAIQCIHqMQppLJ6g1kgVfrd5tU16jwwMNZJLnbG1vF
	cbyNbPjCJ8XuplCF011PKwO2EzK2erp2vqaZicDA8hqUvanlaUKd2fzR5Vh0iFCef685SF7bsjE
	ptc7MQ4fTDJxRpNQLlRvSGwBHFxuHTEuIQjVPSLG23qhUU9P2nHX6F1bHR+kGNcQBj7GeMTqBIU
	NQfF1sDC1GZZ4gK3pdbtStc/M5cJ+VhLBbPVWobtuTaDrrzBeP/atWC1DUKw6lXe3Sqx5ZK25yC
	Bju98RGTlk49JQr4GeVdAYwLfpDdLD0Sj4aVHEUYkQscTk13lpIGExrE8G4a+/G5iTOQXyThq/R
	mHrkiK9MF5ofOSOcoOmhWZTAzx1u7+WGv9n9G18lvjSD4tLV6Rwd4ot1fb7i71cAxGsjzIyqctc
	7HZ3SRcYVKN
X-Received: by 2002:a05:6a21:b98:b0:3de:7dd6:ff8f with SMTP id adf61e73a8af0-3e16be94558mr12412372637.50.1791992963694;
        Wed, 14 Oct 2026 08:49:23 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d009:9564:b54e:1fa2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635cca33bsm7452a12.26.2026.10.14.08.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:49:23 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:49:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Atul Akella <atul.akella@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] rpmsg: virtio: fix error handling in TX buffer wait
Message-ID: <as-kgAyy2oBVP3jr@p14s>
References: <20261013160055.1362-1-atul.akella@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013160055.1362-1-atul.akella@gmail.com>

On Tue, Oct 13, 2026 at 09:30:55PM +0530, Atul Akella wrote:
> The TX buffer wait loop in rpmsg_send_offchannel_raw() ignores the
> possibility of wait_event_interruptible_timeout() returning a
> negative value, which happens when the wait is interrupted by a
> signal. In that case the loop spins back around and re-arms the
> wait instead of propagating the signal, which can stall a task
> that is trying to be killed.
> 
> Separately, on a genuine timeout (return value 0) the function
> returns -ERESTARTSYS, which is reserved for signal-interrupted
> syscalls that the kernel may restart. A timeout is not a signal
> and should not be treated as restartable; return -ETIMEDOUT
> instead.
> 
> Handle both cases explicitly: return err directly when negative,
> and return -ETIMEDOUT on timeout.
> 
> Fixes: bcabbccabffe ("rpmsg: add virtio-based remote processor messaging bus")
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 1b8bb05924af..a32772d6ccbc 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -536,10 +536,13 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  					(msg = get_a_tx_buf(vrp)),
>  					msecs_to_jiffies(15000));
>  
> +		if (err < 0)
> +			return err;
> +
>  		/* timeout ? */
>  		if (!err) {
>  			dev_err(dev, "timeout waiting for a tx buffer\n");
> -			return -ERESTARTSYS;
> +			return -ETIMEDOUT;

Applied.

Thanks,
Mathieu

>  		}
>  	}
>  
> -- 
> 2.51.0.windows.1
> 
