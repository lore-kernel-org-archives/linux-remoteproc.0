Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51EBC433E7
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:12:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C745223BE
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:12:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7VfJE/d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbgJSUMg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 16:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgJSUMe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 16:12:34 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5625EC0613D0
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 13:12:33 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id b23so644310pgb.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 13:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LiuXgliwLW0TRApnl1Zl7uM1igkn0qfIbeMOLGGzAPM=;
        b=P7VfJE/dehWPKpqIxPSoP4zwlb4tCc8tDRMua3vqfKHVI4FEX89dmhsjIrSdwbniiP
         sLJIdZmz8Nj+f06+XzNyYuC7m0b1U3W4fdE+UV1rQ6fC09iZQThhzvFwsggwDCVtu91v
         m/q/awInS9+UpNgQLzrNa9Gk5UyyxtAr/FvXXBCyGXIXLjyQ1fmITPRNxq7+iQea6osW
         An800/+S5FpxjpXvh2O7qmzmIqiiSlapNVeB3kb1KGLx2k2fwyqGviPJEsRwkMtL60AR
         qRpj7DZHMcfeGM22173NtCUNQQV3LoOLrY7jGTNGRjimxZjJJvVYeOUPdaO/AfOi2L/6
         oqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LiuXgliwLW0TRApnl1Zl7uM1igkn0qfIbeMOLGGzAPM=;
        b=Wqd4Q8pAiFpyhZluz22iDGa3nEJ0Yj+0VmTwn8TkIa3zYGWRdICVdpPJMYsglpxicA
         kjPJXdhD60m55f+ovbPHSNl42whEU/uILHtmcWzzM1imracVPJehnb+//hw1dH8l55h3
         m9rbh5pxK/LTI/wuFhszYOi0+9cGdMLPQKKt7ixFWorU7EaHNe3QZHH9w4PRSlAl9ATH
         X97asy7Ql5Tfj/JFHL+bhVPcRPiN0XMLu11mqmsTXATwlfPs7IqFqZns0GU8g0FUbmH4
         SPZdt7C+zBcFXUqmFANPXLOgldq/nKAGORErv/lFtGqrXR6l5wnXL1tNKpXRAubrOSU1
         rQLg==
X-Gm-Message-State: AOAM530KU2v11NkpCKVzkvvJJ7QZMal+QCRQh3WyeWuGu2QeG4L0pPuk
        xBGsOaWgP4ZJl83h5y9OGwV3hw==
X-Google-Smtp-Source: ABdhPJwc3519jQsqsv4LJTjR9H0bWCY7aE5a+AqadnSJWB3Rs56ZrWjPlbWQWDu+y1Z7biPzCzs1SA==
X-Received: by 2002:a65:5c85:: with SMTP id a5mr1252677pgt.145.1603138352639;
        Mon, 19 Oct 2020 13:12:32 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y4sm441517pgs.0.2020.10.19.13.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:12:31 -0700 (PDT)
Date:   Mon, 19 Oct 2020 14:12:29 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     bjorn.andersson@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH V2 7/7] remoteproc: imx_proc: enable virtio/mailbox
Message-ID: <20201019201229.GE496175@xps15>
References: <20200927064131.24101-1-peng.fan@nxp.com>
 <20200927064131.24101-8-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927064131.24101-8-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun, Sep 27, 2020 at 02:41:31PM +0800, Peng Fan wrote:
