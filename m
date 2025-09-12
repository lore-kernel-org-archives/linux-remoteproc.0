Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A07D313E0A
	for <linux-remoteproc@vger.kernel.org>; Fri, 12 Sep 2025 14:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686490; cv=none; b=Jj/wU36t5avIHvk/wb8MDyapfP0wzufc7jH8iCK7mTh6Rnder5A2dwx89KBU1WS6Nskzwz/HH7nEe1eAtA3mJLeiG06QLqHe0dU3jLST7fFHcUPlK3l2u+JWVLgWBRxC0QUEL3QlgmxfOAecbLl5wQW/bmjaSRm4hOuc1LApIJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686490; c=relaxed/simple;
	bh=9sLEUiKxs4kaq/+VDmR5+jYAXaH2kN70zH8R7UU9LhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnF5GM5F78UlwQ4pdm+oAGE9+Ap0YqpoyHM9r6ryoF5kxsBBxuLQWYwiDRO21Du3bJLLGCNxSrPZEEkIlhOV1SkoTg5+Zhlb1b9PY5s/UUteAp1N3Di4PkPF/XnQYfQ+hlLTd9CxnzpsOEeaya0yotsPAKaEx42ZyZCCllCv8dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y7erqBjg; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y7erqBjg"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24cdd95c422so12789425ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Sep 2025 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757686488; x=1758291288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KGHsIb+AKMqGJwrQY3RDFxGfsX+pej5gKpzkWT00FLc=;
        b=Y7erqBjgyfxCjtd1qGzlxnU5oJsSa4wkaXB9XUxMTJLWjRfd3XsLsZhJWdFhm6O0n1
         YzycUNRaPCpuwbeHVNxi7RzozIC9mhgXDUZB4cjhbVzQ1VZ4XjBlnqmRQx91dX0n7Kl3
         kNttUnPFXDNW+8Y0G6TSQ7onSaB9A/8AV8OImG45+WCJYh1otwWD0f6YeGczlUoshhCM
         zZloA1hCevk/mfZUnC+TJk+/pddDORt6afIc/n4gEyStmSzJF++BHY64d0oZwMR5xqmD
         49zoEu294Hu/WcUJM1RRgmEX4NhyNu1pyN9DAO3IL7nDwiaCsChLTKw8dVJCy1lZDNol
         g4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686488; x=1758291288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGHsIb+AKMqGJwrQY3RDFxGfsX+pej5gKpzkWT00FLc=;
        b=l5+RrxK8iMOIsPuc22ZuzKfUl+zk8FRnnTWHOKspguFvcQqF3TJ0rrv50uDja51WLY
         LgfEfJTG1bIVwWhQlpltfZ6mZQdfqxm6/18pcM7T/PqmVRkz6BFJ9yXRf/49xFW3nKe0
         lQ9+Mv4T9URnu0hJM6wJK9j0F+dIp4rIdppjGrkYKTQSSFmuSXQito3OyN6LrBDlHirD
         t6aiAhEaR02BqCT8uFZwy0OWag8uOMSvWdWf7w2Y0mgHDJ8d3sTzsiGYogKJg/FbEWs1
         Hw/J2+Wkr2q+JXakJiv9dQDF61GBCPqf/t8KjpkjO7c1VMUA9hzusVreHyaVAZOfauf2
         i+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr1nuftsg6mY1z9iUU25djQ++yDMvjZQfJMweOBcGVjMbHXED8uuAwmGadqt4ai4fNwcvqeKCQ3vNkcDef7UZK@vger.kernel.org
X-Gm-Message-State: AOJu0YxqYmYI9sHts+oHEQSjbet0QqqQKH6jdZpkeeBZ19L+3X/NePlM
	BmjGT1WUKyrCutkiOBdSLfFiCUFL+S/f2qrSzM65xyZpCPcO1DSQ+gfj4IHW6T0YNoc=
