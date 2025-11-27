Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDF22D3A6A
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260596; cv=none; b=fP08ukPDSfZyAhS/wR+wGbiAZQNTcnAxddaNIm3dvhFR2V0UEvVxD/ZdDGkwwsgUDJr11CR7LCa8W8itsdQ7bhSaKH1UQ1YrKZBtjc29thxcZ1Whutd2nx8pU8uDom3B74hds5xl8e1E/vnQ6Kr2MkcGkhAa/qNYgPc04JKWuho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260596; c=relaxed/simple;
	bh=5w4AUQuz0dGdw5CdD1rC201z9FXIhHuXRPxTOAxvqIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGGah1+VSibOw53tEegQvh1rvSLpraGvUPghlAsHH2XEDzCs8tmU2zVPzq5xXT+sIS+miyJB7ZIA1V9BB/pdxe7iKRLvRv14aEnirEdzQ08LitEunYntf1hx5KqB16Pi3TwYp7SaYH1Gsa0lQII9gVPESSk0mEjOOPbBvBP9trc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KnZ9QDL6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KnZ9QDL6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29ba9249e9dso11621445ad.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 08:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764260594; x=1764865394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bYD9XqhUHtt4KPRx0lwsto4qlMl73VNVsS41vyaBbjs=;
        b=KnZ9QDL6NAAdDriT+kf3AzH0cczxMvyDbPEh80KrBoNO+sh1QfyUXcuKFaiAu3O7oB
         WnhSKn9NdiIZ/89Jj5DyRupokQ4tkCCgB0kkx6+cdPfCtRh1XrpVyVqxgwYcRmVFFLTu
         28BlcVetLYnBogIsJ84kRvZup6brvuCu5yLM+mo8dWnG40sBLD2NzOkgZfxj1St2WKfA
         uh8vmaVpXXu0HiqCaQQHf0l1pOTRj17fqtQP2K1l1gv7un6k8uWv1/6PIVBYVEl/jJKH
         qMO8uyJLd76P1v5Jj9Y5WRWfoalHIvDudpA+FHTLPhPvZp/8na0xl4ZqvwR489AtDwoa
         HI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260594; x=1764865394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYD9XqhUHtt4KPRx0lwsto4qlMl73VNVsS41vyaBbjs=;
        b=NBTgmL/nUWP1JXG8Mo0ngpBTXghq9zweyYnLw5SlFRJfcDYJ6DAJcMafvhVZAGFu7+
         rWJTyE+Tr5tiVEASsPFA2S1g3PFuNS9CZTH7e0mrQfcXSxVzN3kGBVIjj9e6iGgxjBoI
         nMwm1fJGSbxVkKNW6WVQVuIoy8aCYaYTlzGpOACkwJ2O+O7UlH9ivESnCErvetsAPyAH
         1FWbj7eFnoaguRt0i+5PHiLVQHm3qUt1Bhhq1zeUHSkxuF9Um8N17/YYHdei1BGEKWKi
         fTO0f6M5oO30bolmcUpjo6cODM7sTGcy4KijcWN2WaY+d3QAVocbLYFzGKIZ++eUyQvt
         n/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0Iwq7E1aH3mgZ2z7SJFiR/k3HwYpjmqEmvRTTQhKr0mXLoCxQ+mHaqj2FSz6pdhPR39IwNcBdCSWWvJKfOHcC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/D5Bi1kOuuRKIW7eGyfhDhJMk5Gb0Kq1PXEMI8cqpGaRs77KR
	nz3LQnkZtBXhIiF5B0IzS6sh59hzexvxNqoWvGbhpa9q3BA8AM7Vvu4+yTbcGuU92jo=
