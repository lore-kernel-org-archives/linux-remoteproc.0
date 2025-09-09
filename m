Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C3F224AF3
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Sep 2025 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757434556; cv=none; b=pk94nCNCrkHkfTGZqciMuDQzl/nh4hht55Q/clsVY2dt9A5vBUK9IsbOFRLOM8rR1/M+ByD1wrvTzWv2VUwDsP/4K5cjK2YsxFdSAuF3L2jg0GRyfFaKYeU/57sCr21T2HxVwxPIGnXewRm+sJtFR8hwIJ5R3psscxFiG1lpvUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757434556; c=relaxed/simple;
	bh=7Z15smc22BjF1dnNwqHWT4Q61K0HQySupMCHoRvenSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAMdlHHmM9Ie3kKf87s5L3LLU60ySlhz55n09WA3WLQ9RlxsTnD6Knd2WH61GAdZtyzLYarHnqjYvNU+5pNIVG5ZXpPsk+G4b8jdtabVuH1xcDv8S1Tq8iA5pWTyxwVCwqGRMR2SkuukF/NSj5ebc5/SvzEPtAIwJWAKC0pcHPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I3LwDB0Q; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3LwDB0Q"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4f9d61e7deso3674821a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Sep 2025 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757434554; x=1758039354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UEiPxhZen3QXZAobK2Ga2iD+ttNiESa3yuRWHgPHltc=;
        b=I3LwDB0Qzi0uGuLnQyQtPfVEx9YiDFuI4WQIRjMOdomvaW041DvsHdPmRcYWPu56RG
         U5WvJQ/3gCecxBhH+SmCeXF64KpCJzbREGmTlNEn9fWYyflsXfLLTO5TrlHfChNrTF28
         djwm36YQiqAy2zPCDcoRmb3YeLVsiOn9dtc4VfEhMuG5eDVptuHmT6S/cTZNoy1c9d1r
         E+Ikh42AZPqGbFdY5hoJQj34w0ghNTG0UAzhmbwIsP/Ckg3JKdorzn5/jJZ8wbX/WaX2
         fCGHrSX4XFGxaJRvuisjfY65oPFniU+PylvX1UIz2VsasuSL1N5PLz56UGTqVXFANUPN
         /86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757434554; x=1758039354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEiPxhZen3QXZAobK2Ga2iD+ttNiESa3yuRWHgPHltc=;
        b=ld+2su+N99uZGbID9jWdneRyrdssXPiOKESK1rV0tz1gnuE2DFRo7K/wskWzQJnTAn
         qcR/2n05W15/RgvjJA9ij8IAxXf5ihdnvYfAtkPdDwYH8tH0aNJHFRcB5K+CXhlp31go
         roOqIF+4RnQt9CAxF45J7M91S7OvsGqlf4ILhjxBNGA0m1ke/gZEvj0a+sJ7B04eobjY
         Xgj1roDS3jShtofPQXp+IMC11ZtuVo9ubgrUIpnAYeUR2AikF2kT+QuWrUVqOMLquly5
         amoyY9Ve2zaRxsUC3D0VyHYUd2K7wA929O2oihzzTu6sHwVzYICzhIWKA6BCt0Yu5axs
         DjwA==
X-Forwarded-Encrypted: i=1; AJvYcCVwalJNlSATzY8SRL6OuZwpM9PQvsAoNCJeK8nzzX7jEPxfkJ02+Nyt04/L7/uPW1T5lJ0Y9g0LBGrnXKanB4Ol@vger.kernel.org
X-Gm-Message-State: AOJu0YzmPGrwtrD/PbGhHLQYyam97agEJ08JmQdXuYdeEZ/Nu3rJYjBR
	fn/FPw2Aby1WgzwgRG/2q6asq1whydyw4nDEt1FJTyewa8XX7ZHIC9IFf9JGUohzQ6c=