X-Gm-Gg: ASbGncvHSbETwwhtkqykvdfuFq1Rad4rXnZy0qsbbdxVl8C6u6ipagktbSFVuv92Fae
	ShdzGAeNV12nZ0PNzjOsWDp5fR+3JHnOo6PKjDbZBB/4IBKgDGXbyMcBONdDJxpoEDush5s4Xp9
	/AMUoN7xLvyGqYtKiSSnAPstJTyVKT5mOzNsYapZWlrSX29gme7cFcMni2cPvvC3ZKsFRADF7LE
	2JRCRaLQNkFUyXr2vJB/g4V9t2St7xdm6rpMj4s4nCz62HL5VKiG6QOMynSyzAEEbExfAxwoCIx
	7AbjNQ7jWraC6l3oLoJknCpmYo0QtR9ZF4dg0S2UZR5GqHFrg9Brbo9Qf+XdJYATiNfwDDvEjEj
	yrqAZejShOr+lwVatmj5COMKoldVsrT4nwd4QHsgdNG2zlYhOnB0RwOSYM68kxc93yulK+DV0tj
	YL9E6Iti/+El1s1rObNOsI2rpqQGXoGNWasA==
X-Google-Smtp-Source: AGHT+IHHdJciNdadW46V/rsCGh0pPpDDjeLfRRykUe33Y24roFNgOG8c9J3Qxo6W5bSrO6GUGaOkXA==
X-Received: by 2002:a17:902:ce89:b0:25c:5747:4491 with SMTP id d9443c01a7336-25d26c4ab81mr39777925ad.46.1757686488456;
        Fri, 12 Sep 2025 07:14:48 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:650:9892:cdf9:70db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm49226035ad.130.2025.09.12.07.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:14:47 -0700 (PDT)
Date: Fri, 12 Sep 2025 08:14:45 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Message-ID: <aMQq1SABdOMba_jB@p14s>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
 <20250910-imx-rproc-cleanup-v2-6-10386685b8a9@nxp.com>
 <aMGe/gwmFqjoFszg@lizhi-Precision-Tower-5810>
 <PAXPR04MB8459CABA152B6C1C122B35F28809A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>

On Fri, Sep 12, 2025 at 02:11:20PM +0800, Peng Fan wrote:
> On Thu, Sep 11, 2025 at 01:13:59AM +0000, Peng Fan wrote:
> >Hi Frank,
> >> 
> >> Can you remove 'method' in data struct also?
> >
> >The method is used in other places and other purpose, imx_rproc_detach
> >imx_rproc_put_scu, imx_rproc_remove, it is also referred 
> >imx_dsp_rproc.c.
> >
> >Could we keep it for now?
> 
> The method could not be removed from the data structure, because it is also
> used in imx_dsp_rproc.c.
> 
> I have a few more patches to do further cleanup, but that would make
> the patchset a bit larger. I would like to see Mathieu's view.
> 
> Mathieu,
> 
> Do you expect me to add more patches in V3 to cleanup other parts or
> we could keep the patchset size as it is, with further cleanup in
> a standalone new patchset?
>

I think there is enough in this set.  I will look at it next week.
 
> Thanks,
> Peng.
> 
> 
> >
> >Thanks,
> >Peng.
> >
> >> 
> >> Frank
> >> > -	case IMX_RPROC_NONE:
> >> > +	/*
> >> > +	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
> >> > +	 * dcfg->ops or dcfg->ops->detect_mode, it is state
> >> RPROC_DETACHED.
> >> > +	 */
> >> > +	if (!dcfg->ops || !dcfg->ops->detect_mode) {
> >> >  		priv->rproc->state = RPROC_DETACHED;
> >> >  		return 0;
> >> > -	default:
> >> > -		break;
> >> >  	}
> >> >
> >> > -	return 0;
> >> > +	return dcfg->ops->detect_mode(priv->rproc);
> >> >  }
> >> >
> >> >  static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >> >
> >> > --
> >> > 2.37.1
> >> >
