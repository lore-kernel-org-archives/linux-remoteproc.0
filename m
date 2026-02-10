Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D275E226D18
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Feb 2026 22:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770760963; cv=pass; b=SEVPS0QttsqQlYg1WYl7PjX3jx/tlwsMABydWFkiqsxXwVFBfSQhs94J2WX53283j7//jFKjpIso6ukiLhYEVfb4BeDvuuV0qlZr8AGc1Y1rdeqDmWO2o6pNv5eKp7OwAL02f6Ns0OrC4cZf3VoyVfT3KNtptQG1IgZ1UANRUVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770760963; c=relaxed/simple;
	bh=Xoj4olL+YiTWgW9zmEIfi+/bzgXNCnIyAh7tU7+vqu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUXBKjrVTXJKdXpXPPs2+YilpVcxNuGjT5qBEpxAyv1RcC1T3e0cbqUMy76/bu/Zp8qN3JuqM/Ra2iesQWKQq3KIXk01YrqGQrmFfSb+ppDsjEzLRgELcDIqnCjkp2RZBJnvsQ7qd4D01fii9WnWULe5uuVOEoAsb4/mMDUhXms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qZ+g3iu0; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZ+g3iu0"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65a26c220b6so1077588a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Feb 2026 14:02:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770760960; cv=none;
        d=google.com; s=arc-20240605;
        b=KWISwiLGuV6pey5u6WLCt6qJT/p0YnPEb8u0i6sTHJbFRKiOJOBEkP5aeXKL0wEfc6
         AiUEXshejXjdoUGi7x81QpGjzjGZkSydTyAaEeVxr9Yu9Mppa/zjitSzfO8+QrrDlSig
         9Aa2dSO5yCNrLGVIT/3pvNXpgWOKxusdPyzB3tw5ifecmHiiJ8mnIp16OFr48zJvQMUh
         iwXpNvPNPlSNcu5nKgNZB+7TLdbyoq4RRo/naCowFsc3+7IhMOodQfJrPVrhKbKiV6ul
         ujB/wTnJSfPaw5auHIagPxVS0k27SB00dfKbGfThUTL1uZoeK7bcdp1KS8LW3oJ2B+o9
         k59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qA7Wxab5lDTDoenQekoOhdDsgl7K+To9SZa88kVTQKs=;
        fh=rqVuii3TJmdXxaKPOKgoIVdxCqeF76Tkef03LYUrJno=;
        b=WVgxWSqZ3596QAx1EKnGFIBwkM1R6PuJ8FdLzrqNUPsT6Vw7POQM4K0j9aouL3bLhx
         oUpz9Z1TpRHvwY6ze6aZncXeocbX6PSrRjP0B7Mj1ecQnxOv3LoefANUaS9iROr+SWpl
         yhjwy1EK1lGODzPfyiuhDk067miOZvswLVa2wzrZq+i2mY2fwhSm+NDlXyNMA9Jq5CXz
         RWHxhljSq51ir0Rq+/dcGaeHhGJ77+kPePWXi3hNZDwGwzsbozCWTXhS7d8I2a4SS1dG
         SDRSPPtwENayqodDQLqn4Hv05g1/wrzl9hnkyg/rU9HBg3fh1yJBeNEIvB1VPQvC7DQJ
         iHBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770760960; x=1771365760; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qA7Wxab5lDTDoenQekoOhdDsgl7K+To9SZa88kVTQKs=;
        b=qZ+g3iu0boCxhyUv40T/x6cb247omZIJTl76ilngkRjqGLTcZ5PuF3PqdaQqtlEyGL
         ML98x5l4A+xmUgnWvTT+SlYqGGdl1PyQMw2EFAMBV47ooQd50GzJ+fbsSWZsM7PXNqBY
         sOq9uOT7hRgv6AB0op3sCTCTPrhrFrIfNQCJ+QOUdzZXCKnCh7FUZRNVH0/uNPY6+2CF
         hIgITFLqTpuMVRQoUtxeAZV0vtI9kciTMVmUKKreU79/cjs9hJHyxRoqZ7na8WLTCAZM
         H+XL4UwfGogTMi/BsAre9LKoi1G+yaou4lE7zyTleAnp98wCeoUvbz/Iirq8EKdTa/95
         sLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770760960; x=1771365760;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA7Wxab5lDTDoenQekoOhdDsgl7K+To9SZa88kVTQKs=;
        b=Q9A7A4bsgySX2/90ufTiyjICI8cApxqhEiMkHa490JAQWBlUcgZ/o657LiHsI7J4B3
         sUcQg3BR8gv06VC9KjLCa7Ogyk9uA867se2TOKzV/eqcNjNo4BU6hdflp15tf94etNKT
         3dczzDDNtKDkw3u9dFHF/QDPYQuNV98nnu3n+2mVgcCVTst+9dnciQyFetP1Pl0vCBdK
         ruLz6hs396TWQgjU+SdTQZd2lw7ZJ8Vr6gGSvyP4UY6WQ0K+GWkyD7VdIoF/FoJOrNYc
         NwPwzBrEKzq4FxG7RVU2dudydR/p51Czl3L2XMBDuCdaX8Sk2fiXiGJxJ8XKGabwae0L
         ukmg==
