Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C71B3F1D
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Aug 2024 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723646322; cv=none; b=SX1+u9bO24d8JsJ8TRsFNQqCUGYc4tadYxUgdA6a3pgdyZMb96gbPE390ZlFsdtYIdjDT61uLmXfzeZ0xy6k6nlgvo+8gGvuBxC0u6KcRjcEVH/dONEkMBf1KaFGj3yj4MlPc1HeajgkKHj2eZXDqhDUxaIK37awMGtVgRWHw2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723646322; c=relaxed/simple;
	bh=aXNaUat3LKXlkjL2pXbnIzgA9XihrC3jZjhzS9S2qWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYkC1WMJi7kAL0L659mBT0ye2fB6f0rIZotB5A1JwZnXGGYAhvf8hpZFbdLJNQvfRYwszgcg0yPK16oqfshCtVx2Bqz99qPrKdIgUk3b//NwRbgs5/R3i8ObS23fCJAABoru6YA0N2L1KYUwQYH9+/OBrD+AL7byNNjBfHOPSVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpfubSsy; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpfubSsy"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fd65aaac27so6698235ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Aug 2024 07:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723646320; x=1724251120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VeGClbZuXLA9CO3WbjErOWLZ7t2Jx6TcRcw8Toi87Hw=;
        b=TpfubSsykWNILpdq7HlxX7wfDHDx2L892MjtihT6jb15imS19TrligHMgoENMkJIHl
         jEDHpt3aWMJ/+fBE4Hzh0Pz2rnecABmke1amox2jkF9iwPlhzsJe1TtZRXxhV1Ur5ZmM
         rzwqB/yNtazgSdGBkJkryJHfG0buy626lfsF3bvOzBSW3OxdtQdKyg4LvfJgksSj4NpX
         28RWUoGNzvqhEdLdKnB9mEJcWmB4i768lB8JFEZy6RkXU9cDlWvOaokyOBFzg7iyhjJR
         30BBp0IfyYFiFVFPwnk9VMlZ92tXlFNAVmHJSF2mhC9Su8HEIiC3nxvQ/vnLP7LX+eiw
         kQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723646320; x=1724251120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeGClbZuXLA9CO3WbjErOWLZ7t2Jx6TcRcw8Toi87Hw=;
        b=X1w6GDw0IFifPNR0KR8lrTfw7lz0Vx2y9K304ubFnlc6DKt075FWqph4kBnaLVPDAS
         E03CFWr2OVM+Hry6bJxhYjdieNA7vv8jS2ZMjXUF6GP6MywxDovrah5tBBSbKwvWlvca
         cJ5c8g8sdZpCNlGwY1dK7JpvGEDWmlmRuquFazQm5J0zWxz3oqt6KgCIy5U8gK2RxPdr
         FHpMx/lQvylvsV6AVTVxvIenOmGU8qB9shX6DVq5EiYMUiCm+Fw1+9zq7lmAkf4wgdcm
         cIEjd7aO3XP1XoR0wWGh3k4rQA6yh3XJUduK1sDZLuyCf1eqTcfVGonJhTxuIE/L2H7/
         B8BA==
X-Forwarded-Encrypted: i=1; AJvYcCWaX6Oo3kolxJBR0Hnhc1fEkdDRGb7mc3GKQcHJHR3Q6KLCZoL2Ofs8vc9x8TcXSw4RbbjkDid+GYZfeuIWj9YytTlBcOLMrbt+3SzTdj6lOA==
X-Gm-Message-State: AOJu0YzuojPeIna3xJc0IZrfJuCk2yIYckIMNf0tAnecxzO5WzH4m4SQ
	TaVndxyxnChq/9qLAj/v4xrzeLh241t2nqSd3k40evfYNYkEkpiI/+otEUwh3+8=
X-Google-Smtp-Source: AGHT+IFUuropSuxmMoLQTUFTyfhWn0rqyNwVtipty2Kflc9rYsME60ncCjIuU5hnGd4PCRSdPuxcdg==
X-Received: by 2002:a17:902:d2cc:b0:1fc:4acb:3670 with SMTP id d9443c01a7336-201d99993a9mr42053675ad.12.1723646319926;
        Wed, 14 Aug 2024 07:38:39 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:58b0:43ab:ed9f:f0e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1aa00csm30446435ad.173.2024.08.14.07.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:38:39 -0700 (PDT)
Date: Wed, 14 Aug 2024 08:38:36 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hongxing Zhu <hongxing.zhu@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH 6/6] remoteproc: imx_rproc: handle system off for i.MX7ULP
Message-ID: <ZrzBbFAeq+Aawr6h@p14s>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-6-7bcf6732d328@nxp.com>
 <ZrE4Qnk2UOCGpFv1@lizhi-Precision-Tower-5810>
 <PAXPR04MB8459FA9E502510F906D2880588B92@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459FA9E502510F906D2880588B92@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Thu, Aug 08, 2024 at 02:56:20AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 6/6] remoteproc: imx_rproc: handle system off for
