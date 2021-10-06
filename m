Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CFEC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Oct 2021 16:25:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 940B961130
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Oct 2021 16:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232315AbhJFQ1I (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Oct 2021 12:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbhJFQ1H (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Oct 2021 12:27:07 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B214C061755
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Oct 2021 09:25:15 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ls18so2599268pjb.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Oct 2021 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SlLouinstJtGqDeYDZkm/0tMv8ZDoxiEw4xjkE7JI2s=;
        b=R5pjvXeXyk/KJO47HkUp057DRmixyU5/EgBE5S9GKMmgHFu9NFqplRRTKtmA1Cm2JS
         x/AgJgCy+iuRIL6TLykzGU/25hcpiDm98GdsfyvYNwncStkhtC0QPNc3FqBJ7Y8mKSQ7
         vMbDPLCo8eTTtq59dCj7qB+n/eY2MAxsaxyW6Mh/MpO1qwxEmnHHsxAyZcO36r74BRK/
         YzEmVIeuS0TWuRt4wkRNEY1rqnmW0GJV0l0Qc8hfSfh1ssFHg+95Kl86CxGBdCABI4+l
         JwASRHoFPOHK5TRjUeSiRRj7Wrs2sO5rL7dvknotqy4nQWEWwpnU8PSK3Ah1/B6mv+Te
         PUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SlLouinstJtGqDeYDZkm/0tMv8ZDoxiEw4xjkE7JI2s=;
        b=fTV/4Vm5uO+eg3rUylFlMP1HMmoLWVEBFTxqiashtPaDdLafXektBGRv3WaqDv1Hyj
         s/4TFfQMXbCTgdIWZ9IibwcsYcOB3OzlfvrElG3JeP2LVUdQ152Qw8IwQO1kk6OiLYRF
         1txaN/KF6F+MZKDl2S22P+9lRG2MCY/l8/r/P0bMnX0xDmJ7tQAkIo/aGjXD2YMjVq6x
         y/jA2vTzLHj40BsvOveIKF1e7FMcLONU5pNkmnT6UvyEQDaFyf9872GUtqCCpH6D+ItW
         dOP3xLlKKxZPnxCpZtR9a28fEX4qtlwFhqYeG9H8E2xW5FB+bR8+RlZAdEUpHMPzvAkG
         npvA==
X-Gm-Message-State: AOAM531VO4zq8f9rZMXp+1UuSmxBxRsHz6tukzqD1P+g3diH4zNk0yvj
        WE1AVSCYnKqMIXsAXUkQZq3gmQ==
X-Google-Smtp-Source: ABdhPJxJ1grTO/Z89FUCLSNbgkb//8zelQNvy1ipaZp0ZX+jHiHCxT1TqVhdiKp4rmVocz5WV+VALA==
X-Received: by 2002:a17:902:a385:b0:13e:99e9:17f3 with SMTP id x5-20020a170902a38500b0013e99e917f3mr11790324pla.65.1633537514785;
        Wed, 06 Oct 2021 09:25:14 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id q6sm5880167pjd.26.2021.10.06.09.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 09:25:13 -0700 (PDT)
Date:   Wed, 6 Oct 2021 10:25:11 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [PATCH v5 3/4] remoteproc: imx_dsp_rproc: Add remoteproc driver
 for DSP on i.MX
Message-ID: <20211006162511.GA3370862@p14s>
References: <1632625630-784-1-git-send-email-shengjiu.wang@nxp.com>
 <1632625630-784-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632625630-784-4-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Shengjiu,

This pachset doesn't apply to rproc-next, which is now located here[1].  The
change is in linux-next but not in mainline yet.

https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/log/?h=rproc-next

On Sun, Sep 26, 2021 at 11:07:09AM +0800, Shengjiu Wang wrote:
> Provide a basic driver to control DSP processor found on NXP i.MX8QM,
> i.MX8QXP, i.MX8MP and i.MX8ULP.
> 
> Currently it is able to resolve addresses between DSP and main CPU,
> start and stop the processor, suspend and resume.
> 
> The communication between DSP and main CPU is based on mailbox, there
> are three mailbox channels (tx, rx, rxdb).
> 
> This driver was tested on NXP i.MX8QM, i.MX8QXP, i.MX8MP and i.MX8ULP.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/Kconfig         |   11 +
>  drivers/remoteproc/Makefile        |    1 +
>  drivers/remoteproc/imx_dsp_rproc.c | 1206 ++++++++++++++++++++++++++++
>  3 files changed, 1218 insertions(+)
>  create mode 100644 drivers/remoteproc/imx_dsp_rproc.c
>

[...]

> +
> +/**
> + * imx_dsp_attach_pm_domains() - attach the power domains
> + * @priv: private data pointer
> + *
> + * On i.MX8QM and i.MX8QXP there is multiple power domains
> + * required, so need to link them.
> + */
> +static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
> +{
> +	struct device *dev = priv->rproc->dev.parent;
> +	int ret, i;
> +
> +	priv->num_domains = of_count_phandle_with_args(dev->of_node,
> +						       "power-domains",
> +						       "#power-domain-cells");
> +
> +	/* If only one domain, then no need to link the device */
> +	if (priv->num_domains <= 1)
> +		return 0;
> +
> +	priv->pd_dev = devm_kmalloc_array(dev, priv->num_domains,
> +					  sizeof(*priv->pd_dev),
> +					  GFP_KERNEL);
> +	if (!priv->pd_dev)
> +		return -ENOMEM;
> +
> +	priv->pd_dev_link = devm_kmalloc_array(dev, priv->num_domains,
> +					       sizeof(*priv->pd_dev_link),
> +					       GFP_KERNEL);
> +	if (!priv->pd_dev_link)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < priv->num_domains; i++) {
> +		priv->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
> +		if (IS_ERR(priv->pd_dev[i])) {
> +			ret = PTR_ERR(priv->pd_dev[i]);
> +			goto detach_pm;
> +		}

I have pointed a problem with the error handling in the above during the
previous review and it was not addressed.

> +
> +		/*
> +		 * device_link_add will check priv->pd_dev[i], if it is
> +		 * NULL, then will break.
> +		 */
> +		priv->pd_dev_link[i] = device_link_add(dev,
> +						       priv->pd_dev[i],
> +						       DL_FLAG_STATELESS |
> +						       DL_FLAG_PM_RUNTIME);
> +		if (!priv->pd_dev_link[i]) {
> +			dev_pm_domain_detach(priv->pd_dev[i], false);
> +			ret = -EINVAL;
> +			goto detach_pm;
> +		}
> +	}
> +
> +	return 0;
> +
> +detach_pm:
> +	while (--i >= 0) {
> +		device_link_del(priv->pd_dev_link[i]);
> +		dev_pm_domain_detach(priv->pd_dev[i], false);
> +	}
> +
> +	return ret;
> +}
> +
