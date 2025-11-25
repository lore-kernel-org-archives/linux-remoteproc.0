Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F5A329E72
	for <linux-remoteproc@vger.kernel.org>; Tue, 25 Nov 2025 17:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764090300; cv=none; b=UN9qgrWgvOqrhdbIgeGrBvo8tkS8mS8ojf1aqv9G8qb3BVc8A+MG6EVUyntlZwegHw96amhWdaeXKmpeygzJFRL9cFXtOMVOGztpc2Ar8Q5mMxoIgcyNZHRshCVN49IQbC7Czv1GzomhTiz+tj2g/W53dNMZ9lv8fUlX1XkJxVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764090300; c=relaxed/simple;
	bh=iJoCUX90kK6Hi6QO8UUOHy3R4sfD1pdw6tyQrAUqqnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQ1J8qIZimAZg8LvOWgd57oFS2pih6o6dvwHoZ4x/l3m8dxSx6cOpQqeGMBzLsMLSpV/9fc6O9ugKtuHXaYpe7HehVIKS3GIazqkQB4WTf2ID28BhGAp1Nxu9R/mWU0tTMN1I5D4PAdBNupRDPG0B70e5rmJtAU6Q9h+RBNueQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GBgwupMP; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GBgwupMP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso5032672b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 Nov 2025 09:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764090296; x=1764695096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pYgo1d5vBv7JwZFnlBuT9v8v0agvYmWOE6awznPlpPk=;
        b=GBgwupMP3mGm1Df4mi+l6W6mLC5Jzj8Xr/ajiWLRugD9ZSR3Xrnp+Y/8c1wmPXQGUW
         ma6S/p/kaABVCqIKLz4wY6WHwCa7Gusd00YJtvfvskQ+eHo/yuxy46cLgPuU4aaWLX7e
         Ih9vQOM2y3nlXxPgClnCcUe0rRtc1Z9xLsFTLlkeKIOJBS36px9ZfRUFAQHAVRhgHRJa
         LHhAPLxYLUsKkO8duH17+6e2QjwefXblGT0a+TzAo5Yn0t8yAO68p13QYsaS0LgaQpd4
         ic2mGy/vkB9KavC3qv7oqqCsJPB4ZyG0yOZZvzOad5evUO102t8TAgkqLP8IcneaxiYp
         1sPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764090296; x=1764695096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYgo1d5vBv7JwZFnlBuT9v8v0agvYmWOE6awznPlpPk=;
        b=E8oml6f7OzP7uHSaQ3I6V0Bg3x9hLDUZYglGy8hPiwGnVRNgevI5ouoS6rcblE3sKW
         EHE7DDpbqOxGidtLtp5MfgsuKnUUxniH7m5dP6cpSsFBpzKQBSdGvTgfifhkha1ksYuy
         aPxfaCTuUXdvEvlm8KKUvOSRwNVl39TFR0wUyVqsvHeYqC9fQGb/L3Xpa9bBvr/FOQMr
         bmvxmib8UxEKgfTsDXiybo5zVjVXfJUCOzKv0rm2jWRRqYxeMgE9NXQRFLf2SBdN205/
         au/bfjYcD7NqbyAN5tBXEmR3pKG/GdaQprw0MS2JFTjNGdO9ax/nQcPNzrmfJYED9Rul
         1FMw==
X-Forwarded-Encrypted: i=1; AJvYcCXVux3mWO0NpAj8CUEtb1W3orNk/t2FJChJNekA5BNssHZ43RsVQx6m0NEtVLZB1Rssuio/J7AC8dBSXMaPaetF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3xemhlH9KUoXS/QrkeBcJwJb09hhwLgu1dG66q1MokUB84vAO
	H+gxU5t0GSeIttNjX4RdTAL5mAj40Qb8Ama5giqv1XxBOBONBdWM3SINo1XfH+dm53s=
X-Gm-Gg: ASbGncvnIpi/JpwzwCiFXtRaiFsrxcx4NQFR4y/ophdyaCujTqyKa02sEEUFHQpWpzr
	Oh7A7HX89RxGwgYZgkd7jXnIjdum591YZSO3N3VFgv9QEsgLST4ck5GivYhKx4E8RfJyA3YpUWo
	hn2mGyrDXg2S0mPDJ5+dCFUGe4/RUsto/4Isk8CaLJE/TpC8crnWhnC2BAADVxgY4D6Ligfhfti
	ryD0nxGMlLdjqEffsQbxfMnD7cHVcyY5WW0FNB9bpD44tra7bjr5g1tP9TYmRI4r8jWPE3YyFD0
	w89ugKbdx4ON7yH9646Q9enTuPAYCC+sQTj2v1ySp0ymREeBXwzrZ/49rdAeMygVpIYSLSkAksv
	Gimwx2WBasDNeIXJ/p8mBVZy3fUGWblJOHSItmqh578+Y9fJypGPMf/5n3k7zkELguOPvEu4HvC
	29heupwyd36xyVkg==
