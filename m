Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26442C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jan 2021 21:37:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0611235DD
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jan 2021 21:37:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbhANVg6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jan 2021 16:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbhANVgu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jan 2021 16:36:50 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A61BC061757
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jan 2021 13:36:10 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id p15so3760966pjv.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jan 2021 13:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YB/usFiirVWxEZVtVDq8y6qGwNPmfUlSz4nYt8ghwLM=;
        b=o4TqmmQ5juxPZYXctha84Xc20NjANvD7x93pUKXyvJCOY3BHPSorInDT3t55pyvJyo
         DuIrbdvRUPnxbHQBSzRkF3m3amGFDAE5p2vkHNoooyH6pz1QOAIydQ25xmhtdQcPorxN
         61HLtRpJkTUPGohIEAWbR0/3SmoeT+wDrl39bwLsgazYFclCVg1/KdTkpmxFwjXvZhsN
         G6LCdrSIVTnltKpS0GVJdLTpYjBLK/deSsQUXItSM43zECnz7Mc3IxFvVomWGFvGcPRT
         kaBQxpsZ7cI0eNmidZSZfPSEl1chQKDFhSTt/XeSieLstaW6X07RT54BNBmnEz30MtIk
         jHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YB/usFiirVWxEZVtVDq8y6qGwNPmfUlSz4nYt8ghwLM=;
        b=s07Icqx8QX3ONXPWqFJe/o2kb7idChUNA5+AmRkf5OQ5kcJckhtXJ3TwvIFhD/EQMh
         l5MRMprn7zWZMw5aLjmUPByrrqrXPx8K6sisPgAffVYXaW4wm3/7MdisvA6sloOu4zbU
         Kiuxsgixy6ERxFh6I2pBUXp8h8vfTUi/M/65fns/msugjxvHKOfWoFyjiMwRSPYvkqk9
         Og/vQsEvZMCjDvM2EM6DLkKK9Hom2/kT/dMsi/jZUuEUynMh+r5hGa8xnVp7L3TfBhB3
         N9z4+vEVUsJGfsAVBSR2gL1EUcmIoje+BgOSjykYPAdjLrfGTPCX70c+qDlZ4S0NNDFm
         tOPw==
X-Gm-Message-State: AOAM531PXRsE/gJTOdElrwuA2cJN3yl6cZSxVCNXtPj/t6ob/wsCmWEs
        d2y5xBNT2cgCTDyNQTmqWdA4mg==
X-Google-Smtp-Source: ABdhPJzYMrEVDyjpDGj1HPG8FbTx0sMsjeflrjQ9vklr1aN76iayVqTnTPrQjwpPkpVtX4/kIyJwHw==
X-Received: by 2002:a17:902:ec8b:b029:de:577f:2bfe with SMTP id x11-20020a170902ec8bb02900de577f2bfemr5617199plg.2.1610660169813;
        Thu, 14 Jan 2021 13:36:09 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t1sm6017321pfq.154.2021.01.14.13.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 13:36:08 -0800 (PST)
Date:   Thu, 14 Jan 2021 14:36:06 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com
Subject: Re: [PATCH V6 10/10] remoteproc: imx_proc: enable virtio/mailbox
Message-ID: <20210114213606.GD255481@xps15>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
 <1610444359-1857-11-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610444359-1857-11-git-send-email-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jan 12, 2021 at 05:39:19PM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Use virtio/mailbox to build connection between Remote Proccessors