> > i.MX7ULP
> > 
> > On Fri, Jul 12, 2024 at 04:34:59PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The
> > i.MX7ULP
> > > Linux poweroff and restart rely on rpmsg driver to send a message to
> > > Cortex-M4 firmware. Then Cortex-A7 could poweroff or restart by
> > > Cortex-M4 to configure the i.MX7ULP power controller properly.
> > >
> > > However the reboot and restart kernel common code use atomic
> > notifier,
> > > so with blocking tx mailbox will trigger kernel dump, because of
> > > blocking mailbox will use wait_for_completion_timeout. In such case,
> > > linux no need to wait for completion.
> > >
> > > Current patch is to use non-blocking tx mailbox channel when system
> > is
> > > going to poweroff or restart.
> > >
> > > Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 36
> > > ++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index
> > 01cf1dfb2e87..e1abf110abc9
> > > 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -18,6 +18,7 @@
> > >  #include <linux/of_reserved_mem.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_domain.h>
> > > +#include <linux/reboot.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/remoteproc.h>
> > >  #include <linux/workqueue.h>
> > > @@ -114,6 +115,7 @@ struct imx_rproc {
> > >  	u32				entry;		/* cpu start
> > address */
> > >  	u32				core_index;
> > >  	struct dev_pm_domain_list	*pd_list;
> > > +	struct sys_off_data		data;
> > >  };
> > >
> > >  static const struct imx_rproc_att imx_rproc_att_imx93[] = { @@
> > > -1050,6 +1052,22 @@ static int imx_rproc_clk_enable(struct
> > imx_rproc *priv)
> > >  	return 0;
> > >  }
> > >
> > > +static int imx_rproc_sys_off_handler(struct sys_off_data *data) {
> > > +	struct rproc *rproc = data->cb_data;
> > > +	int ret;
> > > +
> > > +	imx_rproc_free_mbox(rproc);
> > > +
> > > +	ret = imx_rproc_xtr_mbox_init(rproc, false);
> > > +	if (ret) {
> > > +		dev_err(&rproc->dev, "Failed to request non-blocking
> > mbox\n");
> > > +		return NOTIFY_BAD;
> > > +	}
> > > +
> > > +	return NOTIFY_DONE;
> > > +}
> > > +
> > >  static int imx_rproc_probe(struct platform_device *pdev)  {
> > >  	struct device *dev = &pdev->dev;
> > > @@ -1104,6 +1122,24 @@ static int imx_rproc_probe(struct
> > platform_device *pdev)
> > >  	if (rproc->state != RPROC_DETACHED)
> > >  		rproc->auto_boot = of_property_read_bool(np,
> > "fsl,auto-boot");
> > >
> > > +	if (of_device_is_compatible(dev->of_node, "fsl,imx7ulp-cm4"))
> > {
> > 
> > I don't suggest check compatible string. It'd better add a field  in
> > imx_rproc_dcfg, such as need_sys_off
> > 
> > 	if (dcfg->need_sys_off) {
> > 		...
> > 	}
> > 
> > If there are new compatible string added, just need set need_sys_off to
> > true in driver data.
> 
> Could we delay the change when there is really new chips need this?
> The downstream commit time is " Date:   Tue Dec 6 17:10:14 2022",
> In the past days, I not see other platforms require this.
> 
> Mathieu, which do you prefer? add need_sys_off or keep current
> approach?
>

This driver is already making extensive use of device data and as such suggest
to continue with that method.

> Thanks,
> Peng.
> 
> > 
> > Frank
> > 
> > > +		ret = devm_register_sys_off_handler(dev,
> > SYS_OFF_MODE_POWER_OFF_PREPARE,
> > > +
> > SYS_OFF_PRIO_DEFAULT,
> > > +
> > imx_rproc_sys_off_handler, rproc);
> > > +		if (ret) {
> > > +			dev_err(dev, "register power off handler
> > failure\n");
> > > +			goto err_put_clk;
> > > +		}
> > > +
> > > +		ret = devm_register_sys_off_handler(dev,
> > SYS_OFF_MODE_RESTART_PREPARE,
> > > +
> > SYS_OFF_PRIO_DEFAULT,
> > > +
> > imx_rproc_sys_off_handler, rproc);
> > > +		if (ret) {
> > > +			dev_err(dev, "register restart handler
> > failure\n");
> > > +			goto err_put_clk;
> > > +		}
> > > +	}
> > > +
> > >  	ret = rproc_add(rproc);
> > >  	if (ret) {
> > >  		dev_err(dev, "rproc_add failed\n");
> > >
> > > --
> > > 2.37.1
> > >
