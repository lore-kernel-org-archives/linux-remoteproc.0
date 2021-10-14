Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CA2C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Oct 2021 16:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13F5E610EA
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Oct 2021 16:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbhJNQM5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Oct 2021 12:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbhJNQM4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Oct 2021 12:12:56 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B149C061753
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Oct 2021 09:10:51 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id a73so6028076pge.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Oct 2021 09:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BWS52dql+ajKsVGzTwJ00TvBktdComipttyL2oNuCUA=;
        b=sgo2JFiKekAgFg2ykYeltwB/Fsj+4+LoUN3qyXiTzbhETyJAtuzFRBfn2cZFtCJLYD
         Ww0LHEKVXCN19dMW27H7oETvQjTySlLeBRTilHKJUTuSaIuBlfHMYQOaVFnEN+sLvqsg
         vstoadWRFJGTjDUBemqdAGv33z9jm6L2k8jqgsYr8g7m/aDHXEnsYQOP6sVeUCQ5DeYs
         QuXdv8fdnU4wzib7JjSl5RB+Aow/LCAHkaF6rQXykxcQB56PRh5YuD6ZtReQiOrGnfdy
         8lfXufISo8qUCLoHUK/FW9PX2ZuXxWdaChqrAdoDnsBa/960uo8o0hMG2LhjnW0o3QOT
         q0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BWS52dql+ajKsVGzTwJ00TvBktdComipttyL2oNuCUA=;
        b=2Y5kPTxjrF0EvDjRHJmHuaFp8MWSpsnnnxoCNedRDYxApzm4To6Kk3eDa0A7xzPoqo
         g+EAC0bp2sgeVMNpFQ/ETrIEgCzUYfbiRLd4Xsac4jKK+GJCzCWMGyKHaQ87J2W4DKR/
         cdb3Pp37UlJilnLSDMltEGoAkyAgaeatx23OjeCgMCCt9qKhr6CeiX6wQvlsHpmUuH1G
         OjFIWPNg526tNwapbpZbvC4OngbL6oijqRFeERjBQdq0wig55/LwQRMUznuaiTItW/zp
         tMvOZVZzKTVVaDXI8Vru/hLbfS4Vehvsap1e8oOx7DucOxpGLbxT8j6eYsAKTn/W2X0e
         l9iQ==
X-Gm-Message-State: AOAM531dDFmSHBYLEUWknIcjvTCvZhBd2XrCsegScmjksdepe3uPwJ/n
        v9jiuLkFRnCYjjMv1xqOlvDd8Q==
X-Google-Smtp-Source: ABdhPJzpYqMNKRQchBTM3b76cveOWAI9PjBSkypDO3jKlwMXS3Yau7rxWQtIpFXM7PNYB5zfArVjjw==
X-Received: by 2002:a63:1d10:: with SMTP id d16mr4805233pgd.13.1634227850721;
        Thu, 14 Oct 2021 09:10:50 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id d19sm2843113pfn.102.2021.10.14.09.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 09:10:48 -0700 (PDT)
Date:   Thu, 14 Oct 2021 10:10:46 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: mark PM functions as
 __maybe_unused
Message-ID: <20211014161046.GA2847733@p14s>
References: <20211014075239.3714694-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014075239.3714694-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Oct 14, 2021 at 09:52:24AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_PM_SLEEP is disabled, we get a harmless warning:
> 
> drivers/remoteproc/imx_dsp_rproc.c:1145:12: error: 'imx_dsp_resume' defined but not used [-Werror=unused-function]
>  1145 | static int imx_dsp_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~
> drivers/remoteproc/imx_dsp_rproc.c:1110:12: error: 'imx_dsp_suspend' defined but not used [-Werror=unused-function]
>  1110 | static int imx_dsp_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~
> 
> Mark these as __maybe_unused to get a clean build.
> 
> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I have applied this.

Thanks,
Mathieu

> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 63749cfcf22f..90fcb389e252 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1107,7 +1107,7 @@ static void imx_dsp_load_firmware(const struct firmware *fw, void *context)
>  	release_firmware(fw);
>  }
>  
> -static int imx_dsp_suspend(struct device *dev)
> +static __maybe_unused int imx_dsp_suspend(struct device *dev)
>  {
>  	struct rproc *rproc = dev_get_drvdata(dev);
>  	struct imx_dsp_rproc *priv = rproc->priv;
> @@ -1142,7 +1142,7 @@ static int imx_dsp_suspend(struct device *dev)
>  	return pm_runtime_force_suspend(dev);
>  }
>  
> -static int imx_dsp_resume(struct device *dev)
> +static __maybe_unused int imx_dsp_resume(struct device *dev)
>  {
>  	struct rproc *rproc = dev_get_drvdata(dev);
>  	int ret = 0;
> -- 
> 2.29.2
> 