X-Gm-Gg: ASbGncslir52fM6uR8is4vx4rEFxS+F4ZYSvu9TbyziUcll2T1Fv0GEgatQbR4q0VFo
	u6r9uVGfTKmpjWUjA6r31WDh9EuGdie1U4cu3sbyjBlcZF0hF3xgq+EmA1peJlV48f3gPHX5Ld0
	3gPl/7nWTqMGJ6G1h8Yfjkn3n+kugVKHpeJOTQMlj/TmCuIMowjnuze337JIFADGYBfD74Mg0bO
	EUQgmtKUpL5a81MmP+ZFWhnzkr5UNbvOUDynbxxMcUIQdkJYwnoPdlqJLSTYguvq64W5AExOKoV
	vdOXnX0J1bU4JiUyaKw849m4LyFuCz9Y5RoivdQg0U2NqJXEEnvBsWeb+sohJJ5RNS6TKmbuMy5
	G6roAloqhQDVmVwLEy/SBwRjNwXq0h3wmSbDgvQ+/tCS2Fp4eKPpSAs/oIotJNhtFbDfFOmX5iJ
	qLL7I4meveSC5mBg==
X-Google-Smtp-Source: AGHT+IHqx1uI/5nrF6nAELgHS8dwwRi8UkkNhUGcSd+x/B6tc1auqIiR26mDQUo8dP8rVSg7iApWFA==
X-Received: by 2002:a17:902:ef08:b0:248:ff5a:b768 with SMTP id d9443c01a7336-29b6c3c7340mr247945805ad.10.1764260593683;
        Thu, 27 Nov 2025 08:23:13 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9ef4:efaa:23ae:f181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce2e676esm22111985ad.0.2025.11.27.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:23:13 -0800 (PST)
Date: Thu, 27 Nov 2025 09:23:10 -0700
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
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <aSh67mvFB_00PywW@p14s>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-3-shenwei.wang@nxp.com>
 <aSdMufLCeqvVyKsp@p14s>
 <PAXPR04MB91857863B163B3F38A26647389DEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91857863B163B3F38A26647389DEA@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Wed, Nov 26, 2025 at 09:46:38PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, November 26, 2025 12:54 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Bjorn Andersson <andersson@kernel.org>; Rob Herring <robh@kernel.org>;
> > Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>; Linus Walleij
> > <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>; Pengutronix
> > Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> > Peng Fan <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> > devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: [EXT] Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices
> > under "rpmsg" subnode
> > > +
> > > +     drvdata = dev_get_drvdata(&rpdev->dev);
> > > +     if (drvdata && drvdata->rx_callback)
> > > +             return drvdata->rx_callback(rpdev, data, len, priv,
> > > + src);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev) {
> > > +     of_platform_depopulate(&rpdev->dev);
> > > +}
> > > +
> > > +static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev) {
> > 
> > Where does the rpmsg_device come from?  Usually there is a call to
> > rpmsg_register_device() and I don't see it anywhere in this patchset.  I also don't
> > see a link to the remote processor.  I can't continue with this set for as long as I
> > don't have this information.
> > 
> 
> It is in the function below named imx_of_rpmsg_register_rpdriver.
> 

The function below calls register_rpmsg_driver(), not rpmsg_register_device().
I still don't know where @rpdev comes from.

> Thanks,
> Shenwei
> 
> > > +
> > > +static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
> > > +                                       struct device *dev, int idx) {
> > > +     struct imx_rpmsg_driver_data *driver_data;
> > > +     struct imx_rpmsg_driver *rp_driver;
> > > +     struct rpmsg_device_id *rpdev_id;
> > > +
> > > +     rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL);
> > > +     if (!rpdev_id)
> > > +             return -ENOMEM;
> > > +
> > > +     strscpy(rpdev_id[0].name, channel_device_map[idx][0],
> > > + RPMSG_NAME_SIZE);
> > > +
> > > +     rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
> > > +     if (!rp_driver)
> > > +             return -ENOMEM;
> > > +
> > > +     driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
> > > +     if (!driver_data)
> > > +             return -ENOMEM;
> > > +
> > > +     driver_data->rproc_name = dev->of_node->name;
> > > +     driver_data->channel_node = channel;
> > > +     driver_data->map_idx = idx;
> > > +
> > > +     rp_driver->rpdrv.drv.name = channel_device_map[idx][0];
> > > +     rp_driver->rpdrv.id_table = rpdev_id;
> > > +     rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
> > > +     rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
> > > +     rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
> > > +     rp_driver->driver_data = driver_data;
> > > +
> > > +     register_rpmsg_driver(&rp_driver->rpdrv);
> > > +
> > > +     return 0;
> > > +}