> Use virtio/mailbox to build connection between Remote Proccessors
> and Linux. Add delayed work to handle incoming messages.
> 
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 112 ++++++++++++++++++++++++++++++++-
>  1 file changed, 109 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 0f69f3f745ab..c514d7ca7c81 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/mailbox_client.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> @@ -17,6 +18,8 @@
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
>  
> +#include "remoteproc_internal.h"
> +
>  #define IMX7D_SRC_SCR			0x0C
>  #define IMX7D_ENABLE_M4			BIT(3)
>  #define IMX7D_SW_M4P_RST		BIT(2)
> @@ -88,6 +91,10 @@ struct imx_rproc {
>  	const struct imx_rproc_dcfg	*dcfg;
>  	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
>  	struct clk			*clk;
> +	struct mbox_client		cl;
> +	struct mbox_chan		*tx_ch;
> +	struct mbox_chan		*rx_ch;
> +	struct delayed_work		rproc_work;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
> @@ -373,9 +380,30 @@ static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
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
> +	mmsg = vqid << 16;

Please add a comment that explains the reason for the shift left.

> +
> +	priv->cl.tx_tout = 100;

See my comment below on this.

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
> @@ -458,6 +486,70 @@ static void imx_rproc_memset(struct rproc *rproc, void *s, int c, size_t count)
>  	memset_io((void * __iomem)s, c, count);
>  }
>  
> +static void imx_rproc_vq_work(struct work_struct *work)
> +{
> +	struct delayed_work *dwork = to_delayed_work(work);
> +	struct imx_rproc *priv = container_of(dwork, struct imx_rproc,
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
> +	schedule_delayed_work(&(priv->rproc_work), 0);

What is the advantage of using a struct delayed_work if there is no delay?  And
since schedule_delayed_work() is using the system_wq, you could simply declare a
struct work_struct and call queue_work() on it.

> +}
> +
> +static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	struct device *dev = priv->dev;
> +	struct mbox_client *cl;
> +	int ret = 0;
> +
> +	if (!of_get_property(dev->of_node, "mbox-names", NULL))
> +		return 0;
> +
> +	cl = &priv->cl;
> +	cl->dev = dev;
> +	cl->tx_block = true;
> +	cl->tx_tout = 20;

What is the point of setting this here when it is set again in imx_rproc_kick()
to 100?

> +	cl->knows_txdone = false;
> +	cl->rx_callback = imx_rproc_rx_callback;
> +
> +	priv->tx_ch = mbox_request_channel_byname(cl, "tx");
> +	if (IS_ERR(priv->tx_ch)) {
> +		if (PTR_ERR(priv->tx_ch) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		ret = PTR_ERR(priv->tx_ch);
> +		dev_dbg(cl->dev, "failed to request mbox tx chan, ret %d\n",
> +			ret);
> +		goto err_out;
> +	}
> +
> +	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
> +	if (IS_ERR(priv->rx_ch)) {
> +		ret = PTR_ERR(priv->rx_ch);
> +		dev_dbg(cl->dev, "failed to request mbox rx chan, ret %d\n",
> +			ret);
> +		goto err_out;
> +	}

Where and when are the channels freed?

Thanks,
Mathieu

> +
> +	return ret;
> +
> +err_out:
> +	if (!IS_ERR(priv->tx_ch))
> +		mbox_free_channel(priv->tx_ch);
> +	if (!IS_ERR(priv->rx_ch))
> +		mbox_free_channel(priv->rx_ch);
> +
> +	return ret;
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -501,17 +593,24 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  
>  	dev_set_drvdata(dev, rproc);
>  
> +	ret = imx_rproc_xtr_mbox_init(rproc);
> +	if (ret) {
> +		if (ret == -EPROBE_DEFER)
> +			goto err_put_rproc;
> +		/* mbox is optional, so not fail here */
> +	}
> +
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
> @@ -521,9 +620,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	ret = clk_prepare_enable(priv->clk);
>  	if (ret) {
>  		dev_err(&rproc->dev, "Failed to enable clock\n");
> -		goto err_put_rproc;
> +		goto err_put_mbox;
>  	}
>  
> +	INIT_DELAYED_WORK(&(priv->rproc_work), imx_rproc_vq_work);
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> @@ -534,6 +635,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  
>  err_put_clk:
>  	clk_disable_unprepare(priv->clk);
> +err_put_mbox:
> +	if (!IS_ERR(priv->tx_ch))
> +		mbox_free_channel(priv->tx_ch);
> +	if (!IS_ERR(priv->rx_ch))
> +		mbox_free_channel(priv->rx_ch);
>  err_put_rproc:
>  	rproc_free(rproc);
>  
> -- 
> 2.28.0
> 