X-Gm-Gg: ASbGncu6uMkWFsWdgdk/9tREKzxIWQdlrZ7ags/tM6iW4QDcb6QPk3sC1ZyJb4wQfha
	29PmSn5SYS/RN6RC/FqV35ogq0LkMvgB8b2p5O6nZ+SRJK/izdo+r84fAX2M/qiQT8n2oANMUrn
	rAUQo+Vlg1xAhxh590/3HH+/mSovb8ibG5tICeMl4UWfzLGiGNLDy0DA1l+mfd0qI+Iw1MRrPyx
	8a8sm1RqZj9ui7X3KCx4hDckV4OrIls82oeExFfwp+SvNdQdQ84kKxpwudlxFhfBavc87ub+AHi
	0fw+/M9k7cMXk04x3kXHm59XPIjfu+1i1PyxJrSUOOQpI2INErvg64JpxgOFnJpuwTD4bZ/hitb
	WF+JDQGl2S0KY+ZrPBHA2zKrtxQlmY5dc1O15qd7+L3H1eXvZu/r8z3Ym21znejdG2CZjOyyDNR
	xtIiqUItwXahJ6puWxEKJt5u9FuLvK04hkYLo=
X-Google-Smtp-Source: AGHT+IH55jBXQuGrRFWB7QFDwp0aHH2LNHjhqhfqYbAFcay2HL31leHRvKu+CE2zXWHS10Yrl/LklQ==
X-Received: by 2002:a17:902:e884:b0:248:811e:f873 with SMTP id d9443c01a7336-25170f37b15mr169800035ad.36.1757434554322;
        Tue, 09 Sep 2025 09:15:54 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e31e:18ea:d6c1:d90e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27def96esm2062685ad.55.2025.09.09.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 09:15:53 -0700 (PDT)
Date: Tue, 9 Sep 2025 10:15:50 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Message-ID: <aMBStih6Wi_isn2N@p14s>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
 <20250908-imx-rproc-cleanup-v1-6-e838cb14436c@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-imx-rproc-cleanup-v1-6-e838cb14436c@nxp.com>

On Mon, Sep 08, 2025 at 09:07:39PM +0800, Peng Fan wrote:
> With the switch-case in imx_rproc_{start,stop}{} removed, simplify
> the code logic by removing 'goto'. The last switch-case in
> imx_rproc_detect_mode() are no longer needed and can be removed.
> 
> This cleanup improves code readability and aligns with the new ops-based
> design.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 25 +++++++------------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 5fa729f4286f6ac939357c32fef41d7d97e5f860..ed8395b097d07d02e5323550ff497819f9b95ad6 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -323,14 +323,11 @@ static int imx_rproc_start(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>  
> -	if (dcfg->ops && dcfg->ops->start) {
> +	if (dcfg->ops && dcfg->ops->start)
>  		ret = dcfg->ops->start(rproc);
> -		goto start_ret;
> -	}
> -
> -	return -EOPNOTSUPP;
> +	else
> +		return -EOPNOTSUPP;


Here I would simply refactor this to:

        if (!dcfg->ops || !dcfg->ops_start)
                return -EONOTSUPP;

Otherwise this patchset is going in the right direction.

Thanks,
Mathieu

>  
> -start_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
>  
> @@ -380,14 +377,11 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> -	if (dcfg->ops && dcfg->ops->stop) {
> +	if (dcfg->ops && dcfg->ops->stop)
>  		ret = dcfg->ops->stop(rproc);
> -		goto stop_ret;
> -	}
> -
> -	return -EOPNOTSUPP;
> +	else
> +		return -EOPNOTSUPP;
>  
> -stop_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to stop remote core\n");
>  	else
> @@ -1000,13 +994,8 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	if (dcfg->ops && dcfg->ops->detect_mode)
>  		return dcfg->ops->detect_mode(priv->rproc);
>  
> -	switch (dcfg->method) {
> -	case IMX_RPROC_NONE:
> +	if (dcfg->method == IMX_RPROC_NONE)
>  		priv->rproc->state = RPROC_DETACHED;
> -		return 0;
> -	default:
> -		break;
> -	}
>  
>  	return 0;
>  }
> 
> -- 
> 2.37.1
> 
