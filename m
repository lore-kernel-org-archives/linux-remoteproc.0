Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99FD158A30
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jul 2024 15:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722267362; cv=none; b=mAtUo010DTcQOBYPAGVNV+Hpb7/FhoMg/X56gNYUoZlz72qy24lw8NWbwtA1/L7fzMGlfu+Xx5xSF0pXhlZQ0mL93+Y6u/ah2ckbD/F+22nTgqbpcVwDPiA4KRxH4fiRkms5oH71Y50RFsKs9fKSRXHKS3uMqaMNVf8tjK1/2hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722267362; c=relaxed/simple;
	bh=OSgiIctFBG71PBIruKSdysdvSsvvf8L97+jvmFIa5Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyCWBnEnFlWg+TwuQAPu48tat89PHeHwVIQHBSkByTrggQpVbRbth2nzxjnI6qG5fly0HZbbMJ2cFeV5VOb2xvzhnEzWseLPhIAk6Dh1HPwENEpsUpq7rdGADr67QMSl7y+tYmqb2fATIpqMyzm7IeKi+YEL6wOdfP+A89JKv/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZUKDmVH; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZUKDmVH"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70d19c525b5so2108528b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jul 2024 08:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722267360; x=1722872160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R3oyZEs5pd+yus/xSJY0J3CYufbcoKy2KGG+eQ20D0A=;
        b=NZUKDmVHTczyf4cMuG78JA4eV1iEUP2BnF7aEvQWxC9TD3zbB0St3VPXkC0zNbcpSk
         wFeRwNfuoUXpkTvK10t8OpISLAELOFh7FYqZxcEnn9K0nUBPFX6ZOt0lNJxhSlSMgrwo
         MvB8c4+zYHzX+nbfIhDlZ+/VVTnIk6l+s4E5t1Vvx11zbExGgFtfX957FKgFTn49yCJd
         BYCTfpPZcHkZ1j8bxZ/xe7930+Kkjvn1HpBr5RlYYCMaT/+C12XiiC7Z0vdUPcIonR4B
         26LIVu90MBFy8/LzTrFRK+GLb605kPXjV+8jpUMzgsvdOyCV6oRm9iz2Utcz7Dps+7pC
         EknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722267360; x=1722872160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3oyZEs5pd+yus/xSJY0J3CYufbcoKy2KGG+eQ20D0A=;
        b=eMixehp3N/uvBEOznR4BHHxcv+ogqqRlT5Xx45Grheek9+tPkzZUDhDIxoiXAhEZ2j
         b3GXokgbAF0lqcGsgn6w2QbdQUFyhA/FEs5EloKFQzXXj1EfY/3K4LTuwEgkEIsfy+oe
         xyf0bukVS/jgmfD+L6HUETuOa2lgLXUJYW8Xdog2JJy647VzKrfVod8gpufvxlDJZToG
         To3Xs1ABC/PN1OhZspFwOmEplLXyjVPNdPCd1At6masAUasjeVuatgMUbmW4IcpKS/BB
         0ngDzJ+SexfwsrXmYIMdw4oX9sjij9AGDxfW4JAgA5gdhHKCW8Nl9BZXzHCHBFbugnt2
         LLpw==
X-Forwarded-Encrypted: i=1; AJvYcCVy66TfREq8Z/puPSU79GQ6IP6syR4gTtewcqVRnDCDoEQb9zI/c+EYt7/O8Z4F8qd76lGirr50AdvgJKDASEACgPQ3R5/J31G0hxrefOk0ZA==
X-Gm-Message-State: AOJu0YwkarpqMQUdMZ7okOb7BK7F2v/j9Gm6jAe7R1R8bQrW4Ojj/oh9
	BkmPsNtSkdEIWUaaWxJH3Q1HnuZGZftdZ8Mn2foO7adPz2JftoRRgPM8p7+ffY/w1n3mCJ4ZS+s
	Z
X-Google-Smtp-Source: AGHT+IFv84T5GiiA/Y8AELuClni1irIXmvrexGVaWXq7ByE0ZTiWAk3x3pV3qNV4LBt5YfUQwHgEqw==
X-Received: by 2002:a05:6a21:3414:b0:1c0:eb1e:868e with SMTP id adf61e73a8af0-1c4a12aed16mr5789802637.19.1722267359947;
        Mon, 29 Jul 2024 08:35:59 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b771:7ecc:900e:e070])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fccb63sm84195465ad.284.2024.07.29.08.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 08:35:59 -0700 (PDT)
Date: Mon, 29 Jul 2024 09:35:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off for
 i.MX7ULP
Message-ID: <Zqe23DlboRPSXiQO@p14s>
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
 <20240719-imx_rproc-v2-2-cd8549aa3f1f@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719-imx_rproc-v2-2-cd8549aa3f1f@nxp.com>

On Fri, Jul 19, 2024 at 04:49:04PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The i.MX7ULP Linux
> poweroff and restart rely on rpmsg driver to send a message to Cortex-M4
> firmware. Then Cortex-A7 could poweroff or restart by Cortex-M4 to
> configure the i.MX7ULP power controller properly.
> 
> However the reboot and restart kernel common code use atomic notifier,
> so with blocking tx mailbox will trigger kernel dump, because of
> blocking mailbox will use wait_for_completion_timeout. In such case,
> linux no need to wait for completion.
> 
> Current patch is to use non-blocking tx mailbox channel when system
> is going to poweroff or restart.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 01cf1dfb2e87..e1abf110abc9 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
>  #include <linux/workqueue.h>
> @@ -114,6 +115,7 @@ struct imx_rproc {
>  	u32				entry;		/* cpu start address */
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
> +	struct sys_off_data		data;

What is this for?  I don't see it used in this patch.

>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -1050,6 +1052,22 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	return 0;
>  }
>  
> +static int imx_rproc_sys_off_handler(struct sys_off_data *data)
> +{
> +	struct rproc *rproc = data->cb_data;
> +	int ret;
> +
> +	imx_rproc_free_mbox(rproc);
> +
> +	ret = imx_rproc_xtr_mbox_init(rproc, false);
> +	if (ret) {
> +		dev_err(&rproc->dev, "Failed to request non-blocking mbox\n");
> +		return NOTIFY_BAD;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1104,6 +1122,24 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	if (rproc->state != RPROC_DETACHED)
>  		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
>  
> +	if (of_device_is_compatible(dev->of_node, "fsl,imx7ulp-cm4")) {
> +		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
> +						    SYS_OFF_PRIO_DEFAULT,
> +						    imx_rproc_sys_off_handler, rproc);

Why does the mailbox needs to be set up again when the system is going down...

> +		if (ret) {
> +			dev_err(dev, "register power off handler failure\n");
> +			goto err_put_clk;
> +		}
> +
> +		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
> +						    SYS_OFF_PRIO_DEFAULT,
> +						    imx_rproc_sys_off_handler, rproc);

... and why does it need to be free'd when the system is going up?

> +		if (ret) {
> +			dev_err(dev, "register restart handler failure\n");
> +			goto err_put_clk;
> +		}
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> 
> -- 
> 2.37.1
> 
> 
