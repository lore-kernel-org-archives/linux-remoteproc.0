Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87ABCC47094
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Jun 2021 16:09:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66069613D8
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Jun 2021 16:09:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhFJQLS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Jun 2021 12:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhFJQLR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Jun 2021 12:11:17 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623ABC061574
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Jun 2021 09:09:06 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id j12so147857pgh.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Jun 2021 09:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kYytFf8w8lGLC87US0lF5QfRu8TkslW/v1k/xfpSpOs=;
        b=LZLpCp2A/10kvyEMW6w1HKRsdeMviQfJVUcbSXMkP1AtgBMgVOYnqXRSkmsdUA8mcZ
         FMo7mr++UAryE0x5Ui9QmZMTC1zfXHs//EULrvKUZGbwyP2YR2FQYn5F5fCLgbWKaamX
         yHyc5Cg1QV/+LqFCHLDYa9jCmqag68lN1Cx390SNnW4iwsTJ9GjWFtS28DUeBqxy0hLo
         nSFftsX+xqgwWHNrkHvSjtPn0VQIbXk7HGJjLCJS0Tq+Pvi5iwQM58Pz5A1Fqa4iuvo6
         aOkFHow5TPeGWwhR06HKlxD+rX5UQPdAgq4kjrLXwJPX4tZTpGHd/ioa5Pz0hJ0CNd+u
         KHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kYytFf8w8lGLC87US0lF5QfRu8TkslW/v1k/xfpSpOs=;
        b=MHPHvpCqTKZyt+OimeriINh5ni87UUPBjVIu4P09FIu5KtVWsX9xU/Z4HEPl+bDwsE
         D0BLKL8JcnYrNGNOwttU1tEdRhitZawJK9N63JPKk3CiHvGlzs0N15LKWbuc4bZC61qt
         6i1A6gXvLlq1Fxgk2GHksdJPv3HBxSt9zxn76GsMjA+NGw9Pd2S1YYelBCvzglcDbmaM
         9OsuJGK7X+pXwKSwvCccZ5NhZ7bXf8jsvEp5RawZq8XpYECKsyoyE2TV9qW/wMvZysa6
         C3BJzvZaBR/J+bI7HAe+EMWqFWKhayO0plyFYu3ukJbv1uIz35XYx/7YVaRJaj2s7iYY
         FBAw==
X-Gm-Message-State: AOAM532EQRlnnekoo8XXZ3sUkKxlqyqtFnadOyPSKLC8sro9lIM3pUvR
        eWgC+bryIB4geBd8NJDYDDYcjQ==
X-Google-Smtp-Source: ABdhPJyp5BAJz6wrSY57esY6nrOu2qG1wIdc4fufA1/o01uQxiH7eippiBBxqOZVK1vycj1+UEwdWg==
X-Received: by 2002:a63:5148:: with SMTP id r8mr5618964pgl.283.1623341345896;
        Thu, 10 Jun 2021 09:09:05 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id a20sm2946041pfk.145.2021.06.10.09.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 09:09:05 -0700 (PDT)
Date:   Thu, 10 Jun 2021 10:09:03 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] remoteproc: imx-rproc: Fix IMX_REMOTEPROC configuration
Message-ID: <20210610160903.GB34238@p14s>
References: <20210610031530.26326-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610031530.26326-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jun 10, 2021 at 11:15:30AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When CONFIG_IMX_REMOTEPROC is y and CONFIG_HAVE_ARM_SMCCC
> is not set, compiling errors are encountered as follows:
> 
> drivers/remoteproc/imx_rproc.o: in function `imx_rproc_stop':
> imx_rproc.c:(.text+0x140): undefined reference to `__arm_smccc_smc'
> drivers/remoteproc/imx_rproc.o: in function `imx_rproc_detect_mode':
> imx_rproc.c:(.text+0x272): undefined reference to `__arm_smccc_smc'
> drivers/remoteproc/imx_rproc.o: in function `imx_rproc_start':
> imx_rproc.c:(.text+0x5e0): undefined reference to `__arm_smccc_smc'
> 
> __arm_smccc_smc is defined when HAVE_ARM_SMCCC is y, so
> add dependency on HAVE_ARM_SMCCC in IMX_REMOTEPROC configuration.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Next time please add:

Fixes: 79806d32d5aa ("remoteproc: imx_rproc: support i.MX8MN/P")

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index e68fcedc999c..9a6eedc3994a 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -26,6 +26,7 @@ config REMOTEPROC_CDEV
>  config IMX_REMOTEPROC
>  	tristate "i.MX remoteproc support"
>  	depends on ARCH_MXC
> +	depends on HAVE_ARM_SMCCC
>  	select MAILBOX
>  	help
>  	  Say y here to support iMX's remote processors via the remote
> -- 
> 2.30.0
> 
