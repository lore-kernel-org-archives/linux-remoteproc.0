Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4E81B1417
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Aug 2024 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647621; cv=none; b=phXr4XvnI+uRiwb/2SgA4guOeblutZ28sYzCcTTRyouRNlUcfmjhccucxKXrH5xdPlLWMFKma50GqV1UfLWt9urEPen+gEZ1PVmGsiLRFA8Y4mCBoKB+7vX9a5I8ZPq7CHOkoqUyqCg6gf0kogTma7Zad6tjTu/OIzHk9+KR6YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647621; c=relaxed/simple;
	bh=8hvipVdBkoFqioEROoZkbc9cbBFMzvKgB/VSGU3jFW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRVfcp1VErwQzQHCRuBnrgeygB7QUQr5qGDAxYwTUGTGMa+2juRGGqPzsp2x2ojjfarv3kJfCGaco453RQ1gZvdtOIKEOnddnF4FSvBE65m6JLG0ridBGSjyDJajsFUaCWCPEgax38drava8O3zb1qcIaJ7Kqn/Spe+Esj1PL74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JjUXuMI3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JjUXuMI3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-200aa78d35aso36659015ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Aug 2024 08:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723647618; x=1724252418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dbHCr0op/VQjYjFoPEioKUUX066cfRvLBk10sukcDPI=;
        b=JjUXuMI37ZJeZePP3IwQ8imOyjv59Mwb4Jw+/RDlxR+XD3c8a92CQTNMfQ5+dmJcsk
         J9ERkjKRwavjfdF4X+aD7AD34nPocYEoOff4IYquwcb7joeD7L5G6AlPVgaTPFBKitmx
         mmd6gvgFmZzQLM8BklBEa5q5o3VLY4/KpJki82g5I6mKJZOjweelTzBlnvVIj0xdaowl
         RqW9QMjzU5Y2OdAid0qLJXinytmXoSdIGfOv0Dhs3UKa015mtd2gVSw8DbJAzErPpt8o
         VMFHvjAbTZ7e71PRmlJrkDN96M9xUyueD69E2FeUU/ZPpt1dNX3cltTyYO/8b1qglmn0
         EotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647618; x=1724252418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbHCr0op/VQjYjFoPEioKUUX066cfRvLBk10sukcDPI=;
        b=igs1sm1+Xt+k4XWI6Oq5V/fbB8I2x7KIuw4C4v0YAs464J+j1N6Xl7sVOy98s3wcSx
         A8YDTLWlr5aZRafM5NX1AjryRqiTQf+F7N57+3f7oatCWMDNc6lFshGicYvTc17g14Sj
         OdBBfLRctANGF9m4YNspgc/8es8eGBabnTTXSDgJfqzjPL+NwM1YhzqBr88NP98Qy2yy
         AHwg4cP3MhvyMZ/MWCNTqYYRwgU2WoUSdFrhQ2HXvytIrKegZ7FKrkYr+mbn7f5jLQiP
         evg3LZjMukz6ROfz/CpsIHXAr8br/igxcFniA+3L/neCxZWEKkzvYqhZjruWM2yvrEd2
         43qA==
X-Forwarded-Encrypted: i=1; AJvYcCXPHC57Liepj2jlfgyY0shR1htyU4QyTF+4NYR1za+1RxjkJW4Y2XXV7xZf3imEFiQEAScQnykmeEwrS16wkJx/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7opem9iD5vYNfy2nEuidBIKrkWfbob3AglJyeqc+NYYuOOUvJ
	/ygUthLjioTM94rgefYuuMJG0ksh8dzwAZIz/soaaqybHTOtl2EpszCFkuy08NU=
X-Google-Smtp-Source: AGHT+IFjkZdeCy3ttB1+N6PonqSVgzwx6/8vpCT2DGG5nYAfJZdLDmhJ/GAb7wGMXw/qa14hbL8Qqg==
X-Received: by 2002:a17:902:ec90:b0:1fd:93d2:fba4 with SMTP id d9443c01a7336-201d64a5bd9mr37801815ad.48.1723647617183;
        Wed, 14 Aug 2024 08:00:17 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:58b0:43ab:ed9f:f0e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1cbad6sm30554035ad.250.2024.08.14.08.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:00:16 -0700 (PDT)
