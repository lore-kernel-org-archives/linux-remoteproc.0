Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F1E24677D
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 02:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765764672; cv=none; b=ub/1NnHNtk0Pt1bQH4rs/lDTVKwzRMqoCT16M6n6sFt1FFh6O9fvlWa8gf66ZwexbYfl1TMdRx87RaZGYe/C2L16ZRF5AyrVsMvDmE8nAVv1LDzvFl7RuBkBFUtJU6yDJBpThgbQQ7dCmNq6vbbW383aA63LUxNrPIWsqkD5qWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765764672; c=relaxed/simple;
	bh=RQpJgAFNddWw7AyF6f5NtI7ueKumtL9CkbkvTEzcXjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9VSqltB4oebRy6x51fAYImGYYzR0BEDmHkz3SYSistIpkKfcz20iHkopeXLrzwQQTGNHE9JSnJtvJMcw3andOoB/AYfJZemavFd7HwJKnymr5rpQf4FNH3IJ63OSSnRaAg/ZKTrViPly69xygMr3ybQUKrSuFAj39GMgwSz6CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dg6+FjWm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dg6+FjWm"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0b4320665so12959395ad.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 14 Dec 2025 18:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765764668; x=1766369468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgsg75s3qAHMgvIkSidcSt/1Y3c1SrFas1wQzevvAw8=;
        b=dg6+FjWmBM2KLJAucT4cRyf1H/DFgQHWMeFhxDdbm7ZfYseAOYS+csy016zzq3lGvQ
         x2HuJc3nXCxjmcyOtNNwIYLXzE4folJOGlbeYiuL3NC0SVyDhb3+XdMwgN+9DqOW9evD
         MWgDYJI51bbm51NmLxWUmkGqjU5dCsTTljjvVp65n2iPyM45KXzuPN6o2R1Xz4qaBu9H
         vlL2yPPJyp/+9JNEmpfl8HR/myGNgWGkUAtFhKDglV1Aty4nBJDELbxAktZj0P/3SFqQ
         wqaGyBMyakZUfF8fsfrHIZb1SaNe/LSVq3C1GTs4R/d+qpoaqAtk1lS5JE9Zcxnv7sF1
         HnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765764668; x=1766369468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qgsg75s3qAHMgvIkSidcSt/1Y3c1SrFas1wQzevvAw8=;
        b=QouP9Ony5WAhFEulSS4VlprauaKf/7f/nn0uch4UDAOerSucNYOgDy/4RouIGV0MS8
         ELcjzt2FzJTuPndVq/0NP/yFpqt/FSQoAEfM2JuAr8e52nF8XgqDEYI2xwSvlUnpN0a+
         osc3rYAcfR2ShdlJe8a0sYzfREh3oEihCa0PggJP/CntFrTNB0HfUDdnGsAOIw1xsOp6
         W+mnD+xyt9ly9anZZz3IxGlE8OrhSugnWG8cWJd4G0PIbDjGK2cJVUSX/PV62kDySSqV
         G3+EbQmT4qRMRECy4+/unsq8HnqZEimuqljiBh04NKXDbR4lrMG6YuVF2pdEkgYiIK5C
         Q6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCV1uvClLx/jJcAslXK5Yf1OoicYj9LL1i/T4VABw/9Ioz39/PTLEL7SZ+R037kXRQKpBOxzdnc3RFCcj6t/P8Uo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0fBOWf6jOpSxO8bwlvYRGG80b0QUegFY4OQUqXSJUkbrvwZJE
	5reyKKvCwKSkrMEp1rxViLPf9iazYRMiuRyJXSrXi/AoTCElxNnpzNtmX0RuNlaRqVU=
X-Gm-Gg: AY/fxX62PP38AQ9QqbkA+qN/MgyUiJIQkgXsUFPAYCsKwCgEcSxYIQBh2pDImxlkOQJ
	q9jmHjLLFmHEQY3N5YeDWu44UF/6p2E/OZHqaSCi3X8M0AVZmAcieSVHBHhA9s3YuMMPI8ZpwoT
	tv6RjpMBTMTmXxcLWUVU3UGJvUQ1VxK0yodgRMinybea0P2tgY7TmwoCU1WFt+2wiDB30M0Ulpl
	iuRk6dVRqOMXrBOUCRLQd9qdd2soYYf4PHQYUvKwjsNjiE4yQ45jZp0sU0Xzf3bB4bCxqCq2AJe
	j00CIeJNAltYosKUIFNYmuD03vQpCrRvMP7DPa1A0P5FEKnAnpwal+6ImvG8qFjou9PnXe4JyNt
	sV3txToFRAjI6upPmN24ZQAYRNRfqxfHzkcvMxP3K9TWhnbWXPco7dzlIK24SsXI4Sc4pDnDXnk
	UKRg8sT+7baSG5wrB7b3O26QbcFHDU4LsQ0HJkucf7fg==
X-Google-Smtp-Source: AGHT+IFshcXVNij9zJ81B5WuJafD0T1VgLx62XssDHNaTIpACeotR+RQvJl07N2kvTSSjnWlXbJGOA==
X-Received: by 2002:a05:6a20:e210:b0:366:14ac:e1fc with SMTP id adf61e73a8af0-369b0999301mr9246879637.78.1765764667976;
        Sun, 14 Dec 2025 18:11:07 -0800 (PST)
Received: from p14s (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1361b76c4bsm3021918a12.35.2025.12.14.18.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 18:11:07 -0800 (PST)
Date: Sun, 14 Dec 2025 19:11:01 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] remoteproc: imx_dsp_rproc: Skip
 RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
Message-ID: <aT9uNSboYCGK1DYL@p14s>
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>

On Thu, Dec 04, 2025 at 02:28:23PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Firmwares that do not use mailbox communication (e.g., the hello_world
> sample) leave priv->tx_ch as NULL. The current suspend logic
> unconditionally sends RP_MBOX_SUSPEND_SYSTEM, which is invalid without
> an initialized TX channel.
> 
> Detect the no_mailboxes case early and skip sending the suspend
> message. Instead, proceed directly to the runtime PM suspend path,
> which is the correct behavior for firmwares that cannot respond to
> mailbox requests.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
> Changes since v1:
> - Wrapped commit message to 75 characters
> - Changed dev_err to dev_dbg since this case is normal behavior
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

I have applied all 3 patches in this set.  Next time, please consider adding a
cover letter.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5130a35214c9..f51deaacc700 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1242,6 +1242,15 @@ static int imx_dsp_suspend(struct device *dev)
>  	if (rproc->state != RPROC_RUNNING)
>  		goto out;
>  
> +	/*
> +	 * No channel available for sending messages;
> +	 * indicates no mailboxes present, so trigger PM runtime suspend
> +	 */
> +	if (!priv->tx_ch) {
> +		dev_dbg(dev, "No initialized mbox tx channel, suspend directly.\n");
> +		goto out;
> +	}
> +
>  	reinit_completion(&priv->pm_comp);
>  
>  	/* Tell DSP that suspend is happening */
> -- 
> 2.25.1
> 
