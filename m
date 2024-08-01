Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79527183CD5
	for <linux-remoteproc@vger.kernel.org>; Thu,  1 Aug 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518252; cv=none; b=kUCXtj3ohYZf6hTyduMg3jClaZWdTsY0O+c/9mRAx4xhDsWUOzy2f1jxnx8iBytDn1/HV8OscrbROKu2RY8yvuVDCOOksYGGmPuVqBCnqBw/1Jp0zDjkeZ+puSfWffun+lXIDlaEtVJ9tLvO2eSYGUqzOoUR9x8u+t2RsuAcBAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518252; c=relaxed/simple;
	bh=riUFCSAxIX1wYAdAKbt3NvslI0aoaxYg18DMexzaLXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxAC2lA1UWzWje8tUUavXdJKxtjuFS0/TOAJjkxo21knXVAnIKEWnXfDBwUlTfuDcVMCQ6vo//T1sPp6oBnvh9ad0zuPc7+dMtV/j4gwSTf4p1Flsl3BO6kNabPG0zdi/prw1UqyJv/mXWRe6d+1lu05rHD9f4c5XDoQP/OKLp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ocxCsQhi; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ocxCsQhi"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a1d984ed52so408876385a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Aug 2024 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722518248; x=1723123048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ituu7XR/DhELbO/jAokzr9hjXaeC2nwefVHgABpHf7Y=;
        b=ocxCsQhiB2FtKF06w2eCR59SsTSkQNdQH2F8nMDMOT37KBOZ+cJahhDTgMjjZw0haB
         zNvAyZroe7YjRl6VYDqNLV6g8MxbNGnLr1lSz/WYkihi0PiB7m666/fFhQAxZuXmoGBv
         eFlP41eTlRWf2jOZtDqHrlhMlSiKMPlM71xdb18sBqaGAMS178P+5ErslZaXf6BtkKSB
         OFylwK+E03T6QGIzdT+2prLpwL0ZOvbx3wuZAsqIMgNZWFfCNGGIbLTNw0QUHtCUyJjy
         IOQgGhlmiMvkukBEho6Th9ZgRdRcJCSxVRwA8+XsHMlCIp49IvYW4uLY7immFzziv8x4
         QHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722518248; x=1723123048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ituu7XR/DhELbO/jAokzr9hjXaeC2nwefVHgABpHf7Y=;
        b=j8/ZUKVpmAEhTAi2otKMNDON9zUKEQfqAuAHzXQxBEqQ4h/BDzp9Lt6M8w3WSEvnVm
         dPmTYoae0BY3t0Jkf1/rxfKpDcGuCU0t2rqQnc3xSCBw+QBaiKKDIPVImxAHZEKeuMbl
         XZ8Pxacrmfy52iC94RyRfRj4gjFrkheLAJjNIlZfaZS5GiIOdxRvTc/uTCTogKZ0oJ5I
         YVhnmN1DQgctFU+HVay8u5plMsoDJ+paxxvdz8Q12DNw6V1uyFnkOxRc5CFNPmDVoRFZ
         Pgu/tHiB5giaU1xtCmRFuexVnJFyp4ns5WAjBu1QuMzBQPE6c801JoS5IjlXN9eQ0n/A
         MClw==
X-Forwarded-Encrypted: i=1; AJvYcCVXTudq+yC6A27mgkJvknrKfFDyhqvEm6qWpGsbYxUfxAndHlDzs8sz5KEpLydmO9tRooMlA24oIb8w8ZdAIvCUH01B3WHDfUfCNhn3vYfqLg==
X-Gm-Message-State: AOJu0YxlyFg9YfIR+HSbAEOQu5i5exP/6p6mzRgV9cnfK7wNDkeeLxuE
	RCnTlE/POrjf9glGaEtFXfmOHNKM6qwHcv5RPyLUQ9n+7NLT0Vu8GjiTJXDJn6MtatN2ZQcRjsm
	s
X-Google-Smtp-Source: AGHT+IGULwRue6J39V2Pt8e6HLGmbrFB3ZrmAZlfo4mFSBpV9+w6RlH9yVQ3MCtaj0bcK/QNg6Hu/A==
X-Received: by 2002:a05:620a:4144:b0:79f:637:b63b with SMTP id af79cd13be357-7a30c70fd72mr248746385a.65.1722518248362;
        Thu, 01 Aug 2024 06:17:28 -0700 (PDT)
Received: from p14s ([2001:56b:dc1d:7300:5196:6a43:e999:d728])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1edaf5169sm536372485a.76.2024.08.01.06.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 06:17:27 -0700 (PDT)
Date: Thu, 1 Aug 2024 07:17:24 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Marek Vasut <marex@denx.de>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off for
 i.MX7ULP
Message-ID: <ZquK5CNtRJTTtlkD@p14s>
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
 <20240719-imx_rproc-v2-2-cd8549aa3f1f@nxp.com>
 <Zqe23DlboRPSXiQO@p14s>
 <DB9PR04MB84615384294C38EEA5B95F0088B02@DB9PR04MB8461.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR04MB84615384294C38EEA5B95F0088B02@DB9PR04MB8461.eurprd04.prod.outlook.com>

On Tue, Jul 30, 2024 at 08:06:22AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off
> > for i.MX7ULP
> > 
> > On Fri, Jul 19, 2024 at 04:49:04PM +0800, Peng Fan (OSS) wrote:
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
> > 
> > What is this for?  I don't see it used in this patch.
> 
> Oh, it was added when I was developing this feature, but in the end
> this seems not needed.
> 
> > 
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
> > > +		ret = devm_register_sys_off_handler(dev,
> > SYS_OFF_MODE_POWER_OFF_PREPARE,
> > > +
> > SYS_OFF_PRIO_DEFAULT,
> > > +
> > imx_rproc_sys_off_handler, rproc);
> > 
> > Why does the mailbox needs to be set up again when the system is
> > going down...
> 
> As wrote in commit message:
> "i.MX7ULP Linux poweroff and restart rely on rpmsg driver to send a
> message," so need to set up mailbox in non-blocking way to send
> a message to M4 side.
> 
> > 
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
> > 
> > ... and why does it need to be free'd when the system is going up?
> 
> 
> Sorry, I not get your point. The free is in imx_rproc_sys_off_handler.
> During system booting, the mailbox is not freed.

Why is the same operation done at both startup and shutdown - that is not clear.

I am currently away from the office, returning on August 12th.  As such I will
not be following up on this thread until then.

> 
> Thanks,
> Peng.
> 
> > 
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
> > >