Date: Wed, 14 Aug 2024 09:00:13 -0600
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
Message-ID: <ZrzGfS/7vv90F5C1@p14s>
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
 <20240719-imx_rproc-v2-2-cd8549aa3f1f@nxp.com>
 <Zqe23DlboRPSXiQO@p14s>
 <DB9PR04MB84615384294C38EEA5B95F0088B02@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <ZquK5CNtRJTTtlkD@p14s>
 <DB9PR04MB846152D0289467468CE0077588B32@DB9PR04MB8461.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR04MB846152D0289467468CE0077588B32@DB9PR04MB8461.eurprd04.prod.outlook.com>

On Fri, Aug 02, 2024 at 04:59:45AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off
> > for i.MX7ULP
> > 
> > On Tue, Jul 30, 2024 at 08:06:22AM +0000, Peng Fan wrote:
> > > > Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system
> > off
> > > > for i.MX7ULP
> > > >
> > > > On Fri, Jul 19, 2024 at 04:49:04PM +0800, Peng Fan (OSS) wrote:
> > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > >
> > > > > The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The
> > > > i.MX7ULP
> > > > > Linux poweroff and restart rely on rpmsg driver to send a message
> > > > > to
> > > > > Cortex-M4 firmware. Then Cortex-A7 could poweroff or restart by
> > > > > Cortex-M4 to configure the i.MX7ULP power controller properly.
> > > > >
> > > > > However the reboot and restart kernel common code use atomic
> > > > notifier,
> > > > > so with blocking tx mailbox will trigger kernel dump, because of
> > > > > blocking mailbox will use wait_for_completion_timeout. In such
> > > > > case, linux no need to wait for completion.
> > > > >
> > > > > Current patch is to use non-blocking tx mailbox channel when
> > > > > system
> > > > is
> > > > > going to poweroff or restart.
> > > > >
> > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > ---
> > > > >  drivers/remoteproc/imx_rproc.c | 36
> > > > > ++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 36 insertions(+)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > > > b/drivers/remoteproc/imx_rproc.c index
> > > > 01cf1dfb2e87..e1abf110abc9
> > > > > 100644
> > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > @@ -18,6 +18,7 @@
> > > > >  #include <linux/of_reserved_mem.h>  #include
> > > > > <linux/platform_device.h>  #include <linux/pm_domain.h>
> > > > > +#include <linux/reboot.h>
> > > > >  #include <linux/regmap.h>
> > > > >  #include <linux/remoteproc.h>
> > > > >  #include <linux/workqueue.h>
> > > > > @@ -114,6 +115,7 @@ struct imx_rproc {
> > > > >  	u32				entry;		/* cpu start
> > > > address */
> > > > >  	u32				core_index;
> > > > >  	struct dev_pm_domain_list	*pd_list;
> > > > > +	struct sys_off_data		data;
> > > >
> > > > What is this for?  I don't see it used in this patch.
> > >
> > > Oh, it was added when I was developing this feature, but in the end
> > > this seems not needed.
> > >
> > > >
> > > > >  };
> > > > >
> > > > >  static const struct imx_rproc_att imx_rproc_att_imx93[] = { @@
> > > > > -1050,6 +1052,22 @@ static int imx_rproc_clk_enable(struct
> > > > imx_rproc *priv)
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > +static int imx_rproc_sys_off_handler(struct sys_off_data *data) {
> > > > > +	struct rproc *rproc = data->cb_data;
> > > > > +	int ret;
> > > > > +
> > > > > +	imx_rproc_free_mbox(rproc);
> > > > > +
> > > > > +	ret = imx_rproc_xtr_mbox_init(rproc, false);
> > > > > +	if (ret) {
> > > > > +		dev_err(&rproc->dev, "Failed to request non-blocking
> > > > mbox\n");
> > > > > +		return NOTIFY_BAD;
> > > > > +	}
> > > > > +
> > > > > +	return NOTIFY_DONE;
> > > > > +}
> > > > > +
> > > > >  static int imx_rproc_probe(struct platform_device *pdev)  {
> > > > >  	struct device *dev = &pdev->dev; @@ -1104,6 +1122,24 @@
> > static
> > > > > int imx_rproc_probe(struct
> > > > platform_device *pdev)
> > > > >  	if (rproc->state != RPROC_DETACHED)
> > > > >  		rproc->auto_boot = of_property_read_bool(np,
> > > > "fsl,auto-boot");
> > > > >
> > > > > +	if (of_device_is_compatible(dev->of_node, "fsl,imx7ulp-cm4"))
> > > > {
> > > > > +		ret = devm_register_sys_off_handler(dev,
> > > > SYS_OFF_MODE_POWER_OFF_PREPARE,
> > > > > +
> > > > SYS_OFF_PRIO_DEFAULT,
> > > > > +
> > > > imx_rproc_sys_off_handler, rproc);
> > > >
> > > > Why does the mailbox needs to be set up again when the system is
> > > > going down...
> > >
> > > As wrote in commit message:
> > > "i.MX7ULP Linux poweroff and restart rely on rpmsg driver to send a
> > > message," so need to set up mailbox in non-blocking way to send a
> > > message to M4 side.
> > >
> > > >
> > > > > +		if (ret) {
> > > > > +			dev_err(dev, "register power off handler
> > > > failure\n");
> > > > > +			goto err_put_clk;
> > > > > +		}
> > > > > +
> > > > > +		ret = devm_register_sys_off_handler(dev,
> > > > SYS_OFF_MODE_RESTART_PREPARE,
> > > > > +
> > > > SYS_OFF_PRIO_DEFAULT,
> > > > > +
> > > > imx_rproc_sys_off_handler, rproc);
> > > >
> > > > ... and why does it need to be free'd when the system is going up?
> > >
> > >
> > > Sorry, I not get your point. The free is in imx_rproc_sys_off_handler.
> > > During system booting, the mailbox is not freed.
> > 
> > Why is the same operation done at both startup and shutdown - that is
> > not clear.
> 
> The below commit shows request/free done in startup and shutdown.
> Hope this explains what you ask.

Unfortunately it doesn't.  I just spent another hour trying to understand why
the same operations are carried out for both shutdown and restart without
success.  I am out of time for this patch and have to move on to other patchset
waiting to be reviewed.  I suggest you ask Daniel to help clarify the changelog
and comments in the code and submit another revision.

Thanks,
Mathieu

> 
> commit 99b142cf7191b08adcd23f700ea0a3d7dffdd0c1
> Author: Peng Fan <peng.fan@nxp.com>
> Date:   Fri Oct 21 12:15:25 2022 +0800
> 
>     remoteproc: imx_rproc: Request mbox channel later
>     
>     It is possible that when remote processor crash, the communication
>     channel will be broken with garbage value in mailbox, such as
>     when Linux is issuing a message through mailbox, remote processor
>     crashes, we need free & rebuild the mailbox channels to make sure
>     no garbage value in mailbox channels.
>     
>     So move the request/free to start/stop for managing remote procesosr in
>     Linux, move to attach/detach for remote processor is out of control of
>     Linux.
>     
>     Previous, we just request mbox when attach for CM4 boot early before
>     Linux, but if mbox defer probe, remoteproc core will do resource cleanup
>     and corrupt resource table for later probe.
>     
>     So move request mbox ealier and still keep mbox request when attach
>     for self recovery case, but keep a check when request/free mbox.
> 
> > 
> > I am currently away from the office, returning on August 12th.  As such
> > I will not be following up on this thread until then.
> 
> sure. Thanks for letting me know.
> 
> Thanks,
> Peng.
> 
> > 
> > >
> > > Thanks,
> > > Peng.
> > >
> > > >
> > > > > +		if (ret) {
> > > > > +			dev_err(dev, "register restart handler
> > > > failure\n");
> > > > > +			goto err_put_clk;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > >  	ret = rproc_add(rproc);
> > > > >  	if (ret) {
> > > > >  		dev_err(dev, "rproc_add failed\n");
> > > > >
> > > > > --
> > > > > 2.37.1
> > > > >
> > > > >
