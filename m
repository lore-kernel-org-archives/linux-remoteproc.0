Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C130B52E
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Feb 2026 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394215; cv=none; b=jDVB9NNSqGIrJTieqCScp6HdR37Efs0Ul5ekkFd2+159yAJ6vm5IkG/moiNo6UFFCJ1MDMCnZUMb5MOQwPbhMj3GpddxqbaXEyUqHdG0+lOHFT9jRO6af6YmvA1NKCJN8No3PsT+q4Bkr/+jPb87J5WYprepYIjtxZSZEDRqoK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394215; c=relaxed/simple;
	bh=xoUbFm5BTkRiUAzdIjH86j8+cd5U0ieA8XUJf+QV+oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+q/3YcDrhBE2fGfwt2W5pLmKEwyA3mMovcecLVkQfUWJ2mL751FA1HSkXot0FLkdfFJFlrMg8JdAOhYdlN2Rs9MUVpWjvpjDtUMCbut5ulipOBpv4f1h8fgUUaeqLOTOf5etWzNigK6kZCAjLvP7OK++ye0bbENBPBojgrzeKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wqTapAVc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wqTapAVc"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a95de4b5cbso2750955ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Feb 2026 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770394214; x=1770999014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HOEJZRVPudm8f+CgXHv89P8iLoQHtMeP5j8jQ4S4oiM=;
        b=wqTapAVc6K/aAWqwMQtwvOVoQq5ZBn7fXxEhRGpU4U8tMBHORtj086REUi9ZHgByR4
         LYXLKGLaywOc+EyBxIgaIsUaTuIaaMG92maEWS4HAupMtsDMDRYg1q3Ol6oh2wOCc14o
         SL+exANw43PEE/LxjSQzVVtxY4zX7TWNjQHjBX/NycXq1EKdD5FR5rosi0WxblzZ5uw4
         qzSbQuZw6KHJf3/eKRxbvoqbrET01AQxLr3V76Zm89ZoX+0WXBDs+7qVhFvghesIW5Gj
         WLv0lmMT37O2FT6dEsncuFeDwsLjg9QrphNr00EoS+aW/1IaJfKXk2GZxbhVg0OXdS2a
         dAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770394214; x=1770999014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOEJZRVPudm8f+CgXHv89P8iLoQHtMeP5j8jQ4S4oiM=;
        b=eNgoyOwfNlndwpE8UgJO6i1zI+x2aIK04pFc8y4EybysfnhD/LUKN3Q2FtfmKiQ4OE
         onl8fM+avTjDT9c3TinePqZNxkLLMFuxB3SJVYNtxRUNuO5/kklm5IH7JPQq7R5t64Gm
         aVAJQaHNEQlRRD+gw345/7/eis774Ei63ssf2+5W9iC8cL0sMtDjIQkm3BlxCi2tHG3L
         LhnloRDXOINrCKO/AyLPnAg7D7TIg4O95Qqzg8aH8PSDKdaTqlMso1SPnhxCXnm2APhP
         Wdx0dliTJ0wQMKGCFfbNjIQl+0aMFQNv6otcmTL2QlaI5HETyxhQyNQ2J0r0Gm72SeMj
         S94A==
X-Forwarded-Encrypted: i=1; AJvYcCV7boXO/LtlEzkKpI7dklDE82YN9h3fDJpy7SLLPkQMJMhTTygCb3ihqNmsKGKJZC5pxy0cfI3iiqnzU4K/2ddl@vger.kernel.org
X-Gm-Message-State: AOJu0YwYAh+ZCgtYJJvfMhZmTZBFwf5VxfZuLlzo5j6aDYr3tuEozhXh
	5HrMEoNRSGyjtQ5DSZ11ADTzoqeW71OigIJ+9ZHY8D1RwSGAA26HnrcpjuABz8tJDcs=
X-Gm-Gg: AZuq6aJXwSMrgNinzN7ZMP8TRSAUTcglTnKbTl0JBM1eeCgrDMiFIMfE+7DSfXjVpYE
	wHtd/31hxWPP/y+Nn3ZV9ABNj7WmU5diW4gLctzOciM4xXfLMrcjj2YSum5PlG1P5oeEAOVL6Js
	ZegRXii2Of4suD6NCQqF4SwTaKONA5lY0zdJ/gvNQqTEnWfrLvxUDu9wSbWf5C9rzFOWbNwef0q
	DYojHaM4O8pKJBO45Zcjft62nLpvIRetPfxw/74mxTF2rEWFanQ8F56ahFQNiW/3yd6oXq5fSVP
	cbmSas6iELlUgLT4IbPFHS5ksGpk7sWqgryh3Q/eXVMeXc42jzLYkbku+OpE9pgFhqmK6ayuHTt
	f2vvzm02jeLbh3x9QzBSKwZ8wI61GQMitmsL/rYYkNyz78lmMvZyBi1Va/Uh/SPrwZ4D7HWT7lW
	Ng3yxwka5BMJF1
X-Received: by 2002:a17:902:e5ca:b0:2a7:757b:35ad with SMTP id d9443c01a7336-2a95170b352mr36939965ad.42.1770394214292;
        Fri, 06 Feb 2026 08:10:14 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:fa3:e3b4:3597:587a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c722c3sm26045635ad.23.2026.02.06.08.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 08:10:13 -0800 (PST)
Date: Fri, 6 Feb 2026 09:10:11 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Chen Ni <nichen@iscas.ac.cn>,
	"andersson@kernel.org" <andersson@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: imx_rproc: Check return value of
 regmap_attach_dev() in imx_rproc_mmio_detect_mode()
Message-ID: <aYYSY3Rn3702zk3S@p14s>
References: <20260205050905.3031134-1-nichen@iscas.ac.cn>
 <PAXPR04MB8459ABF483274720F6BB23188866A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459ABF483274720F6BB23188866A@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Fri, Feb 06, 2026 at 03:34:41AM +0000, Peng Fan wrote:
> > Subject: [PATCH] remoteproc: imx_rproc: Check return value of
> > regmap_attach_dev() in imx_rproc_mmio_detect_mode()
> > 
> > Add error checking for regmap_attach_dev() call in
> > imx_rproc_mmio_detect_mode() function to ensure proper error
> > propagation.
> > 
> > Return the value of regmap_attach_dev() if it fails to prevent
> > proceeding with an incomplete regmap setup.
> > 
> > Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index f5f916d67905..0e23f519c247
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1007,7 +1007,9 @@ static int
> > imx_rproc_mmio_detect_mode(struct rproc *rproc)
> >  	}
> > 
> >  	priv->regmap = regmap;
> > -	regmap_attach_dev(dev, regmap, &config);
> > +	ret = regmap_attach_dev(dev, regmap, &config);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "regmap attach
> > failed\n");
> 
> 
> In the main probe, there is already dev_err_probe for
> detect_mode. So I would use below style as other error
> return in imx_rproc_mmio_detect_mode():
> dev_err("regmap attach failed\n");
> return ret;
> 
> Let's wait Mathieu's view.
>

I agreew with Peng's assessment.
 
> Regards
> Peng.
> 
> > 
> >  	if (priv->gpr) {
> >  		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
> > --
> > 2.25.1
> > 
> 
