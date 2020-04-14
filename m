Return-Path: <SRS0=6AeO=56=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D14DC2BA19
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Apr 2020 17:36:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 488F0206B6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Apr 2020 17:36:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFyJLZxt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407653AbgDNRge (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Apr 2020 13:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407638AbgDNRga (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Apr 2020 13:36:30 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85196C061A0E
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 10:36:30 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b72so239910pfb.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 10:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N/Ua+kNY1INXU8/vefeEMmjH2oEjRI24sNk0LQ39hNU=;
        b=RFyJLZxtQ5VrS3LcTIRsWDqzZc4VHkZTJkFp61oPQeTr6ipbBEWOk31/9HvT7+Irv2
         fOLBgQq7J4RwfUdYaC68+yWdW5GSX+9C3dB58zcFq48Nf/dieyCmw+imw5gwSqD91OXr
         A1NLZ7vWagrRgR8eP/1iA9JBRn7Y2lLHk7hP05+ieeURPgqM3gUnVE/ACz24Um/8YVsn
         W7dUVl3sP9DOF9YkB7O1UIWAkXLEQAloOLSSUovaPpWyU3fU8iMCqm0vt4dkgBVZ59TE
         qKV26fBcWiq3jV/LqEfo3dYJVooIu6/15zZpuR4nk+ZGoi8wep1ek124MbyPLmgZi/fZ
         xHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N/Ua+kNY1INXU8/vefeEMmjH2oEjRI24sNk0LQ39hNU=;
        b=nGihAsQsM7HfWG9EvyuxvS+h/Xj95ps/albUlm8uMrMsVUz66F7akCdy4rBWO8EUDu
         leBR+5N2bu/HwvXc9bM7IamrqnwgXKq4TEwDJ5glCJUTif7iqGM+v6FyFSGvQyeJASsl
         mtNUwOpgqd7X/zDwr7M9L6oMa6BiRfd0Djr6OtRu9Rpmboa8FNBS06+A24kqHa4mMQop
         ugPDiliMOh3+uyFpNfR/N75OV3w23fodIcInZ7uinHZw3wBTPtD2JN2C5UT8iFosGhiX
         hsOFN52BUB2tLWiyayWlquoVJ+IRNCbky/ntMyTdLi2XafD43reNDJVmK11mgK/pK4cg
         nDoA==
X-Gm-Message-State: AGi0PuZ7EgHTNlQw1c15rb5sPIv9WwQxKOBrN1bvdaIh2gPRx77zfe4/
        MmDmBS7pPgvrncWeF46TShwZpA==
X-Google-Smtp-Source: APiQypKRNgqz9RThJhrPvV5k2HJsq+Uz5Pc0ZoaVc4QROaDd3pcImCFV9Dx1O9T6rge4bbTBDy2l0g==
X-Received: by 2002:aa7:9a92:: with SMTP id w18mr23833141pfi.95.1586885789861;
        Tue, 14 Apr 2020 10:36:29 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r9sm11192048pfg.2.2020.04.14.10.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 10:36:29 -0700 (PDT)
Date:   Tue, 14 Apr 2020 11:36:27 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     nikita.shubin@maquefel.me
Cc:     Nikita Shubin <NShubin@topcon.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: mailbox support
Message-ID: <20200414173627.GC24061@xps15>
References: <20200304142628.8471-1-NShubin@topcon.com>
 <20200406113310.3041-1-nikita.shubin@maquefel.me>
 <20200406113310.3041-3-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406113310.3041-3-nikita.shubin@maquefel.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200414173627.0evnPoBamwL9fwrDu5w883HgDmEM9sSSU6v8B46UYY8@z>

On Mon, Apr 06, 2020 at 02:33:09PM +0300, nikita.shubin@maquefel.me wrote:
> Add support for mailboxes to imx_rproc
> 
> Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> ---
>  drivers/remoteproc/Kconfig     |   2 +
>  drivers/remoteproc/imx_rproc.c | 142 ++++++++++++++++++++++++++++++++-
>  2 files changed, 143 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 94afdde4bc9f..02d23a54c9cf 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -17,6 +17,8 @@ if REMOTEPROC
>  config IMX_REMOTEPROC
>  	tristate "IMX6/7 remoteproc support"
>  	depends on ARCH_MXC
> +	select MAILBOX
> +	select IMX_MBOX
>  	help
>  	  Say y here to support iMX's remote processors (Cortex M4
>  	  on iMX7D) via the remote processor framework.
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bebc58d0f711..d2bede4ccb70 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -14,6 +14,9 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/mailbox_client.h>
> +
> +#include "remoteproc_internal.h"
>  
>  #define IMX7D_SRC_SCR			0x0C
>  #define IMX7D_ENABLE_M4			BIT(3)
> @@ -47,6 +50,12 @@
>  
>  #define IMX_BOOT_PC			0x4
>  
> +#define IMX_MBOX_NB_VQ			2
> +#define IMX_MBOX_NB_MBX		2
> +
> +#define IMX_MBX_VQ0		"vq0"
> +#define IMX_MBX_VQ1		"vq1"
> +
>  /**
>   * struct imx_rproc_mem - slim internal memory structure
>   * @cpu_addr: MPU virtual address of the memory region
> @@ -80,6 +89,14 @@ struct imx_rproc_dcfg {
>  	size_t				att_size;
>  };
>  
> +struct imx_mbox {
> +	const unsigned char name[10];
> +	struct mbox_chan *chan;
> +	struct mbox_client client;
> +	struct work_struct vq_work;
> +	int vq_id;
> +};
> +
>  struct imx_rproc {
>  	struct device			*dev;
>  	struct regmap			*regmap;
> @@ -88,6 +105,8 @@ struct imx_rproc {
>  	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
>  	struct clk			*clk;
>  	void __iomem			*bootreg;
> +	struct imx_mbox mb[IMX_MBOX_NB_MBX];
> +	struct workqueue_struct *workqueue;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
> @@ -251,10 +270,118 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>  	return va;
>  }
>  
> +static void imx_rproc_mb_vq_work(struct work_struct *work)
> +{
> +	struct imx_mbox *mb = container_of(work, struct imx_mbox, vq_work);
> +	struct rproc *rproc = dev_get_drvdata(mb->client.dev);
> +
> +	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)
> +		dev_dbg(&rproc->dev, "no message found in vq%d\n", mb->vq_id);
> +}
> +
> +static void imx_rproc_mb_callback(struct mbox_client *cl, void *data)
> +{
> +	struct rproc *rproc = dev_get_drvdata(cl->dev);
> +	struct imx_mbox *mb = container_of(cl, struct imx_mbox, client);
> +	struct imx_rproc *ddata = rproc->priv;
> +
> +	queue_work(ddata->workqueue, &mb->vq_work);
> +}
> +
> +static const struct imx_mbox imx_rproc_mbox[IMX_MBOX_NB_MBX] = {
> +	{
> +		.name = IMX_MBX_VQ0,
> +		.vq_id = 0,
> +		.client = {
> +			.rx_callback = imx_rproc_mb_callback,
> +			.tx_block = false,
> +		},
> +	},
> +	{
> +		.name = IMX_MBX_VQ1,
> +		.vq_id = 1,
> +		.client = {
> +			.rx_callback = imx_rproc_mb_callback,
> +			.tx_block = false,
> +		},
> +	},
> +};
> +
> +static void imx_rproc_request_mbox(struct rproc *rproc)
> +{
> +	struct imx_rproc *ddata = rproc->priv;
> +	struct device *dev = &rproc->dev;
> +	unsigned int i;
> +	const unsigned char *name;
> +	struct mbox_client *cl;
> +
> +	/* Initialise mailbox structure table */
> +	memcpy(ddata->mb, imx_rproc_mbox, sizeof(imx_rproc_mbox));
> +
> +	for (i = 0; i < IMX_MBOX_NB_MBX; i++) {
> +		name = ddata->mb[i].name;
> +
> +		cl = &ddata->mb[i].client;
> +		cl->dev = dev->parent;
> +
> +		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);

I forgot... You will also need to update the bindings document (imx-rproc.txt).

> +
> +		dev_dbg(dev, "%s: name=%s, idx=%u\n",
> +			__func__, name, ddata->mb[i].vq_id);
> +
> +		if (IS_ERR(ddata->mb[i].chan)) {
> +			dev_warn(dev, "cannot get %s mbox\n", name);
> +			ddata->mb[i].chan = NULL;
> +		}
> +
> +		if (ddata->mb[i].vq_id >= 0)
> +			INIT_WORK(&ddata->mb[i].vq_work, imx_rproc_mb_vq_work);
> +	}
> +}
> +
> +static void imx_rproc_free_mbox(struct rproc *rproc)
> +{
> +	struct imx_rproc *ddata = rproc->priv;
> +	unsigned int i;
> +
> +	dev_dbg(&rproc->dev, "%s: %d boxes\n",
> +		__func__, ARRAY_SIZE(ddata->mb));
> +
> +	for (i = 0; i < ARRAY_SIZE(ddata->mb); i++) {
> +		if (ddata->mb[i].chan)
> +			mbox_free_channel(ddata->mb[i].chan);
> +		ddata->mb[i].chan = NULL;
> +	}
> +}
> +
> +static void imx_rproc_kick(struct rproc *rproc, int vqid)
> +{
> +	struct imx_rproc *ddata = rproc->priv;
> +	unsigned int i;
> +	int err;
> +
> +	if (WARN_ON(vqid >= IMX_MBOX_NB_VQ))
> +		return;
> +
> +	for (i = 0; i < IMX_MBOX_NB_MBX; i++) {
> +		if (vqid != ddata->mb[i].vq_id)
> +			continue;
> +		if (!ddata->mb[i].chan)
> +			return;
> +		dev_dbg(&rproc->dev, "sending message : vqid = %d\n", vqid);
> +		err = mbox_send_message(ddata->mb[i].chan, &vqid);
> +		if (err < 0)
> +			dev_err(&rproc->dev, "%s: failed (%s, err:%d)\n",
> +					__func__, ddata->mb[i].name, err);
> +			return;
> +	}
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
>  	.da_to_va	= imx_rproc_da_to_va,
> +	.kick		= imx_rproc_kick,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
>  
> @@ -384,14 +511,26 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		goto err_put_rproc;
>  	}
>  
> +	priv->workqueue = create_workqueue(dev_name(dev));
> +	if (!priv->workqueue) {
> +		dev_err(dev, "cannot create workqueue\n");
> +		ret = -ENOMEM;
> +		goto err_put_clk;
> +	}
> +
> +	imx_rproc_request_mbox(rproc);
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> -		goto err_put_clk;
> +		goto err_free_mb;
>  	}
>  
>  	return 0;
>  
> +err_free_mb:
> +	imx_rproc_free_mbox(rproc);
> +	destroy_workqueue(priv->workqueue);
>  err_put_clk:
>  	clk_disable_unprepare(priv->clk);
>  err_put_rproc:
> @@ -407,6 +546,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
>  
>  	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
> +	imx_rproc_free_mbox(rproc);
>  	rproc_free(rproc);
>  
>  	return 0;
> -- 
> 2.25.1
> 