X-Forwarded-Encrypted: i=1; AJvYcCV/V7u8MGjd97rcSouAdm2QZBF2gA8p6uV9yodNJaTRJw6nFG9pmiV91CJTaLDcymRs8DKsvRcrRfb/fPlvsXwW@vger.kernel.org
X-Gm-Message-State: AOJu0YwYNrYTsLAkmiXtFt/n/DYqVc6ovhEB2FBMvIcwaT7kQaa0t0iG
	i4Q52XRv+zoSvkUz2vYsw66SVcXliCMH2uiro5WZvy+PWuH15V/r6d4qPgbE2kr61ztOD11icz3
	jzECBeGGtsIsdkUX10DSuNTji2BphePVR6/kUeD6Hdw==
X-Gm-Gg: AZuq6aIB2TBUyRF6/v3sq3rePFWal7b33QA3UQAHcQa5KvfOKi5RWZH3q9/UB7mUo8/
	2HLm4EsRB7J7xbnJbcxQ1YyLtiSOfrJAp8QppQ9iSQZPbd1uGnysV3dExnmz4Yt/eCg2wfK47A6
	6enxpylFGr7FzkByjF/gfWIgAL63f3WwBMs8BWoBfS97mhgFZqw6yVe4PxL7l/ZdgV/GQ9hmsDZ
	pB6ec/cifLFDf5LBrmKDxZI+kGtYKbaHbMx7tygqJgs0bY2FIuoUV0zppml7CMOs4HySy1ID4lm
	aco18lVR0+F3IFt6/4rDcoJtL3nBb/i/kZVtZ12h4g==
X-Received: by 2002:a05:6402:2747:b0:659:428f:a6c0 with SMTP id
 4fb4d7f45d1cf-65984195a6dmr8461697a12.20.1770760960108; Tue, 10 Feb 2026
 14:02:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209051407.1467660-1-nichen@iscas.ac.cn>
In-Reply-To: <20260209051407.1467660-1-nichen@iscas.ac.cn>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 10 Feb 2026 15:02:29 -0700
X-Gm-Features: AZwV_QiEwWqMd-kvx6163w8_DnjRXZIR5SwPqJy6RBJlGaVXXNh7W1JAS9Kje6M
Message-ID: <CANLsYkwVL76mt1BcKb8OkMBCH5UzrO_rp9ctuGoN1uo7QmYcgg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Check return value of
 regmap_attach_dev() in imx_rproc_mmio_detect_mode()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: peng.fan@nxp.com, andersson@kernel.org, festevam@gmail.com, 
	frank.li@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, s.hauer@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Feb 2026 at 22:18, Chen Ni <nichen@iscas.ac.cn> wrote:
>
> Add error checking for regmap_attach_dev() call in
> imx_rproc_mmio_detect_mode() function to ensure proper error
> propagation.
>
> Return the value of regmap_attach_dev() if it fails to prevent
> proceeding with an incomplete regmap setup.
>
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
> Changes in v2:
> - Use dev_err() + return ret instead of dev_err_probe()
> ---
>  drivers/remoteproc/imx_rproc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f5f916d67905..75baf905988b 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1007,7 +1007,11 @@ static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
>         }
>
>         priv->regmap = regmap;
> -       regmap_attach_dev(dev, regmap, &config);
> +       ret = regmap_attach_dev(dev, regmap, &config);
> +       if (ret) {
> +               dev_err(dev, "regmap attach failed\n");
> +               return ret;
> +       }
>

I will add this to my tree when the next cycle starts.

Thanks,
Mathieu

>         if (priv->gpr) {
>                 ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
> --
> 2.25.1
>
