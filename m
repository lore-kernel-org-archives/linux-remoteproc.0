Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7985CC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 18 Jan 2022 18:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348457AbiARS5f (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:57:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348333AbiARS5d (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 18 Jan 2022 13:57:33 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3241CC06161C
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Jan 2022 10:57:33 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id i8-20020a17090a138800b001b3936fb375so3589896pja.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Jan 2022 10:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dhKNR53q0AZ+CCJsVG7glKrCX7hIyhuD8l3gxdOBGJM=;
        b=wc1VhTyHyOap8tNcl1AAmiPCTgfxB1pSsPIPkiw6NaAM332lPpnpIhaORP/SYsZLf3
         i4hwVPPXVe20Ad82lOOI0FzikfjvzDHo5dzURl1fcnwQIXZLU8/z6SniOvXBEFOCVeb+
         H9ciqITZGwLXyIXffkrs8iSZvemWv996T9sKsTutnWRO+Ytq9OXQuszfIuzYEOJiT0Ix
         UjcghxA3iQ5Pwo6qGGmdrOqiyciHUhs3qn1wRktpz0IhsODgAwz+baGTyd0FWjxyOcmB
         7ImCgVVCbd7IA+8NQRHIdxVoHytVI9dDmHR+w63IaCB2+z0taPm+K+P6B1a7TmQamX5z
         EETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dhKNR53q0AZ+CCJsVG7glKrCX7hIyhuD8l3gxdOBGJM=;
        b=pvhUfonCpIPrp8L9Oqam5IM/CKFGOoX1pZRBVWdjY9H2aIPXuWV3IdiOgO3MtLHH+1
         +ZoQg0D7RKZzvr71vAtbnP7c4VZIzqYFwviReOMHC+hPPihmGT+kcgfmY32Df2+d3Jnb
         jOmf46bXaxoAiQiqx4K0RSXRydfA1y2c6BhyF1ZMOrLsHBW5N0RYvsjpmNu8Jjkct+4E
         NtgO0Vd8Oq8k5SMP+5sEpU/VDwxTMpKqGM5lYXkG1qw6onaEcRIoJeQLtHK7BjGq3LxS
         sFBz8bPu9RVTLK3GBCwdHWJm2Wo0p+I4zjSPc3zKu7eSrz8mi9lX1nBvYHdmD1sA8VGU
         m6Jw==
X-Gm-Message-State: AOAM531+7Uy4cQzvOpkagLsL4OOe+o2jrVShOrSE/6PKbw7TeXvrL4bb
        llGWybk0Xc/HMocEyhCrmyleoQ==
X-Google-Smtp-Source: ABdhPJzr37hEsjF6XnuAJGXMgp1pwB9geIQOlOMmPqoLWG0VO6ecJ4oAriXmRdy17R39zSmGyuaRRQ==
X-Received: by 2002:a17:902:a988:b0:149:f2ae:649a with SMTP id bh8-20020a170902a98800b00149f2ae649amr28679565plb.172.1642532252682;
        Tue, 18 Jan 2022 10:57:32 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id lw14sm3690723pjb.41.2022.01.18.10.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 10:57:31 -0800 (PST)
Date:   Tue, 18 Jan 2022 11:57:29 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     bjorn.andersson@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 6/9] remoteproc: imx_rproc: support attaching to i.MX8QXP
 M4
Message-ID: <20220118185729.GH1119324@p14s>
References: <20220111033333.403448-1-peng.fan@oss.nxp.com>
 <20220111033333.403448-9-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111033333.403448-9-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jan 11, 2022 at 11:33:30AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When M4 is kicked by SCFW, M4 runs in its own hardware partition, Linux
> could only do IPC with M4, it could not start, stop, update image.
> 
> When M4 crash reboot, it could notify Linux, so Linux could prepare to
> reattach to M4 after M4 recovery.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 96 ++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 0e99a3ca6fbc..5f04aea2f6a1 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -6,6 +6,7 @@
>  #include <linux/arm-smccc.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
> +#include <linux/firmware/imx/sci.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -59,6 +60,8 @@
>  #define IMX_SIP_RPROC_STARTED		0x01
>  #define IMX_SIP_RPROC_STOP		0x02
>  
> +#define	IMX_SC_IRQ_GROUP_REBOOTED	5
> +
>  /**
>   * struct imx_rproc_mem - slim internal memory structure
>   * @cpu_addr: MPU virtual address of the memory region
> @@ -90,6 +93,23 @@ struct imx_rproc {
>  	struct workqueue_struct		*workqueue;
>  	void __iomem			*rsc_table;
>  	bool				has_clk;
> +	struct imx_sc_ipc		*ipc_handle;
> +	struct notifier_block		proc_nb;
> +	u32				rproc_pt;
> +	u32				rsrc;

There is no documentation for the above two fields and I have to guess what they
do.

> +};
> +
> +static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
> +	/* dev addr , sys addr  , size	    , flags */
> +	{ 0x08000000, 0x08000000, 0x10000000, 0},
> +	/* TCML/U */
> +	{ 0x1FFE0000, 0x34FE0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +	/* OCRAM(Low 96KB) */
> +	{ 0x21000000, 0x00100000, 0x00018000, 0},
> +	/* OCRAM */
> +	{ 0x21100000, 0x00100000, 0x00040000, 0},
> +	/* DDR (Data) */
> +	{ 0x80000000, 0x80000000, 0x60000000, 0 },
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> @@ -236,6 +256,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
>  	.method		= IMX_RPROC_NONE,
>  };
>  
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
> +	.att		= imx_rproc_att_imx8qxp,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
> +	.method		= IMX_RPROC_SCU_API,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
>  	.att		= imx_rproc_att_imx7ulp,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
> @@ -491,6 +517,11 @@ static int imx_rproc_attach(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int imx_rproc_detach(struct rproc *rproc)
> +{
> +	return 0;

Is it possible to detach the remote processor from the application core?  If not
please write a comment that says so.  And shouldn't this return some kind of
error so that users don't think the operation was carried out successfully?

I am out of time for today and as such will continue with this set tomorrow.

Thanks,
Mathieu

> +}
> +
>  static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -525,6 +556,7 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
>  	.attach		= imx_rproc_attach,
> +	.detach		= imx_rproc_detach,
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
>  	.kick		= imx_rproc_kick,
> @@ -671,6 +703,22 @@ static void imx_rproc_free_mbox(struct rproc *rproc)
>  	mbox_free_channel(priv->rx_ch);
>  }
>  
> +static int imx_rproc_partition_notify(struct notifier_block *nb,
> +				      unsigned long event, void *group)
> +{
> +	struct imx_rproc *priv = container_of(nb, struct imx_rproc, proc_nb);
> +
> +	/* Ignore other irqs */
> +	if (!((event & BIT(priv->rproc_pt)) && (*(u8 *)group == IMX_SC_IRQ_GROUP_REBOOTED)))
> +		return 0;
> +
> +	rproc_report_crash(priv->rproc, RPROC_WATCHDOG);
> +
> +	pr_info("Patition%d reset!\n", priv->rproc_pt);
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  {
>  	struct regmap_config config = { .name = "imx-rproc" };
> @@ -680,6 +728,7 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	struct arm_smccc_res res;
>  	int ret;
>  	u32 val;
> +	u8 pt;
>  
>  	switch (dcfg->method) {
>  	case IMX_RPROC_NONE:
> @@ -690,6 +739,52 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  		if (res.a0)
>  			priv->rproc->state = RPROC_DETACHED;
>  		return 0;
> +	case IMX_RPROC_SCU_API:
> +		ret = imx_scu_get_handle(&priv->ipc_handle);
> +		if (ret)
> +			return ret;
> +		ret = of_property_read_u32(dev->of_node, "rsrc-id", &priv->rsrc);
> +		if (ret) {
> +			dev_err(dev, "no rsrc-id\n");
> +			return ret;
> +		}
> +
> +		/*
> +		 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
> +		 * and Linux could only do IPC with Mcore and nothing else.
> +		 */
> +		if (!imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc)) {
> +
> +			priv->has_clk = false;
> +			priv->rproc->self_recovery = true;
> +			priv->rproc->state = RPROC_DETACHED;
> +
> +			/* Get partition id and enable irq in SCFW */
> +			ret = imx_sc_rm_get_resource_owner(priv->ipc_handle, priv->rsrc, &pt);
> +			if (ret) {
> +				dev_err(dev, "not able to get resource owner\n");
> +				return ret;
> +			}
> +
> +			priv->rproc_pt = pt;
> +			priv->proc_nb.notifier_call = imx_rproc_partition_notify;
> +
> +			ret = imx_scu_irq_register_notifier(&priv->proc_nb);
> +			if (ret) {
> +				dev_warn(dev, "register scu notifier failed.\n");
> +				return ret;
> +			}
> +
> +			ret = imx_scu_irq_group_enable(IMX_SC_IRQ_GROUP_REBOOTED,
> +						       BIT(priv->rproc_pt), true);
> +			if (ret) {
> +				imx_scu_irq_unregister_notifier(&priv->proc_nb);
> +				dev_warn(dev, "Enable irq failed.\n");
> +				return ret;
> +			}
> +		}
> +
> +		return 0;
>  	default:
>  		break;
>  	}
> @@ -847,6 +942,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
>  	{ .compatible = "fsl,imx8mn-cm7", .data = &imx_rproc_cfg_imx8mn },
>  	{ .compatible = "fsl,imx8mp-cm7", .data = &imx_rproc_cfg_imx8mn },
> +	{ .compatible = "fsl,imx8qxp-cm4", .data = &imx_rproc_cfg_imx8qxp },
>  	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
>  	{},
>  };
> -- 
> 2.25.1
> 