X-Google-Smtp-Source: AGHT+IE3HVI2OSwKYyz2J7aR+dAp3ud2KB0NZWfDEl2yFaQQfh/xXRFxm9LLeRPNFwq1q34sUk9S4w==
X-Received: by 2002:a05:6a20:7490:b0:35e:bfe5:ee82 with SMTP id adf61e73a8af0-36150f1ed1emr18535116637.48.1764090295883;
        Tue, 25 Nov 2025 09:04:55 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:c0c0:5a6c:d170:84a1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed37b0c7sm18550669b3a.20.2025.11.25.09.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:04:55 -0800 (PST)
Date: Tue, 25 Nov 2025 10:04:52 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <aSXhtAcFBOgJoCWd@p14s>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-3-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-3-shenwei.wang@nxp.com>

Good morning, 

Here are some first-pass comments - more to come later.

On Tue, Nov 04, 2025 at 02:33:12PM -0600, Shenwei Wang wrote:
> Register the RPMsg channel driver and populate remote devices defined
> under the "rpmsg" subnode upon receiving their notification messages.
> 
> The following illustrates the expected DTS layout structure:
> 
> 	cm33: remoteproc-cm33 {
> 		compatible = "fsl,imx8ulp-cm33";
> 
> 		rpmsg {
> 			rpmsg-io-channel {
> 				gpio@0 {
> 					compatible = "fsl,imx-rpmsg-gpio";
> 					reg = <0>;
> 				};
> 
> 				gpio@1 {
> 					compatible = "fsl,imx-rpmsg-gpio";
> 					reg = <1>;
> 				};
> 
> 				...
> 			};
> 
> 			rpmsg-i2c-channel {
> 				i2c@0 {
> 					compatible = "fsl,imx-rpmsg-i2c";
> 					reg = <0>;
> 				};
> 			};
> 
> 			...
> 		};
> 	};

2 observations here:

(1) Why are you trying to introduce both i2c and GPIO in the same patchset?
(2) My first impression is that i2c, GPIO and others should be bundled with the
platform definitions for i2c and GPIO, with a phandle to the remote processor
they hang off from.  My opinion may change once I have reviewed the other
patches in this set.

> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c  | 146 ++++++++++++++++++++++++++++++++
>  include/linux/rpmsg/imx_rpmsg.h |  48 +++++++++++
>  2 files changed, 194 insertions(+)
>  create mode 100644 include/linux/rpmsg/imx_rpmsg.h
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index a6eef0080ca9..e21a7980c490 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/rpmsg/imx_rpmsg.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -15,6 +16,8 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> @@ -22,6 +25,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/rpmsg.h>
>  #include <linux/workqueue.h>
>  
>  #include "imx_rproc.h"
> @@ -1084,6 +1088,144 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>  	return NOTIFY_DONE;
>  }
>  
> +struct imx_rpmsg_driver {
> +	struct rpmsg_driver rpdrv;
> +	void *driver_data;
> +};
> +
> +static char *channel_device_map[][2] = {
> +	{"rpmsg-io-channel", "fsl,imx-rpmsg-gpio"},
> +	{"rpmsg-i2c-channel", "fsl,imx-rpmsg-i2c"},
> +};
> +
> +static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev, void *data,
> +				 int len, void *priv, u32 src)
> +{
> +	struct imx_rpmsg_driver_data *drvdata;
> +
> +	drvdata = dev_get_drvdata(&rpdev->dev);
> +	if (drvdata && drvdata->rx_callback)
> +		return drvdata->rx_callback(rpdev, data, len, priv, src);
> +
> +	return 0;
> +}
> +
> +static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev)
> +{
> +	of_platform_depopulate(&rpdev->dev);
> +}
> +
> +static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev)
> +{
> +	struct imx_rpmsg_driver_data *drvdata;
> +	struct imx_rpmsg_driver *imx_rpdrv;
> +	struct device *dev = &rpdev->dev;
> +	struct of_dev_auxdata *auxdata;
> +	struct rpmsg_driver *rpdrv;
> +	int i;
> +
> +	rpdrv = container_of(dev->driver, struct rpmsg_driver, drv);
> +	imx_rpdrv = container_of(rpdrv, struct imx_rpmsg_driver, rpdrv);
> +
> +	if (!imx_rpdrv->driver_data)
> +		return -EINVAL;
> +
> +	drvdata = devm_kmemdup(dev, imx_rpdrv->driver_data, sizeof(*drvdata), GFP_KERNEL);

Something with the overall design of this feature doesn't work if you need to do
this.

> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	i = drvdata->map_idx;
> +	if (i >= ARRAY_SIZE(channel_device_map))
> +		return -ENODEV;
> +
> +	auxdata = devm_kzalloc(dev, sizeof(*auxdata) * 2, GFP_KERNEL);
> +	if (!auxdata)
> +		return -ENOMEM;
> +
> +	drvdata->rpdev = rpdev;
> +	auxdata[0].compatible = channel_device_map[i][1];
> +	auxdata[0].platform_data = drvdata;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
> +	of_node_put(drvdata->channel_node);

Why is there a need for of_node_put() when imx_of_rprmsg_node_init() is using
for_each_child_of_node_scoped()?

> +
> +	return 0;
> +}
> +
> +static int imx_of_rpmsg_is_in_map(const char *name)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(channel_device_map); i++) {
> +		if (strcmp(name, channel_device_map[i][0]) == 0)
> +			return i;
> +	}
> +
> +	return -1;