> and Linux. Add work queue to handle incoming messages.
> 
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 115 ++++++++++++++++++++++++++++++++-
>  1 file changed, 112 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index e62a53ee128e..812b077f1282 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -7,6 +7,7 @@
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
> +#include <linux/mailbox_client.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> @@ -15,6 +16,9 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/workqueue.h>
> +
> +#include "remoteproc_internal.h"
>  
>  #define IMX7D_SRC_SCR			0x0C
>  #define IMX7D_ENABLE_M4			BIT(3)
> @@ -86,6 +90,11 @@ struct imx_rproc {
>  	const struct imx_rproc_dcfg	*dcfg;
>  	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
>  	struct clk			*clk;
> +	struct mbox_client		cl;
> +	struct mbox_chan		*tx_ch;
> +	struct mbox_chan		*rx_ch;
> +	struct work_struct		rproc_work;
> +	struct workqueue_struct		*workqueue;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
> @@ -366,9 +375,33 @@ static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  }
>  
> +static void imx_rproc_kick(struct rproc *rproc, int vqid)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	int err;
> +	__u32 mmsg;
> +
> +	if (!priv->tx_ch) {
> +		dev_err(priv->dev, "No initialized mbox tx channel\n");
> +		return;
> +	}
> +
> +	/*
> +	 * Send the index of the triggered virtqueue as the mu payload.
> +	 * Let remote processor know which virtqueue is used.
> +	 */
> +	mmsg = vqid << 16;
> +
> +	err = mbox_send_message(priv->tx_ch, (void *)&mmsg);
> +	if (err < 0)
> +		dev_err(priv->dev, "%s: failed (%d, err:%d)\n",
> +			__func__, vqid, err);
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
> +	.kick		= imx_rproc_kick,
>  	.da_to_va       = imx_rproc_da_to_va,
>  	.load		= rproc_elf_load_segments,
>  	.parse_fw	= imx_rproc_parse_fw,
> @@ -444,6 +477,65 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	return 0;
>  }
>  
> +static void imx_rproc_vq_work(struct work_struct *work)
> +{
> +	struct imx_rproc *priv = container_of(work, struct imx_rproc,
> +					      rproc_work);
> +
> +	rproc_vq_interrupt(priv->rproc, 0);
> +	rproc_vq_interrupt(priv->rproc, 1);
> +}
> +
> +static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
> +{
> +	struct rproc *rproc = dev_get_drvdata(cl->dev);
> +	struct imx_rproc *priv = rproc->priv;
> +
> +	queue_work(priv->workqueue, &priv->rproc_work);
> +}
> +
> +static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	struct device *dev = priv->dev;
> +	struct mbox_client *cl;
> +	int ret;
> +
> +	if (!of_get_property(dev->of_node, "mbox-names", NULL))
> +		return 0;
> +
> +	cl = &priv->cl;
> +	cl->dev = dev;
> +	cl->tx_block = true;
> +	cl->tx_tout = 100;
> +	cl->knows_txdone = false;
> +	cl->rx_callback = imx_rproc_rx_callback;
> +
> +	priv->tx_ch = mbox_request_channel_byname(cl, "tx");
> +	if (IS_ERR(priv->tx_ch)) {
> +		ret = PTR_ERR(priv->tx_ch);
> +		return dev_err_probe(cl->dev, PTR_ERR(priv->tx_ch),
> +				     "failed to request tx mailbox channel: %d\n", ret);

        	return dev_err_probe(cl->dev, ret,
				     "failed to request tx mailbox channel: %d\n", ret);
> +	}
> +
> +	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
> +	if (IS_ERR(priv->rx_ch)) {
> +		mbox_free_channel(priv->tx_ch);
> +		return dev_err_probe(cl->dev, PTR_ERR(priv->rx_ch),
> +				     "failed to request mbox tx chan\n");

        	ret = PTR_ERR(priv->rx_ch);
		return dev_err_probe(cl->dev, ret,
				     "failed to request rx mailbox channel: %d\n", ret);

> +	}
> +
> +	return 0;
> +}
> +
> +static void imx_rproc_free_mbox(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +
> +	mbox_free_channel(priv->tx_ch);
> +	mbox_free_channel(priv->rx_ch);
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -481,18 +573,28 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	priv->dev = dev;
>  
>  	dev_set_drvdata(dev, rproc);
> +	priv->workqueue = create_workqueue(dev_name(dev));
> +	if (!priv->workqueue) {
> +		dev_err(dev, "cannot create workqueue\n");
> +		ret = -ENOMEM;
> +		goto err_put_rproc;
> +	}
> +
> +	ret = imx_rproc_xtr_mbox_init(rproc);
> +	if (ret)
> +		goto err_put_wkq;
>  
>  	ret = imx_rproc_addr_init(priv, pdev);
>  	if (ret) {
>  		dev_err(dev, "failed on imx_rproc_addr_init\n");
> -		goto err_put_rproc;
> +		goto err_put_mbox;
>  	}
>  
>  	priv->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(priv->clk)) {
>  		dev_err(dev, "Failed to get clock\n");
>  		ret = PTR_ERR(priv->clk);
> -		goto err_put_rproc;
> +		goto err_put_mbox;
>  	}
>  
>  	/*
> @@ -502,9 +604,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	ret = clk_prepare_enable(priv->clk);
>  	if (ret) {
>  		dev_err(&rproc->dev, "Failed to enable clock\n");
> -		goto err_put_rproc;
> +		goto err_put_mbox;
>  	}
>  
> +	INIT_WORK(&(priv->rproc_work), imx_rproc_vq_work);
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> @@ -515,6 +619,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  
>  err_put_clk:
>  	clk_disable_unprepare(priv->clk);
> +err_put_mbox:
> +	imx_rproc_free_mbox(rproc);
> +err_put_wkq:
> +	destroy_workqueue(priv->workqueue);
>  err_put_rproc:
>  	rproc_free(rproc);
>  
> @@ -527,6 +635,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
>  	struct imx_rproc *priv = rproc->priv;
>  
>  	clk_disable_unprepare(priv->clk);
> +	imx_rproc_free_mbox(rproc);

Function rproc_del() needs to be called first so that rproc_shutdown() is
executed (because rproc->auto_boot is true).

Thanks,
Mathieu

>  	rproc_del(rproc);
>  	rproc_free(rproc);
>  
> -- 
> 2.28.0
> 