Please return a real error code.

> +}
> +
> +static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
> +					  struct device *dev, int idx)
> +{
> +	struct imx_rpmsg_driver_data *driver_data;
> +	struct imx_rpmsg_driver *rp_driver;
> +	struct rpmsg_device_id *rpdev_id;
> +
> +	rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL);

I had a really good time figuring out why 2 instances were needed.  Reviewing
this work without a single line of comment isn't motivating.

> +	if (!rpdev_id)
> +		return -ENOMEM;
> +
> +	strscpy(rpdev_id[0].name, channel_device_map[idx][0], RPMSG_NAME_SIZE);
> +
> +	rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
> +	if (!rp_driver)
> +		return -ENOMEM;
> +
> +	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
> +	if (!driver_data)
> +		return -ENOMEM;
> +
> +	driver_data->rproc_name = dev->of_node->name;
> +	driver_data->channel_node = channel;
> +	driver_data->map_idx = idx;

struct rpmsg_device_id already contains a @driver_data.  As with my other
comment above, something in the design of this feature is not working if you
need to do something like this.

> +
> +	rp_driver->rpdrv.drv.name = channel_device_map[idx][0];
> +	rp_driver->rpdrv.id_table = rpdev_id;
> +	rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
> +	rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
> +	rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
> +	rp_driver->driver_data = driver_data;
> +
> +	register_rpmsg_driver(&rp_driver->rpdrv);
> +
> +	return 0;
> +}
> +
> +static int imx_of_rpmsg_node_init(struct platform_device *pdev)
> +{
> +	struct device_node *np __free(device_node);
> +	struct device *dev = &pdev->dev;
> +	int idx, ret;
> +
> +	np = of_get_child_by_name(dev->of_node, "rpmsg");
> +	if (!np)
> +		return 0;
> +
> +	for_each_child_of_node_scoped(np, child) {
> +		idx = imx_of_rpmsg_is_in_map(child->name);
> +		if (idx < 0)
> +			ret = of_platform_default_populate(child, NULL, dev);

Why is this called?

> +		else
> +			ret = imx_of_rpmsg_register_rpdriver(child, dev, idx);
> +
> +		if (ret < 0)
> +			return ret;

In case of an error, the reference to @np is not released.

> +	}
> +
> +	return 0;
> +}
> +

If we were to keep the current design, all of the above should be in
drivers/rpmsg/imx_rpmsg.c.

>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1177,6 +1319,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		goto err_put_clk;
>  	}
>  
> +	ret = imx_of_rpmsg_node_init(pdev);
> +	if (ret < 0)
> +		dev_info(dev, "populating 'rpmsg' node failed\n");
> +
>  	return 0;
>  
>  err_put_clk:
> diff --git a/include/linux/rpmsg/imx_rpmsg.h b/include/linux/rpmsg/imx_rpmsg.h
> new file mode 100644
> index 000000000000..04a5ad2d4a1d
> --- /dev/null
> +++ b/include/linux/rpmsg/imx_rpmsg.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2025 NXP */
> +
> +/*
> + * @file linux/imx_rpmsg.h
> + *
> + * @brief Global header file for iMX RPMSG
> + *
> + * @ingroup RPMSG
> + */
> +#ifndef __LINUX_IMX_RPMSG_H__
> +#define __LINUX_IMX_RPMSG_H__
> +
> +/* Category define */
> +#define IMX_RMPSG_LIFECYCLE	1
> +#define IMX_RPMSG_PMIC		2
> +#define IMX_RPMSG_AUDIO		3
> +#define IMX_RPMSG_KEY		4
> +#define IMX_RPMSG_GPIO		5
> +#define IMX_RPMSG_RTC		6
> +#define IMX_RPMSG_SENSOR	7
> +
> +/* rpmsg version */
> +#define IMX_RMPSG_MAJOR		1
> +#define IMX_RMPSG_MINOR		0
> +
> +#define MAX_DEV_PER_CHANNEL	10
> +
> +struct imx_rpmsg_head {
> +	u8 cate;	/* Category */
> +	u8 major;	/* Major version */
> +	u8 minor;	/* Minor version */
> +	u8 type;	/* Message type */
> +	u8 cmd;		/* Command code */
> +	u8 reserved[5];
> +} __packed;

This structure is not used in this file, please remove.

> +
> +struct imx_rpmsg_driver_data {
> +	int map_idx;
> +	const char *rproc_name;
> +	struct rpmsg_device *rpdev;
> +	struct device_node *channel_node;
> +	int (*rx_callback)(struct rpmsg_device *rpdev, void *data,
> +			   int len, void *priv, u32 src);
> +	void *channel_devices[MAX_DEV_PER_CHANNEL];
> +};

For the above 2 struct, proper documentation is needed.

Thanks,
Mathieu

> +
> +#endif /* __LINUX_IMX_RPMSG_H__ */
> -- 
> 2.43.0
> 
